package com.mc.portal.view.site;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.site.Config;
import com.mc.core.service.site.ConfigService;
import com.mc.core.view.JMapView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller("com.mc.portal.view.site.ConfigView")
@RequestMapping("/site/config/")
public class ConfigView extends SuperView<Integer, Config> {
	public ConfigView(ConfigService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Config en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Config en = new Config();
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setClazz(null), en.setField(null), en.setTacit(null), en.setEntry(null), en.setCode(null), en.setFkAccount(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("name", en.getName());
			data.put("clazz", en.getClazz());
			data.put("field", en.getField());
			data.put("code", en.getCode() ? 1 : 0);
			if (!en.getCode()) {
				data.put("tacit", en.getTacit());
				data.put("entry", en.getEntry());
			}
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Config en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Config en) {
		JMapView res = new JMapView();
		try {
			if (!ServletTool.getOnline(request).id.equals(SUPER_MANAGER_ACCOUNT)) {
				res.setState("你没有配置全局参数的权限");
				return res;
			}
			if (service.update(en)) {
				Config temp = new Config();
				temp.setId(en.getId());
				temp.setSqlQueryField(temp.setClazz(null), temp.setField(null), temp.setEntry(null));
				temp = service.get(temp);
				if (temp != null) {
					Map<String, String> map = new HashMap<String, String>();
					map.put(temp.getField(), temp.getEntry());
					StartListener.config(temp.getClazz(), map);
				}
				res.setState(OK);
			} else {
				res.setState("更新全局参数失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Config en) throws Exception {
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
		Config en = new Config();
		en.setFkAccount(SUPER_MANAGER_ACCOUNT);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setField(null), en.setTacit(null), en.setEntry(null), en.setCode(null));
		en.setSqlQueryTerm(true, en.setClazz(null), Config.Operation.NotEqualTo, "");
		en.setSqlQueryTerm(true, en.setField(null), Config.Operation.NotEqualTo, "");
		en.setSqlQueryNull(true, en.setClazz(null), true);
		en.setSqlQueryNull(true, en.setField(null), true);
		en.setSqlQueryOrder(en.setField(null), true);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Config> datas = service.list(en);
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "site/config_index");
		res.addObject("datas", datas != null ? datas : new ArrayList<Config>());
		return res;
	}
}