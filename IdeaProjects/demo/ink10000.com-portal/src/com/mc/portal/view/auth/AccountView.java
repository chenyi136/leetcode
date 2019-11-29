package com.mc.portal.view.auth;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Enjoy;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.EnjoyService;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
import com.mc.portal.view.GlobalView;
@Controller
@RequestMapping("/auth/account/")
public class AccountView extends SuperView<String, Account> {
	@Autowired
	private EnjoyService enjoyService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private PowerService powerService;
	@Autowired
	public AccountView(AccountService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Account en) throws Exception {
		if (GROUP.size() < 1) {
			StartListener.group(groupService);
		}
		en.setSqlQueryField(en.setUsername(null), en.setName(null), en.setPermit(null), en.setForbid(null), en.setLocked(null), en.setFkGroup(null));
		return super.load(request, en.getId(), en, "auth/account_load");
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Account en) throws Exception {
		en.setPermit(en.getPermit().replace("'", "\""));
		en.setForbid(en.getForbid().replace("'", "\""));
		if (en.getId() == null) {
			en.setId(UUID.randomUUID().toString().replace("-", ""));
			en.setConfig(JsonTool.write(new OnlineInfo.Config()));
			if (service.save(en)) {
				List<Enjoy> datas = new ArrayList<Enjoy>();
				Map<String, Power> powers = StartListener.power(powerService, groupService, en);
				for (Power power : powers.values()) {
					if (power.getQuick()) {
						Enjoy data = new Enjoy();
						data.setFkPower(power.getId());
						data.setFkAccount(en.getId());
						datas.add(data);
					}
				}
				enjoyService.batch(datas);
				return super.jump(request, "auth/account/list.htm", "创建用户成功");
			} else {
				return super.jump(request, "auth/account/list.htm", "创建用户失败");
			}
		} else {
			en.setEdited(new Date());
			if (service.update(en)) {
				String clear = request.getParameter("clear");
				if (OK.equals(clear)) {
					OnlineInfo online = ServletTool.getOnline(request);
					online.name = !en.doIsEmpty(en.getName()) ? en.getName() : en.getUsername();
					Map<String, Power> powers = StartListener.power(powerService, groupService, en);
					if (en.getId().equals(online.id)) {
						Account temp = new Account();
						temp.setId(en.getId());
						temp.setSqlQueryField(temp.setConfig(null));
						temp = service.get(temp);
						temp.setId(en.getId());
						GlobalView.head(request, online.id, online.name, powers);
						GlobalView.menu(online.id, StartListener.power(powers, null, online));
						GlobalView.copy(request, temp, powers);
						request.setAttribute(KEY_JUMP_CACHE, "&cache"+ System.currentTimeMillis());
					} else {
						FileTool.delete(new File(CACHE + "share/" + en.getId() + "-head.html"), false);
						FileTool.delete(new File(CACHE + "share/" + en.getId() + "-menu.html"), false);
						FileTool.delete(new File(CACHE + "share/" + en.getId() + "-copy.html"), false);
					}
				} else if ("HEAD".equals(clear)) {
					OnlineInfo online = ServletTool.getOnline(request);
					online.name = !en.doIsEmpty(en.getName()) ? en.getName() : en.getUsername();
					if (en.getId().equals(online.id)) {
						GlobalView.head(request, online.id, online.name, StartListener.power(powerService, groupService, en));
					} else {
						FileTool.delete(new File(CACHE + "share/" + en.getId() + "-head.html"), false);
					}
				}
				return super.jump(request, "auth/account/list.htm", "更新用户成功");
			} else {
				return super.jump(request, "auth/account/list.htm", "更新用户失败");
			}
		}
	}
	public JMapView save(HttpServletRequest request, Account en) {
		return null;
	}
	public Object list(HttpServletRequest request, PageBody pages, Account en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Account().setCreated(null), false);
		pages.setLink(0, "auth/account/list.htm");
		pages.setLink(2, "auth/account/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auth/account_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Account en = new Account();
			en.setSqlQueryField(en.setId(null), en.setUsername(null), en.setEmail(null), en.setFace(null), en.setName(null), en.setLocked(null), en.setCreated(null), en.setEdited(null), en.setFkGroup(null));
			List<Account> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				if (GROUP.size() < 1) {
					StartListener.group(groupService);
				}
				for (Account data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("username", data.getUsername());
					map.put("email", !data.doIsEmpty(data.getEmail()) ? data.getEmail() : "-");
					map.put("face", super.file(data.getFace()));
					map.put("name", !data.doIsEmpty(data.getName()) ? data.getName() : "-");
					map.put("locked", data.getLocked());
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
					map.put("fkGroup", GROUP.get(data.getFkGroup()).getName());
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
	@RequestMapping(value = "power", method = RequestMethod.POST)
	public JMapView power(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			Account en = new Account();
			en.setId(id);
			en.setSqlQueryField(en.setPermit(null), en.setForbid(null), en.setFkGroup(null));
			if (id == null || id.equals("") || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Power> powers = StartListener.power(powerService, groupService, en);
			StringBuffer entry = new StringBuffer(",");
			for (Power power : powers.values()) {
				if (!power.getForbid()) {
					entry.append(power.getId() + ",");
				}
			}
			res.put("entry", entry.toString());
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}