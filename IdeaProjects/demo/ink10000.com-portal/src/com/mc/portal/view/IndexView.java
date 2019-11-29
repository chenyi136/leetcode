package com.mc.portal.view;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Enjoy;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.EnjoyService;
import com.mc.core.service.auth.EventService;
import com.mc.core.service.auth.FeedbackService;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.tool.CookieTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/admin/")
public class IndexView extends Global {
	@Autowired
	private AccountService accountService;
	@Autowired
	private EnjoyService enjoyService;
	@Autowired
	private EventService eventService;
	@Autowired
	private FeedbackService feedbackService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private PowerService powerService;
	@DailyPoint
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Account pages = new Account();
		pages.setId(online.id);
		pages.setSqlQueryField(pages.setUsername(null), pages.setEmail(null), pages.setFace(null), pages.setName(null), pages.setBrief(null), pages.setLocked(null), pages.setCreated(null), pages.setEdited(null), pages.setFkGroup(null));
		pages = accountService.get(pages);
		if (pages == null) {
			response.sendRedirect(ROOT + "logout.htm");
			return null;
		}
		
		Enjoy enjoy = new Enjoy();
		enjoy.setFkAccount(online.id);
		enjoy.setSqlQueryField(enjoy.setFkPower(null));
		enjoy.setSqlQueryOrder(enjoy.setCreated(null), false);
		enjoy.setSqlLeafSize(15L);
		List<Enjoy> enjoys = enjoyService.list(enjoy);
		List<Power> hobby = new ArrayList<Power>();
		if (enjoys != null && enjoys.size() > 0) {
			Account account = new Account();
			account.setId(online.id);
			account.setSqlQueryField(account.setPermit(null), account.setForbid(null), account.setFkGroup(null));
			account = accountService.get(account);
			if (account != null) {
				Map<String, Power> powers = StartListener.power(powerService, groupService, account);
				for (Enjoy data : enjoys) {
					Power power = powers.get(data.getFkPower());
					if (power != null && !power.getForbid()) {
						hobby.add(power);
					}
				}
			}
		}
		
		pages.setFace(super.file(pages.getFace(), true));
		Map<String, OnlineInfo> cache = new HashMap<String, OnlineInfo>();
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "index");
		res.addObject("hobby", hobby);
		res.addObject("event", EventView.list(request, eventService, false, 3));
		res.addObject("feedback", FeedbackView.list(accountService, feedbackService, online, null, false, cache));
		res.addObject("cache", cache);
		res.addObject("group", GROUP.get(pages.getFkGroup()));
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, String type, String email, String captcha) {
		JMapView res = new JMapView();
		try {
			if (email == null || email.equals("") || captcha == null || captcha.equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			String temp = ServletTool.getAttribute(request, KEY_SESSION_CAPTCHA, String.class);
			ServletTool.setAttribute(request, KEY_SESSION_CAPTCHA, null);
			if (!captcha.equals(temp)) {
				res.setState("请输入正确的验证码");
				return res;
			}
			
			Account en = new Account();
			en.setEmail(email);
			if (accountService.count(en) > 0) {
				res.setState("该邮箱已被占用了");
				return res;
			}
			en.setId(ServletTool.getOnline(request).id);
			en.setEdited(new Date());
			res.setState(accountService.update(en) ? OK : "修改绑定邮箱失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Account en = new Account();
		en.setId(ServletTool.getOnline(request).id);
		en.setSqlQueryField(en.setUsername(null), en.setEmail(null), en.setFace(null), en.setName(null), en.setBrief(null));
		en = accountService.get(en);
		if (en == null) {
			response.sendRedirect(ROOT + "logout.htm");
			return null;
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "profile");
		res.addObject("pages", en);
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response, Account en) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		en.setId(online.id);
		en.setEdited(new Date());
		if (en.doIsEmpty(en.getFace())) {
			en.doFieldValue(en.setFace(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFace(null));
		}
		if (!en.doIsEmpty(en.getBrief())) {
			en.setBrief(en.getBrief().replace("\r", "").trim());
		}
		en.doFieldValue(en.setUsername(null).ClazzFieldName, null);
		en.doFieldValue(en.setPermit(null).ClazzFieldName, null);
		en.doFieldValue(en.setForbid(null).ClazzFieldName, null);
		en.doFieldValue(en.setFkGroup(null).ClazzFieldName, null);
		if (accountService.update(en)) {
			online.face = super.file(en.getFace(), true);
			String name = !en.doIsEmpty(en.getName()) ? en.getName() : request.getParameter("username2");
			if (!name.equals(online.name)) {
				online.name = name;
				Account account = new Account();
				account.setId(online.id);
				account.setSqlQueryField(account.setPermit(null), account.setForbid(null), account.setFkGroup(null));
				account = accountService.get(account);
				if (account == null) {
					response.sendRedirect(ROOT + "logout.htm");
					return null;
				}
				
				GlobalView.head(request, online.id, online.name, StartListener.power(powerService, groupService, account));
			}
			return super.jump(request, "admin/index.htm", "更新个人资料成功");
		} else {
			return super.jump(request, "admin/index.htm", "更新个人资料失败");
		}
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "param", method = RequestMethod.GET)
	public ModelAndView param(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Account en = new Account();
		en.setId(ServletTool.getOnline(request).id);
		en.setSqlQueryField(en.setConfig(null));
		en = accountService.get(en);
		if (en == null) {
			response.sendRedirect(ROOT + "logout.htm");
			return null;
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "param");
		res.addObject("template", JsonTool.read(en.getConfig(), OnlineInfo.Config.class));
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@RequestMapping(value = "param", method = RequestMethod.POST)
	public ModelAndView param(HttpServletRequest request, HttpServletResponse response, OnlineInfo.Config config, String refer) throws Exception {
		Account en = new Account();
		en.setId(ServletTool.getOnline(request).id);
		en.setConfig(JsonTool.write(config));
		en.setEdited(new Date());
		if (accountService.update(en)) {
			if (!config.KEEY_LOCAL_ADDRESS) {
				CookieTool.drop(request, response, KEY_LOCAL_ADDRESS);
			}
			FileTool.delete(new File(CACHE + "share/" + en.getId() + "-copy.html"), false);
			return super.jump(request, refer != null && refer.startsWith(ROOT) && !refer.equals(ROOT) ? refer : "admin/index.htm", "更新我的设置成功");
		} else {
			return super.jump(request, refer != null && refer.startsWith(ROOT) && !refer.equals(ROOT) ? refer : "admin/index.htm", "更新我的设置失败");
		}
	}
}