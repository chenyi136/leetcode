package com.mc.portal.view.blog;
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
import com.mc.core.crux.Legal;
import com.mc.core.entity.blog.Locator;
import com.mc.core.service.blog.LocatorService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/locator/")
public class LocatorView extends SuperView<Integer, Locator> {
	@Autowired
	public LocatorView(LocatorService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Locator en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Locator en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Locator en) {
		JMapView res = new JMapView();
		try {
			en.setAddress(en.getAddress().replace("http://github.com/", "https://github.com/"));
			res.setState(en.getId() == null ? (service.save(en) ? OK : "创建站点失败") : (service.update(en) ? OK : "更新站点失败"));
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = LocatorService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Locator en, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Locator en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Locator().setCreated(null), false);
		pages.setLink(0, "blog/locator/list.htm");
		pages.setLink(1, "blog/locator/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/locator_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Locator en = new Locator();
			en.setSqlQueryField(en.setId(null), en.setType(null), en.setTitle(null), en.setAddress(null), en.setAccess(null), en.setCreated(null));
			List<Locator> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Locator data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("type", new String[] { data.getType().toString(), Legal.BLOG_LOCATOR_TYPE.get(data.getType()) });
					map.put("title", data.getTitle());
					map.put("address", data.getAddress());
					map.put("access", data.getAccess());
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