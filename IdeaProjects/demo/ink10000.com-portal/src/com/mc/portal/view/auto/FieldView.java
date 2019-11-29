package com.mc.portal.view.auto;
import java.io.File;
import java.net.URL;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auto.Bound;
import com.mc.core.entity.auto.Driver;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Inward;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Project;
import com.mc.core.entity.auto.Table;
import com.mc.core.entity.auto.Template;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.auto.BoundService;
import com.mc.core.service.auto.DriverService;
import com.mc.core.service.auto.FieldService;
import com.mc.core.service.auto.GenreService;
import com.mc.core.service.auto.InwardService;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.TemplateService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.template.DaoImplTemplate;
import com.mc.core.template.DaoMapperTemplate;
import com.mc.core.template.DaoTemplate;
import com.mc.core.template.EntityTemplate;
import com.mc.core.template.ServiceImplTemplate;
import com.mc.core.template.ServiceTemplate;
import com.mc.core.template.TemplateConfig;
import com.mc.core.template.impl.PortalDaoImplTemplateImpl;
import com.mc.core.template.impl.PortalDaoMapperTemplateImpl;
import com.mc.core.template.impl.PortalDaoTemplateImpl;
import com.mc.core.template.impl.PortalEntityTemplateImpl;
import com.mc.core.template.impl.PortalServiceImplTemplateImpl;
import com.mc.core.template.impl.PortalServiceTemplateImpl;
import com.mc.core.template.impl.TacitDaoImplTemplateImpl;
import com.mc.core.template.impl.TacitDaoMapperTemplateImpl;
import com.mc.core.template.impl.TacitDaoTemplateImpl;
import com.mc.core.template.impl.TacitEntityTemplateImpl;
import com.mc.core.template.impl.TacitServiceImplTemplateImpl;
import com.mc.core.template.impl.TacitServiceTemplateImpl;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.Zip4jTool;
import com.mc.core.view.JMapView;
import com.mc.core.view.JTreeView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.TemplateHelper;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.JdbcTool;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/field/")
public class FieldView extends SuperView<Integer, Field> implements ApplicationContextAware {
	private ApplicationContext context;
	@Autowired
	private BoundService boundService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private DriverService driverService;
	@Autowired
	private InwardService inwardService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TableService tableService;
	@Autowired
	private TemplateService templateService;
	@Autowired
	private WorkService workService;
	@Autowired
	public FieldView(FieldService service) {
		super(service);
	}
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Field en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Field en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Field en) {
		JMapView res = new JMapView();
		try {
			String clazz = new TemplateConfig().getVerifyClass(en.getClazz(), true);
			String frame = en.getFrame() != null ? en.getFrame().replace(" ", "") : "";
			if (clazz == null) {
				res.setState("属性名称非法");
				return res;
			}
			if (frame.equals("")) {
				res.setState("表字段名非法");
				return res;
			}
			if (en.getFkInward().intValue() == -1) {
				en.doFieldValue(en.setFkInward(null).ClazzFieldName, null);
				en.setSqlUpdateNull(en.setFkInward(null));
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Field temp = new Field();
			if (en.getId() == null) {
				temp.setSqlQueryTerm(false, temp.setClazz(null), Field.Operation.EqualTo, clazz);
				temp.setSqlQueryTerm(true, temp.setFkTable(null), Field.Operation.EqualTo, en.getFkTable());
				temp.setSqlQueryTerm(false, temp.setFrame(null), Field.Operation.EqualTo, frame);
				temp.setSqlQueryTerm(true, temp.setFkTable(null), Field.Operation.EqualTo, en.getFkTable());
				if (service.count(temp) > 0) {
					res.setState("该字段已存在");
					return res;
				}
				
				en.setClazz(clazz);
				en.setFrame(frame);
				en.setFkWork(config.id);
				if (service.save(en)) {
					super.setTable(workService, tableService, config.id, en.getFkTable(), null, true);
					res.put("id", en.getId());
					res.setState(OK);
				} else {
					res.setState("添加字段失败");
				}
			} else {
				temp.setId(en.getId());
				temp.setFkWork(config.id);
				if (!config.modify || service.count(temp) < 1) {
					res.setState("你没有更新字段的权限");
					return res;
				}
				
				temp = new Field();
				temp.setSqlQueryTerm(false, temp.setId(null), Field.Operation.NotEqualTo, en.getId());
				temp.setSqlQueryTerm(true, temp.setClazz(null), Field.Operation.EqualTo, clazz);
				temp.setSqlQueryTerm(true, temp.setFkTable(null), Field.Operation.EqualTo, en.getFkTable());
				temp.setSqlQueryTerm(false, temp.setId(null), Field.Operation.NotEqualTo, en.getId());
				temp.setSqlQueryTerm(true, temp.setFrame(null), Field.Operation.EqualTo, frame);
				temp.setSqlQueryTerm(true, temp.setFkTable(null), Field.Operation.EqualTo, en.getFkTable());
				if (service.count(temp) > 0) {
					res.setState("该字段已存在");
					return res;
				}
				
				List<Bound> bounds = new ArrayList<Bound>();
				List<Integer> tables = new ArrayList<Integer>();
				if (this.verify(tableService, boundService, en.getId(), frame, en.getFkTable(), en.getName(), tables, bounds)) {
					res.setState("被索引约束引用而无法修改");
					return res;
				}
				
				en.setClazz(clazz);
				en.setFrame(frame);
				if (service.update(en)) {
					tables.add(en.getFkTable());
					super.setTable(tableService, tables);
					for (Bound bound : bounds) {
						boundService.update(bound);
					}
					res.setState("UPDATE");
				} else {
					res.setState("更新字段失败");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = FieldService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary Field en) {
		JMapView res = new JMapView();
		try {
			if (en.getId() == null || en.getId() < 1 || en.getFrame() == null || en.getFkTable() == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash) {
				res.setState("你没有删除字段的权限");
				return res;
			}
			
			if (this.verify(tableService, boundService, en.getId(), en.getFrame(), en.getFkTable(), null, null, null)){
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			
			Field temp = new Field();
			temp.setId(en.getId());
			temp.setFkTable(en.getFkTable());
			temp.setFkWork(config.id);
			if (service.trash(temp) > 0) {
				super.setTable(workService, tableService, config.id, en.getFkTable(), null, true);
				res.setState(OK);
			} else {
				res.setState("删除字段失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Field en) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (config.inward == null || config.inward.size() < 1) {
			config.inward = super.getInward(inwardService, config.id, true);
		}
		return config.inward;
	}
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	public JMapView list(HttpServletRequest request, PageBody pages) {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Field en = new Field();
			en.setFkTable(id);
			en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setFrame(null), en.setType(null), en.setLength(null));
			en.setSqlQueryOrder(en.setQueue(null), true);
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Field> fields = service.list(en);
			if (fields == null || fields.size() < 1) {
				res.setState("该对象暂无字段");
				return res;
			}
			
			List<String[]> data = new ArrayList<String[]>();
			for (Field field : fields) {
				data.add(new String[] { field.getId().toString(), field.getName(), field.getFrame(), field.getType(), field.getLength().toString() });
			}
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "count", method = RequestMethod.GET)
	public ModelAndView count(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		Map<Integer, String> tables = super.getTable(tableService, config.id, false, true, id);
		Map<String, Map<String, List<String>>> pages = new TreeMap<String, Map<String, List<String>>>(new Comparator<String>() {
			public int compare(String o1, String o2) {
				if (o1 != null && o2 == null) {
					return 1;
				} else if (o1 == null && o2 != null) {
					return -1;
				}
				return o1.compareTo(o2);
			}
		});
		
		StringBuffer count = new StringBuffer();
		for (Map.Entry<Integer, String> table : tables.entrySet()) {
			if (Arrays.asList(121).contains(table.getKey())) {
				continue;
			}
			Field en = new Field();
			en.setFkTable(table.getKey());
			en.setFkWork(config.id);
			en.setSqlQueryField(en.setName(null), en.setFrame(null), en.setType(null), en.setEmpty(null), en.setLength(null), en.setFkTable(null));
			en.setSqlLeafTotal(service.count(en));
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Field> datas = service.list(en);
			if (datas != null && datas.size() > 0) {
				for (Field data : datas) {
					Map<String, List<String>> value = pages.get(data.getFrame());
					if (value == null) {
						value = new TreeMap<String, List<String>>(new Comparator<String>() {
							public int compare(String o1, String o2) {
								if (o1 != null && o2 == null) {
									return 1;
								} else if (o1 == null && o2 != null) {
									return -1;
								}
								return o1.compareTo(o2);
							}
						});
						pages.put(data.getFrame(), value);
					}
					
					String key = data.getType() + "+" + data.getEmpty() + "+" + data.getLength() + "+" + data.getName();
					List<String> entrys = value.get(key);
					if (entrys == null) {
						entrys = new ArrayList<String>();
						value.put(key, entrys);
					}
					entrys.add(table.getValue());
					if (data.getEmpty() && (data.getType().endsWith("CHAR") || data.getType().endsWith("TEXT"))) {
						count.append("UPDATE " + table.getValue() + " SET " + data.getFrame() + " = NULL WHERE " + data.getFrame() + " = '';<br>");
					}
				}
			}
		}
		if (count.length() > 0) {
			count.delete(count.length() - 4, count.length());
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/field_count");
		res.addObject("modules", super.getModule(moduleService, config.id, new Module().setName(null)));
		res.addObject("pages", pages);
		res.addObject("module", id);
		res.addObject("count", count.toString());
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		Table table = tableService.load(id);
		if (table == null) {
			response.sendRedirect(ROOT + "auto/table/list.htm");
			return null;
		}
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (table.getFkWork() != config.id) {
			response.sendRedirect(ROOT + "auto/table/list.htm");
			return null;
		}
		
		boolean build = false;
		Field field = new Field();
		field.setFkTable(id);
		field.setSqlQueryTerm(true, field.setFkWork(null), Field.Operation.NotEqualTo, config.id);
		if (service.trash(field) > 0) {
			super.setTable(workService, tableService, config.id, id, null, true);
			build = true;
		}
		
		if (config.template.getContext().MeshKeySupport) {
			if (table.getGrow()) {
				super.setTable(workService, tableService, config.id, id, false, true);
				build = true;
			}
		} else {
			field = new Field();
			field.setMajor(true);
			field.setFkTable(id);
			field.setFkWork(config.id);
			if (service.count(field) > 1) {
				field = new Field();
				field.setMajor(true);
				field.setFkTable(id);
				field.setFkWork(config.id);
				field.setSqlUpdateNew(field.setMajor(null), false);
				if (service.alter(field) > 0 && !build) {
					super.setTable(workService, tableService, config.id, id, null, true);
					build = true;
				}
			}
		}
		
		field = new Field();
		field.setSqlUpdateNull(field.setTacit(null));
		field.setSqlQueryNull(false, field.setTacit(null), true);
		field.setSqlQueryTerm(true, field.setTacit(null), Field.Operation.NotEqualTo, "");
		field.setSqlQueryTerm(true, field.setMajor(null), Field.Operation.EqualTo, true);
		field.setSqlQueryTerm(true, field.setFkTable(null), Field.Operation.EqualTo, id);
		field.setSqlQueryTerm(true, field.setFkWork(null), Field.Operation.EqualTo, config.id);
		field.setSqlQueryNull(false, field.setTacit(null), true);
		field.setSqlQueryTerm(true, field.setTacit(null), Field.Operation.NotEqualTo, "");
		field.setSqlQueryTerm(true, field.setEmpty(null), Field.Operation.EqualTo, true);
		field.setSqlQueryTerm(true, field.setFkTable(null), Field.Operation.EqualTo, id);
		field.setSqlQueryTerm(true, field.setFkWork(null), Field.Operation.EqualTo, config.id);
		field.setSqlQueryNull(false, field.setTacit(null), true);
		field.setSqlQueryTerm(true, field.setTacit(null), Field.Operation.NotEqualTo, "");
		field.setSqlQueryTerm(true, field.setType(null), Field.Operation.Like, "%BLOB%");
		field.setSqlQueryTerm(true, field.setFkTable(null), Field.Operation.EqualTo, id);
		field.setSqlQueryTerm(true, field.setFkWork(null), Field.Operation.EqualTo, config.id);
		if (service.alter(field) > 0 && !build) {
			super.setTable(workService, tableService, config.id, id, null, true);
		}
		
		field = new Field();
		field.setFkTable(id);
		field.setFkWork(config.id);
		field.setSqlQueryField(field.setId(null), field.setName(null), field.setClazz(null), field.setFrame(null), field.setType(null), field.setRely(null), field.setEmpty(null), field.setLength(null), field.setTacit(null), field.setNote(null), field.setMajor(null), field.setQueue(null), field.setFkInward(null));
		field.setSqlQueryOrder(field.setQueue(null), true);
		field.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Field> fields = service.list(field);
		if (fields == null) {
			fields = new ArrayList<Field>();
		}
		
		int queue = 1;
		for (Field data : fields) {
			if (data.getQueue().intValue() != queue) {
				Field temp = new Field();
				temp.setId(data.getId());
				temp.setQueue(queue);
				service.update(temp);
				data.setQueue(queue);
			}
			queue++;
		}
		
		Bound bound = new Bound();
		bound.setFkTableHost(id);
		bound.setFkWork(config.id);
		bound.setSqlQueryField(bound.setId(null), bound.setName(null), bound.setType(null), bound.setTrash(null), bound.setModify(null), bound.setFieldHost(null), bound.setFieldObey(null), bound.setFkTableHost(null), bound.setFkTableObey(null));
		bound.setSqlQueryOrder(bound.setName(null), true);
		bound.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Bound> bounds = boundService.list(bound);
		if (bounds == null) {
			bounds = new ArrayList<Bound>();
		}
		
		if (config.template.getTypeMap().size() < 1) {
			super.setGenre(super.getGenre(genreService, config.id), config.template);
		}
		
		this.list(request, new PageBody(), new Field());
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/field_index");
		res.addObject("context", config);
		res.addObject("table", table);
		res.addObject("fields", fields);
		res.addObject("bounds", bounds);
		res.addObject("obeys", super.getTable(tableService, config.id, true, true));
		return res;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "major", method = RequestMethod.POST)
	public JMapView major(HttpServletRequest request, @RequestParam("ids[]") Integer[] ids, @RequestParam("grow") boolean grow, @RequestParam("fkTable") Integer fkTable) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null || ids[0] < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Field en = new Field();
			en.setFkWork(config.id);
			en.setSqlQueryIn(true, en.setId(null), true, ids);
			if (!config.modify || service.count(en) != ids.length) {
				res.setState("你没有设置主键的权限");
				return res;
			}
			
			int count = 0;
			if (config.template.getContext().MeshKeySupport) {
				grow = false;
				en = new Field();
				en.setMajor(true);
				en.setFkTable(fkTable);
				en.setFkWork(config.id);
				en.setSqlUpdateNew(en.setMajor(null), false);
				en.setSqlQueryIn(true, en.setId(null), false, ids);
				count += service.alter(en);
				
				en = new Field();
				en.setMajor(false);
				en.setFkTable(fkTable);
				en.setFkWork(config.id);
				en.setSqlUpdateNew(en.setMajor(null), true);
				en.setSqlUpdateNull(en.setTacit(null));
				en.setSqlQueryIn(true, en.setId(null), true, ids);
				count += service.alter(en);
			} else {
				if (ids.length != 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				en = new Field();
				en.setMajor(true);
				en.setFkTable(fkTable);
				en.setFkWork(config.id);
				en.setSqlUpdateNew(en.setMajor(null), false);
				en.setSqlQueryTerm(true, en.setId(null), Field.Operation.NotEqualTo, ids[0]);
				count += service.alter(en);
				
				en = new Field();
				en.setMajor(false);
				en.setFkTable(fkTable);
				en.setFkWork(config.id);
				en.setSqlUpdateNew(en.setMajor(null), true);
				en.setSqlUpdateNull(en.setTacit(null));
				en.setSqlQueryTerm(true, en.setId(null), Field.Operation.EqualTo, ids[0]);
				count += service.alter(en);
			}
			super.setTable(workService, tableService, config.id, fkTable, grow, true);
			res.setState(count > 0 ? OK : "设置主键成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "queue", method = RequestMethod.POST)
	public JMapView queue(HttpServletRequest request, @RequestBody Integer[][] datas) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.modify) {
				res.setState("你没有字段排序的权限");
				return res;
			}
			
			for (Integer[] data : datas) {
				Field en = new Field();
				en.setId(data[0]);
				en.setFkWork(config.id);
				en.setSqlUpdateNew(en.setQueue(null), data[1]);
				service.alter(en);
			}
			super.setTable(workService, tableService, config.id, datas[0][2], null, true);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "script", method = RequestMethod.POST)
	public void script(HttpServletRequest request, HttpServletResponse response, @RequestParam(name = "ids[]", required = false) Integer[] ids, @RequestParam(name = "id", required = false) Integer id) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		Project project = null;
		if (ids == null || ids.length < 1) {
			if (id == null || (project = projectService.load(id)) == null || (ids = JsonTool.read(project.getEntry(), Integer[].class)) == null || ids.length < 1) {
				super.out(response, "-- 找不到有效的对象", null);
				return;
			}
		}
		
		Driver driver = project != null ? (config.driver != null && config.driver.getId().intValue() == project.getFkDriver() ? config.driver : driverService.load(project.getFkDriver())) : this.script(config, driverService);
		if (driver == null) {
			super.out(response, "-- 请先设置模块驱动", null);
			return;
		}
		Connection conn;
		try {
			conn = JdbcTool.open(driver.getClazz(), driver.getAddress(), driver.getUsername(), CryptoTool.DES.decode(driver.getPassword()));
		} catch (Exception e) {
			super.out(response, null, e);
			return;
		}
		JdbcTool.DataBase dataBase = JdbcTool.product(conn, null);
		if (dataBase == null) {
			super.out(response, "-- 尚未实现相关功能", null);
			return;
		}
		
		String schema = conn.getCatalog();
		Map<Integer, String> title = super.getTable(tableService, config.id, false, true);
		Map<Integer, String> prefix = super.getModule(moduleService, config.id, new Module().setFrame(null));
		if (config.template.getTypeMap().size() < 1) {
			super.setGenre(super.getGenre(genreService, config.id), config.template);
		}
		Map<Integer, Inward> inwards = new HashMap<Integer, Inward>();
		Inward inward = new Inward();
		inward.setFkWork(config.id);
		inward.setSqlQueryField(inward.setId(null), inward.setEntry(null));
		inward.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Inward> datas = inwardService.list(inward);
		if (datas != null && datas.size() > 0) {
			for (Inward data : datas) {
				inwards.put(data.getId(), data);
			}
		}
		
		StringBuffer res = new StringBuffer();
		for (Integer key : ids) {
			Table table = tableService.load(key);
			if (table == null || table.getFkWork() != config.id) {
				res.append("-- <a style=\"color:#F00;\">缺少表结构信息</a>\n\n");
				continue;
			}
			
			if (table.getFkModule() != null) {
				String temp = prefix.get(table.getFkModule());
				if (temp != null && !table.getFrame().startsWith(temp)) {
					res.append("-- <a style=\"color:#F00;\">表名前缀与模块前缀不一致</a>\n\n");
					continue;
				}
			}
			
			Field en = new Field();
			en.setFkTable(table.getId());
			en.setFkWork(config.id);
			en.setSqlQueryField(en.setName(null), en.setFrame(null), en.setType(null), en.setEmpty(null), en.setLength(null), en.setTacit(null), en.setNote(null), en.setMajor(null), en.setFkInward(null));
			en.setSqlQueryOrder(en.setQueue(null), true);
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Field> fields = service.list(en);
			if (fields == null || fields.size() < 1) {
				res.append("-- <a style=\"color:#F00;\">缺少表字段信息</a>\n\n");
				continue;
			}
			
			List<Field> primarys = new ArrayList<Field>();
			for (Field field : fields) {
				if (field.getMajor()) {
					primarys.add(field);
				}
			}
			if (primarys == null || primarys.size() < 1) {
				res.append("-- <a style=\"color:#F00;\">缺少表主键信息</a>\n\n");
				continue;
			}
			
			Bound bound = new Bound();
			bound.setFkTableHost(table.getId());
			bound.setFkWork(config.id);
			bound.setSqlQueryField(bound.setName(null), bound.setType(null), bound.setTrash(null), bound.setModify(null), bound.setFieldHost(null), bound.setFieldObey(null), bound.setFkTableObey(null));
			bound.setSqlQueryOrder(bound.setName(null), true);
			bound.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Bound> bounds = boundService.list(bound);
			if (bounds == null) {
				bounds = new ArrayList<Bound>();
			}
			
			if (dataBase.exist(conn, schema, table.getFrame())) {
				List<Field> target = dataBase.column(conn, table.getFrame());
				if (target.size() < 1) {
					res.append("-- <a style=\"color:#F00;\">获取数据库字段信息失败</a>\n\n");
					continue;
				}
				
				res.append(dataBase.header(driver, table) + "\n");
				for (int i = 0; i < fields.size(); i++) {
					Field field = fields.get(i);
					String column = dataBase.column(config.template, driver, table, field, inwards.get(field.getFkInward()));
					res.append(column + "\n");
					if (i < target.size()) {
						String temp = dataBase.column(conn, driver, table, target.get(i));
						if (!temp.equals(column)) {
							res.append("<a style=\"color:#F00;\">" + temp + "</a>\n");
						}
					}
				}
				
				String[] temp = new String[] { dataBase.primary(driver, primarys), dataBase.primary(driver, dataBase.primary(conn, schema, table.getFrame())) };
				res.append(temp[0] + "\n");
				if (!temp[0].equals(temp[1])) {
					res.append("<a style=\"color:#F00;\">" + temp[1] + "</a>\n");
				}
				temp = new String[] { dataBase.footer(driver, table), dataBase.footer(conn, schema, table.getFrame())};
				res.append(temp[0] + "\n");
				if (!temp[0].equals(temp[1])) {
					res.append("<a style=\"color:#F00;\">" + temp[1] + "</a>\n");
				}
				if (fields.size() != target.size()) {
					res.append("-- <a style=\"color:#F00;\">表字段个数不同</a>\n");
				}
				
				Map<String, String> limits1 = new LinkedHashMap<String, String>();
				for (Bound data : bounds) {
					data.setFkTableHost(table.getId());
					limits1.put(data.getName(), dataBase.limit(driver, title, data, false));
				}
				Map<String, String> limits2 = new LinkedHashMap<String, String>();
				Map<String, String> indexs2 = dataBase.index(conn, driver, table.getFrame(), limits2);
				dataBase.restrict(conn, driver, schema, table.getFrame(), indexs2, false, limits2);
				if (limits1.size() > 0 || limits2.size() > 0) {
					res.append("\n");
				}
				
				StringBuffer task = new StringBuffer();
				for (Map.Entry<String, String> data : limits1.entrySet()) {
					temp = new String[] { data.getValue(), limits2.get(data.getKey())};
					res.append(temp[0] + "\n");
					if (temp[1] == null) {
						task.append("<a style=\"color:#F00;\">" + temp[0] + "</a>\n");
					} else {
						limits2.remove(data.getKey());
						if (!temp[0].equals(temp[1])) {
							task.append("<a style=\"color:#F00;\">" + (data.getValue().indexOf("FOREIGN KEY") != -1 ? "ALTER TABLE " + driver.getSymbol() + table.getFrame() + driver.getSymbol() + " DROP FOREIGN KEY " + driver.getSymbol() + data.getKey() + driver.getSymbol() + ";" : "DROP INDEX " + driver.getSymbol() + data.getKey() + driver.getSymbol() + " ON " + driver.getSymbol() + table.getFrame() + driver.getSymbol() + ";") + "</a>\n");
							task.append("<a style=\"color:#F00;\">" + temp[0] + "</a>\n");
						}
					}
				}
				res.append(task);
				for (Map.Entry<String, String> data : limits2.entrySet()) {
					res.append("<a style=\"color:#F00;\">" + (data.getValue().indexOf("FOREIGN KEY") != -1 ? "ALTER TABLE " + driver.getSymbol() + table.getFrame() + driver.getSymbol() + " DROP FOREIGN KEY " + driver.getSymbol() + data.getKey() + driver.getSymbol() + ";" : "DROP INDEX " + driver.getSymbol() + data.getKey() + driver.getSymbol() + " ON " + driver.getSymbol() + table.getFrame() + driver.getSymbol() + ";") + "</a>\n");
				}
				res.append("<hr style=\"height:1px;background-color:#FCF;border:none;\">");
			} else {
				res.append(dataBase.header(driver, table) + "\n");
				for (Field field : fields) {
					res.append(dataBase.column(config.template, driver, table, field, inwards.get(field.getFkInward())) + "\n");
				}
				res.append(dataBase.primary(driver, primarys) + "\n");
				res.append(dataBase.footer(driver, table) + "\n");
				res.append("-- <a style=\"color:#F00;\">尚未建表</a>\n");
				
				if (bounds.size() > 0) {
					res.append("\n");
					for (Bound data : bounds) {
						data.setFkTableHost(table.getId());
						res.append(dataBase.limit(driver, title, data, false) + "\n");
					}
				}
				res.append("<hr style=\"height:1px;background-color:#FCF;border:none;\">");
			}
		}
		
		JdbcTool.close(conn, null, null, null);
		res.delete(res.length() - 1 - 58, res.length());
		super.out(response, res.toString().replace("   ", "&nbsp;&nbsp;&nbsp;").replace("  ", "&nbsp;&nbsp;").replace("\n", "<br>"), null);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "code", method = RequestMethod.GET)
	public ModelAndView code(HttpServletRequest request, HttpServletResponse response, Integer[] ids, Integer id) throws Exception {
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/field_code");
		res.addObject("codes", this.code(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class), ids, id, null, null, null));
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "down", method = RequestMethod.GET)
	public void down(HttpServletRequest request, HttpServletResponse response, Integer[] ids, Integer id) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		File source = new File(CACHE + "auto/" + config.account + "/src/");
		FileTool.delete(source, true);
		if (!source.mkdirs()) {
			super.out(response, "创建代码目录失败", null);
			return;
		}
		
		List<File> files = new ArrayList<File>();
		String[][] codes = this.code(config, ids, id, source.getAbsolutePath(), files, null);
		if (files.size() < 1) {
			super.out(response, "生成代码文件失败，出错原因：" + codes[0][0].substring(2)+ "，可点击<a href=\"" + ROOT + "auto/work/config.htm\">此处</a>检查模板配置", null);
			return;
		}
		
		File target = new File(CACHE + "auto/" + config.account + "/源码下载（" + System.currentTimeMillis() + "）.zip");
		FileTool.delete(target, true);
		Zip4jTool.zip(source, target, null, null, true, ROOT);
		if (!target.exists()) {
			super.out(response, "创建压缩文件失败", null);
			return;
		}
		
		ServletTool.getDown(request, response, null, target, target.getName());
		FileTool.delete(source, true);
		FileTool.delete(target, true);
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "build", method = RequestMethod.POST)
	public JMapView build(HttpServletRequest request, @RequestParam(name = "ids[]", required = false) Integer[] ids, @RequestParam(name = "id", required = false) Integer id) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (OUTPUT == null) {
				if (ids == null || ids.length < 1) {
					res.setState("请求参数非法");
					return res;
				}
				
				Table table = new Table();
				table.setFkWork(config.id);
				table.setSqlQueryIn(true, table.setId(null), true, ids);
				if (!config.modify || tableService.count(table) != ids.length) {
					res.setState("你没有标记对象的权限");
					return res;
				}
				
				table = new Table();
				table.setBuild(true);
				table.setFkWork(config.id);
				table.setSqlUpdateNew(table.setBuild(null), false);
				table.setSqlQueryIn(true, table.setId(null), true, ids);
				int count = tableService.alter(table);
				if (count > 0) {
					Work work = new Work();
					work.setSqlUpdateMethod(work.setVersion(null), work.setVersion(null).FrameFieldName + " + " + count);
					work.setSqlQueryTerm(true, work.setId(null), Work.Operation.EqualTo, config.id);
					workService.alter(work);
				}
			} else {
				this.code(config, ids, id, OUTPUT, new ArrayList<File>(), null);
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	//http://127.0.0.1:8088/ink10000.com-portal/auto/field/export.htm?ids=11&ids=1
	@DailyPoint(refer = true)
	@RequestMapping(value = "export", method = RequestMethod.GET)
	public void export(HttpServletRequest request, HttpServletResponse response, Integer[] ids) throws Exception {
		if (ids == null || ids.length != 2 || ids[0] == null || ids[0] < 1) {
			super.out(response, "请求参数非法", null);
			return;
		}
		
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		File source = new File(CACHE + "auto/" + config.account + "/src/");
		FileTool.delete(source, true);
		if (!source.mkdirs()) {
			super.out(response, "创建代码目录失败", null);
			return;
		}
		
		File destination;
		if (ids[1] != null && ids[1] == 1) {
			destination = source;
		} else {
			destination = new File(CACHE + "auto/" + config.account + "/classes/");
			FileTool.delete(destination, true);
			if (!destination.mkdirs()) {
				super.out(response, "创建编译目录失败", null);
				return;
			}
		}
		
		Project helper = new Project();
		List<File> files = new ArrayList<File>();
		String[][] codes = this.code(config, null, ids[0], source.getAbsolutePath(), files, helper);
		if (files.size() < 1) {
			super.out(response, "生成代码文件失败，出错原因：" + codes[0][0].substring(2) + "，可点击<a href=\"" + ROOT + "auto/work/config.htm\">此处</a>检查模板配置", null);
			return;
		}
		
		FileTool.write(super.getInward(config.inward != null ? config.inward : super.getInward(inwardService, config.id, true)), new File(source, "com/mc/core/crux/Legal.java"), "UTF-8");
		if (destination != source) {
			String prefix = source.getAbsolutePath().replace("\\", "/");
			for (File file : files) {
				if (!file.getName().endsWith(".java")) {
					FileTool.copy(file, new File(destination, file.getAbsolutePath().replace("\\", "/").replace(prefix, "")));
				}
			}
		}
		
		String version = helper.getName();
		File target = new File(CACHE + "auto/" + config.account + "/" + helper.getClazz().replace("{version}", version));
		FileTool.delete(target, true);
		try {
			config.template.compile(target, version, source.getAbsolutePath(), destination.getAbsolutePath(), super.getLibrary(JsonTool.read(helper.getLibrary(), String[].class), String.class));
		} catch (Exception e) {
			super.out(response, null, e);
			return;
		} catch (Throwable e) {
			super.out(response, e.getMessage().replace("\n", "<br>").replace("${ROOT}", ROOT + "data/cache/auto/" + config.account + "/src/"), null);
			return;
		}
		
		ServletTool.getDown(request, response, null, target, target.getName());
		FileTool.delete(source, true);
		FileTool.delete(destination, true);
		FileTool.delete(target, true);
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "library", method = RequestMethod.POST)
	public JMapView library(HttpServletRequest request, @RequestParam(value = "keys[]", required = false) String[] keys, boolean editable) {
		JMapView res = new JMapView();
		try {
			List<String> rely = new ArrayList<String>();
			if (keys != null && keys.length > 0) {
				rely = Arrays.asList(keys);
			}
			
			List<String> cache = new ArrayList<String>();
			List<JTreeView> left = new ArrayList<JTreeView>();
			Map<String, List<LibraryItem>> kind = new TreeMap<String, List<LibraryItem>>(new Comparator<String>() {
				public int compare(String o1, String o2) {
					if (o1 == null && o2 == null) {
						return 0;
					} else if (o1 != null && o2 == null) {
						return 1;
					} else if (o1 == null && o2 != null) {
						return -1;
					}
					return o1.toString().compareTo(o2.toString());
				}
			});
			
			for (LibraryItem item : LIBRARY.values()) {
				int index = item.PATH.lastIndexOf("/");
				String parent = item.PATH.substring(0, index).replace("&", "&amp;");
				if (!cache.contains(parent)) {
					cache.add(parent);
					left.add(new JTreeView(parent, null, parent, true, true));
				}
				left.add(new JTreeView(item.ID, parent, this.library(item, rely.contains(item.ID), editable)));
				
				List<LibraryItem> value = kind.get(item.KIND);
				if (value == null) {
					value = new ArrayList<LibraryItem>();
					kind.put(item.KIND, value);
				}
				value.add(item);
			}
			
			List<JTreeView> right = new ArrayList<JTreeView>();
			for (Map.Entry<String, List<LibraryItem>> en : kind.entrySet()) {
				String parent = en.getKey();
				List<LibraryItem> value = en.getValue();
				Collections.sort(value, new Comparator<LibraryItem>() {
					public int compare(LibraryItem o1, LibraryItem o2) {
						return o1.ID.toString().compareTo(o2.ID.toString());
					}
				});
				int count = 0;
				for (LibraryItem item : value) {
					right.add(new JTreeView(item.ID, parent, item.NAME + "<input type=\"hidden\" value=\"" + item.ID + "\" name=\"id\">"));
					count++;
				}
				if (count > 0) {
					right.add(new JTreeView(parent, null, parent, true, true));
				}
			}
			
			if (editable) {
				List<File> tomcat = new ArrayList<File>();
				FileTool.list(new File(System.getProperty("catalina.home"), "lib"), new String[] { ".jar" }, tomcat);
				left.add(new JTreeView("tomcat", null, "tomcat", true, false));
				right.add(new JTreeView("tomcat", null, "tomcat", true, false));
				for (File file : tomcat) {
					LibraryItem item = new LibraryItem();
					item.NAME = file.getName();
					item.KIND = "tomcat";
					left.add(new JTreeView(file.getName(), "tomcat", this.library(item, true, false)));
					right.add(new JTreeView(file.getName(), "tomcat", "<u style=\"color:#DD514C\">" + item.NAME + "</u>"));
				}
			} else {
				LibraryItem item = new LibraryItem();
				item.NAME = "com.mc.helper.template-0.0.0.jar";
				item.KIND = "template";
				left.add(new JTreeView("template", null, "template", true, false));
				left.add(new JTreeView("com.mc.helper.template-0.0.0.jar", "template", this.library(item, true, false)));
				right.add(new JTreeView("template", null, "template", true, false));
				right.add(new JTreeView("com.mc.helper.template-0.0.0.jar", "template", "<u style=\"color:#DD514C\">" + item.NAME + "</u>"));
			}
			
			StringBuffer alert = new StringBuffer();
			alert.append("日志配置(1)：commons-logging<br>");
			alert.append("日志配置(2)：commons-logging、log4j<br>");
			alert.append("日志配置(3)：jcl-over-slf4j、slf4j-api<br>");
			alert.append("日志配置(4)：jcl-over-slf4j、slf4j-api、slf4j-log4j12、log4j<br>");
			alert.append("日志配置(5)：jcl-over-slf4j、slf4j-api、logback-core、logback-classic<br>");
			alert.append("阿里存储：aliyun-sdk-oss、httpclient、httpcore、jdom<br>");
			alert.append("邮件推送：aliyun-java-sdk-dm、gson<br>");
			alert.append("阿里支付：alipay-sdk-java、commons-logging");
			res.put("left", left);
			res.put("right", right);
			res.put("alert", alert);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private boolean verify(TableService tableService, BoundService boundService, Integer id, String frame, Integer table, String name, List<Integer> tables, List<Bound> bounds) throws Exception {
		if (name != null) {
			Bound en = new Bound();
			en.setFkTableHost(table);
			en.setSqlQueryField(en.setFieldHost(null));
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Bound> datas = boundService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Bound data : datas) {
					List<Field> fields = JsonTool.list(data.getFieldHost(), Field.class);
					if (fields == null || fields.size() < 1) {
						continue;
					}
					for (Field field : fields) {
						if (field.getId() != id) {
							continue;
						}
						if (!field.getFrame().equals(frame)) {
							return true;
						}
						if (!field.getName().equals(name)) {
							field.setName(name);
							Bound temp = new Bound();
							temp.setId(data.getId());
							temp.setFieldHost(JsonTool.write(fields));
							bounds.add(temp);
							break;
						}
					}
				}
			}
			
			en = new Bound();
			en.setFkTableObey(table);
			en.setSqlQueryField(en.setFieldObey(null), en.setFkTableHost(null));
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			datas = boundService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Bound data : datas) {
					List<Field> fields = JsonTool.list(data.getFieldObey(), Field.class);
					if (fields == null || fields.size() < 1) {
						continue;
					}
					for (Field field : fields) {
						if (field.getId() != id) {
							continue;
						}
						if (!field.getFrame().equals(frame)) {
							return true;
						}
						if (!field.getName().equals(name)) {
							field.setName(name);
							Bound temp = new Bound();
							temp.setId(data.getId());
							temp.setFieldObey(JsonTool.write(fields));
							bounds.add(temp);
							tables.add(data.getFkTableHost());
							break;
						}
					}
				}
			}
		} else {
			int count = 0;
			Bound en = new Bound();
			en.setFkTableHost(table);
			en.setSqlQueryField(en.setFieldHost(null));
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Bound> datas = boundService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Bound data : datas) {
					List<Field> fields = JsonTool.list(data.getFieldHost(), Field.class);
					if (fields == null || fields.size() < 1) {
						continue;
					}
					for (Field field : fields) {
						if (field.getId() == id) {
							count++;
						}
					}
				}
			}
			
			en = new Bound();
			en.setFkTableObey(table);
			en.setSqlQueryField(en.setFieldObey(null), en.setFkTableHost(null));
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			datas = boundService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Bound data : datas) {
					List<Field> fields = JsonTool.list(data.getFieldObey(), Field.class);
					if (fields == null || fields.size() < 1) {
						continue;
					}
					for (Field field : fields) {
						if (field.getId() == id) {
							count++;
							continue;
						}
					}
				}
			}
			return count > 0;
		}
		return false;
	}
	private Driver script(WorkConfig config, DriverService driverService) {
		if (config.driver != null) {
			return config.driver;
		}
		Driver en = new Driver();
		en.setTacit(true);
		en.setFkWork(config.id);
		en.setSqlLeafSize(1L);
		List<Driver> datas = driverService.list(en);
		if (datas != null && datas.size() > 0) {
			config.driver = datas.get(0);
			return config.driver;
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	private <T> T code(int id, TemplateHelper loader, Class<T> clazz) {
		try {
			Template en = new Template();
			en.setId(id);
			en.setSqlQueryField(en.setClazz(null), en.setCode(null), en.setNozzle(null));
			en = templateService.get(en);
			if (en == null || en.getNozzle().indexOf(clazz.getName()) == -1) {
				return null;
			}
			String[] codes = JsonTool.read(en.getCode(), String[].class);
			for (int i = 0; i < codes.length; i++) {
				loader.load(codes[i], Base64.decodeBase64(codes[++i]));
			}
			Class.forName(en.getClazz(), true, loader);
			return (T) loader.loadClass(en.getClazz()).newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private String[][] code(TemplateConfig template, int id, Integer[] keys, Map<Integer, Inward> inwards, String library, int[] clazz, String root, List<File> files) throws Exception {
		if (root != null) {
			File parent = new File(root);
			if (!parent.exists() || !parent.isDirectory()) {
				return new String[][] { { "//请求参数非法" } };
			}
		}
		
		EntityTemplate entityTemplate = null;
		DaoTemplate daoTemplate = null;
		DaoImplTemplate daoImplTemplate = null;
		DaoMapperTemplate daoMapperTemplate = null;
		ServiceTemplate serviceTemplate = null;
		ServiceImplTemplate serviceImplTemplate = null;
		TemplateHelper loader = new TemplateHelper(super.getLibrary(JsonTool.read(library, String[].class), URL[].class), context.getClassLoader());
		if (clazz[0] != 0) {
			if (clazz[0] == TacitEntityTemplateImpl.TEMPLATE_KERNEL_ID) {
				entityTemplate = new TacitEntityTemplateImpl();
			} else if (clazz[0] == PortalEntityTemplateImpl.TEMPLATE_KERNEL_ID) {
				entityTemplate = new PortalEntityTemplateImpl();
			} else {
				entityTemplate = this.code(clazz[0], loader, EntityTemplate.class);
			}
		}
		if (clazz[1] != 0){
			if (clazz[1] == TacitDaoTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoTemplate = new TacitDaoTemplateImpl();
			} else if (clazz[1] == PortalDaoTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoTemplate = new PortalDaoTemplateImpl();
			} else {
				daoTemplate = this.code(clazz[1], loader, DaoTemplate.class);
			}
		}
		if (clazz[2] != 0){
			if (clazz[2] == TacitDaoImplTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoImplTemplate = new TacitDaoImplTemplateImpl();
			} else if (clazz[2] == PortalDaoImplTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoImplTemplate = new PortalDaoImplTemplateImpl();
			} else {
				daoImplTemplate = this.code(clazz[2], loader, DaoImplTemplate.class);
			}
		}
		if (clazz[3] != 0){
			if (clazz[3] == TacitDaoMapperTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoMapperTemplate = new TacitDaoMapperTemplateImpl();
			} else if (clazz[3] == PortalDaoMapperTemplateImpl.TEMPLATE_KERNEL_ID) {
				daoMapperTemplate = new PortalDaoMapperTemplateImpl();
			} else {
				daoMapperTemplate = this.code(clazz[3], loader, DaoMapperTemplate.class);
			}
		}
		if (clazz[4] != 0){
			if (clazz[4] == TacitServiceTemplateImpl.TEMPLATE_KERNEL_ID) {
				serviceTemplate = new TacitServiceTemplateImpl();
			} else if (clazz[4] == PortalServiceTemplateImpl.TEMPLATE_KERNEL_ID) {
				serviceTemplate = new PortalServiceTemplateImpl();
			} else {
				serviceTemplate = this.code(clazz[4], loader, ServiceTemplate.class);
			}
		}
		if (clazz[5] != 0){
			if (clazz[5] == TacitServiceImplTemplateImpl.TEMPLATE_KERNEL_ID) {
				serviceImplTemplate = new TacitServiceImplTemplateImpl();
			} else if (clazz[5] == PortalServiceImplTemplateImpl.TEMPLATE_KERNEL_ID) {
				serviceImplTemplate = new PortalServiceImplTemplateImpl();
			} else {
				serviceImplTemplate = this.code(clazz[5], loader, ServiceImplTemplate.class);
			}
		}
		
		Map<Integer, String> prefix = super.getModule(moduleService, id, new Module().setClazz(null));
		Map<Integer, String> title = super.getTable(tableService, id, true, false);
		Map<String, String[]> types = template.getTypeMap();
		if (types.size() < 1) {
			super.setGenre(super.getGenre(genreService, id), template);
		}
		String[][] res = new String[keys.length][6];
		for (int i = 0; i < keys.length; i++) {
			res[i] = new String[6];
			if (i == 0) {
				res[i][0] = "//执行成功";
			}
			Table table = tableService.load(keys[i]);
			if (table == null || table.getFkWork() != id) {
				res[i][0] = "//缺少对象信息";
				continue;
			}
			if (OUTPUT != null && OUTPUT.equals(root) && !table.getBuild()) {
				res[i][0] = "//无需再次重建";
				continue;
			}
			
			Field en = new Field();
			en.setFkTable(table.getId());
			en.setFkWork(id);
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setFrame(null), en.setType(null), en.setRely(null), en.setEmpty(null), en.setLength(null), en.setTacit(null), en.setNote(null), en.setMajor(null), en.setFkInward(null));
			en.setSqlQueryOrder(en.setQueue(null), true);
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Field> datas = service.list(en);
			if (datas == null || datas.size() < 1) {
				res[i][0] = "//缺少属性信息";
				continue;
			}
			
			List<Field> fields = new ArrayList<Field>();
			List<Field> primarys = new ArrayList<Field>();
			for (Field data : datas) {
				if (types.get(data.getType()) == null) {
					continue;
				}
				fields.add(data);
				if (data.getMajor()) {
					primarys.add(data);
				}
			}
			if (fields == null || fields.size() < 1) {
				res[i][0] = "//缺少属性信息";
				continue;
			}
			if (primarys.size() < 1) {
				res[i][0] = "//缺少主键信息";
				continue;
			}
			
			Bound bound = new Bound();
			bound.setFkTableHost(table.getId());
			bound.setFkWork(id);
			bound.setSqlQueryField(bound.setType(null), bound.setFieldHost(null), bound.setFieldObey(null), bound.setFkTableObey(null));
			bound.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Bound> bounds = boundService.list(bound);
			try {
				template.build(prefix.get(table.getFkModule()), table.getClazz());
				if (root != null) {
					if (entityTemplate != null) {
						files.add(entityTemplate.toString(template, table, fields, primarys, template.getBound(title, bounds), inwards, root));
					}
					if (daoTemplate != null) {
						files.add(daoTemplate.toString(template, table, primarys, root));
					}
					if (daoImplTemplate != null) {
						files.add(daoImplTemplate.toString(template, table, primarys, root));
					}
					if (daoMapperTemplate != null) {
						files.add(daoMapperTemplate.toString(template, table, fields, primarys, root));
					}
					if (serviceTemplate != null) {
						files.add(serviceTemplate.toString(template, table, primarys, root));
					}
					if (serviceImplTemplate != null) {
						files.add(serviceImplTemplate.toString(template, table, fields, primarys, inwards, root));
					}
				} else {
					if (entityTemplate != null) {
						res[i][0] = entityTemplate.toString(template, table, fields, primarys, template.getBound(title, bounds), inwards);
					}
					if (daoTemplate != null) {
						res[i][1] = daoTemplate.toString(template, table, primarys);
					}
					if (daoImplTemplate != null) {
						res[i][2] = daoImplTemplate.toString(template, table, primarys);
					}
					if (daoMapperTemplate != null) {
						res[i][3] = daoMapperTemplate.toString(template, table, fields, primarys);
					}
					if (serviceTemplate != null) {
						res[i][4] = serviceTemplate.toString(template, table, primarys);
					}
					if (serviceImplTemplate != null) {
						res[i][5] = serviceImplTemplate.toString(template, table, fields, primarys, inwards);
					}
				}
				
				if (OUTPUT != null && OUTPUT.equals(root) && table.getBuild()) {
					super.setTable(workService, tableService, id, table.getId(), null, false);
				}
			} catch (Exception e) {
				res[i][0] = e.getMessage() != null ? e.getMessage() : "未知错误";
				e.printStackTrace();
			}
		}
		loader.close();
		return res;
	}
	private String[][] code(WorkConfig config, Integer[] keys, Integer id, String root, List<File> files, Project helper) throws Exception {
		Work work = new Work();
		work.setId(config.id);
		work.setSqlQueryField(work.setVersion(null), work.setLibrary(null), work.setFkEntityClass(null), work.setFkDaoClass(null), work.setFkDaoImplClass(null), work.setFkDaoMapperXml(null), work.setFkServiceClass(null), work.setFkServiceImplClass(null));
		work = workService.get(work);
		if (work == null) {
			return new String[][] { { "//请求参数非法" } };
		}
		
		List<String> level = null;
		Integer[] custom = null;
		if (keys == null || keys.length < 1) {
			Project project;
			if (id == null || (project = projectService.load(id)) == null) {
				return new String[][] { { "//找不到有效的项目" } };
			}
			keys = JsonTool.read(project.getEntry(), Integer[].class);
			if (keys == null || keys.length < 1) {
				return new String[][] { { "//找不到有效的对象" } };
			}
			level = Arrays.asList(JsonTool.read(project.getLevel(), String[].class));
			custom = new Integer[] { project.getFkEntityClass(), project.getFkDaoClass(), project.getFkDaoImplClass(), project.getFkDaoMapperXml(), project.getFkServiceClass(), project.getFkServiceImplClass() };
			if (helper != null) {
				helper.setName(super.getVersion(work.getVersion()));
				helper.setClazz(project.getClazz());
				helper.setLibrary(work.getLibrary());
			}
		} else {
			level = new ArrayList<String>(AUTO_PROJECT_LEVEL.keySet());
			custom = new Integer[6];
		}
		
		int[] clazz = new int[] { 0, 0, 0, 0, 0, 0 };
		if (level.contains(EntityTemplate.class.getName())) {
			if (custom[0] != null) {
				clazz[0] = custom[0];
			} else {
				if (work.getFkEntityClass() != null) {
					clazz[0] = work.getFkEntityClass();
				}
			}
		}
		if (level.contains(DaoTemplate.class.getName())) {
			if (custom[1] != null) {
				clazz[1] = custom[1];
			} else {
				if (work.getFkDaoClass() != null) {
					clazz[1] = work.getFkDaoClass();
				}
			}
		}
		if (level.contains(DaoImplTemplate.class.getName())) {
			if (custom[2] != null) {
				clazz[2] = custom[2];
			} else {
				if (work.getFkDaoImplClass() != null) {
					clazz[2] = work.getFkDaoImplClass();
				}
			}
		}
		if (level.contains(DaoMapperTemplate.class.getName())) {
			if (custom[3] != null) {
				clazz[3] = custom[3];
			} else {
				if (work.getFkDaoMapperXml() != null) {
					clazz[3] = work.getFkDaoMapperXml();
				}
			}
		}
		if (level.contains(ServiceTemplate.class.getName())) {
			if (custom[4] != null) {
				clazz[4] = custom[4];
			} else {
				if (work.getFkServiceClass() != null) {
					clazz[4] = work.getFkServiceClass();
				}
			}
		}
		if (level.contains(ServiceImplTemplate.class.getName())) {
			if (custom[5] != null) {
				clazz[5] = custom[5];
			} else {
				if (work.getFkServiceImplClass() != null) {
					clazz[5] = work.getFkServiceImplClass();
				}
			}
		}
		return this.code(config.template, config.id, keys, config.inward != null ? config.inward : super.getInward(inwardService, config.id, false), work.getLibrary(), clazz, root, files);
	}
	private String library(LibraryItem value, boolean check, boolean editable) {
		StringBuffer res = new StringBuffer();
		if (value.ID != null) {
			res.append("<u>" + (AUTO_LIBRARY_TACIT.containsKey(value.ID) ? "*" : "") + value.NAME + "<input type=\"hidden\" value=\"" + value.ID + "\" name=\"ID\"></u>");
			res.append("<u><input type=\"text\"" + (value.KIND != null ? " value=\"" + value.KIND + "\"" : "") + (editable ? " name=\"KIND\"" : " readonly=\"readonly\"") + "></u>");
			res.append("<u><input type=\"checkbox\"" + (check ? " checked=\"checked\"" : "") + " name=\"CHECK\"></u>");
			res.append("<u onclick=\"JTarget('" + ROOT + "_/doc/jar/" + value.PATH + "',[new Date().getTime()]);\">下载</u>");
			res.append(value.SOURCE != null ? "<u onclick=\"JTarget('" + ROOT + "_/doc/jar/" + value.SOURCE + "',[new Date().getTime()]);\">源码</u>" : "<u></u>");
		} else {
			res.append("<u>" + value.NAME + "</u>");
			res.append("<u><input type=\"text\" value=\"" + value.KIND + "\" readonly=\"readonly\"></u>");
			res.append("<u><input type=\"checkbox\" checked=\"checked\" disabled=\"disabled\"></u>");
			res.append("<u></u><u></u>");
		}
		return res.toString();
	}
}