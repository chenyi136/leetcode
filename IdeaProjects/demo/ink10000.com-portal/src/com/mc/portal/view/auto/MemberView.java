package com.mc.portal.view.auto;
import java.util.ArrayList;
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
import com.mc.core.entity.auto.Member;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auto.MemberService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/member/")
public class MemberView extends SuperView<Integer, Member> {
	@Autowired
	private AccountService accountService;
	@Autowired
	public MemberView(MemberService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Member en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Member en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Member en) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.modify) {
				res.setState("你没有添加空间成员的权限");
				return res;
			}
			
			Member temp = new Member();
			temp.setFkWork(config.id);
			temp.setFkAccount(en.getFkAccount());
			if (service.count(temp) > 0) {
				res.setState("已添加该用户");
				return res;
			}
			
			Account account = new Account();
			account.setId(en.getFkAccount());
			if (accountService.count(account) < 1) {
				res.setState("该用户不存在");
				return res;
			}
			
			temp.setGrade(0L);
			res.setState(service.save(temp) ? OK : "添加成员失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1) {
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.modify) {
				res.setState("你没有删除成员的权限");
				return res;
			}
			
			List<String> keys = new ArrayList<String>();
			for (String id : ids) {
				if (id != null && !id.equals(config.account)) {
					keys.add(id);
				}
			}
			if (keys.size() < 1) {
				res.put("count", 0);
				res.setState(OK);
				return res;
			}
			
			Member en = new Member();
			en.setFkWork(config.id);
			en.setSqlQueryIn(true, en.setFkAccount(null), true, keys.toArray(new String[] {}));
			res.put("count", service.trash(en));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Member en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		if (pages.getCustom() != null && pages.getCustom().size() > 0) {
			for (PageBody.PageBodyValue data : pages.getCustom()) {
				if (data.name.equals(en.setGrade(null).FrameFieldName)) {
					long temp = Long.parseLong(data.value);
					if (temp == 0 || temp == Long.MAX_VALUE) {
						en.setGrade(temp);
					} else {
						en.setSqlQueryTerm(true, en.setGrade(null), Member.Operation.NotEqualTo, 0L);
						en.setSqlQueryTerm(true, en.setGrade(null), Member.Operation.NotEqualTo, Long.MAX_VALUE);
					}
				} else if (data.name.equals(en.setFkAccount(null).FrameFieldName)) {
					List<String> keys = new ArrayList<String>();
					Account account = new Account();
					account.setSqlQueryField(account.setId(null));
					account.setSqlQueryTerm(true, account.setUsername(null), Account.Operation.Like, "%" + data.value.replace("%", "\\%").replace("_", "\\_") + "%");
					account.setSqlQueryTerm(true, account.setName(null), Account.Operation.Like, "%" + data.value.replace("%", "\\%").replace("_", "\\_") + "%");
					account.setSqlLeafSize(LEAF_MAX_SIZE);
					List<Account> accounts = accountService.list(account);
					if (accounts != null && accounts.size() > 0) {
						for (Account temp : accounts) {
							keys.add(temp.getId());
						}
					} else {
						keys.add("-1");
					}
					en.setSqlQueryIn(true, en.setFkAccount(null), true, keys.toArray(new String[] {}));
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Member().setCreated(null), false);
		pages.setLink(0, "auto/member/list.htm");
		pages.setLink(1, "auto/member/drop.htm");
		pages.setLink(2, "auto/member/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/member_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Member en = new Member();
			en.setSqlQueryField(en.setId(null), en.setGrade(null), en.setCreated(null), en.setFkAccount(null));
			List<Member> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Member data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getFkAccount());
					map.put("grade", new String[] { data.getGrade().toString() ,data.getGrade() == Long.MAX_VALUE ? "持有者" : (data.getGrade() == 0 ? "游客" : "参与者") });
					map.put("created", TimeTool.getTime(data.getCreated(), null));
					map.put("fkAccount", super.online(accountService, data.getFkAccount()).name);
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
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "grade", method = RequestMethod.POST)
	public JMapView grade(HttpServletRequest request, Long grade, String fkAccount) {
		JMapView res = new JMapView();
		try {
			if (grade == null || grade < 0 || fkAccount == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.modify) {
				res.setState("你没有设置成员等级的权限");
				return res;
			}
			
			Member en = new Member();
			en.setSqlQueryField(en.setId(null), en.setGrade(null));
			en.setFkWork(config.id);
			en.setFkAccount(fkAccount);
			en.setSqlLeafSize(1L);
			List<Member> datas = service.list(en);
			if (datas == null || datas.size() < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Member temp = datas.get(0);
			if (temp.getGrade().longValue() == grade || temp.getGrade() > 0 && temp.getGrade() < Long.MAX_VALUE && grade > 0 && grade < Long.MAX_VALUE) {
				res.setState("设置成员等级成功");
				return res;
			}
			if (temp.getGrade() == Long.MAX_VALUE && grade < Long.MAX_VALUE) {
				res.setState("不可对持有者降级");
				return res;
			}
			
			en = new Member();
			en.setId(temp.getId());
			en.setGrade(grade);
			if (service.update(en)) {
				if (grade == Long.MAX_VALUE) {
					grade = System.currentTimeMillis();
					en = new Member();
					en.setGrade(Long.MAX_VALUE);
					en.setFkWork(config.id);
					en.setSqlUpdateNew(en.setGrade(null), grade);
					en.setSqlQueryTerm(true, en.setId(null), Member.Operation.NotEqualTo, temp.getId());
					service.alter(en);
					
					config.account = fkAccount;
					config.trash = false;
					temp = (Member) ServletTool.getAttribute(request, KEY_SESSION_WORKS, Map.class).get(config.id);
					temp.setFkAccount(fkAccount);
					temp.setGrade(grade);
				}
				res.setState(OK);
			} else {
				res.setState("设置成员等级失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}