package com.ziniu.template;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.ziniu.crux.Global;
import com.ziniu.entity.auth.Account;
import com.ziniu.entity.core.Analyze;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Program;
import com.ziniu.entity.core.Summary;
import com.ziniu.entity.core.Trace;
import com.ziniu.service.auth.AccountService;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.service.core.SummaryService;
import com.ziniu.service.core.TraceService;
import com.ziniu.tool.JsonTool;
import com.ziniu.view.SuperView;
@Component
public class HyperTask implements ApplicationContextAware {
	private RestTemplate restTemplate;
	private AccountService accountService;
	private AnalyzeService analyzeService;
	private HyperService hyperService;
	private KeywordService keywordService;
	private ProgramService programService;
	private SummaryService summaryService;
	private TraceService traceService;
	public HyperTask() {}
	public HyperTask(ApplicationContext context) throws Exception {
		this.setApplicationContext(context);
	}
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.restTemplate = context.getBean(RestTemplate.class);
		this.accountService = context.getBean(AccountService.class);
		this.analyzeService = context.getBean(AnalyzeService.class);
		this.hyperService = context.getBean(HyperService.class);
		this.keywordService = context.getBean(KeywordService.class);
		this.programService = context.getBean(ProgramService.class);
		this.summaryService = context.getBean(SummaryService.class);
		this.traceService = context.getBean(TraceService.class);
	}
	@Scheduled(cron = "0 1 */1 * * *")
	public void work() {
		try {
			GregorianCalendar ggc = new GregorianCalendar();
			int hour = ggc.get(GregorianCalendar.HOUR_OF_DAY);
			Account en = new Account();
			en.setSqlQueryField(en.setId(null), en.setWords(null), en.setCoords(null));
			if (hour >= 12) {
				en.setSqlQueryTerm(false, en.setCreated(null).FrameFieldName, Account.Operation.Like, "____-__-__ " + hour + ":__:__");
				hour = (hour + 12) % 24;
				en.setSqlQueryTerm(false, en.setCreated(null).FrameFieldName, Account.Operation.Like, "____-__-__ " + (hour > 9 ? hour : "0" + hour) + ":__:__");
			} else {
				en.setSqlQueryTerm(false, en.setCreated(null).FrameFieldName, Account.Operation.Like, "____-__-__ " + (hour > 9 ? hour : "0" + hour) + ":__:__");
				hour += 12;
				en.setSqlQueryTerm(false, en.setCreated(null).FrameFieldName, Account.Operation.Like, "____-__-__ " + hour + ":__:__");
			}
			
			en.setSqlLeafTotal(accountService.count(en));
			en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
			for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
				en.setSqlLeafNow(i);
				List<Account> datas = accountService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Account data : datas) {
						final Account task = data;
						new Thread(new Runnable() {
							public void run() {
								try {
									task.setGrab(new Date());
									HyperTask.this.work(task, null);
									HyperTask.this.judge(task);
									HyperTask.this.count(task);
									Account temp = new Account();
									temp.setId(task.getId());
									temp.setGrab(task.getGrab());
									accountService.update(temp);
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						}).start();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public void work(Account account, Integer now) throws Exception {
		Program program = new Program();
		program.setFkAccount(account.getId());
		program.setSqlQueryField(program.setId(null), program.setMedia(null));
		program.setSqlQueryOrder(program.setQueue(null), true);
		program.setSqlLeafSize(account.getWords());
		List<Program> datas = programService.list(program);
		if (datas != null && datas.size() > 0) {
			for (Program data : datas) {
				Map<String, String> engine = JsonTool.read(data.getMedia(), Map.class);
				if (engine.size() < 1) {
					continue;
				}
				
				Keyword keyword = new Keyword();
				keyword.setId(now);
				keyword.setFkProgram(data.getId());
				keyword.setFkAccount(account.getId());
				keyword.setSqlQueryField(keyword.setId(null), keyword.setName(null), keyword.setAgent(null), keyword.setGrab(null));
				keyword.setSqlQueryOrder(keyword.setCreated(null), false);
				keyword.setSqlLeafSize(account.getWords());
				List<Keyword> keywords = keywordService.list(keyword);
				if (keywords == null || keywords.size() < 1) {
					continue;
				}
				
				for (String media : engine.keySet()) {
					Media temp = Global.HYPER_MEDIA_ENGINE.get(Integer.parseInt(media));
					if (temp == null) {
						continue;
					}
					
					try {
						HyperCrawler crawler = (HyperCrawler) Class.forName(temp.getNozzle()).newInstance();
						crawler.init(restTemplate, hyperService, analyzeService);
						for (Keyword word : keywords) {
							Map<String, Hyper> newly = crawler.work(word.getGrab() ? account.getCoords() : Global.HYPER_CRAWLER_COORDS, temp.getStart(), temp.getGrads(), word.getAgent(), word.getName());
							if (newly.size() < 1) {
								continue;
							}
							
							this.work(newly, word, account);
						}
					} catch (Exception e) {
						continue;
					}
				}
				
				for (Keyword word : keywords) {
					if (!word.getGrab()) {
						Keyword temp = new Keyword();
						temp.setId(word.getId());
						temp.setGrab(true);
						keywordService.update(temp);
					}
				}
			}
		}
	}
	private void work(Map<String, Hyper> newly, Keyword keyword, Account account) throws Exception {
		List<String> keys = new ArrayList<String>(newly.keySet());
		Hyper en = new Hyper();
		en.setSqlQueryField(en.setId(null), en.setTitle(null), en.setContent(null), en.setScreen(null), en.setBlend(null), en.setAbate(null), en.setCreated(null), en.setFkMedia(null));
		en.setSqlQueryOrder(en.setCreated(null), false);
		en.setSqlLeafTotal(new Long(keys.size()));
		en.setSqlLeafSize(100L);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			en.setSqlQueryIn(true, en.setId(null), true, keys.subList(en.getSqlLeafStart().intValue(), new Long(Math.min(en.getSqlLeafStart() + en.getSqlLeafSize(), en.getSqlLeafTotal())).intValue()).toArray(new String[] {}));
			en.setSqlLeafNow(1L);
			List<Hyper> datas = hyperService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Hyper data : datas) {
					if (data.getTitle().indexOf(keyword.getName()) == -1 && data.getContent().indexOf(keyword.getName()) == -1) {
						continue;
					}
					
					Analyze analyze = new Analyze();
					analyze.setFkHyper(data.getId());
					analyze.setFkKeyword(keyword.getId());
					analyze.setFkAccount(account.getId());
					analyze.setSqlQueryField(analyze.setId(null), analyze.setTrend(null), analyze.setJudge(null), analyze.setAffirm(null), analyze.setTrace(null), analyze.setFkMedia(null));
					analyze.setSqlLeafSize(1L);
					List<Analyze> analyzes = analyzeService.list(analyze);
					Hyper hyper = newly.get(data.getId());
					
					if (analyzes == null || analyzes.size() < 1) {
						if (data.getAbate()) {
							continue;
						}
						
						analyze.setId(UUID.randomUUID().toString().replace("-", ""));
						analyze.setJudge(false);
						analyze.setAffirm(false);
						analyze.setTrace(true);
						analyze.setScreen(data.getScreen());
						analyze.setCreated(data.getCreated());
						analyze.setFkMedia(data.getFkMedia());
						HyperHelper.trend(data.getContent(), analyze);
						analyzeService.save(analyze);
						
						Trace trace = new Trace();
						trace.setTitle(data.getTitle());
						trace.setCoords(hyper.getCoords());
						trace.setPlace(hyper.getPlace());
						trace.setBlend(data.getBlend());
						trace.setTrend(analyze.getTrend());
						trace.setScreen(data.getScreen());
						trace.setCreated(account.getGrab());
						trace.setFkMedia(data.getFkMedia());
						trace.setFkAnalyze(analyze.getId());
						trace.setFkAccount(account.getId());
						traceService.save(trace);
					} else {
						analyze = analyzes.get(0);
						if (analyze.getJudge() && !analyze.getAffirm()) {
							Analyze temp = new Analyze();
							temp.setId(analyze.getId());
							temp.setJudge(false);
							if (data.getScreen() != null) {
								temp.setScreen(data.getScreen());
							} else {
								temp.setSqlUpdateNull(temp.setScreen(null));
							}
							if (data.getAbate()) {
								temp.setTrend("WUXIAO");
								temp.setAffirm(true);
								temp.setTrace(false);
								analyze.setTrend(temp.getTrend());
								analyze.setTrace(false);
							} else {
								HyperHelper.trend(data.getContent(), temp);
								analyze.setTrend(temp.getTrend());
							}
							if (analyze.getFkMedia() != data.getFkMedia()) {
								temp.setFkMedia(data.getFkMedia());
							}
							analyzeService.update(temp);
						}
						
						if (!data.getAbate() && analyze.getTrace()) {
							Trace trace = new Trace();
							trace.setTitle(data.getTitle());
							trace.setCoords(hyper.getCoords());
							trace.setPlace(hyper.getPlace());
							trace.setBlend(data.getBlend());
							trace.setTrend(analyze.getTrend());
							trace.setScreen(data.getScreen());
							trace.setCreated(account.getGrab());
							trace.setFkMedia(data.getFkMedia());
							trace.setFkAnalyze(analyze.getId());
							trace.setFkAccount(account.getId());
							traceService.save(trace);
						}
					}
				}
			}
		}
	}
	private void judge(Account account) throws Exception {
		Analyze en = new Analyze();
		en.setJudge(true);
		en.setAffirm(false);
		en.setFkAccount(account.getId());
		en.setSqlQueryField(en.setId(null), en.setFkMedia(null), en.setFkHyper(null));
		en.setSqlLeafTotal(analyzeService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		Map<String, Hyper> cache = new HashMap<String, Hyper>();
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Analyze> datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					Hyper value = cache.get(data.getFkHyper());
					if (value == null) {
						value = hyperService.load(data.getFkHyper());
						if (value == null) {
							continue;
						}
						cache.put(data.getFkHyper(), value);
					}
					
					Analyze temp = new Analyze();
					temp.setId(data.getId());
					temp.setJudge(false);
					if (value.getScreen() != null) {
						temp.setScreen(value.getScreen());
					} else {
						temp.setSqlUpdateNull(temp.setScreen(null));
					}
					if (value.getAbate()) {
						temp.setTrend("WUXIAO");
						temp.setAffirm(true);
						temp.setTrace(false);
					} else {
						HyperHelper.trend(value.getContent(), temp);
					}
					if (data.getFkMedia() != value.getFkMedia()) {
						temp.setFkMedia(value.getFkMedia());
					}
					analyzeService.update(temp);
				}
			}
		}
	}
	private String[][] count(Date now) {
		String[][] res = new String[3][];
		GregorianCalendar ggc = new GregorianCalendar();
		ggc.setTime(now);
		int index = ggc.get(GregorianCalendar.DAY_OF_YEAR);
		
		res[0] = new String[7];
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 6);
		res[0][0] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 5);
		res[0][1] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 4);
		res[0][2] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 3);
		res[0][3] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 2);
		res[0][4] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 1);
		res[0][5] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 0);
		res[0][6] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		
		res[1] = new String[7];
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 0);
		res[1][0] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 6);
		res[1][1] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 14);
		res[1][2] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 29);
		res[1][3] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 89);
		res[1][4] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 179);
		res[1][5] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		ggc.set(GregorianCalendar.DAY_OF_YEAR, index - 359);
		res[1][6] = new SimpleDateFormat("yyyy-MM-dd").format(ggc.getTime());
		
		res[2] = new String[7];
		res[2][0] = "001";
		res[2][1] = "007";
		res[2][2] = "015";
		res[2][3] = "030";
		res[2][4] = "090";
		res[2][5] = "180";
		res[2][6] = "360";
		return res;
	}
	@SuppressWarnings("unchecked")
	private void count(Account account) throws Exception {
		//通用常量
		String[][] time = HyperTask.this.count(account.getGrab());
		String[] trends = Global.HYPER_ANALYZE_TREND.keySet().toArray(new String[] {});
		Map<String, Summary> batch = new HashMap<String, Summary>();
		Map<String, Map<Integer, Media>> engine = SuperView.media(null, programService, account.getId());
		List<Integer> medias = new ArrayList<Integer>();
		List<Analyze> datas;
		
		//清理数据
		Summary value = new Summary();
		value.setFkAccount(account.getId());
		summaryService.trash(value);
		
		//舆情总量：global+0-total+000
		Analyze en = new Analyze();
		en.setFkAccount(account.getId());
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		value = new Summary();
		value.setField("global+0-total+000");
		value.setTotal(analyzeService.count(en));
		value.setFkAccount(account.getId());
		batch.put(value.getField(), value);
		
		//舆情新增：global+0-newly+000
		en = new Analyze();
		en.setFkAccount(account.getId());
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.Like, time[0][6] + "%");
		value = new Summary();
		value.setField("global+0-newly+000");
		value.setTotal(analyzeService.count(en));
		value.setFkAccount(account.getId());
		batch.put(value.getField(), value);
		
		//负面新增：global+0-negative+000
		en = new Analyze();
		en.setTrend("FUMIAN");
		en.setFkAccount(account.getId());
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.Like, time[0][6] + "%");
		value = new Summary();
		value.setField("global+0-negative+000");
		value.setTotal(analyzeService.count(en));
		value.setFkAccount(account.getId());
		batch.put(value.getField(), value);
		
		//按来源类型占比图：engine+{来源类型}-time+360、按来源类型走势图：engine+{来源类型}-day+001、来源类型总量汇总：engine+{来源类型}-total+000
		for (Map.Entry<String, Map<Integer, Media>> temp : engine.entrySet()) {
			medias.addAll(temp.getValue().keySet());
			Integer[] keys = temp.getValue().keySet().toArray(new Integer[] {});
			for (int i = 0; i < 7; i++) {
				en = new Analyze();
				en.setFkAccount(account.getId());
				en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
				en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.NotLessThan, time[1][i]);
				en.setSqlQueryIn(true, en.setFkMedia(null), true, keys);
				value = new Summary();
				value.setEngine(temp.getKey());
				value.setField("engine+" + temp.getKey() + "-time+" + time[2][i]);
				value.setTotal(analyzeService.count(en));
				value.setFkAccount(account.getId());
				batch.put(value.getField(), value);
				
				en = new Analyze();
				en.setFkAccount(account.getId());
				en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
				en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.Like, time[0][i] + "%");
				en.setSqlQueryIn(true, en.setFkMedia(null), true, keys);
				value = new Summary();
				value.setEngine(temp.getKey());
				value.setField("engine+" + temp.getKey() + "-day+00" + i);
				value.setTotal(analyzeService.count(en));
				value.setFkAccount(account.getId());
				batch.put(value.getField(), value);
			}
			
			en = new Analyze();
			en.setFkAccount(account.getId());
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryIn(true, en.setFkMedia(null), true, keys);
			value = new Summary();
			value.setEngine(temp.getKey());
			value.setField("engine+" + temp.getKey() + "-total+000");
			value.setTotal(analyzeService.count(en));
			long[] trend = new long[4];
			for (int i = 0; i < 4; i++) {
				en = new Analyze();
				en.setTrend(trends[i]);
				en.setFkAccount(account.getId());
				en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
				en.setSqlQueryIn(true, en.setFkMedia(null), true, keys);
				trend[i] = analyzeService.count(en);
			}
			value.setExtra(JsonTool.write(trend));
			value.setFkAccount(account.getId());
			batch.put(value.getField(), value);
		}
		
		//按来源媒体占比图：media+{媒体编号}-time+360、按来源媒体走势图：media+{媒体编号}-day+001
		Integer[] media = medias.toArray(new Integer[] {});
		for (int i = 0; i < 7; i++) {
			en = new Analyze();
			en.setFkAccount(account.getId());
			en.setSqlQueryField(Analyze.Method.COUNT.getField(en.setTotal(null)), en.setFkMedia(null));
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.NotLessThan, time[1][i]);
			en.setSqlQueryIn(true, en.setFkMedia(null), true, media);
			en.setSqlQueryGroup(en.setFkMedia(null));
			en.setSqlLeafSize(new Long(media.length));
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					Media temp = Global.HYPER_MEDIA_ENGINE.get(data.getFkMedia());
					if (temp == null) {
						continue;
					}
					
					value = new Summary();
					value.setEngine(temp.getEngine());
					value.setField("media+" + data.getFkMedia() + "-time+" + time[2][i]);
					value.setTotal(data.getTotal());
					value.setFkMedia(data.getFkMedia());
					value.setFkAccount(account.getId());
					batch.put(value.getField(), value);
				}
			}
			
			en = new Analyze();
			en.setFkAccount(account.getId());
			en.setSqlQueryField(Analyze.Method.COUNT.getField(en.setTotal(null)), en.setFkMedia(null));
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.Like, time[0][i] + "%");
			en.setSqlQueryIn(true, en.setFkMedia(null), true, media);
			en.setSqlQueryGroup(en.setFkMedia(null));
			en.setSqlLeafSize(new Long(media.length));
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					Media temp = Global.HYPER_MEDIA_ENGINE.get(data.getFkMedia());
					if (temp == null) {
						continue;
					}
					
					value = new Summary();
					value.setEngine(temp.getEngine());
					value.setField("media+" + data.getFkMedia() + "-day+00" + i);
					value.setTotal(data.getTotal());
					value.setFkMedia(data.getFkMedia());
					value.setFkAccount(account.getId());
					batch.put(value.getField(), value);
				}
			}
		}
		
		//按正面评价排名：media+{媒体编号}-total+000
		en = new Analyze();
		en.setFkAccount(account.getId());
		en.setSqlQueryField(Analyze.Method.COUNT.getField(en.setTotal(null)), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		en.setSqlQueryIn(true, en.setFkMedia(null), true, media);
		en.setSqlQueryGroup(en.setFkMedia(null));
		en.setSqlLeafSize(new Long(media.length));
		datas = analyzeService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Analyze data : datas) {
				Media temp = Global.HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (temp == null) {
					continue;
				}
				
				value = new Summary();
				value.setEngine(temp.getEngine());
				value.setField("media+" + data.getFkMedia() + "-total+000");
				value.setTotal(data.getTotal());
				value.setFkMedia(data.getFkMedia());
				value.setFkAccount(account.getId());
				batch.put(value.getField(), value);
			}
		}
		Map<String, long[]> trend = new HashMap<String, long[]>();
		for (int i = 0; i < 4; i++) {
			en = new Analyze();
			en.setTrend(trends[i]);
			en.setFkAccount(account.getId());
			en.setSqlQueryField(Analyze.Method.COUNT.getField(en.setTotal(null)), en.setFkMedia(null));
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryIn(true, en.setFkMedia(null), true, media);
			en.setSqlQueryGroup(en.setFkMedia(null));
			en.setSqlLeafSize(new Long(media.length));
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					String field = "media+" + data.getFkMedia() + "-total+000";
					long[] temp = trend.get(field);
					if (temp == null) {
						temp = new long[4];
						trend.put(field, temp);
					}
					temp[i] = data.getTotal();
				}
			}
		}
		for (Map.Entry<String, long[]> temp : trend.entrySet()) {
			value = batch.get(temp.getKey());
			if (value == null) {
				continue;
			}
			value.setRatio(temp.getValue()[0] * 100.0 / value.getTotal());
			value.setExtra(JsonTool.write(temp.getValue()));
		}
		summaryService.batch(new ArrayList<Summary>(batch.values()));
		
		//正面词汇：spirit+{词语编号}-positive+000、负面词汇：spirit+{词语编号}-negative+000
		batch = new ConcurrentHashMap<String, Summary>();
		en = new Analyze();
		en.setFkAccount(account.getId());
		en.setSqlQueryField(en.setDetail(null));
		en.setSqlQueryTerm(true, en.setDetail(null), Analyze.Operation.NotEqualTo, "{}");
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		en.setSqlLeafTotal(analyzeService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					Map<String, Integer> detail = JsonTool.read(data.getDetail(), Map.class);
					for (Map.Entry<String, Integer> temp : detail.entrySet()) {
						int spirit = Integer.parseInt(temp.getKey());
						String field;
						if (temp.getValue() > 0) {
							if (!Global.HYPER_SPIRIT_POSITIVE.containsKey(spirit)) {
								continue;
							}
							field = "spirit+" + temp.getKey() + "-positive+000";
						} else {
							if (!Global.HYPER_SPIRIT_NEGATIVE.containsKey(spirit)) {
								continue;
							}
							field = "spirit+" + temp.getKey() + "-negative+000";
						}
						
						value = batch.get(field);
						if (value == null) {
							value = new Summary();
							value.setField(field);
							value.setTotal(0L);
							value.setFkSpirit(spirit);
							value.setFkAccount(account.getId());
							batch.put(field, value);
						}
						value.setTotal(value.getTotal() + Math.abs(temp.getValue()));
					}
				}
			}
		}
		summaryService.batch(new ArrayList<Summary>(batch.values()));
		
		//抓取词语分析
		Keyword keyword = new Keyword();
		keyword.setSqlQueryField(keyword.setId(null));
		keyword.setSqlLeafSize(account.getWords());
		List<Keyword> keywords = keywordService.list(keyword);
		if (keywords != null && keywords.size() > 0) {
			for (Keyword data : keywords) {
				this.count(account, data, time, engine, media);
			}
		}
	}
	private void count(Account account, Keyword keyword, String[][] time, Map<String, Map<Integer, Media>> engine, Integer[] media) throws Exception {
		System.out.println(keyword.getId());
		//通用常量
		Map<String, Summary> batch = new HashMap<String, Summary>();
		Summary value;
		
		//词语情感占比：keyword+{词语编号}-trend+{情感类型}
		Analyze en = new Analyze();
		en.setFkKeyword(keyword.getId());
		en.setFkAccount(account.getId());
		en.setSqlQueryField(en.setTrend(null), Analyze.Method.COUNT.getField(en.setTotal(null)));
		en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
		en.setSqlQueryGroup(en.setTrend(null));
		en.setSqlLeafSize(4L);
		List<Analyze> datas = analyzeService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Analyze data : datas) {
				value = new Summary();
				value.setField("keyword+" + keyword.getId() + "-trend+" + data.getTrend());
				value.setTotal(data.getTotal());
				value.setFkKeyword(keyword.getId());
				value.setFkAccount(account.getId());
				batch.put(value.getField(), value);
			}
		}
		
		//词语汇总走势：keyword+{词语编号}-trend+{情感类型}-day+001
		for (int i = 0 ; i < 7; i++) {
			en = new Analyze();
			en.setFkKeyword(keyword.getId());
			en.setFkAccount(account.getId());
			en.setSqlQueryField(en.setTrend(null), Analyze.Method.COUNT.getField(en.setTotal(null)));
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.Like, time[0][i] + "%");
			en.setSqlQueryGroup(en.setTrend(null));
			en.setSqlLeafSize(4L);
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					value = new Summary();
					value.setField("keyword+" + keyword.getId() + "-trend+" + data.getTrend() + "-day+00" + i);
					value.setTotal(data.getTotal());
					value.setFkKeyword(keyword.getId());
					value.setFkAccount(account.getId());
					batch.put(value.getField(), value);
				}
			}
		}
		
		//词语引擎占比：keyword+{词语编号}-engine+{来源类型}-time+001
		for (Map.Entry<String, Map<Integer, Media>> temp : engine.entrySet()) {
			Integer[] keys = temp.getValue().keySet().toArray(new Integer[] {});
			for (int i = 0; i < 5; i++) {
				en = new Analyze();
				en.setFkKeyword(keyword.getId());
				en.setFkAccount(account.getId());
				en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
				en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.NotLessThan, time[1][i]);
				en.setSqlQueryIn(true, en.setFkMedia(null), true, keys);
				value = new Summary();
				value.setEngine(temp.getKey());
				value.setField("keyword+" + keyword.getId() + "-engine+" + temp.getKey() + "-time+" + time[2][i]);
				value.setTotal(analyzeService.count(en));
				value.setFkKeyword(keyword.getId());
				value.setFkAccount(account.getId());
				batch.put(value.getField(), value);
			}
		}
		
		//词语媒体占比：keyword+{词语编号}-media+{媒体编号}-time+001
		for (int i = 0; i < 5; i++) {
			en = new Analyze();
			en.setFkKeyword(keyword.getId());
			en.setFkAccount(account.getId());
			en.setSqlQueryField(Analyze.Method.COUNT.getField(en.setTotal(null)), en.setFkMedia(null));
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.LessThan, account.getGrab());
			en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Analyze.Operation.NotLessThan, time[1][i]);
			en.setSqlQueryIn(true, en.setFkMedia(null), true, media);
			en.setSqlQueryGroup(en.setFkMedia(null));
			en.setSqlLeafSize(new Long(media.length));
			datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Analyze data : datas) {
					Media temp = Global.HYPER_MEDIA_ENGINE.get(data.getFkMedia());
					if (temp == null) {
						continue;
					}
					
					value = new Summary();
					value.setEngine(temp.getEngine());
					value.setField("keyword+" + keyword.getId() + "-media+" + data.getFkMedia() + "-time+" + time[2][i]);
					value.setTotal(data.getTotal());
					value.setFkMedia(data.getFkMedia());
					value.setFkKeyword(keyword.getId());
					value.setFkAccount(account.getId());
					batch.put(value.getField(), value);
				}
			}
		}
		summaryService.batch(new ArrayList<Summary>(batch.values()));
	}
	public static void main(String[] args) throws Exception {
		Account account = new Account();
		account.setId("3c6f34480ef549629a238a2e4e12d1a3");
		account.setWords(100L);
		account.setCoords(1L);
		account.setGrab(new Date());
		HyperTask task = new HyperTask();
		task.setApplicationContext(new ClassPathXmlApplicationContext("ApplicationContext.xml"));
		task.work();
		//task.count(account);
	}
}