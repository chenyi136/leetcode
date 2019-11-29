package com.ziniu.view;
import java.util.ArrayList;
import java.util.Date;
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
import com.ziniu.entity.core.Media;
import com.ziniu.pojo.AnalyzePage;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.service.auth.AccountService;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.template.HyperHelper;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/analyze/")
public class AnalyzeView extends SuperView {
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
	
	@RequestMapping(value = "{type}", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, @PathVariable String type) throws Exception {
		if (type == null || type.equals("")) {
			response.sendError(404);
			return null;
		}
		
		OnlineInfo online = ServletTool.getOnline(request);
		Map<Integer, Media> media = super.media(request, programService, online.id).get(type = type.toUpperCase());
		if (media == null) {
			response.sendError(404);
			return null;
		}
		
		AnalyzePage pages = new AnalyzePage().init();
		pages.media = media.keySet().toArray(new Integer[] {});
		ModelAndView res = new ModelAndView("jsp/analyze");
		res.addObject("media", media);
		res.addObject("pages", pages);
		res.addObject("title", HYPER_MEDIA_TYPE.get(type));
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public Map<String, Object> list(HttpServletRequest request, @RequestBody AnalyzePage pages) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			OnlineInfo online = ServletTool.getOnline(request);
			Analyze en = new Analyze();
			if(pages.keyword != null && pages.keyword.length > 0){
				en.setSqlQueryIn(true, en.setFkKeyword(null), true, pages.keyword);
			}
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setId(null), en.setTrend(null), en.setAffirm(null), en.setStore(null), en.setScreen(null), en.setCreated(null), en.setFkMedia(null), en.setFkHyper(null), en.setFkKeyword(null));
			en.setSqlQueryIn(true, en.setTrend(null), true, pages.trend);
			en.setSqlQueryTerm(true, en.setCreated(null), Analyze.Operation.NotLessThan, new Date(System.currentTimeMillis() - pages.created * 3600 * 1000L));
			en.setSqlQueryIn(true, en.setFkMedia(null), true, pages.media);
			en.setSqlLeafTotal(analyzeService.count(en));
			en.setSqlLeafSize(10L);
			en.setSqlLeafNow(pages.place > en.getSqlLeafTabs() ? en.getSqlLeafTabs() : pages.place);
			this.list(en, pages.queue);
			
			List<Analyze> datas = analyzeService.list(en);
			if (datas != null && datas.size() > 0) {
				List<Map<String, Object>> batch = new ArrayList<Map<String, Object>>();
				Map<String, Hyper> hyper = new LinkedHashMap<String, Hyper>();
				Map<Integer, Keyword> keyword = new LinkedHashMap<Integer, Keyword>();
				for (Analyze data : datas) {
					if ("WUXIAO".equals(data.getTrend()) && !data.getAffirm()){
						Analyze temp = new Analyze();
						temp.setId(data.getId());
						temp.setAffirm(true);
						analyzeService.update(temp);
						data.setAffirm(true);
					}
					
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
					map.put("affirm", data.getAffirm());
					map.put("store", data.getStore());
					if (data.getScreen() != null) {
						map.put("screen", HyperHelper.time(data.getScreen(), null));
					}
					map.put("created", HyperHelper.time(data.getCreated(), null));
					map.put("media", HYPER_MEDIA_ENGINE.get(data.getFkMedia()).getName());
					map.put("keyword", value1.getName());
					map.put("address", value2.getAddress());
					map.put("title", value2.getTitle());
					map.put("content", value2.getContent().substring(0, Math.min(400, value2.getContent().length())));
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
	@ResponseBody
	@RequestMapping(value = "affirm", method = RequestMethod.POST)
	public Map<String, Object> affirm(HttpServletRequest request, String id, String trend) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (id == null || id.equals("") || !HYPER_ANALYZE_TREND.containsKey(trend)) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Analyze en = new Analyze();
			en.setId(id);
			en.setSqlQueryField(en.setTrend(null), en.setAffirm(null), en.setFkAccount(null));
			en = analyzeService.get(en);
			if (en == null || !en.getFkAccount().equals(online.id)) {
				res.put("state", "请求参数非法");
				return res;
			}
			if (en.getTrend().equals(trend)) {
				res.put("state", "OK");
				return res;
			}
			if (en.getAffirm() && !trend.equals("WUXIAO")) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			en = new Analyze();
			en.setId(id);
			en.setTrend(trend);
			en.setAffirm(true);
			if (trend.equals("WUXIAO")) {
				en.setTrace(false);
			}
			res.put("state", analyzeService.update(en) ? "OK" : "更新情感判断失败");
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	private void list(Analyze en, String queue) {
		if ("SCREEN_DESC".equals(queue)) {
			en.setSqlQueryOrder(en.setScreen(null), false);
		} else if ("SCREEN_ASC".equals(queue)) {
			en.setSqlQueryOrder(en.setScreen(null), true);
		} else if ("CREATED_DESC".equals(queue)) {
			en.setSqlQueryOrder(en.setCreated(null), false);
		} else if ("CREATED_ASC".equals(queue)) {
			en.setSqlQueryOrder(en.setCreated(null), true);
		}
	}
}