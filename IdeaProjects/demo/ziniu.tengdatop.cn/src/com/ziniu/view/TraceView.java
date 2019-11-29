package com.ziniu.view;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ziniu.entity.core.Analyze;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Trace;
import com.ziniu.pojo.AnalyzePage;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.TraceService;
import com.ziniu.template.HyperHelper;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/trace/")
public class TraceView extends SuperView {
	@Autowired
	private AnalyzeService analyzeService;
	@Autowired
	private HyperService hyperService;
	@Autowired
	private KeywordService keywordService;
	@Autowired
	private TraceService traceService;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView res = new ModelAndView("jsp/store");
		res.addObject("pages", new AnalyzePage().init());
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public Map<String, Object> index(HttpServletRequest request, @RequestBody AnalyzePage pages) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			OnlineInfo online = ServletTool.getOnline(request);
			Analyze en = new Analyze();
			en.setStore(true);
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setId(null), en.setTrend(null), en.setTrace(null), en.setScreen(null), en.setCreated(null), en.setFkMedia(null), en.setFkHyper(null), en.setFkKeyword(null));
			en.setSqlLeafTotal(analyzeService.count(en));
			en.setSqlLeafSize(10L);
			en.setSqlLeafNow(pages.place > en.getSqlLeafTabs() ? en.getSqlLeafTabs() : pages.place);
			List<Analyze> datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				List<Map<String, Object>> batch = new ArrayList<Map<String, Object>>();
				Map<String, Hyper> hyper = new LinkedHashMap<String, Hyper>();
				Map<Integer, Keyword> keyword = new LinkedHashMap<Integer, Keyword>();
				for (Analyze data : datas) {
					Keyword value1 = keyword.get(data.getFkKeyword());
					if (value1 == null) {
						value1 = keywordService.load(data.getFkKeyword());
						if (value1 == null) {
							continue;
						}
						keyword.put(data.getFkKeyword(), value1);
					}
					
					Hyper value2 = hyper.get(data.getFkHyper());
					if (value2 == null) {
						value2 = hyperService.load(data.getFkHyper());
						if (value2 == null) {
							continue;
						}
						hyper.put(data.getFkHyper(), value2);
					}
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("trend", data.getTrend());
					map.put("store", data.getStore());
					map.put("screen", data.getScreen() != null ? HyperHelper.time(data.getScreen(), null) : "-");
					map.put("created", HyperHelper.time(data.getCreated(), null));
					map.put("media", HYPER_MEDIA_ENGINE.get(data.getFkMedia()).getName());
					map.put("keyword", value1.getName());
					map.put("address", value2.getAddress());
					map.put("title", value2.getTitle());
					batch.add(map);
				}
				res.put("datas", batch);
				res.put("total", en.getSqlLeafTotal());
				res.put("coords", en.getSqlLeafTabs());
				res.put("place", en.getSqlLeafNow());
				res.put("state", "OK");
			} else {
				res.put("state", "没有找到相关数据");
			}
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, @PathVariable String id) throws Exception {
		if (id == null || id.equals("")) {
			response.sendError(404);
			return null;
		}
		OnlineInfo online = ServletTool.getOnline(request);
		Analyze analyze = new Analyze();
		analyze.setId(id);
		analyze.setSqlQueryField(analyze.setTrace(null), analyze.setStore(null), analyze.setFkHyper(null), analyze.setFkKeyword(null), analyze.setFkAccount(null));
		analyze = analyzeService.get(analyze);
		if (analyze == null || !analyze.getFkAccount().equals(online.id)) {
			response.sendError(404);
			return null;
		}
		Hyper hyper = hyperService.load(analyze.getFkHyper());
		if (hyper == null) {
			response.sendError(404);
			return null;
		}
		Keyword keyword = keywordService.load(analyze.getFkKeyword());
		if (keyword == null || !keyword.getFkAccount().equals(online.id)) {
			response.sendError(404);
			return null;
		}
		
		analyze.setId(id);
		Trace en = new Trace();
		en.setFkAnalyze(id);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setTitle(null), en.setCoords(null), en.setPlace(null), en.setBlend(null), en.setTrend(null), en.setScreen(null), en.setCreated(null), en.setFkMedia(null));
		en.setSqlQueryOrder(en.setCreated(null), false);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Trace> datas = traceService.list(en);
		
		ModelAndView res = new ModelAndView("jsp/trace");
		res.addObject("analyze", analyze);
		res.addObject("hyper", hyper);
		res.addObject("keyword", keyword);
		res.addObject("datas", datas != null ? datas : new ArrayList<Trace>());
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "affirm", method = RequestMethod.POST)
	public Map<String, Object> affirm(HttpServletRequest request, String id) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (id == null || id.equals("")) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Analyze en = new Analyze();
			en.setId(id);
			en.setSqlQueryField(en.setTrace(null), en.setFkAccount(null));
			en = analyzeService.get(en);
			if (en == null || !en.getFkAccount().equals(online.id)) {
				res.put("state", "请求参数非法");
				return res;
			}
			if (!en.getTrace()) {
				res.put("state", "OK");
				return res;
			}
			
			en = new Analyze();
			en.setId(id);
			en.setTrace(false);
			res.put("state", analyzeService.update(en) ? "OK" : "设置停止追踪失败");
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "store", method = RequestMethod.POST)
	public Map<String, Object> store(HttpServletRequest request, String id, boolean store) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (id == null || id.equals("")) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Analyze en = new Analyze();
			en.setId(id);
			en.setSqlQueryField(en.setStore(null), en.setFkAccount(null));
			en = analyzeService.get(en);
			if (en == null || !en.getFkAccount().equals(online.id)) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			if (en.getStore() == store) {
				res.put("state", "OK");
				return res;
			}
			
			en = new Analyze();
			en.setId(id);
			en.setStore(store);
			res.put("state", analyzeService.update(en) ? "OK" : (store ? "加入收藏失败" : "移除收藏失败"));
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
}