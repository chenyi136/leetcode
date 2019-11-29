package com.mc.portal.view.auto;
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
import com.mc.core.entity.auto.Bound;
import com.mc.core.entity.auto.Field;
import com.mc.core.service.auto.BoundService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.JdbcTool;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/bound/")
public class BoundView extends SuperView<Integer, Bound> {
	@Autowired
	private TableService tableService;
	@Autowired
	private WorkService workService;
	@Autowired
	public BoundView(BoundService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Bound en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Bound en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Bound en) {
		JMapView res = new JMapView();
		try {
			Bound temp = new Bound();
			temp.setName(this.bound(en));
			temp.setFkTableHost(en.getFkTableHost());
			if (service.count(temp) > 0) {
				res.setState("该索引已存在");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			en.setName(temp.getName());
			en.setFkWork(config.id);
			if (!service.save(en)) {
				res.setState("创建索引失败");
				return res;
			}
			
			temp = new Bound();
			temp.setName(en.getName().split("-")[0].replace("fk_", "nk_"));
			temp.setFkTableHost(en.getFkTableHost());
			if (service.count(temp) < 1) {
				temp.setType("NORMAL KEY");
				temp.setTrash("NO ACTION");
				temp.setModify("NO ACTION");
				temp.setFieldHost(en.getFieldHost());
				temp.setFkWork(config.id);
				if (!service.save(temp)) {
					service.delete(en.getId());
					res.setState("创建索引失败");
					return res;
				}
			}
			
			super.setTable(workService, tableService, config.id, en.getFkTableHost(), null, true);
			res.put("id", en.getId());
			res.put("name", en.getName());
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Bound en, @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (en.getId() == null || en.getName() == null || en.getFkTableHost() == null) {
				if (ids == null || ids.length != 1 || ids[0] == null || ids[0] < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				en = service.load(ids[0]);
				if (en == null) {
					res.setState("请求参数非法");
					return res;
				}
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash) {
				res.setState("你没有删除约束的权限");
				return res;
			}
			
			Bound temp = new Bound();
			temp.setId(en.getId());
			temp.setFkTableHost(en.getFkTableHost());
			temp.setFkWork(config.id);
			int count = service.trash(temp);
			
			if (count > 0) {
				super.setTable(workService, tableService, config.id, en.getFkTableHost(), null, true);
			}
			res.put("count", count);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Bound en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Bound().setFkTableHost(null), true);
		pages.setLink(0, "auto/bound/list.htm");
		pages.setLink(1, "auto/bound/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/bound_list");
		res.addObject("tables", super.getTable(tableService, ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id, true, true));
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Bound en = new Bound();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setType(null), en.setTrash(null), en.setModify(null), en.setFieldHost(null), en.setFieldObey(null), en.setFkTableHost(null), en.setFkTableObey(null));
			List<Bound> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				Map<Integer, String> title = super.getTable(tableService, ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id, true, true);
				for (Bound data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("type", Legal.AUTO_BOUND_TYPE.get(data.getType()));
					map.put("trash", Legal.AUTO_BOUND_ACTION.get(data.getTrash()));
					map.put("modify", Legal.AUTO_BOUND_ACTION.get(data.getModify()));
					map.put("field_host", JdbcTool.field(data.getFieldHost(), "", "-"));
					map.put("field_obey", JdbcTool.field(data.getFieldObey(), "", "-"));
					String title1 = title.get(data.getFkTableHost());
					map.put("fk_table_host", new String[] { data.getFkTableHost().toString(), title1 != null ? title1 : "-" });
					String title2 = data.getFkTableObey() == null ? "-" : title.get(data.getFkTableObey());
					map.put("fk_table_obey", title2 != null ? title2 : "-");
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
	private String bound(Bound en) throws Exception {
		List<Field> datas = JsonTool.list(en.getFieldHost(), Field.class);
		if (datas == null || datas.size() < 1) {
			throw new Exception("请求参数非法");
		}
		
		StringBuffer temp = new StringBuffer();
		temp.append(en.getFkWork());
		temp.append("-" + en.getFkTableHost());
		for (Field data : datas) {
			temp.append("-" + data.getFrame());
		}
		int identity = CryptoTool.MD5.encode(temp.toString().getBytes()).hashCode();
		String res = (identity > 0 ? 1 : 0) + String.valueOf(Math.abs(identity));
		int size = res.length();
		if (res.length() < 11) {
			for (int i = 0; i < 11 - size; i++) {
				res += i;
			}
		}
		
		if ("FOREIGN KEY".equals(en.getType())) {
			datas = JsonTool.list(en.getFieldObey(), Field.class);
			if (datas != null && datas.size() > 0) {
				temp = new StringBuffer();
				temp.append(en.getFkTableObey());
				for (Field data : datas) {
					temp.append("-" + data.getFrame());
				}
				int identity2 = CryptoTool.MD5.encode(temp.toString().getBytes()).hashCode();
				String res2 = (identity2 > 0 ? 1 : 0) + String.valueOf(Math.abs(identity2));
				int size2 = res2.length();
				if (size2 < 11) {
					for (int i = 0; i < 11 - size2; i++) {
						res2 += i;
					}
				}
				return "fk_" + res + "-" + res2;
			}
		} else if ("FULL TEXT KEY".equals(en.getType())) {
			return "hk_" + res;
		} else if ("NORMAL KEY".equals(en.getType())) {
			return "nk_" + res;
		} else if ("UNIQUE KEY".equals(en.getType())) {
			return "uk_" + res;
		}
		return null;
	}
}