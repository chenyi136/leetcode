package com.mc.portal.view.auth;
import java.io.File;
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
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Group;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
import com.mc.portal.view.GlobalView;
@Controller
@RequestMapping("/auth/group/")
public class GroupView extends SuperView<Integer, Group> {
	@Autowired
	private AccountService accountService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private PowerService powerService;
	@Autowired
	public GroupView(GroupService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Group en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setEntry(null), en.setTotal(null), en.setForbid(null));
		return super.load(request, en.getId(), en, "auth/group_load");
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Group en) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		en.setEntry(en.getEntry().replace("'", "\""));
		if (en.getId() == null) {
			en.setFkAccount(online.id);
			if (service.save(en)) {
				StartListener.group((GroupService) service);
				return super.jump(request, "auth/group/list.htm", "创建群组失败");
			} else {
				return super.jump(request, "auth/group/list.htm", "创建群组失败");
			}
		} else {
			if (service.update(en)) {
				StartListener.group((GroupService) service);
				if (OK.equals(request.getParameter("clear"))) {
					Account account = new Account();
					account.setFkGroup(en.getId());
					account.setSqlQueryField(account.setId(null), account.setConfig(null), account.setPermit(null), account.setForbid(null));
					account.setSqlLeafTotal(accountService.count(account));
					account.setSqlLeafSize(LEAF_MAX_SIZE);
					for (long i = 1; i <= account.getSqlLeafTabs(); i++) {
						account.setSqlLeafNow(i);
						List<Account> datas = accountService.list(account);
						if (datas != null && datas.size() > 0) {
							for (Account data : datas) {
								if (data.getId().equals(online.id)) {
									data.setFkGroup(en.getId());
									Map<String, Power> powers = StartListener.power(powerService, groupService, data);
									GlobalView.head(request, online.id, online.name, powers);
									GlobalView.menu(online.id, StartListener.power(powers, null, online));
									GlobalView.copy(request, data, powers);
									request.setAttribute(KEY_JUMP_CACHE, "&cache"+ System.currentTimeMillis());
								} else {
									FileTool.delete(new File(CACHE + "share/" + data.getId() + "-head.html"), false);
									FileTool.delete(new File(CACHE + "share/" + data.getId() + "-menu.html"), false);
									FileTool.delete(new File(CACHE + "share/" + data.getId() + "-copy.html"), false);
								}
							}
						}
					}
				}
				return super.jump(request, "auth/group/list.htm", "更新群组成功");
			} else {
				return super.jump(request, "auth/group/list.htm", "更新群组失败");
			}
		}
	}
	public JMapView save(HttpServletRequest request, Group en) {
		return null;
	}
	@DailyPoint(service = GroupService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null || ids[0] < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Account en = new Account();
			en.setFkGroup(ids[0]);
			if (accountService.count(en) >0) {
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			
			if (service.delete(ids[0])) {
				StartListener.group((GroupService) service);
				res.put("count", 1);
			} else {
				res.put("count", 0);
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setData(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Group en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Group().setId(null), true);
		pages.setLink(0, "auth/group/list.htm");
		pages.setLink(1, "auth/group/drop.htm");
		pages.setLink(2, "auth/group/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auth/group_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Group en = new Group();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setEntry(null), en.setTotal(null), en.setForbid(null));
			List<Group> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Group data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("entry", this.entry(data.getEntry()));
					map.put("total", data.getTotal());
					map.put("forbid", data.getForbid());
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
	private String[] entry(String entry) throws Exception {
		String[] data = JsonTool.read(entry, String[].class);
		if (data.length < 1) {
			return new String[] { "-", "-" };
		}
		if (data.length == 1) {
			return new String[] { data[0], data[0] };
		}
		if (data.length == 2) {
			return new String[] { data[0] + "," + data[1], data[0] + "," + data[1] };
		}
		String[] res = new String[] { data[0] + ", " + data[1] + ", " + data[2], data[0] + ", " + data[1] + ", " + data[2] };
		for (int i = 3; i < data.length; i++) {
			res[1] += (i % 3 == 0 ? "<br>" : ", ") + data[i];
		}
		if (res[1].endsWith("<br>")) {
			res[1] = res[1].substring(0, res[1].length() - 4);
		}
		return res;
	}
}