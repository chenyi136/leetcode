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
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Table;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.service.auto.TableService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/module/")
public class ModuleView extends SuperView<Integer, Module> {
	@Autowired
	private TableService tableService;
	@Autowired
	public ModuleView(ModuleService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Module en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Module en = new Module();
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setClazz(null), en.setFrame(null), en.setFkWork(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("name", en.getName());
			data.put("clazz", en.getClazz());
			data.put("frame", en.getFrame());
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Module en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Module en) {
		JMapView res = new JMapView();
		try {
			String clazz = new TemplateConfig().getVerifyClass(en.getClazz(), true);
			String frame = en.getFrame() != null ? en.getFrame().replace(" ", "") : "";
			if (clazz == null) {
				res.setState("模块代号非法");
				return res;
			}
			if (frame.equals("")) {
				res.setState("结构前缀非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Module temp = new Module();
			if (en.getId() == null) {
				temp.setSqlQueryTerm(false, temp.setClazz(null), Module.Operation.EqualTo, clazz);
				temp.setSqlQueryTerm(true, temp.setFkWork(null), Module.Operation.EqualTo, config.id);
				temp.setSqlQueryTerm(false, temp.setFrame(null), Module.Operation.EqualTo, frame);
				temp.setSqlQueryTerm(true, temp.setFkWork(null), Module.Operation.EqualTo, config.id);
				if (service.count(temp) > 0) {
					res.setState("该模块已存在");
					return res;
				}
				
				en.setClazz(clazz);
				en.setFkWork(config.id);
				res.setState(service.save(en) ? OK : "创建模块失败");
			} else {
				temp.setId(en.getId());
				temp.setFkWork(config.id);
				if (!config.modify || service.count(temp) < 1) {
					res.setState("你没有更新模块的权限");
					return res;
				}
				
				temp = new Module();
				temp.setSqlQueryTerm(false, temp.setId(null), Module.Operation.NotEqualTo, en.getId());
				temp.setSqlQueryTerm(true, temp.setClazz(null), Module.Operation.EqualTo, clazz);
				temp.setSqlQueryTerm(true, temp.setFkWork(null), Module.Operation.EqualTo, config.id);
				temp.setSqlQueryTerm(false, temp.setId(null), Module.Operation.NotEqualTo, en.getId());
				temp.setSqlQueryTerm(true, temp.setFrame(null), Module.Operation.EqualTo, frame);
				temp.setSqlQueryTerm(true, temp.setFkWork(null), Module.Operation.EqualTo, config.id);
				if (service.count(temp) > 0) {
					res.setState("该模块已存在");
					return res;
				}
				
				en.setClazz(clazz);
				en.setFrame(frame);
				if (service.update(en)) {
					if (!clazz.equals(request.getParameter("clazz2"))) {
						Table table = new Table();
						table.setFkModule(en.getId());
						table.setSqlQueryField(table.setId(null));
						table.setSqlLeafSize(LEAF_MAX_SIZE);
						List<Table> datas = tableService.list(table);
						if (datas != null && datas.size() > 0) {
							List<Integer> keys = new ArrayList<Integer>();
							for (Table data : datas) {
								keys.add(data.getId());
							}
							super.setTable(tableService, keys);
						}
					}
					res.setState(OK);
				} else {
					res.setState("更新模块失败");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = ModuleService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length != 1 || ids[0] == null || ids[0] < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash) {
				res.setState("你没有删除模块的权限");
				return res;
			}
			
			Module en = new Module();
			en.setId(ids[0]);
			en.setFkWork(config.id);
			if (service.trash(en) > 0) {
				Table table = new Table();
				table.setFkModule(ids[0]);
				table.setSqlUpdateNew(table.setBuild(null), true);
				table.setSqlUpdateNull(table.setFkModule(null));
				tableService.alter(table);
			}
			res.put("count", 1);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Module en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Module().setClazz(null), true);
		pages.setLink(0, "auto/module/list.htm");
		pages.setLink(1, "auto/module/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/module_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Module en = new Module();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setFrame(null), en.setCreated(null));
			List<Module> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Module data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("clazz", data.getClazz());
					map.put("frame", data.getFrame());
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