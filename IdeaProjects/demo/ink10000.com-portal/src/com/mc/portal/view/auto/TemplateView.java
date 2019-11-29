package com.mc.portal.view.auto;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auto.Project;
import com.mc.core.entity.auto.Template;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.service.auto.TemplateService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.template.DaoImplTemplate;
import com.mc.core.template.DaoMapperTemplate;
import com.mc.core.template.DaoTemplate;
import com.mc.core.template.EntityTemplate;
import com.mc.core.template.ServiceImplTemplate;
import com.mc.core.template.ServiceTemplate;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.TemplateHelper;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/template/")
public class TemplateView extends SuperView<Integer, Template> {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private WorkService workService;
	@Autowired
	public TemplateView(TemplateService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Template en) throws Exception {
		en.setSqlQueryField(en.setClazz(null), en.setSource(null), en.setNozzle(null));
		ModelAndView res = super.load(request, en.getId(), en, "auto/template_load");
		Integer id = ((Template) res.getModel().get("pages")).getFkWork();
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (id != null && id != config.id) {
			response.sendRedirect(ROOT + "auto/template/list.htm");
			return null;
		}
		return res;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Template en) throws Exception {
		MultipartHttpServletRequest handler = (MultipartHttpServletRequest) request;
		MultipartFile doc = handler.getFile("file");
		if (en.getId() == null && (doc == null || doc.isEmpty())) {
			return super.jump(request, "auto/template/list.htm", "上传的文件非有效文件");
		}
		
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (doc != null && !doc.isEmpty()) {
			Work work = new Work();
			work.setId(config.id);
			work.setSqlQueryField(work.setLibrary(null));
			work = workService.get(work);
			if (work == null) {
				return super.jump(request, "auto/template/list.htm", null);
			}
			String name = doc.getOriginalFilename();
			if (name == null || !name.endsWith(".java")) {
				return super.jump(request, "auto/template/list.htm", "上传的文件不是类文件");
			}
			File parent = new File(CACHE + "auto/" + System.currentTimeMillis() + "/");
			if (!parent.mkdirs()) {
				return super.jump(request, "auto/template/list.htm", "创建编译临时目录失败");
			}
			
			File target = new File(parent, name);
			((CommonsMultipartFile) doc).transferTo(target);
			JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
			ByteArrayOutputStream err = new ByteArrayOutputStream();
			String[] keys = JsonTool.read(work.getLibrary(), String[].class);
			if (compiler.run(null, null, err, "-classpath", super.getLibrary(keys, String.class), "-d", parent.getAbsolutePath(), target.getAbsolutePath().replace("\\", "/")) != 0) {
				FileTool.delete(parent, true);
				super.out(response, err.toString("UTF-8"), null);
				err.close();
				return null;
			}
			err.close();
			List<File> files = new ArrayList<File>();
			FileTool.list(parent, new String[] { ".class" }, files);
			if (files.size() < 1) {
				FileTool.delete(parent, true);
				return super.jump(request, "auto/template/list.htm", "找不到编译产生的文件");
			}
			
			name = name.replace(".java", "");
			String root = parent.getAbsolutePath().replace("\\", "/");
			if (!root.endsWith("/")) {
				root += "/";
			}
			
			TemplateHelper loader = new TemplateHelper(super.getLibrary(keys, URL[].class));
			List<String> codes = new ArrayList<String>();
			for (File file : files) {
				byte[] data = Files.readAllBytes(Paths.get(file.toURI()));
				String clazz = file.getAbsolutePath().replace("\\", "/").replace(root, "").replace("/", ".").replace(".class", "");
				if (name.equals(file.getName().replace(".class", ""))) {
					en.setClazz(clazz);
				}
				codes.add(clazz);
				codes.add(Base64.encodeBase64String(data));
				loader.load(clazz, data);
			}
			
			en.setSource(Base64.encodeBase64String(Files.readAllBytes(Paths.get(target.toURI()))));
			FileTool.delete(parent, true);
			Class<?>[] interfaces = loader.loadClass(en.getClazz()).getInterfaces();
			if (interfaces == null || interfaces.length < 1) {
				loader.close();
				return super.jump(request, "auto/template/list.htm", "类没有实现提供的接口");
			}
			List<String> nozzle = new ArrayList<String>();
			for (Class<?> temp : interfaces) {
				if (temp.getName().equals(EntityTemplate.class.getName())
					|| temp.getName().equals(DaoTemplate.class.getName())
					|| temp.getName().equals(DaoImplTemplate.class.getName())
					|| temp.getName().equals(DaoMapperTemplate.class.getName())
					|| temp.getName().equals(ServiceTemplate.class.getName())
					|| temp.getName().equals(ServiceImplTemplate.class.getName())) {
					nozzle.add(temp.getName());
				}
			}
			loader.close();
			if (nozzle.size() < 1) {
				return super.jump(request, "auto/template/list.htm", "类没有实现提供的接口");
			}
			
			Template temp = new Template();
			temp.setClazz(en.getClazz());
			temp.setFkWork(config.id);
			if (en.getId() != null) {
				temp.setSqlQueryTerm(true, temp.setId(null), Template.Operation.NotEqualTo, en.getId());
			}
			if (service.count(temp) > 0) {
				return super.jump(request, "auto/template/list.htm", "该模板接口实现类已存在");
			}
			en.setCode(JsonTool.write(codes));
			en.setNozzle(JsonTool.write(nozzle));
		}
		
		if (en.getId() == null) {
			en.setFkWork(config.id);
			return super.jump(request, "auto/template/list.htm", service.save(en) ? "上传模板成功" : "上传模板失败");
		} else {
			en.setEdited(new Date());
			return super.jump(request, "auto/template/list.htm", service.update(en) ? "更新模板成功" : "更新模板失败");
		}
	}
	public JMapView save(HttpServletRequest request, Template en) {
		return null;
	}
	@DailyPoint(service = TemplateService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length != 1 || ids[0] < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Template en = new Template();
			en.setId(ids[0]);
			en.setSqlQueryField(en.setKernel(null));
			en = service.get(en);
			if (en == null || en.getKernel()) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			if (!config.trash) {
				res.setState("你没有删除模板的权限");
				return res;
			}
			
			Work work = new Work();
			work.setSqlQueryTerm(false, work.setFkEntityClass(null), Work.Operation.EqualTo, ids[0]);
			work.setSqlQueryTerm(false, work.setFkDaoClass(null), Work.Operation.EqualTo, ids[0]);
			work.setSqlQueryTerm(false, work.setFkDaoImplClass(null), Work.Operation.EqualTo, ids[0]);
			work.setSqlQueryTerm(false, work.setFkDaoMapperXml(null), Work.Operation.EqualTo, ids[0]);
			work.setSqlQueryTerm(false, work.setFkServiceClass(null), Work.Operation.EqualTo, ids[0]);
			work.setSqlQueryTerm(false, work.setFkServiceImplClass(null), Work.Operation.EqualTo, ids[0]);
			Project project = new Project();
			project.setSqlQueryTerm(false, project.setFkEntityClass(null), Project.Operation.EqualTo, ids[0]);
			project.setSqlQueryTerm(false, project.setFkDaoClass(null), Project.Operation.EqualTo, ids[0]);
			project.setSqlQueryTerm(false, project.setFkDaoImplClass(null), Project.Operation.EqualTo, ids[0]);
			project.setSqlQueryTerm(false, project.setFkDaoMapperXml(null), Project.Operation.EqualTo, ids[0]);
			project.setSqlQueryTerm(false, project.setFkServiceClass(null), Project.Operation.EqualTo, ids[0]);
			project.setSqlQueryTerm(false, project.setFkServiceImplClass(null), Project.Operation.EqualTo, ids[0]);
			if (workService.count(work) > 0 || projectService.count(project) > 0){
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			
			res.put("count", service.delete(ids[0]) ? 1 : 0);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Template en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Template().setClazz(null), true);
		pages.setLink(0, "auto/template/list.htm");
		pages.setLink(1, "auto/template/drop.htm");
		pages.setLink(2, "auto/template/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/template_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Template en = new Template();
			en.setSqlQueryField(en.setId(null), en.setClazz(null), en.setNozzle(null), en.setKernel(null), en.setCreated(null), en.setEdited(null));
			List<Template> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Template data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("clazz", data.getClazz());
					map.put("nozzle", data.getNozzle().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
					map.put("kernel", data.getKernel());
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
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