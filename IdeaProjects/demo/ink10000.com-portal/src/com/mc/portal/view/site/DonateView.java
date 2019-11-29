package com.mc.portal.view.site;
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
import com.mc.core.entity.site.Donate;
import com.mc.core.service.SuperService;
import com.mc.core.service.site.DonateService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/site/donate/")
public class DonateView extends SuperView<Integer, Donate> {
	@Autowired
	public DonateView(SuperService<Integer, Donate> service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Donate en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Donate en = new Donate();
			en.setId(id);
			en.setSqlQueryField(en.setMoney(null), en.setOccur(null), en.setNick(null), en.setContact(null), en.setState(null), en.setCreated(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("money", en.getMoney());
			data.put("occur", !en.getOccur().equals("-") ? en.getOccur() : null);
			data.put("nick", !en.getNick().equals("-") ? en.getNick() : null);
			data.put("contact", en.getContact());
			data.put("state", en.getState() ? 1 : 0);
			data.put("created", TimeTool.getTime(en.getCreated(), null));
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Donate en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Donate en) {
		JMapView res = new JMapView();
		try {
			res.setState(service.update(en) ? OK : "更新赞助失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = DonateService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Donate en, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Donate en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Donate().setCreated(null), false);
		pages.setLink(0, "site/donate/list.htm");
		pages.setLink(1, "site/donate/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "site/donate_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Donate en = new Donate();
			en.setSqlQueryField(en.setId(null), en.setMoney(null), en.setOccur(null), en.setNick(null), en.setContact(null), en.setState(null), en.setCreated(null));
			List<Donate> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Donate data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("money", data.getMoney());
					map.put("occur", data.getOccur());
					map.put("nick", data.getNick());
					map.put("contact", !data.doIsEmpty(data.getContact()) ? data.getContact() : "-");
					map.put("state", data.getState());
					map.put("created", TimeTool.getTime(data.getCreated(), null));
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
}