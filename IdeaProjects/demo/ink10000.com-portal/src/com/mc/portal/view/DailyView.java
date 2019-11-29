package com.mc.portal.view;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.site.Daily;
import com.mc.core.service.site.DailyService;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller("com.mc.portal.view.DailyView")
@RequestMapping("/daily/")
public class DailyView extends Global {
	@Autowired
	private DailyService dailyService;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView(VIEW_PATH_PREFIX + "_/share/daily");
	}
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, @RequestParam("prefixs[]") String[] prefixs, Long size, Long now) {
		JMapView res = new JMapView();
		try {
			if (prefixs == null || prefixs.length < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Daily en = new Daily();
			if (prefixs[0].equals("/")) {
				en.setProject(1);
				en.setFkAccount(online.id);
			} else {
				for (String prefix : prefixs) {
					en.setSqlQueryTerm(false, en.setProject(null), Daily.Operation.EqualTo, 1);
					en.setSqlQueryTerm(true, en.setFkAccount(null), Daily.Operation.EqualTo, online.id);
					en.setSqlQueryTerm(true, en.setAddress(null), Daily.Operation.Like, prefix + "%");
				}
			}
			en.setSqlQueryField(en.setName(null), en.setRemote(null), en.setTitle(null), en.setRefer(null), en.setAddress(null), en.setArgs(null), en.setType(null), en.setSize(null), en.setTrack(null), en.setForbid(null), en.setCreated(null));
			en.setSqlQueryOrder(en.setCreated(null), false);
			en.setSqlLeafTotal(dailyService.count(en));
			en.setSqlLeafSize(size);
			en.setSqlLeafNow(now > en.getSqlLeafTabs() ? en.getSqlLeafTabs() : now);
			List<Daily> datas = dailyService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Daily data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("name", data.getName());
					map.put("type", data.getType());
					map.put("remote", data.getRemote());
					map.put("size", data.getSize());
					map.put("track", data.getTrack());
					map.put("created", TimeTool.getTime(data.getCreated(), null));
					if (!data.getForbid()) {
						map.put("address", data.getAddress());
						if (data.getArgs() != null) {
							map.put("args", data.getArgs().startsWith("?") ? data.getArgs() : JsonTool.read(data.getArgs(), PageBody.class));
						}
					}
					if (data.getTitle() != null) {
						map.put("title", data.getTitle());
						map.put("refer", data.getRefer());
					}
					res.setDatas(map);
				}
				res.put("tabs", en.getSqlLeafTabs());
				res.put("now", en.getSqlLeafNow());
				res.setState(OK);
			} else {
				res.setState("暂无数据");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}