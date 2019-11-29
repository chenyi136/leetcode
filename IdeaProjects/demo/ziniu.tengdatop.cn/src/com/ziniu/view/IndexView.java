package com.ziniu.view;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.tool.CryptoTool;
import com.ziniu.entity.auth.Account;
import com.ziniu.entity.core.Analyze;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Summary;
import com.ziniu.pojo.AnalyzeInfo;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.pojo.SummaryLine;
import com.ziniu.pojo.SummaryPie;
import com.ziniu.service.auth.AccountService;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.service.core.SummaryService;
import com.ziniu.template.HyperHelper;
import com.ziniu.tool.JsonTool;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/")
public class IndexView extends SuperView {
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
	@RequestMapping(value = "logon", method = RequestMethod.GET)
	public void logon(HttpServletRequest request, HttpServletResponse response, String phone, String password, String callback) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		Map<String, Object> res = new HashMap<String, Object>();
		if (phone == null || phone.equals("") || password == null || password.equals("")) {
			res.put("state", "请求参数非法");
			response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
			return;
		}
		
		Account en = new Account();
		en.setPhone(phone);
		if (accountService.count(en) > 0) {
			res.put("state", "该手机号已被注册");
			response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
			return;
		}
		
		en.setId(UUID.randomUUID().toString().replace("-", ""));
		en.setPassword(password);
		en.setWords(1L);
		en.setCoords(5L);
		en.setToken(UUID.randomUUID().toString().replace("-", ""));
		if (accountService.save(en)) {
			res.put("jump", ROOT + "jump.htm?id=" + en.getId() + "&token=" + en.getToken());
			res.put("state", "OK");
		} else {
			res.put("state", "注册失败！请稍后重试");
		}
		response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login(HttpServletRequest request, HttpServletResponse response, String phone, String password, String callback) throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		if (phone == null || phone.equals("") || password == null || password.equals("")) {
			res.put("state", "请求参数非法");
			response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
			return;
		}
		
		Account en = new Account();
		en.setPhone(phone);
		en.setSqlQueryField(en.setId(null), en.setPassword(null));
		en.setSqlLeafSize(1L);
		List<Account> datas = accountService.list(en);
		if (datas == null || datas.size() < 1) {
			res.put("state", "该手机号尚未注册");
			response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
			return;
		}
		en = datas.get(0);
		if (!en.getPassword().equals(CryptoTool.DES.encode(password))) {
			res.put("state", "登录密码错误");
			response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
			return;
		}
		
		Account temp = new Account();
		temp.setId(en.getId());
		temp.setToken(UUID.randomUUID().toString().replace("-", ""));
		if (accountService.update(temp)) {
			res.put("jump", ROOT + "jump.htm?id=" + temp.getId() + "&token=" + temp.getToken());
			res.put("state", "OK");
		} else {
			res.put("state", "登录失败！请稍后重试");
		}
		response.getWriter().write(callback + "(" + JsonTool.write(res) + ")");
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletTool.destroy(request);
		response.sendRedirect(LOGIN);
	}
	@RequestMapping(value = "jump", method = RequestMethod.GET)
	public void jump(HttpServletRequest request, HttpServletResponse response, String id, String token) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		if (online != null) {
			response.sendRedirect(ROOT);
			return;
		}
		if (id == null || id.equals("") || token == null || token.equals("")) {
			response.sendRedirect(LOGIN);
			return;
		}
		
		Account en = new Account();
		en.setId(id);
		en.setSqlQueryField(en.setPhone(null), en.setFace(null), en.setName(null), en.setWords(null), en.setToken(null));
		en = accountService.get(en);
		if (en == null || !token.equals(en.getToken())) {
			response.sendRedirect(LOGIN);
			return;
		}
		
		online = new OnlineInfo();
		online.id = id;
		online.face = super.file(en.getFace(), true);
		online.name = !en.doIsEmpty(en.getName()) ? en.getName() : en.getPhone();
		online.words = en.getWords();
		ServletTool.setOnline(request, online);
		
		en = new Account();
		en.setId(id);
		en.setSqlUpdateNull(en.setToken(null));
		accountService.update(en);
		if (super.media(request, programService, id).size() < 1) {
			response.sendRedirect(ROOT + "program/load.htm");
		} else {
			response.sendRedirect(ROOT);
		}
	}
	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public ModelAndView menu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		ModelAndView res = new ModelAndView("jsp/_/menu");
		res.addObject("media", super.media(request, programService, online.id));
		return res;
	}
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Account account = accountService.load(online.id);
		if (account == null) {
			response.sendRedirect(LOGIN);
			return null;
		}
		
		if (account.getGrab() == null) {
			return this.index();
		}
		
		ModelAndView res = new ModelAndView("jsp/index");
		Summary en = new Summary();
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null));
		en.setSqlQueryIn(true, en.setField(null), true, new String[] { "global+0-total+000", "global+0-newly+000", "global+0-negative+000" });
		en.setSqlLeafSize(3L);
		List<Summary> datas = summaryService.list(en);
		Map<String, Long> header = new HashMap<String, Long>();
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				header.put(data.getField(), data.getTotal());
			}
		}
		res.addObject("header", header);
		
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
			
			String field = "engine+" + temp.getKey() + "-time+";
			en = new Summary();
			en.setEngine(temp.getKey());
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setField(null), en.setTotal(null));
			en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, field + "___");
			en.setSqlLeafSize(7L);
			datas = summaryService.list(en);
			if (datas != null && datas.size() > 0) {
				String[] value = new String[8];
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
					} else if (data.getField().equals(field + "180")) {
						value[6] = data.getTotal().toString();
					} else if (data.getField().equals(field + "360")) {
						value[7] = data.getTotal().toString();
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
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setEngine(null), en.setTotal(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "engine+%-time+001");
		en.setSqlQueryIn(true, en.setEngine(null), true, select.keySet().toArray(new String[] {}));
		en.setSqlLeafSize(new Long(select.size()));
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				if (data.getTotal() < 1) {
					continue;
				}
				
				String name = HYPER_MEDIA_TYPE.get(data.getEngine());
				pie_engine_time.put(name, new SummaryPie(name, data.getTotal()));
			}
		}
		res.addObject("pie_engine_time", pie_engine_time);
		
		Map<Integer, String[]> table_media_time = new HashMap<Integer, String[]>();
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-time+___");
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
					
					value = new String[8];
					value[0] = media.getName();
					table_media_time.put(data.getFkMedia(), value);
				}
				
				String field = "media+" + data.getFkMedia() + "-time+";
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
				} else if (data.getField().equals(field + "180")) {
					value[6] = data.getTotal().toString();
				} else if (data.getField().equals(field + "360")) {
					value[7] = data.getTotal().toString();
				}
			}
		}
		res.addObject("table_media_time", table_media_time);
		
		Map<String, SummaryPie> pie_media_time = new HashMap<String, SummaryPie>();
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-time+001");
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
		
		List<String> table_media_total = new ArrayList<String>();
		en = new Summary();
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-total+000");
		en.setSqlQueryOrder(en.setRatio(null), false);
		en.setSqlLeafSize(10L);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (media != null) {
					table_media_total.add(media.getName());
				}
			}
		}
		res.addObject("table_media_total", table_media_total);
		
		SummaryLine line_engine_day = new SummaryLine();
		line_engine_day.xAxis = super.grab(account.getGrab());
		line_engine_day.series = new LinkedHashMap<String, SummaryLine.Item>();
		for (Map.Entry<String, String> temp : select.entrySet()) {
			String field = "engine+" + temp.getKey() + "-day+00";
			en = new Summary();
			en.setEngine(temp.getKey());
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
				line_engine_day.series.put(temp.getValue(), value);
			}
		}
		res.addObject("line_engine_day", line_engine_day);
		
		SummaryLine line_media_day = new SummaryLine();
		line_media_day.xAxis = line_engine_day.xAxis;
		line_media_day.series = new HashMap<String, SummaryLine.Item>();
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-day+00_");
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				Media temp = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (temp == null) {
					continue;
				}
				
				SummaryLine.Item value = line_media_day.series.get(temp.getName());
				if (value == null) {
					value = new SummaryLine.Item(temp.getName(), 7);
					line_media_day.series.put(temp.getName(), value);
				}
				value.data[Integer.parseInt(data.getField().replace("media+" + data.getFkMedia() + "-day+00", ""))] = data.getTotal();
			}
		}
		res.addObject("line_media_day", line_media_day);
		
		List<AnalyzeInfo> table_analyze_newly = new ArrayList<AnalyzeInfo>();
		Analyze analyze = new Analyze();
		analyze.setFkAccount(online.id);
		analyze.setSqlQueryField(analyze.setTrend(null), analyze.setCreated(null), analyze.setFkMedia(null), analyze.setFkHyper(null), analyze.setFkKeyword(null));
		en.setSqlQueryTerm(true, analyze.setTrend(null), Analyze.Operation.NotEqualTo, "WUXIAO");
		analyze.setSqlQueryIn(true, en.setFkMedia(null), true, HYPER_MEDIA_ENGINE.keySet().toArray(new Integer[] {}));
		analyze.setSqlQueryOrder(analyze.setCreated(null), false);
		analyze.setSqlLeafSize(5L);
		List<Analyze> analyzes = analyzeService.list(analyze);
		if (analyzes != null && analyzes.size() > 0) {
			for (Analyze data : analyzes) {
				Hyper temp = hyperService.load(data.getFkHyper());
				if (temp == null) {
					continue;
				}
				
				Keyword keyword = keywordService.load(data.getFkKeyword());
				if (keyword == null) {
					continue;
				}
				
				AnalyzeInfo value = new AnalyzeInfo();
				value.trend = data.getTrend();
				value.title = temp.getTitle();
				value.created = HyperHelper.time(data.getCreated(), "yyyy.MM.dd HH:mm");
				value.media = HYPER_MEDIA_ENGINE.get(data.getFkMedia()).getName();
				value.keyword = keyword.getName();
				table_analyze_newly.add(value);
			}
		}
		res.addObject("table_analyze_newly", table_analyze_newly);
		
		en = new Summary();
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setFkSpirit(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "spirit+%-positive+000");
		en.setSqlQueryOrder(en.setTotal(null), false);
		en.setSqlLeafSize(20L);
		List<Summary> table_spirit_positive = summaryService.list(en);
		res.addObject("table_spirit_positive", table_spirit_positive != null ? table_spirit_positive : new ArrayList<Summary>());
		
		en = new Summary();
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setFkSpirit(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "spirit+%-negative+000");
		en.setSqlQueryOrder(en.setTotal(null), false);
		en.setSqlLeafSize(20L);
		List<Summary> table_spirit_negative = summaryService.list(en);
		res.addObject("table_spirit_negative", table_spirit_negative != null ? table_spirit_negative : new ArrayList<Summary>());
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public Map<String, Object> list(HttpServletRequest request, String type, String engine, String time, Integer keyword) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (Arrays.asList("index_table_media_time", "index_pie_media_time", "index_table_media_total", "index_line_media_day", "table_media_time", "pie_media_time", "table_media_total").contains(type)) {
				if (engine == null || engine.equals("")) {
					res.put("state", "请求参数非法");
					return res;
				}
			}
			if (Arrays.asList("index_pie_engine_time", "index_table_media_time", "index_pie_media_time", "pie_engine_time", "pie_media_time").contains(type)) {
				if (time == null || time.equals("")) {
					res.put("state", "请求参数非法");
					return res;
				}
			}
			if (Arrays.asList("pie_engine_time", "table_media_time", "pie_media_time").contains(type)) {
				if (keyword == null || keyword < 1) {
					res.put("state", "请求参数非法");
					return res;
				}
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Map<String, Map<Integer, Media>> select = super.media(request, programService, online.id);
			if ("index_pie_engine_time".equals(type)) {
				Map<String, SummaryPie> pie_engine_time = new HashMap<String, SummaryPie>();
				Summary en = new Summary();
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setEngine(null), en.setTotal(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "engine+%-" + time);
				en.setSqlQueryIn(true, en.setEngine(null), true, select.keySet().toArray(new String[] {}));
				en.setSqlLeafSize(new Long(select.size()));
				List<Summary> datas = summaryService.list(en);
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
				res.put("datas", pie_engine_time);
				res.put("state", "OK");
			} else if ("index_table_media_time".equals(type)) {
				Map<Integer, String[]> table_media_time = new HashMap<Integer, String[]>();
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-time+___");
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						String[] value = table_media_time.get(data.getFkMedia());
						if (value == null) {
							Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
							if (media == null) {
								continue;
							}
							
							value = new String[8];
							value[0] = media.getName();
							table_media_time.put(data.getFkMedia(), value);
						}
						
						String field = "media+" + data.getFkMedia() + "-time+";
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
						} else if (data.getField().equals(field + "180")) {
							value[6] = data.getTotal().toString();
						} else if (data.getField().equals(field + "360")) {
							value[7] = data.getTotal().toString();
						}
					}
				}
				res.put("datas", table_media_time.values());
				
				Map<String, SummaryPie> pie_media_time = new HashMap<String, SummaryPie>();
				en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-" + time);
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
				res.put("datas2", pie_media_time);
				res.put("state", "OK");
			} else if ("index_pie_media_time".equals(type)) {
				Map<String, SummaryPie> pie_media_time = new HashMap<String, SummaryPie>();
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-" + time);
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (media != null) {
							pie_media_time.put(media.getName(), new SummaryPie(media.getName(), data.getTotal()));
						}
					}
				}
				res.put("datas", pie_media_time);
				res.put("state", "OK");
			} else if("index_table_media_total".equals(type)) {
				List<String> table_media_total = new ArrayList<String>();
				Summary en = new Summary();
				if (!engine.equals("-1")) {
					en.setEngine(engine);
				}
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-total+000");
				en.setSqlQueryOrder(en.setRatio(null), false);
				en.setSqlLeafSize(10L);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (media != null) {
							table_media_total.add(media.getName());
						}
					}
				}
				res.put("datas", table_media_total);
				res.put("state", "OK");
			} else if ("index_line_media_day".equals(type)) {
				SummaryLine line_media_day = new SummaryLine();
				line_media_day.series = new HashMap<String, SummaryLine.Item>();
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-day+00_");
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media temp = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (temp == null) {
							continue;
						}
						
						SummaryLine.Item value = line_media_day.series.get(temp.getName());
						if (value == null) {
							value = new SummaryLine.Item(temp.getName(), 7);
							line_media_day.series.put(temp.getName(), value);
						}
						value.data[Integer.parseInt(data.getField().replace("media+" + data.getFkMedia() + "-day+00", ""))] = data.getTotal();
					}
				}
				res.put("datas", line_media_day);
				res.put("state", "OK");
			} else if ("pie_engine_time".equals(type)) {
				Map<String, SummaryPie> pie_engine_time = new HashMap<String, SummaryPie>();
				Summary en = new Summary();
				en.setFkKeyword(keyword);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setEngine(null), en.setTotal(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword + "-engine+%-" + time);
				en.setSqlQueryIn(true, en.setEngine(null), true, select.keySet().toArray(new String[] {}));
				en.setSqlLeafSize(new Long(select.size()));
				List<Summary> datas = summaryService.list(en);
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
				res.put("datas", pie_engine_time);
				res.put("state", "OK");
			} else if ("table_media_time".equals(type)) {
				Map<Integer, String[]> table_media_time = new HashMap<Integer, String[]>();
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkKeyword(keyword);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword + "-media+%-time+0__");
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Summary> datas = summaryService.list(en);
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
						
						String field = "keyword+" + keyword + "-media+" + data.getFkMedia() + "-time+";
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
				res.put("datas", table_media_time.values());
				res.put("state", "OK");
			} else if ("pie_media_time".equals(type)) {
				Map<String, SummaryPie> pie_media_time = new HashMap<String, SummaryPie>();
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkKeyword(keyword);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "keyword+" + keyword + "-media+%-" + time);
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (media != null) {
							pie_media_time.put(media.getName(), new SummaryPie(media.getName(), data.getTotal()));
						}
					}
				}
				res.put("datas", pie_media_time);
				res.put("state", "OK");
			} else if ("table_media_total".equals(type)) {
				Map<Integer, String[]> total = new LinkedHashMap<Integer, String[]>();
				String[] value = new String[13];
				value[0] = "全部";
				total.put(0, value);
				Summary en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setField(null), en.setTotal(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "engine+" + engine + "-time+___");
				en.setSqlLeafSize(7L);
				List<Summary> datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					String field = "engine+" + engine + "-time+";
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
						} else if (data.getField().equals(field + "180")) {
							value[6] = data.getTotal().toString();
						} else if (data.getField().equals(field + "360")) {
							value[7] = data.getTotal().toString();
						}
					}
				}
				en = new Summary();
				en.setField("engine+" + engine + "-total+000");
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setTotal(null), en.setExtra(null));
				en.setSqlLeafSize(1L);
				datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					en = datas.get(0);
					Long[] temp = JsonTool.read(en.getExtra(), Long[].class);
					for (int i = 0; i < 4; i++) {
						value[8 + i] = temp[i].toString();
					}
					value[12] = en.getTotal().toString();
				}
				
				en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-time+___");
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (media == null) {
							continue;
						}
						value = total.get(media.getId());
						if (value == null) {
							value = new String[13];
							value[0] = media.getName();
							total.put(data.getFkMedia(), value);
						}
						
						String field = "media+" + data.getFkMedia() + "-time+";
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
						} else if (data.getField().equals(field + "180")) {
							value[6] = data.getTotal().toString();
						} else if (data.getField().equals(field + "360")) {
							value[7] = data.getTotal().toString();
						}
					}
				}
				en = new Summary();
				en.setEngine(engine);
				en.setFkAccount(online.id);
				en.setSqlQueryField(en.setTotal(null), en.setExtra(null), en.setFkMedia(null));
				en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-total+000");
				en.setSqlLeafSize(LEAF_MAX_SIZE);
				datas = summaryService.list(en);
				if (datas != null && datas.size() > 0) {
					for (Summary data : datas) {
						Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
						if (media == null) {
							continue;
						}
						value = total.get(media.getId());
						if (value == null) {
							value = new String[13];
							value[0] = media.getName();
							total.put(data.getFkMedia(), value);
						}
						
						Long[] temp = JsonTool.read(data.getExtra(), Long[].class);
						for (int i = 0; i < 4; i++) {
							value[8 + i] = temp[i].toString();
						}
						value[12] = data.getTotal().toString();
					}
				}
				List<String[]> table_media_total = new ArrayList<String[]>(total.values());
				Collections.sort(table_media_total, new Comparator<String[]>() {
					public int compare(String[] o1, String[] o2) {
						if (o1[0].equals("全部") || o2.equals("全部")) {
							return -1;
						}
						long num1 = Long.parseLong(o1[12]);
						long num2 = Long.parseLong(o2[12]);
						if (num1 > num2) {
							return -1;
						} else if (num1 < num2) {
							return 1;
						}
						return 0;
					}
				});
				res.put("datas", table_media_total);
				res.put("state", "OK");
			}
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	private ModelAndView index() {
		ModelAndView res = new ModelAndView("jsp/index");
		res.addObject("header", new HashMap<String, Long>());
		res.addObject("select", new HashMap<String, String>());
		res.addObject("table_engine_time", new ArrayList<String[]>());
		res.addObject("pie_engine_time", new HashMap<String, SummaryPie>());
		res.addObject("table_media_time", new HashMap<Integer, String[]>());
		res.addObject("pie_media_time", new HashMap<String, SummaryPie>());
		res.addObject("table_media_total", new ArrayList<String>());
		SummaryLine line_engine_day = new SummaryLine();
		line_engine_day.xAxis = super.grab(new Date());
		line_engine_day.series = new HashMap<String, SummaryLine.Item>();
		res.addObject("line_engine_day", line_engine_day);
		SummaryLine line_media_day = new SummaryLine();
		line_media_day.xAxis = line_engine_day.xAxis;
		line_media_day.series = new HashMap<String, SummaryLine.Item>();
		res.addObject("line_media_day", line_media_day);
		res.addObject("table_analyze_newly", new ArrayList<AnalyzeInfo>());
		res.addObject("table_spirit_positive", new ArrayList<Summary>());
		res.addObject("table_spirit_negative", new ArrayList<Summary>());
		return res;
	}
}