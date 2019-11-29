package com.mc.portal.view.auto;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.mc.core.entity.SuperEntity;
import com.mc.core.entity.auto.Driver;
import com.mc.core.entity.auto.Project;
import com.mc.core.entity.auto.Template;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.auto.DriverService;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.TemplateService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/project/")
public class ProjectView extends SuperView<Integer, Project> {
	@Autowired
	private DriverService driverService;
	@Autowired
	private TableService tableService;
	@Autowired
	private TemplateService templateService;
	@Autowired
	private WorkService workService;
	@Autowired
	public ProjectView(ProjectService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Project en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setHome(null), en.setClazz(null), en.setEntry(null), en.setLevel(null), en.setNeglect(null), en.setRoute(null), en.setFkDriver(null), en.setFkWork(null));
		ModelAndView res = super.load(request, en.getId(), en, "auto/project_load");
		Integer id = ((Project) res.getModel().get("pages")).getFkWork();
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (id != null && id != config.id) {
			response.sendRedirect(ROOT + "auto/project/list.htm");
			return null;
		}
		
		res.addObject("tables", super.getTable(tableService, config.id, true, false));
		res.addObject("drivers", this.driver(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id));
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Project en = new Project();
			en.setId(id);
			en.setSqlQueryField(en.setId(null), en.setFkEntityClass(null), en.setFkDaoClass(null), en.setFkDaoImplClass(null), en.setFkDaoMapperXml(null), en.setFkServiceClass(null), en.setFkServiceImplClass(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("fkEntityClass", en.getFkEntityClass());
			data.put("fkDaoClass", en.getFkDaoClass());
			data.put("fkDaoImplClass", en.getFkDaoImplClass());
			data.put("fkDaoMapperXml", en.getFkDaoMapperXml());
			data.put("fkServiceClass", en.getFkServiceClass());
			data.put("fkServiceImplClass", en.getFkServiceImplClass());
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Project en) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (en.getFkDriver() == -1) {
			en.doFieldValue(en.setFkDriver(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkDriver(null));
		} else {
			if (!this.driver(config.id).containsKey(en.getFkDriver())) {
				return super.jump(request, "auto/project/list.htm", "请求参数非法");
			}
		}
		
		if (en.doIsEmpty(en.getClazz())) {
			en.setClazz(System.currentTimeMillis() + "-{version}.jar");
		}
		if (!en.getClazz().endsWith(".jar")) {
			en.setClazz(en.getClazz() + ".jar");
		}
		if (!en.doIsEmpty(en.getRoute())) {
			en.setRoute(en.getRoute().replace("\\", "/"));
		}
		
		if (en.getId() == null) {
			en.setLevel("[]");
			en.setLibrary("[]");
			en.setFkWork(config.id);
			return super.jump(request, "auto/project/list.htm", service.save(en) ? "创建项目成功" : "创建项目失败");
		} else {
			Project temp = new Project();
			temp.setId(en.getId());
			temp.setFkWork(config.id);
			if (!config.modify || service.count(temp) < 1) {
				return super.jump(request, "auto/project/list.htm", "你没有更新项目的权限");
			}
			
			en.setEdited(new Date());
			return super.jump(request, "auto/project/list.htm", service.update(en) ? "更新项目成功" : "更新项目失败");
		}
	}
	public JMapView save(HttpServletRequest request, Project en) {
		return null;
	}
	@DailyPoint(service = ProjectService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Project en = new Project();
			en.setFkWork(config.id);
			en.setSqlQueryIn(true, en.setId(null), true, ids);
			if (!config.trash || service.count(en) != ids.length) {
				res.setState("你没有删除项目的权限");
				return res;
			}
			
			en = new Project();
			en.setSqlQueryIn(true, new SuperEntity.Field(null, false, null, ids[0].getClass(), JDBC_PRIMARY_FIELD, 0, null), true, ids);
			res.put("count", service.trash(en));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
			return res;
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Project en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		PageBody pages = super.list(request, new Project().setCreated(null), false);
		pages.setLink(0, "auto/project/list.htm");
		pages.setLink(1, "auto/project/drop.htm");
		pages.setLink(2, "auto/project/load.htm");
		
		Map<Integer, String[]> clazz = new LinkedHashMap<Integer, String[]>();
		Template template = new Template();
		template.setFkWork(config.id);
		template.setSqlQueryField(template.setId(null), template.setClazz(null), template.setNozzle(null));
		template.setSqlLeafSize(LEAF_MAX_SIZE);
		template.setSqlQueryOrder(template.setClazz(null), true);
		List<Template> datas = templateService.list(template);
		if (datas != null && datas.size() > 0) {
			for (Template data : datas) {
				clazz.put(data.getId(), new String[] { data.getClazz(), data.getNozzle() });
			}
		}
		template = new Template();
		template.setKernel(true);
		template.setSqlQueryTerm(true, template.setFkWork(null), Template.Operation.NotEqualTo, config.id);
		template.setSqlQueryField(template.setId(null), template.setClazz(null), template.setNozzle(null));
		template.setSqlLeafSize(LEAF_MAX_SIZE);
		template.setSqlQueryOrder(template.setClazz(null), true);
		datas = templateService.list(template);
		if (datas != null && datas.size() > 0) {
			for (Template data : datas) {
				clazz.put(data.getId(), new String[] { data.getClazz(), data.getNozzle() });
			}
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/project_list");
		res.addObject("drivers", this.driver(config.id));
		res.addObject("clazz", clazz);
		res.addObject("context", config);
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Project en = new Project();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setHome(null), en.setClazz(null), en.setLevel(null), en.setCreated(null), en.setEdited(null), en.setFkDriver(null));
			List<Project> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				Map<Integer, String> drivers = this.driver(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
				for (Project data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("home", data.getHome());
					map.put("clazz", data.getClazz());
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
					map.put("driver", drivers.containsKey(data.getFkDriver()) ? new String[] { data.getFkDriver().toString(), drivers.get(data.getFkDriver()) } : new String[] { "-", "-" });
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
	@RequestMapping(value = "template", method = RequestMethod.POST)
	public JMapView template(HttpServletRequest request, Project en) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.modify) {
				res.setState("你没有更新项目模板的权限");
				return res;
			}
			
			Work work = new Work();
			work.setId(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
			work.setSqlQueryField(en.setId(null), en.setFkEntityClass(null), en.setFkDaoClass(null), en.setFkDaoImplClass(null), en.setFkDaoMapperXml(null), en.setFkServiceClass(null), en.setFkServiceImplClass(null));
			if (en.getId() == null || en.getId() < 1 || (work = workService.get(work)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			if (en.getFkEntityClass().intValue() == -1 || work.getFkEntityClass() != null && work.getFkEntityClass().intValue() == en.getFkEntityClass().intValue()) {
				en.doFieldValue(en.setFkEntityClass(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkEntityClass(null));
			}
			if (en.getFkDaoClass().intValue() == -1 || work.getFkDaoClass() != null && work.getFkDaoClass().intValue() == en.getFkDaoClass().intValue()) {
				en.doFieldValue(en.setFkDaoClass(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkDaoClass(null));
			}
			if (en.getFkDaoImplClass().intValue() == -1 || work.getFkDaoImplClass() != null && work.getFkDaoImplClass().intValue() == en.getFkDaoImplClass().intValue()) {
				en.doFieldValue(en.setFkDaoImplClass(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkDaoImplClass(null));
			}
			if (en.getFkDaoMapperXml().intValue() == -1 || work.getFkDaoMapperXml() != null && work.getFkDaoMapperXml().intValue() == en.getFkDaoMapperXml().intValue()) {
				en.doFieldValue(en.setFkDaoMapperXml(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkDaoMapperXml(null));
			}
			if (en.getFkServiceClass().intValue() == -1 || work.getFkServiceClass() != null && work.getFkServiceClass().intValue() == en.getFkServiceClass().intValue()) {
				en.doFieldValue(en.setFkServiceClass(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkServiceClass(null));
			}
			if (en.getFkServiceImplClass().intValue() == -1 || work.getFkServiceImplClass() != null && work.getFkServiceImplClass().intValue() == en.getFkServiceImplClass().intValue()) {
				en.doFieldValue(en.setFkServiceImplClass(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkServiceImplClass(null));
			}
			en.setEdited(new Date());
			res.setState(service.update(en) ? "定制项目模板成功" : "定制项目模板失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "library", method = RequestMethod.GET)
	public ModelAndView library(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		Project en = new Project();
		en.setId(id);
		en.setSqlQueryField(en.setName(null), en.setLibrary(null), en.setFkWork(null));
		if (id == null || id < 1 || (en = service.get(en)) == null) {
			response.sendRedirect(ROOT + "auto/project/list.htm");
			return null;
		}
		if (en.getFkWork() != ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id) {
			response.sendRedirect(ROOT + "auto/project/list.htm");
			return null;
		}
		
		en.setId(id);
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/project_library");
		res.addObject("pages", en);
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@ResponseBody
	@RequestMapping(value = "library", method = RequestMethod.POST)
	public JMapView library(HttpServletRequest request, Integer id, @RequestParam(value = "keys[]", required = false) String[] keys, boolean share) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash || !config.modify) {
				res.setState("你没有更新项目类库的权限");
				return res;
			}
			Project en = new Project();
			en.setId(id);
			en.setSqlQueryField(en.setId(null), en.setNeglect(null), en.setRoute(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Project temp = new Project();
			temp.setId(id);
			temp.setLibrary(keys != null ? JsonTool.write(keys) : "[]");
			temp.setEdited(new Date());
			service.update(temp);
			File parent = new File(en.getRoute());
			File[] files;
			if (keys == null || keys.length < 1 || !parent.exists() || !parent.isDirectory() || (files = parent.listFiles()) == null) {
				if (keys == null || keys.length < 1) {
					FileTool.delete(parent, false);
				}
				res.setState(OK);
				return res;
			}
			
			String[] ignore = null;
			if (!en.doIsEmpty(en.getNeglect())) {
				ignore = en.getNeglect().replace("\r", "").split("\n");
			}
			List<String> cache = new ArrayList<String>(Arrays.asList(keys));
			for (File file : files) {
				if (!file.isFile() || !file.getName().endsWith(".jar") || this.neglect(ignore, file.getName())) {
					continue;
				}
				String key = CryptoTool.MD5.encode(file, false).MD5;
				LibraryItem library = LIBRARY.get(key);
				if (library == null) {
					file.delete();
					continue;
				}
				if (share && AUTO_LIBRARY_TACIT.containsKey(key)) {
					file.delete();
					cache.remove(key);
					continue;
				}
				if (cache.contains(key) && file.getName().equals(library.NAME)) {
					cache.remove(key);
				} else {
					file.delete();
				}
			}
			for (String key : cache) {
				if (!AUTO_LIBRARY_TACIT.containsKey(key)) {
					LibraryItem library = LIBRARY.get(key);
					FileTool.copy(new File(PROJECT, "_/doc/jar/" + library.PATH), new File(en.getRoute(), library.NAME));
				}
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private Map<Integer, String> driver(Integer id) throws Exception {
		Map<Integer, String> res = new LinkedHashMap<Integer, String>();
		Driver en = new Driver();
		en.setFkWork(id);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setAddress(null), en.setUsername(null));
		en.setSqlQueryOrder(en.setEdited(null), false);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Driver> datas = driverService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Driver data : datas) {
				res.put(data.getId(), data.getName());
			}
		}
		return res;
	}
	private boolean neglect(String[] prefixs, String name) {
		if (prefixs == null || prefixs.length < 1) {
			return false;
		}
		for (String prefix : prefixs) {
			if (name.startsWith(prefix)) {
				return true;
			}
		}
		return false;
	}
}