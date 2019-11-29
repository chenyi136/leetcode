package com.mc.portal.view.file;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
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
import com.mc.core.entity.file.Enroll;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.file.EnrollService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/file/enroll/")
public class EnrollView extends SuperView<Integer, Enroll> {
	@Autowired
	public EnrollView(EnrollService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Enroll en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Enroll en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Enroll en) {
		return null;
	}
	@DailyPoint(service = EnrollService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Enroll en, @DailyPoint.Primary Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Enroll en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Enroll().setId(null), true);
		pages.setLink(0, "file/enroll/list.htm");
		pages.setLink(1, "file/enroll/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "file/enroll_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Enroll en = new Enroll();
			en.setSqlQueryField(en.setId(null), en.setAccount(null), en.setVerify(null));
			List<Enroll> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Enroll data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("account", data.getAccount());
					map.put("verify", data.getVerify() != null ? TimeTool.getTime(data.getVerify(), null) : "-");
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
	@RequestMapping(value = "collect", method = RequestMethod.POST)
	public JMapView collect(HttpServletRequest request, HttpServletResponse response, @RequestParam("keys[]") String[] keys) {
		JMapView res = new JMapView();
		try {
			String[][] datas = new String[keys.length][];
			long[] total = new long[2];
			for (int i = 0; i < keys.length; i++) {
				Enroll en = new Enroll();
				en.setSqlQueryTerm(true, en.setAccount(null), Entry.Operation.Like, "%@" + keys[i]);
				long count = service.count(en);
				datas[i] = new String[2];
				datas[i][0] = keys[i];
				datas[i][1] = String.valueOf(count);
				total[1] += count;
			}
			
			Enroll en = new Enroll();
			en.setSqlQueryTerm(true, en.setAccount(null), Entry.Operation.Like, "%@%");
			total[0] = service.count(en);
			res.put("datas", datas);
			res.put("total", total);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "lead", method = RequestMethod.POST)
	public JMapView lead(HttpServletRequest request, String account) {
		JMapView res = new JMapView();
		try {
			if (account == null || account.equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			if (account.indexOf("@") !=-1 && !Pattern.matches(PATTERN_VERIFY_EMAIL, account)) {
				res.setState("邮箱格式非法");
				return res;
			}
			Enroll en = new Enroll();
			en.setAccount(account.toLowerCase());
			if (service.count(en) > 0) {
				res.setState("该邮箱已导入");
				return res;
			}
			res.setState(service.save(en) ? OK : "导入邮箱失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}