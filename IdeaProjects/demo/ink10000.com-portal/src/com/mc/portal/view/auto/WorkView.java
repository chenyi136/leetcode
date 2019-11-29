package com.mc.portal.view.auto;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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
import com.mc.core.entity.auto.Driver;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Genre;
import com.mc.core.entity.auto.Member;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Project;
import com.mc.core.entity.auto.Table;
import com.mc.core.entity.auto.Template;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auto.DriverService;
import com.mc.core.service.auto.FieldService;
import com.mc.core.service.auto.GenreService;
import com.mc.core.service.auto.MemberService;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.TemplateService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.CookieTool;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.pojo.WorkParam;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/work/")
public class WorkView extends SuperView<Integer, Work> {
	@Autowired
	private AccountService accountService;
	@Autowired
	private DriverService driverService;
	@Autowired
	private FieldService fieldService;
	@Autowired
	private GenreService genreService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TableService tableService;
	@Autowired
	private TemplateService templateService;
	@Autowired
	public WorkView(WorkService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Work en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Work en = new Work();
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setKeyt(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> token = new HashMap<String, Object>();
			token.put("id", id);
			token.put("online", ServletTool.getOnline(request).id);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("name", en.getName());
			data.put("token", id + "." + CryptoTool.AES.encode(JsonTool.write(token), en.getKeyt()));
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Work en) throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Work en) {
		JMapView res = new JMapView();
		try {
			OnlineInfo online = ServletTool.getOnline(request);
			if (en.getId() == null) {
				en.setConfig(JsonTool.write(new TemplateConfig.Context().init()));
				en.setLibrary("[]");
				en.setKeyt(UUID.randomUUID().toString().replace("-", ""));
				if (!service.save(en)) {
					res.setState("创建空间失败");
					return res;
				}
				
				Member member = new Member();
				member.setGrade(Long.MAX_VALUE);
				member.setFkWork(en.getId());
				member.setFkAccount(online.id);
				if (memberService.save(member)) {
					ServletTool.setAttribute(request, KEY_SESSION_WORKS, null);
					res.setState(OK);
				} else {
					service.delete(en.getId());
					res.setState("创建空间失败");
				}
			} else {
				Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(en.getId());
				if (member == null || !member.getFkAccount().equals(online.id)) {
					res.setState("你没有更新空间的权限");
					return res;
				}
				
				en.setEdited(new Date());
				res.setState(service.update(en) ? OK : "更新空间失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	public Object list(HttpServletRequest request, PageBody pages, Work en) throws Exception {
		Map<Integer, Member> res = ServletTool.getAttribute(request, KEY_SESSION_WORKS, Map.class);//空间编号：成员等级、空间编号、群主编号
		if (res == null) {
			String online = ServletTool.getOnline(request).id;
			Member member = new Member();
			member.setFkAccount(online);
			member.setSqlQueryField(member.setGrade(null), member.setFkWork(null));
			member.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Member> datas = memberService.list(member);
			res = new HashMap<Integer, Member>();
			if (datas != null && datas.size() > 0) {
				for (Member data : datas) {
					if (data.getGrade() == Long.MAX_VALUE) {
						data.setFkAccount(online);
					} else {
						Member temp = new Member();
						temp.setGrade(Long.MAX_VALUE);
						temp.setFkWork(data.getFkWork());
						temp.setSqlQueryField(temp.setFkAccount(null));
						temp.setSqlLeafSize(1L);
						List<Member> members = memberService.list(temp);
						if (members != null && members.size() > 0) {
							data.setFkAccount(members.get(0).getFkAccount());
						}
					}
					if (data.getFkAccount() != null) {
						res.put(data.getFkWork(), data);
					}
				}
			}
		}
		if (res.size() > 0) {
			ServletTool.setAttribute(request, KEY_SESSION_WORKS, res);
			en.setSqlQueryIn(true, en.setId(null), true, res.keySet().toArray(new Integer[] {}));
		} else {
			en.setSqlQueryIn(true, en.setId(null), true, new Integer[] { -1 });
		}
		return res;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Work().setCreated(null), false);
		pages.setLink(0, "auto/work/list.htm");
		pages.setLink(2, "auto/work/config.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/work_list");
		res.addObject("pages", pages);
		return res;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Work en = new Work();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setConfig(null), en.setVersion(null), en.setCreated(null), en.setEdited(null));
			List<Work> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				Map<Integer, Member> session = (Map<Integer, Member>) this.list(request, null, new Work());
				for (Work data : datas) {
					TemplateConfig.Context context = JsonTool.read(data.getConfig(), TemplateConfig.Context.class);
					Member member = session.get(data.getId());
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("version", new String[] { data.getVersion().toString(), super.getVersion(data.getVersion()) });
					map.put("MeshKeySupport", context.MeshKeySupport ? "支持" : "不支持");
					map.put("HumpNamingSupport", context.HumpNamingSupport ? "支持" : "不支持");
					map.put("TacitValueType", context.TacitValueType ? "表结构中" : "代码中");
					map.put("ItemValueType", context.ItemValueType ? "表结构中" : "代码中");
					map.put("UnsignedSupport", new String[] { context.UnsignedNumberSupport ? "有" : "无", context.UnsignedFloatSupport ? "有" : "无" });
					map.put("DotLength", new Integer[] { context.FloatDotLength, context.DecimalDotLength });
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
					map.put("grade", member.getGrade() == Long.MAX_VALUE ? "持有者" : (member.getGrade() == 0 ? "游客" : "参与者"));
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
	@DailyPoint(refer = true)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "config", method = RequestMethod.GET)
	public ModelAndView config(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		if (!((Map<Integer, Member>) this.list(request, null, new Work())).containsKey(id)) {
			response.sendRedirect(ROOT + "auto/work/list.htm");
			return null;
		}
		
		Work en = new Work();
		en.setId(id);
		en.setSqlQueryField(en.setName(null), en.setConfig(null), en.setFkEntityClass(null), en.setFkDaoClass(null), en.setFkDaoImplClass(null), en.setFkDaoMapperXml(null), en.setFkServiceClass(null), en.setFkServiceImplClass(null));
		en = service.get(en);
		if (en == null) {
			response.sendRedirect(ROOT + "auto/work/list.htm");
			return null;
		}
		
		Map<Integer, String[]> clazz = new LinkedHashMap<Integer, String[]>();
		Template template = new Template();
		template.setFkWork(id);
		template.setSqlQueryField(template.setId(null), template.setClazz(null), template.setNozzle(null), template.setKernel(null));
		template.setSqlLeafSize(LEAF_MAX_SIZE);
		template.setSqlQueryOrder(template.setClazz(null), true);
		List<Template> datas = templateService.list(template);
		if (datas != null && datas.size() > 0) {
			for (Template data : datas) {
				clazz.put(data.getId(), new String[] { data.getClazz(), data.getNozzle(), data.getKernel().toString() });
			}
		}
		template = new Template();
		template.setKernel(true);
		template.setSqlQueryTerm(true, template.setFkWork(null), Template.Operation.NotEqualTo, id);
		template.setSqlQueryField(template.setId(null), template.setClazz(null), template.setNozzle(null), template.setKernel(null));
		template.setSqlLeafSize(LEAF_MAX_SIZE);
		template.setSqlQueryOrder(template.setClazz(null), true);
		datas = templateService.list(template);
		if (datas != null && datas.size() > 0) {
			for (Template data : datas) {
				clazz.put(data.getId(), new String[] { data.getClazz(), data.getNozzle(), data.getKernel().toString() });
			}
		}
		
		en.setId(id);
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/work_config");
		res.addObject("clazz", clazz);
		res.addObject("pages", en);
		return res;
	}
	@DailyPoint(refer = true, forbid = true, impact = true)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "config", method = RequestMethod.POST)
	public ModelAndView config(HttpServletRequest request, HttpServletResponse response, Work en, WorkParam params, String ModuleName, String ClassName) throws Exception {
		String param = JsonTool.write(params);
		TemplateConfig.Context context = JsonTool.read(param, TemplateConfig.Context.class);
		if (ClassName != null && !ClassName.equals("")) {
			TemplateConfig temp = new TemplateConfig(context);
			try {
				if ((ClassName = temp.getVerifyClass(ClassName, true)) == null) {
					super.out(response, "对象类名非法", null);
					return null;
				}
				temp.build(temp.getVerifyClass(ModuleName, true), ClassName);
				super.out(response, JsonTool.toString(temp), null);
			} catch (Exception e) {
				super.out(response, e.getMessage(), null);
				e.printStackTrace();
			}
			return null;
		}
		
		Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(en.getId());
		if (member == null || !member.getFkAccount().equals(ServletTool.getOnline(request).id)) {
			return super.jump(request, "auto/work/list.htm", "你没有更新空间配置的权限");
		}
		
		en.setConfig(param);
		en.setEdited(new Date());
		if (en.getFkEntityClass().intValue() == -1) {
			en.doFieldValue(en.setFkEntityClass(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkEntityClass(null));
		}
		if (en.getFkDaoClass().intValue() == -1) {
			en.doFieldValue(en.setFkDaoClass(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkDaoClass(null));
		}
		if (en.getFkDaoImplClass().intValue() == -1) {
			en.doFieldValue(en.setFkDaoImplClass(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkDaoImplClass(null));
		}
		if (en.getFkDaoMapperXml().intValue() == -1) {
			en.doFieldValue(en.setFkDaoMapperXml(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkDaoMapperXml(null));
		}
		if (en.getFkServiceClass().intValue() == -1) {
			en.doFieldValue(en.setFkServiceClass(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkServiceClass(null));
		}
		if (en.getFkServiceImplClass().intValue() == -1) {
			en.doFieldValue(en.setFkServiceImplClass(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkServiceImplClass(null));
		}
		if (service.update(en)) {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (config != null && config.id == en.getId()) {
				config.template.init(context);
			}
			return super.jump(request, "auto/work/list.htm", "更新模块配置成功");
		} else {
			return super.jump(request, "auto/work/list.htm", "更新模块配置失败");
		}
	}
	@DailyPoint(impact = true)
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "tacit", method = RequestMethod.POST)
	public JMapView tacit(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			if (id == null ||id < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(id);
			if (member == null || !member.getFkAccount().equals(ServletTool.getOnline(request).id)) {
				res.setState("你没有还原模板配置到默认的权限");
				return res;
			}
			
			Work en = new Work();
			en.setId(id);
			en.setConfig(JsonTool.write(new TemplateConfig.Context().init()));
			en.setEdited(new Date());
			service.update(en);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(refer = true)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "library", method = RequestMethod.GET)
	public ModelAndView library(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		if (!((Map<Integer, Member>) this.list(request, null, new Work())).containsKey(id)) {
			response.sendRedirect(ROOT + "auto/work/list.htm");
			return null;
		}
		
		Work en = new Work();
		en.setId(id);
		en.setSqlQueryField(en.setName(null), en.setLibrary(null));
		en = service.get(en);
		if (en == null) {
			response.sendRedirect(ROOT + "auto/work/list.htm");
			return null;
		}
		
		en.setId(id);
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/work_library");
		res.addObject("pages", en);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "library", method = RequestMethod.POST)
	public JMapView library(HttpServletRequest request, Integer id, @RequestParam(value = "keys[]", required = false) String[] keys) {
		JMapView res = new JMapView();
		try {
			if (id == null || id < 1) {
				res.setState("请求参数非法");
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(id);
			if (member == null || !member.getFkAccount().equals(online.id)) {
				res.setState("你没有更新空间依赖的权限");
				return res;
			}
			
			Work en = new Work();
			en.setId(id);
			en.setLibrary(keys != null ? JsonTool.write(keys) : "[]");
			en.setEdited(new Date());
			res.setState(service.update(en) ? OK : "更新空间依赖失败");
		} catch (Exception e) {
			res.setData(e);
		}
		return res;
	}
	@DailyPoint(impact = true)
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "keyt", method = RequestMethod.POST)
	public JMapView keyt(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			if (id == null || id < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			OnlineInfo online = ServletTool.getOnline(request);
			Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(id);
			if (member == null || !member.getFkAccount().equals(online.id)) {
				res.setState("你没有重置空间密钥的权限");
				return res;
			}
			
			Work en = new Work();
			en.setId(id);
			en.setKeyt(UUID.randomUUID().toString().replace("-", ""));
			if (service.update(en)) {
				Map<String, Object> token = new HashMap<String, Object>();
				token.put("id", id);
				token.put("online", online.id);
				res.put("token", id + "." + CryptoTool.AES.encode(JsonTool.write(token), en.getKeyt()));
				res.setState("重置空间密钥成功");
			} else {
				res.setState("重置空间密钥失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(refer = true)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, final Integer id) throws Exception {
		OnlineInfo online = null;
		WorkConfig config = null;
		Work en = new Work();
		if (id != null && id > 0) {
			Member member = ((Map<Integer, Member>) this.list(request, null, new Work())).get(id);
			if (member == null) {
				response.sendRedirect(ROOT + "auto/work/list.htm?" + KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
				return null;
			}
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setVersion(null), en.setConfig(null), en.setKeyt(null), en.setCreated(null), en.setFkEntityClass(null));
			en = service.get(en);
			if (en == null) {
				response.sendRedirect(ROOT + "auto/work/list.htm?" + KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
				return null;
			}
			
			online = ServletTool.getOnline(request);
			config = new WorkConfig();
			config.id = id;
			config.name = en.getName();
			config.account = member.getFkAccount();
			config.username = member.getGrade() == Long.MAX_VALUE ? online.name : super.online(accountService, member.getFkAccount()).name;
			if (member.getGrade() == 0) {
				config.trash = false;
				config.modify = false;
			} else if (member.getGrade() == Long.MAX_VALUE) {
				config.trash = true;
				config.modify = true;
			} else {
				config.trash = false;
				config.modify = true;
			}
			config.template = new TemplateConfig(JsonTool.read(en.getConfig(), TemplateConfig.Context.class));
			super.setGenre(super.getGenre(genreService, id), config.template);
			ServletTool.setAttribute(request, KEY_SESSION_CONFIG, config);
			String target = CookieTool.get(request, KEY_LOCAL_ADDRESS);
			if (target != null && target.indexOf("auto/") != -1 && target.indexOf("auto/work/list.htm") == -1 && target.indexOf("auto/work/index.htm") == -1) {
				response.sendRedirect(ROOT + target);
				return null;
			}
		} else {
			online = ServletTool.getOnline(request);
			config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (config == null) {
				response.sendRedirect(ROOT + "auto/work/list.htm?" + KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
				return null;
			}
			
			en.setId(config.id);
			en.setSqlQueryField(en.setVersion(null), en.setKeyt(null), en.setCreated(null));
			en = service.get(en);
			if (en == null) {
				response.sendRedirect(ROOT + "auto/work/list.htm?" + KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
				return null;
			}
		}
		
		String[] version = new String[4];
		version[0] = en.getVersion().toString();
		version[1] = super.getVersion(en.getVersion());
		version[2] = TimeTool.getTime(en.getCreated(), null);
		Map<String, Object> token = new HashMap<String, Object>();
		token.put("id", config.id);
		token.put("online", online.id);
		version[3] = config.id + "." + CryptoTool.AES.encode(JsonTool.write(token), en.getKeyt());
		
		Long[] count = new Long[] { 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L };
		Project project = new Project();
		project.setFkWork(config.id);
		count[0] = projectService.count(project);
		Member member = new Member();
		member.setFkWork(config.id);
		count[1] = memberService.count(member);
		Table table = new Table();
		table.setFkWork(config.id);
		count[2] = tableService.count(table);
		Driver driver = new Driver();
		driver.setFkWork(config.id);
		count[3] = driverService.count(driver);
		Template template = new Template();
		template.setFkWork(config.id);
		count[4] = templateService.count(template);
		Module module = new Module();
		module.setFkWork(config.id);
		count[5] = moduleService.count(module);
		Genre genre = new Genre();
		genre.setFkWork(config.id);
		count[6] = genreService.count(genre);
		Field field = new Field();
		field.setFkWork(config.id);
		count[7] = fieldService.count(field);
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/work_index");
		res.addObject("online", online);
		res.addObject("config", config);
		res.addObject("version", version);
		res.addObject("count", count);
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "exit", method = RequestMethod.GET)
	public void exit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletTool.setAttribute(request, KEY_SESSION_CONFIG, null);
		response.sendRedirect(ROOT + "auto/work/list.htm");
	}
}