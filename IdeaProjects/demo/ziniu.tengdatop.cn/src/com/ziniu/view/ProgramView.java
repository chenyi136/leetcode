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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ziniu.entity.core.Analyze;
import com.ziniu.entity.core.Keyword;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Program;
import com.ziniu.entity.core.Summary;
import com.ziniu.entity.core.Trace;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.pojo.ProgramInfo;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.KeywordService;
import com.ziniu.service.core.ProgramService;
import com.ziniu.service.core.SummaryService;
import com.ziniu.service.core.TraceService;
import com.ziniu.tool.JsonTool;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/program/")
public class ProgramView extends SuperView {
	@Autowired
	private AnalyzeService analyzeService;
	@Autowired
	private KeywordService keywordService;
	@Autowired
	private ProgramService programService;
	@Autowired
	private SummaryService summaryService;
	@Autowired
	private TraceService traceService;
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Program en = new Program();
		en.setId(id);
		en.setSqlQueryField(en.setName(null), en.setMedia(null), en.setFkAccount(null));
		en = programService.get(en);
		if (en == null || !en.getFkAccount().equals(online.id)) {
			en = new Program();
		} else {
			en.setId(id);
		}
		
		ModelAndView res = new ModelAndView("jsp/program");
		res.addObject("pages", en);
		return res;
	}
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response, Integer id, String name, Integer[] medias) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Program en = new Program();
		String message = null;
		if (id == null) {
			System.out.println(JsonTool.write(online));
			Program program = new Program();
			program.setFkAccount(online.id);
			if (programService.count(program) >= online.words) {
				message = "你的会员权益规定：你最多可添加" + online.words + "个方案";
			} else {
				Map<Integer, String> temp = new LinkedHashMap<Integer, String>();
				if (medias != null && medias.length > 0) {
					Map<String, Map<Integer, Media>> cache = super.media(request, programService, online.id);
					for (Integer key : medias) {
						Media media = HYPER_MEDIA_ENGINE.get(key);
						if (media != null) {
							temp.put(key, media.getName());
							Map<Integer, Media> value = cache.get(media.getEngine());
							if (value == null) {
								value = new LinkedHashMap<Integer, Media>();
								cache.put(media.getEngine(), value);
							}
							if (!value.containsKey(media.getId())) {
								value.put(media.getId(), media);
							}
						}
					}
				}
				
				en.setName(name);
				en.setMedia(JsonTool.write(temp));
				en.setFkAccount(online.id);
				if (programService.save(en)) {
					ProgramInfo value = new ProgramInfo();
					value.id = en.getId();
					value.name = en.getName();
					value.queue = en.getQueue();
					value.keywords = new LinkedHashMap<Integer, String>();
					super.program(request, programService, keywordService, online.id, online.words).put(value.id, value);
					message =  "设置方案成功";
				} else {
					message = "设置方案失败";
				}
			}
		} else {
			en.setId(id);
			en.setSqlQueryField(en.setFkAccount(null));
			en = programService.get(en);
			if (en != null && en.getFkAccount().equals(online.id)) {
				Map<Integer, String> temp = new LinkedHashMap<Integer, String>();
				if (medias != null && medias.length > 0) {
					for (Integer key : medias) {
						Media media = HYPER_MEDIA_ENGINE.get(key);
						if (media != null) {
							temp.put(key, media.getName());
						}
					}
				}
				
				en.setId(id);
				en.setMedia(JsonTool.write(temp));
				if (programService.update(en)) {
					ServletTool.setAttribute(request, KEY_SESSION_MEDIA, null);
					message =  "更新方案成功";
				} else {
					message =  "更新方案失败";
				}
			}
		}
		if (message == null) {
			response.sendRedirect(ROOT + "program/load.htm");
		} else {
			response.getWriter().write("<script type=\"text/javascript\">window.alert(\"" + message + "\");location.href=\"" + ROOT + "program/load.htm\";</script>");
		}
	}
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public Map<String, Object> drop(HttpServletRequest request, Integer id) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			if (id == null || id < 1) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Program program = programService.load(id);
			if (program == null || !program.getFkAccount().equals(online.id)) {
				res.put("state", "请求参数非法");
				return res;
			}
			
			programService.delete(id);
			Keyword keyword = new Keyword();
			keyword.setFkProgram(id);
			keyword.setFkAccount(online.id);
			keyword.setSqlQueryField(keyword.setId(null));
			keyword.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Keyword> keywords = keywordService.list(keyword);
			if (keywords != null && keywords.size() > 0) {
				keywordService.trash(keyword);
				for (Keyword temp : keywords) {
					Analyze analyze = new Analyze();
					analyze.setFkKeyword(temp.getId());
					analyze.setFkAccount(online.id);
					analyze.setSqlQueryField(analyze.setId(null));
					analyze.setSqlLeafTotal(analyzeService.count(analyze));
					analyze.setSqlLeafSize(LEAF_MAX_SIZE);
					for (long i = 1; i <= analyze.getSqlLeafTabs(); i++) {
						analyze.setSqlLeafNow(i);
						List<Analyze> datas = analyzeService.list(analyze);
						if (datas != null && datas.size() > 0) {
							List<String> keys = new ArrayList<String>();
							for (Analyze data : datas) {
								keys.add(data.getId());
							}
							Trace trace = new Trace();
							trace.setFkAccount(online.id);
							trace.setSqlQueryIn(true, trace.setFkAnalyze(null), true, keys.toArray(new String[] {}));
							traceService.trash(trace);
						}
					}
					analyzeService.trash(analyze);
					
					Summary summary = new Summary();
					summary.setFkKeyword(temp.getId());
					summary.setFkAccount(online.id);
					summaryService.trash(summary);
				}
			}
			super.program(request, programService, keywordService, online.id, online.words).remove(id);
			res.put("state", "OK");
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		ModelAndView res = new ModelAndView("jsp/_/program");
		res.addObject("datas", super.program(request, programService, keywordService, online.id, online.words));
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "queue", method = RequestMethod.POST)
	public Map<String, Object> queue(HttpServletRequest request, @RequestBody Integer[][] datas) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			OnlineInfo online = ServletTool.getOnline(request);
			for (Integer[] data : datas) {
				Program en = new Program();
				en.setId(data[0]);
				en.setFkAccount(online.id);
				en.setSqlUpdateNew(en.setQueue(null), data[1]);
				programService.alter(en);
			}
			ServletTool.setAttribute(request, KEY_SESSION_PROGRAM, null);
			res.put("state", "OK");
		} catch (Exception e) {
			res.put("state", "内部错误！请稍后重试");
			e.printStackTrace();
		}
		return res;
	}
}