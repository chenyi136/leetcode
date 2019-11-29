package com.mc.portal.view.auto;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auto.Genre;
import com.mc.core.service.auto.GenreService;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/genre/")
public class GenreView extends SuperView<Integer, Genre> {
	@Autowired
	public GenreView(GenreService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Genre en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Genre en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Genre en) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Genre temp = new Genre();
			if (en.getId() == null) {
				temp.setName(en.getName());
				temp.setFkWork(config.id);
				if (service.count(temp) > 0) {
					res.setState("该类型已存在");
					return res;
				}
				
				en.setTacit(false);
				en.setFkWork(config.id);
				if (service.save(en)) {
					config.template.getTypeMap().clear();
					res.put("id", en.getId());
					res.setState(OK);
				} else {
					res.setState("创建类型失败");
				}
			} else {
				temp.setId(en.getId());
				temp.setFkWork(config.id);
				if (!config.modify || service.count(temp) < 1) {
					res.setState("你没有更新类型的权限");
					return res;
				}
				
				temp = new Genre();
				temp.setName(en.getName());
				temp.setFkWork(config.id);
				temp.setSqlQueryTerm(true, temp.setId(null), Genre.Operation.NotEqualTo, en.getId());
				if (service.count(temp) > 0) {
					res.setState("该类型已存在");
					return res;
				}
				
				if (service.update(en)) {
					config.template.getTypeMap().clear();
					res.setState("更新类型成功");
				} else {
					res.setState("更新类型失败");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = GenreService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary Integer id) {
		JMapView res = new JMapView();
		try {
			if (id == null || id < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash) {
				res.setState("你没有删除类型的权限");
				return res;
			}
			
			Genre en = new Genre();
			en.setId(id);
			en.setFkWork(config.id);
			if (service.trash(en) > 0) {
				config.template.getTypeMap().clear();
				res.setState(OK);
			} else {
				res.setState("删除类型失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Genre en) throws Exception {
		return null;
	}
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	public JMapView list(HttpServletRequest request, PageBody pages) {
		return null;
	}
	@DailyPoint
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/genre_index");
		res.addObject("datas", super.getGenre((GenreService) service, ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id));
		return res;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "tacit", method = RequestMethod.POST)
	public JMapView tacit(HttpServletRequest request) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.trash) {
				res.setState("你没有还原数据类型到默认的权限");
				return res;
			}
			
			Genre en = new Genre();
			en.setFkWork(config.id);
			service.trash(en);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}