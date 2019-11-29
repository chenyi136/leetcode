package com.ziniu.view;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ziniu.entity.auth.Account;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Program;
import com.ziniu.entity.core.Summary;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.pojo.SummaryLine;
import com.ziniu.pojo.SummaryPie;
import com.ziniu.service.auth.AccountService;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.service.core.SummaryService;
import com.ziniu.template.HyperTask;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/keyword/")
public class KeywordView extends SuperView implements ApplicationContextAware {
	private ApplicationContext context;
	@Autowired
	private AccountService accountService;
	@Autowired
	private AnalyzeService analyzeService;
	@Autowired
	private HyperService hyperService;
	@Autowired
	private KeywordService keywordService;
	@Autowired
	private ProgramService programService;
	@Autowired
	private SummaryService summaryService;
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Keyword keyword = new Keyword();
		keyword.setSqlQueryField(keyword.setId(null), keyword.setName(null));
		keyword.setFkAccount(online.id);
		keyword.setSqlQueryOrder(keyword.setCreated(null), false);
		keyword.setSqlLeafSize(1L);
		List<Keyword> keywords = keywordService.list(keyword);
		keyword = keywords != null && keywords.size() > 0 ? keywords.get(0) : null;
		if (keyword == null) {
			return this.index();
		}
		return this.index(request, response, keyword.getId(), keyword);
	}
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, @PathVariable Integer id, Keyword keyword) throws Exception {
		if ((id == null || id < 1) && (keyword.getId() == null || keyword.getId() < 1 || keyword.getName() == null)) {
			response.sendError(404);
			return null;
		}
		
		OnlineInfo online = ServletTool.getOnline(request);
		Account account = accountService.load(online.id);
		if (account == null) {
			response.sendRedirect(LOGIN);
			return null;
		}
		if (account.getGrab() == null) {
			return this.index();
		}
		
		if (keyword.getId() == null || keyword.getName() == null) {
			keyword = keywordService.load(id);
			if (keyword == null || !keyword.getFkAccount().equals(online.id)) {
				response.sendError(404);
				return null;
			}
		}
		ModelAndView res = new ModelAndView("jsp/keyword");
		res.addObject("keyword", keyword);
		
		Map<String, SummaryPie> pie_keyword_trend = new HashMap<String, SummaryPie>();
		Summary en = new Summary();
		en.setFkKeyword(keyword.getId());
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword.getId() + "-trend+%");
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.NotLike, "keyword+" + keyword.getId() + "-trend+%-day+00_");
		en.setSqlLeafSize(4L);
		List<Summary> datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				String name = HYPER_ANALYZE_TREND.get(data.getField().replace("keyword+" + keyword.getId() + "-trend+", ""));
				if (name != null) {
					pie_keyword_trend.put(name, new SummaryPie(name, data.getTotal()));
				}
			}
		}
		res.addObject("pie_keyword_trend", pie_keyword_trend);
		
		SummaryLine line_keyword_day = new SummaryLine();
		line_keyword_day.xAxis = super.grab(account.getGrab());
		line_keyword_day.series = new LinkedHashMap<String, SummaryLine.Item>();
		for (Map.Entry<String, String> temp : HYPER_ANALYZE_TREND.entrySet()) {
			String field = "keyword+" + keyword.getId() + "-trend+" + temp.getKey() + "-day+00";
			en = new Summary();
			en.setFkKeyword(keyword.getId());
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setField(null), en.setTotal(null));
			en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, field + "_");
			en.setSqlLeafSize(7L);
			
			datas = summaryService.list(en);
			if (datas != null && datas.size() > 0) {
				SummaryLine.Item value = new SummaryLine.Item(temp.getValue(), 7);
				for (Summary data : datas) {
					value.data[Integer.parseInt(data.getField().replace(field, ""))] = data.getTotal();
				}
				line_keyword_day.series.put(temp.getValue(), value);
			}
		}
		res.addObject("line_keyword_day", line_keyword_day);
		
		Map<String, Map<Integer, Media>> engine = super.media(request, programService, online.id);
		List<String[]> table_engine_time = new ArrayList<String[]>();
		Map<String, String> select = new LinkedHashMap<String, String>();
		String query = null;
		for (Map.Entry<String, String> temp : HYPER_MEDIA_TYPE.entrySet()) {
			if (!engine.containsKey(temp.getKey())) {
				continue;
			}
			select.put(temp.getKey(), temp.getValue());
			if (query == null) {
				query = temp.getKey();
			}
			
			String field = "keyword+" + keyword.getId() + "-engine+" + temp.getKey() + "-time+";
			en = new Summary();
			en.setEngine(temp.getKey());
			en.setFkKeyword(keyword.getId());
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setField(null), en.setTotal(null));
			en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, field + "0__");
			en.setSqlLeafSize(5L);
			datas = summaryService.list(en);
			if (datas != null && datas.size() > 0) {
				String[] value = new String[6];
				value[0] = temp.getValue();
				for (Summary data : datas) {
					if (data.getField().equals(field + "001")) {
						value[1] = data.getTotal().toString();
					} else if (data.getField().equals(field + "007")) {
						value[2] = data.getTotal().toString();
					} else if (data.getField().equals(field + "015")) {
						value[3] = data.getTotal().toString();
					} else if (data.getField().equals(field + "030")) {
						value[4] = data.getTotal().toString();
					} else if (data.getField().equals(field + "090")) {
						value[5] = data.getTotal().toString();
					}
				}
				table_engine_time.add(value);
			}
		}
		
		if (query == null) {
			return this.index();
		}
		res.addObject("select", select);
		res.addObject("table_engine_time", table_engine_time);
		
		Map<String, SummaryPie> pie_engine_time = new HashMap<String, SummaryPie>();
		en = new Summary();
		en.setFkKeyword(keyword.getId());
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setEngine(null), en.setTotal(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword.getId() + "-engine+%-time+001");
		en.setSqlQueryIn(true, en.setEngine(null), true, select.keySet().toArray(new String[] {}));
		en.setSqlLeafSize(new Long(select.size()));
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				if (data.getTotal() < 1) {
					continue;
				}
				
				String name = HYPER_MEDIA_TYPE.get(data.getEngine());
				if (name != null) {
					pie_engine_time.put(name, new SummaryPie(name, data.getTotal()));
				}
			}
		}
		res.addObject("pie_engine_time", pie_engine_time);
		
		Map<Integer, String[]> table_media_time = new HashMap<Integer, String[]>();
		en = new Summary();
		en.setEngine(query);
		en.setFkKeyword(keyword.getId());
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword.getId() + "-media+%-time+0__");
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				String[] value = table_media_time.get(data.getFkMedia());
				if (value == null) {
					Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
					if (media == null) {
						continue;
					}
					
					value = new String[6];
					value[0] = media.getName();
					table_media_time.put(data.getFkMedia(), value);
				}
				
				String field = "keyword+" + keyword.getId() + "-media+" + data.getFkMedia() + "-time+";
				if (data.getField().equals(field + "001")) {
					value[1] = data.getTotal().toString();
				} else if (data.getField().equals(field + "007")) {
					value[2] = data.getTotal().toString();
				} else if (data.getField().equals(field + "015")) {
					value[3] = data.getTotal().toString();
				} else if (data.getField().equals(field + "030")) {
					value[4] = data.getTotal().toString();
				} else if (data.getField().equals(field + "090")) {
					value[5] = data.getTotal().toString();
				}
			}
		}
		res.addObject("table_media_time", table_media_time);
		
		Map<String, SummaryPie> pie_media_time = new HashMap<String, SummaryPie>();
		en = new Summary();
		en.setEngine(query);
		en.setFkKeyword(keyword.getId());
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword.getId() + "-media+%-time+001");
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (media != null) {
					pie_media_time.put(media.getName(), new SummaryPie(media.getName(), data.getTotal()));
				}
			}
		}
		res.addObject("pie_media_time", pie_media_time);
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public Map<String, Object> save(HttpServletRequest request, final Integer id, String name) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (id == null || id < 1 || name.length() > 10) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			final OnlineInfo online = ServletTool.getOnline(request);
			Program program = new Program();
			program.setId(id);
			program.setFkAccount(online.id);
			if (programService.count(program) < 1) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			final Keyword en = new Keyword();
			en.setFkAccount(online.id);
			if (keywordService.count(en) >= online.words) {
				res.put("state", "你的会员权益规定：你最多可添加" + online.words + "个词语");
				return res;
			}
			
			en.setName(name);
			en.setFkProgram(id);
			if (keywordService.count(en) > 0) {
				res.put("state", "该词语已存在");
				return res;
			}
			en.setAgent(request.getHeader("user-agent"));
			if (keywordService.save(en)) {
				super.program(request, programService, keywordService, online.id, online.words).get(id).keywords.put(en.getId(), en.getName());
				new Thread(new Runnable() {
					public void run() {
						try {
							Account account = accountService.load(online.id);
							if (account == null) {
								return;
							}
							account.setGrab(new Date());
							new HyperTask(context).work(account, en.getId());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}).start();
				res.put("id", en.getId());
				res.put("state", "OK");
			} else {
				res.put("state", "添加词语失败");
			}
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	private ModelAndView index() {
		ModelAndView res = new ModelAndView("jsp/keyword");
		res.addObject("keyword", new Keyword());
		res.addObject("pie_keyword_trend", new HashMap<String, SummaryPie>());
		SummaryLine line_keyword_day = new SummaryLine();
		line_keyword_day.xAxis = super.grab(new Date());
		line_keyword_day.series = new HashMap<String, SummaryLine.Item>();
		res.addObject("line_keyword_day", line_keyword_day);
		res.addObject("select", new HashMap<String, String>());
		res.addObject("table_engine_time", new ArrayList<String[]>());
		res.addObject("pie_engine_time", new HashMap<String, SummaryPie>());
		res.addObject("table_media_time", new HashMap<Integer, String[]>());
		res.addObject("pie_media_time", new HashMap<String, SummaryPie>());
		return res;
	}
}