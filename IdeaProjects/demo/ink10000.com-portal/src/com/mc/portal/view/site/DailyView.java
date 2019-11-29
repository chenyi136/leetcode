package com.mc.portal.view.site;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.site.Daily;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.site.DailyService;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller("com.mc.portal.view.site.DailyView")
@RequestMapping("/site/daily/")
public class DailyView extends SuperView<Integer, Daily> {
	@Autowired
	private AccountService accountService;
	@Autowired
	public DailyView(DailyService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Daily en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Daily en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Daily en) {
		return null;
	}
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Daily en, @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Daily en) throws Exception {
		if (pages.getCustom() != null && pages.getCustom().size() > 0) {
			for (PageBody.PageBodyValue data : pages.getCustom()) {
				if (data.name.equals(en.setCreated(null).FrameFieldName)) {
					en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Daily.Operation.Like, data.value + "%");
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Daily().setCreated(null), false);
		pages.setLink(0, "site/daily/list.htm");
		pages.setLink(1, "site/daily/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "site/daily_list");
		res.addObject("pages", pages);
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Daily en = new Daily();
			en.setSqlQueryField(en.setId(null), en.setProject(null), en.setName(null), en.setRemote(null), en.setTitle(null), en.setRefer(null), en.setAddress(null), en.setArgs(null), en.setType(null), en.setSize(null), en.setTrack(null), en.setForbid(null), en.setCreated(null), en.setFkAccount(null));
			List<Daily> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Daily data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("type", data.getType());
					map.put("remote", data.getRemote());
					map.put("size", data.getSize());
					map.put("track", data.getTrack());
					map.put("created", TimeTool.getTime(data.getCreated(), null));
					map.put("fkAccount", super.online(accountService, data.getFkAccount()).name);
					if (!data.getForbid()) {
						map.put("address", data.getProject().intValue() == 2 ? CLOUD + data.getAddress() : data.getAddress());
						if (!data.doIsEmpty(data.getArgs())) {
							map.put("args", data.getArgs().startsWith("?") ? data.getArgs() : JsonTool.read(data.getArgs(), PageBody.class));
						}
					}
					if (data.getTitle() != null) {
						map.put("title", data.getTitle());
						map.put("refer", data.getRefer().startsWith("http://") || data.getRefer().startsWith("https://") ? data.getRefer() : (data.getProject().intValue() == 2 ? CLOUD + data.getRefer() : data.getRefer()));
					}
					res.setDatas(map);
				}
				res.put("pages", pages);
				res.setState(OK);
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint(refer = true)
	@RequestMapping(value = "down", method = RequestMethod.GET)
	public void down(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		Daily en;
		if (id == null || id < 1 || (en = service.load(id)) == null) {
			response.sendError(404);
			return;
		}
		
		Map<String, Object> data = JsonTool.read(JsonTool.write(en), Map.class);
		if (en.getArgs() != null && !en.getArgs().startsWith("?")) {
			data.put("args", JsonTool.read(en.getArgs(), Map.class));
		}
		data.put("param", JsonTool.read(en.getParam(), Map.class));
		data.put("entry", JsonTool.list(en.getEntry(), Map.class));
		data.put("created", TimeTool.getTime(en.getCreated(), null));
		data.put("fkAccount", en.getFkAccount());
		data.remove("fkPower");
		ServletTool.getDown(request, response, JsonTool.toString(data).getBytes(), null, "daily-" + id + ".json");
	}
}