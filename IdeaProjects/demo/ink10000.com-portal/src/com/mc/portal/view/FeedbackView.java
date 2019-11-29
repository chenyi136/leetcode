package com.mc.portal.view;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.mc.core.entity.auth.Feedback;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.FeedbackService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/feedback/")
public class FeedbackView extends Global {
	@Autowired
	private AccountService accountService;
	@Autowired
	private FeedbackService feedbackService;
	@DailyPoint(refer = true)
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, boolean solve) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Map<String, OnlineInfo> cache = new HashMap<String, OnlineInfo>();
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "_/share/feedback");
		res.addObject("datas", list(accountService, feedbackService, online, null, solve, cache));
		res.addObject("cache", cache);
		res.addObject("manager", online.id.equals(SUPER_MANAGER_ACCOUNT));
		res.addObject("solve", solve);
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@ResponseBody
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public JMapView index(HttpServletRequest request, String type, boolean solve, Feedback en) {
		JMapView res = new JMapView();
		try {
			if (!Arrays.asList("load", "save", "reply", "drop", "list").contains(type)) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			if ("load".equals(type)) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				if (!online.id.equals(SUPER_MANAGER_ACCOUNT)) {
					res.setState("你没有加载意见反馈的权限");
					return res;
				}
				
				Feedback temp = new Feedback();
				temp.setId(en.getId());
				temp.setSqlQueryField(temp.setContent(null), temp.setAddress(null), temp.setSolve(null), en.setAdopt(null), temp.setReply(null), temp.setCreated(null));
				temp = feedbackService.get(temp);
				if (temp == null) {
					res.setState("请求参数非法");
					return res;
				}
				
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("content", temp.getContent());
				data.put("address", temp.getAddress());
				data.put("solve", temp.getSolve() ? 1 : 0);
				data.put("adopt", temp.getAdopt() ? 1 : 0);
				data.put("reply", temp.getReply());
				data.put("created", TimeTool.getTime(temp.getCreated(), null));
				res.setData(data);
				res.setState(OK);
			} else if ("save".equals(type)) {
				en.setProject(1);
				en.setAddress(en.getAddress().replace(ROOT, ""));
				en.setFkAccount(online.id);
				res.setState(feedbackService.save(en) ? OK : "意见反馈失败");
			} else if ("reply".equals(type)) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				if (!online.id.equals(SUPER_MANAGER_ACCOUNT)) {
					res.setState("你没有回复意见反馈的权限");
					return res;
				}
				
				Feedback temp = new Feedback();
				temp.setId(en.getId());
				temp.setSolve(en.getSolve());
				temp.setAdopt(en.getAdopt());
				temp.setReply(en.getReply());
				temp.setEdited(new Date());
				res.setState(feedbackService.update(en) ? OK : "回复意见失败");
			} else if ("drop".equals(type)) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				if (!online.id.equals(SUPER_MANAGER_ACCOUNT)) {
					res.setState("你没有删除意见反馈的权限");
					return res;
				}
				res.setState(feedbackService.delete(en.getId()) ? OK : "删除意见失败");
			} else if ("list".equals(type)) {
				if (en.getId() == null || en.getId() < 1) {
					res.setState("请求参数非法");
					return res;
				}
				Map<String, OnlineInfo> cache = new HashMap<String, OnlineInfo>();
				List<Feedback> datas = list(accountService, feedbackService, online, en.getId(), solve, cache);
				if (datas != null && datas.size() > 0) {
					cache.put(online.id, online);
					for (Feedback data : datas) {
						OnlineInfo account = cache.get(data.getFkAccount());
						if (account == null) {
							account = super.online(accountService, data.getFkAccount());
							cache.put(data.getFkAccount(), account);
						}
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("id", data.getId());
						map.put("content", data.getContent());
						map.put("address", data.getProject().intValue() == 2 ? CLOUD + data.getAddress() : data.getAddress());
						map.put("solve", data.getSolve());
						map.put("adopt", data.getAdopt());
						map.put("reply", data.getReply());
						map.put("created", TimeTool.getTime(data.getCreated(), null));
						map.put("fkAccount", account);
						res.setDatas(map);
					}
					res.setState(OK);
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public static List<Feedback> list(AccountService accountService, FeedbackService feedbackService, OnlineInfo online, Integer id, boolean solve, Map<String, OnlineInfo> cache) throws Exception {
		cache.put(online.id, online);
		Feedback en = new Feedback();
		if (id != null) {
			en.setSqlQueryTerm(true, en.setId(null), Feedback.Operation.LessThan, id);
		}
		if (online.id.equals(SUPER_MANAGER_ACCOUNT)) {
			if (solve) {
				en.setSolve(false);
			}
		} else {
			en.setProject(1);
			en.setFkAccount(online.id);
		}
		en.setSqlQueryField(en.setId(null), en.setProject(null), en.setContent(null), en.setAddress(null), en.setSolve(null), en.setAdopt(null), en.setReply(null), en.setCreated(null), en.setFkAccount(null));
		en.setSqlQueryOrder(en.setId(null), false);
		en.setSqlLeafSize(3L);
		List<Feedback> res = feedbackService.list(en);
		if (res != null) {
			for (Feedback data : res) {
				if (!cache.containsKey(data.getFkAccount())) {
					cache.put(data.getFkAccount(), online(accountService, data.getFkAccount()));
				}
			}
			return res;
		}
		return new ArrayList<Feedback>();
	}
}