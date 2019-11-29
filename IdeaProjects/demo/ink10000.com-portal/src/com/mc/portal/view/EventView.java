package com.mc.portal.view;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Event;
import com.mc.core.service.auth.EventService;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/event/")
public class EventView extends Global {
	@Autowired
	private EventService eventService;
	@DailyPoint(refer = true)
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, boolean total) throws Exception {
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "_/share/event");
		res.addObject("datas", list(request, eventService, total, LEAF_MAX_SIZE));
		res.addObject("total", total);
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, String type, Event en) {
		JMapView res = new JMapView();
		try {
			if (!Arrays.asList("save", "state", "trash", "delete").contains(type)) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Event temp = null;
			if (Arrays.asList("state", "trash", "delete").contains(type)) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				temp = new Event();
				temp.setId(en.getId());
				temp.setSqlQueryField(temp.setState(null), temp.setFkAccount(null));
				temp = eventService.get(temp);
				if (temp == null || !temp.getFkAccount().equals(online.id)) {
					res.setState("请求参数非法");
					return res;
				}
			}
			
			if ("save".equals(type)) {
				if (!en.getAddress().startsWith(ROOT)) {
					res.setState("请求参数非法");
					return res;
				}
				if ("".equals(en.getImage())) {
					en.doFieldValue(en.setImage(null).ClazzFieldName, null);
				}
				en.setAddress(en.getAddress().replace(ROOT, ""));
				en.setState(0);
				en.setFkAccount(online.id);
				res.setState(eventService.save(en) ? OK : "创建待办事项失败");
			} else if ("state".equals(type)) {
				if (temp.getState().intValue() == 2) {
					res.setState("请求参数非法");
					return res;
				}
				
				Integer state = temp.getState();
				temp = new Event();
				temp.setId(en.getId());
				temp.setState(state + 1);
				if (temp.getState().intValue() == 2) {
					temp.setTrash(true);
				}
				temp.setEdited(new Date());
				if (eventService.update(temp)) {
					res.put("now", temp.getState());
					res.setState(OK);
				} else {
					res.setState("更新事项状态失败");
				}
			} else if ("trash".equals(type)) {
				temp = new Event();
				temp.setId(en.getId());
				temp.setTrash(true);
				temp.setEdited(new Date());
				if (eventService.update(temp)) {
					res.setState(OK);
				} else {
					res.setState("废弃待办事项失败");
				}
			} else if ("delete".equals(type)) {
				res.setState(eventService.delete(en.getId()) ? OK : "删除待办事项失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public static List<Event> list(HttpServletRequest request, EventService eventService, boolean total, long size) throws Exception {
		Event en = new Event();
		if (!total) {
			en.setTrash(false);
		}
		en.setFkAccount(ServletTool.getOnline(request).id);
		en.setSqlQueryField(en.setId(null), en.setAddress(null), en.setClose(null), en.setContent(null), en.setImage(null), en.setState(null), en.setTrash(null), en.setCreated(null));
		en.setSqlQueryOrder(en.setClose(null), true);
		en.setSqlQueryOrder(en.setEdited(null), false);
		en.setSqlLeafSize(size);
		List<Event> res = eventService.list(en);
		if (res != null) {
			return res;
		}
		return new ArrayList<Event>();
	}
}