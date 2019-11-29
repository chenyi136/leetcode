package com.mc.portal.view.auth;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Enjoy;
import com.mc.core.entity.auth.Power;
import com.mc.core.entity.site.Daily;
import com.mc.core.service.auth.EnjoyService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.service.site.DailyService;
import com.mc.core.view.JMapView;
import com.mc.core.view.JTreeView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/auth/power/")
public class PowerView extends SuperView<String, Power> {
	@Autowired
	private DailyService dailyService;
	@Autowired
	private EnjoyService enjoyService;
	@Autowired
	public PowerView(PowerService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Power en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setIcon(null), en.setRoute(null), en.setForbid(null), en.setTacit(null), en.setMenu(null), en.setQuick(null), en.setQueue(null), en.setParent(null));
		ModelAndView res = super.load(request, en.getId(), en, "auth/power_load");
		res.addObject("items", this.power());
		res.addObject("parent", StartListener.power((PowerService) service, en.getId()));
		return res;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Power en) throws Exception {
		if (en.getRoute().indexOf("javascript") != -1) {
			en.setRoute("javascript:void(" + System.currentTimeMillis() + ");");
		}
		while(en.getRoute().startsWith("/")) {
			en.setRoute(en.getRoute().substring(1));
		}
		if (en.getParent().equals("-1")) {
			en.doFieldValue(en.setParent(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setParent(null));
		}
		if (!en.getIcon().equals("am-icon-circle-o")){
			Power temp = new Power();
			temp.setIcon(en.getIcon());
			if (en.getId() != null) {
				temp.setSqlQueryTerm(true, temp.setId(null), Power.Operation.NotEqualTo, en.getId());
			}
			if (service.count(temp) > 0) {
				return super.jump(request, "auth/power/list.htm", "权限图标重复");
			}
		}
		
		if (en.getId() == null) {
			en.setId(request.getParameter("id2"));
			if (en.getId() == null) {
				en.setId(en.getRoute().replace("/", "_").replace(".htm", ""));
			}
			Power temp = new Power();
			temp.setIcon(en.getId());
			if (service.count(temp) > 0) {
				return super.jump(request, "auth/power/list.htm", "该权限已存在");
			}
			
			if (service.save(en)) {
				StartListener.power((PowerService) service);
				return super.jump(request, "auth/power/list.htm", "创建权限成功");
			} else {
				return super.jump(request, "auth/power/list.htm", "创建权限失败");
			}
		} else {
			if (service.update(en)) {
				StartListener.power((PowerService) service);
				return super.jump(request, "auth/power/list.htm", "更新权限成功");
			} else {
				return super.jump(request, "auth/power/list.htm", "更新权限失败");
			}
		}
	}
	public JMapView save(HttpServletRequest request, Power en) {
		return null;
	}
	@DailyPoint(service = PowerService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Power en = new Power();
			en.setParent(ids[0]);
			if (service.count(en) > 0) {
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			
			if (service.delete(ids[0])) {
				Enjoy enjoy = new Enjoy();
				enjoy.setFkPower(ids[0]);
				enjoyService.trash(enjoy);
				Daily daily = new Daily();
				daily.setFkPower(ids[0]);
				dailyService.trash(daily);
				POWER.clear();
				res.put("count", 1);
			} else {
				res.put("count", 0);
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Power en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Power().setQueue(null), true);
		pages.setLink(0, "auth/power/list.htm");
		pages.setLink(1, "auth/power/drop.htm");
		pages.setLink(2, "auth/power/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auth/power_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Power en = new Power();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setIcon(null), en.setRoute(null), en.setLevel(null), en.setForbid(null), en.setTacit(null), en.setMenu(null), en.setQuick(null), en.setQueue(null));
			List<Power> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Power data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("icon", data.getIcon());
					map.put("route", data.getRoute());
					map.put("level", data.getLevel());
					map.put("forbid", data.getForbid());
					map.put("tacit", data.getTacit());
					map.put("menu", data.getMenu());
					map.put("quick", data.getQuick());
					map.put("queue", data.getQueue());
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
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "tree", method = RequestMethod.POST)
	public List<JTreeView> tree(HttpServletRequest request, boolean menu, boolean check, boolean drag) {
		List<JTreeView> res = new ArrayList<JTreeView>();
		try {
			if (POWER.size() < 1) {
				StartListener.power((PowerService) service);
			}
			for (Power temp : POWER.values()) {
				if (menu && !temp.getMenu()) {
					continue;
				}
				
				boolean isParent = temp.getRoute().indexOf("javascript") != -1;
				JTreeView data = new JTreeView(temp.getId(), temp.getParent(), "<i class=\"" + temp.getIcon() + "\"></i> " + temp.getName(), isParent, temp.getForbid(), check && temp.getTacit(), true, temp.getRoute());
				if (drag) {
					data.drag = drag;
				}
				res.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "queue", method = RequestMethod.GET)
	public ModelAndView queue(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (POWER.size() < 1) {
			StartListener.power((PowerService) service);
		}
		return new ModelAndView(VIEW_PATH_PREFIX + "auth/power_queue");
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "queue", method = RequestMethod.POST)
	public JMapView queue(HttpServletRequest request, @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			int count = 0;
			for (int i = 0; i < ids.length; i++) {
				if (POWER.get(ids[i]).getQueue() != i + 1) {
					Power temp = new Power();
					temp.setId(ids[i]);
					temp.setQueue(i + 1);
					service.update(temp);
					count++;
				}
			}
			if (count > 0) {
				StartListener.power((PowerService) service);
			}
			res.setState("权限排序成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private List<PowerItem> power() {
		if (POWER.size() < 1) {
			StartListener.power((PowerService) service);
		}
		Map<String, PowerItem> res = new LinkedHashMap<String, PowerItem>();
		for (Map.Entry<String, Power> data : POWER.entrySet()) {
			Power value = data.getValue();
			if (value.getLevel() != 1) {
				continue;
			}
			PowerItem item = new PowerItem();
			item.id = value.getId();
			item.name = value.getName();
			item.next = new ArrayList<PowerItem>();
			res.put(value.getId(), item);
		}
		for (Map.Entry<String, Power> data : POWER.entrySet()) {
			Power value = data.getValue();
			if (value.getLevel() != 2) {
				continue;
			}
			PowerItem item = new PowerItem();
			item.id = value.getId();
			item.name = value.getName();
			res.get(value.getParent()).next.add(item);
		}
		return new ArrayList<PowerItem>(res.values());
	}
}