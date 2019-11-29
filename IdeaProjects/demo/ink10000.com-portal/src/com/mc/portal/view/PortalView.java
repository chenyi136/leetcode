package com.mc.portal.view;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.tool.CookieTool;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/")
public class PortalView extends Global {
	@Autowired
	private AccountService accountService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private PowerService powerService;
	@DailyPoint
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (ServletTool.getOnline(request) != null) {
			return this.jump(request, null);
		}
		ModelAndView res = new ModelAndView("login");
		Map<String, String> local = (Map<String, String>) JsonTool.read(CryptoTool.DES.decode(CookieTool.get(request, KEY_LOCAL_ONLINE)), Map.class);
		if (local != null) {
			res.addObject("username", local.get("username"));
			res.addObject("password", local.get("password"));
		}
		return res;
	}
	@DailyPoint(protect = "password", refer = true, forbid = true)
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, String username, String password, String captcha, boolean remember) throws Exception {
		ModelAndView res = new ModelAndView("login");
		res.addObject("username", username);
		res.addObject("password", password);
		if (username == null || username.equals("")) {
			res.addObject("message", "请输入账号或邮箱");
			return res;
		}
		if (password == null || password.equals("")) {
			res.addObject("message", "请输入登录密码");
			return res;
		}
		String temp = ServletTool.getAttribute(request, KEY_SESSION_CAPTCHA, String.class);
		ServletTool.setAttribute(request, KEY_SESSION_CAPTCHA, null);
		if (captcha == null || captcha.equals("") || !captcha.equals(temp)) {
			res.addObject("message", "请输入正确的验证码");
			return res;
		}
		
		Account en = new Account();
		en.setUsername(username);
		en.setSqlQueryField(en.setId(null), en.setEmail(null), en.setPassword(null), en.setName(null), en.setFace(null), en.setConfig(null), en.setLocked(null), en.setPermit(null), en.setForbid(null), en.setActive(null), en.setFkGroup(null));
		en.setSqlLeafSize(1L);
		List<Account> datas = accountService.list(en);
		if (datas == null || datas.size() < 1) {
			res.addObject("message", "账号不存在！请先注册");
			return res;
		}
		en = datas.get(0);
		if (!CryptoTool.DES.encode(password).equals(en.getPassword())) {
			res.addObject("message", "你的密码错误");
			return res;
		}
		if (en.getLocked()) {
			res.addObject("message", "你被禁止登录");
			return res;
		}
		if (!en.doIsEmpty(en.getActive())) {
			res.addObject("message", "请登录邮箱（" + en.getEmail() + "）激活账号");
			return res;
		}
		
		OnlineInfo online = new OnlineInfo();
		online.id = en.getId();
		online.name = !en.doIsEmpty(en.getName()) ? en.getName() : username;
		online.face = super.file(en.getFace(), true);
		Map<String, Power> powers = StartListener.power(powerService, groupService, en);
		GlobalView.head(request, online.id, online.name, powers);
		GlobalView.menu(online.id, StartListener.power(powers, null, online));
		GlobalView.copy(request, en, powers);
		ServletTool.setOnline(request, online);
		
		if (remember) {
			Map<String, String> local = new HashMap<String, String>();
			local.put("username", username);
			local.put("password", password);
			CookieTool.set(response, KEY_LOCAL_ONLINE, CryptoTool.DES.encode(JsonTool.write(local)), LOCAL_MAX_TIME);
		} else {
			CookieTool.drop(request, response, KEY_LOCAL_ONLINE);
		}
		return this.jump(request, null);
	}
	@DailyPoint
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		if (online != null) {
			FileTool.delete(new File(CACHE + "share/" + online.id + "-head.html"), false);
			FileTool.delete(new File(CACHE + "share/" + online.id + "-menu.html"), false);
			FileTool.delete(new File(CACHE + "share/" + online.id + "-copy.html"), false);
		}
		ServletTool.destroy(request);
		return this.jump(request, "");
	}
	private ModelAndView jump(HttpServletRequest request, String target) throws Exception {
		if (target == null) {
			target = CookieTool.get(request, KEY_LOCAL_ADDRESS);
		}
		if (target == null) {
			target = "admin/index.htm";
		}
		ModelAndView res = new ModelAndView("jump");
		res.addObject(KEY_JUMP_TARGET, target);
		return res;
	}
}