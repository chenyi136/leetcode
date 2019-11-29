package com.mc.portal.view.auto;
import java.util.ArrayList;
import java.util.Date;
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
import com.mc.core.entity.auto.Bound;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Table;
import com.mc.core.service.auto.BoundService;
import com.mc.core.service.auto.FieldService;
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
@RequestMapping("/auto/table/")
public class TableView extends SuperView<Integer, Table> {
	@Autowired
	private BoundService boundService;
	@Autowired
	private FieldService fieldService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	public TableView(TableService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Table en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setClazz(null), en.setFrame(null), en.setBasis(null), en.setNode(null), en.setCode(null), en.setNote(null), en.setFkModule(null), en.setFkWork(null));
		ModelAndView res = super.load(request, en.getId(), en, "auto/table_load");
		Integer id = ((Table) res.getModel().get("pages")).getFkWork();
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (id != null && id != config.id) {
			response.sendRedirect(ROOT + "auto/table/list.htm");
			return null;
		}
		res.addObject("modules", super.getModule(moduleService, config.id, null));
		return res;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Table en) throws Exception {
		String clazz = new TemplateConfig().getVerifyClass(en.getClazz(), true);
		String frame = en.getFrame() != null ? en.getFrame().replace(" ", "") : "";
		if (clazz == null) {
			return super.jump(request, "auto/table/list.htm", "对象名称非法");
		}
		if (frame.equals("")) {
			return super.jump(request, "auto/table/list.htm", "结构名称非法");
		}
		
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (en.getFkModule() == -1) {
			en.doFieldValue(en.setFkModule(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkModule(null));
		} else {
			String temp = super.getModule(moduleService, config.id, new Module().setFrame(null)).get(en.getFkModule());
			if (temp == null || !en.getFrame().startsWith(temp)) {
				return super.jump(request, "auto/table/list.htm", "表名前缀与模块前缀不一致");
			}
		}
		
		Table temp = new Table();
		if (en.getId() == null) {
			temp.setSqlQueryTerm(false, temp.setClazz(null), Table.Operation.EqualTo, clazz);
			temp.setSqlQueryTerm(true, temp.setFkWork(null), Table.Operation.EqualTo, config.id);
			temp.setSqlQueryTerm(false, temp.setFrame(null), Table.Operation.EqualTo, frame);
			temp.setSqlQueryTerm(true, temp.setFkWork(null), Table.Operation.EqualTo, config.id);
			if (service.count(temp) > 0) {
				return super.jump(request, "auto/table/list.htm", "该对象已存在");
			}
			
			en.setClazz(clazz);
			en.setBuild(true);
			en.setFkWork(config.id);
			if (service.save(en)) {
				return super.jump(request, "auto/field/index.htm?id=" + en.getId(), null);
			} else {
				return super.jump(request, "auto/table/list.htm", "创建对象失败");
			}
		} else {
			temp.setId(en.getId());
			temp.setFkWork(config.id);
			if (!config.modify || service.count(temp) < 1) {
				return super.jump(request, "auto/table/list.htm", "你没有更新对象的权限");
			}
			
			temp = new Table();
			temp.setSqlQueryTerm(false, temp.setId(null), Table.Operation.NotEqualTo, en.getId());
			temp.setSqlQueryTerm(true, temp.setClazz(null), Table.Operation.EqualTo, clazz);
			temp.setSqlQueryTerm(true, temp.setFkWork(null), Table.Operation.EqualTo, config.id);
			temp.setSqlQueryTerm(false, temp.setId(null), Table.Operation.NotEqualTo, en.getId());
			temp.setSqlQueryTerm(true, temp.setFrame(null), Table.Operation.EqualTo, frame);
			temp.setSqlQueryTerm(true, temp.setFkWork(null), Table.Operation.EqualTo, config.id);
			if (service.count(temp) > 0) {
				return super.jump(request, "auto/table/list.htm", "该对象已存在");
			}
			
			en.setFrame(frame);
			en.setClazz(clazz);
			en.setBuild(true);
			en.setEdited(new Date());
			if (service.update(en)) {
				if (!en.getName().equals(request.getParameter("name2"))) {
					Bound bound = new Bound();
					bound.setFkTableObey(en.getId());
					bound.setFkWork(config.id);
					bound.setSqlQueryField(bound.setFkTableHost(null));
					bound.setSqlLeafSize(LEAF_MAX_SIZE);
					List<Bound> datas = boundService.list(bound);
					if (datas != null && datas.size() > 0) {
						List<Integer> tables = new ArrayList<Integer>();
						for (Bound data : datas) {
							tables.add(data.getFkTableHost());
						}
						super.setTable((TableService) service, tables);
					}
				}
				return super.jump(request, "auto/table/list.htm", "更新对象成功");
			} else {
				return super.jump(request, "auto/table/list.htm", "更新对象失败");
			}
		}
	}
	public JMapView save(HttpServletRequest request, Table en) {
		return null;
	}
	@DailyPoint(service = TableService.class)
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
				res.setState("你没有删除对象的权限");
				return res;
			}
			
			Field field = new Field();
			field.setFkTable(ids[0]);
			Bound bound = new Bound();
			bound.setSqlQueryTerm(false, bound.setFkTableHost(null), Bound.Operation.EqualTo, ids[0]);
			bound.setSqlQueryTerm(false, bound.setFkTableObey(null), Bound.Operation.EqualTo, ids[0]);
			if (fieldService.count(field) > 0 || boundService.count(bound) > 0) {
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			
			Table table = new Table();
			table.setId(ids[0]);
			table.setFkWork(config.id);
			res.put("count", service.trash(table));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Table en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Table().setFrame(null), true);
		pages.setLink(0, "auto/table/list.htm");
		pages.setLink(1, "auto/table/drop.htm");
		pages.setLink(2, "auto/table/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/table_list");
		res.addObject("modules", super.getModule(moduleService, ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id, new Module().setName(null)));
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Table en = new Table();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setFrame(null), en.setGrow(null), en.setBuild(null), en.setNote(null), en.setCreated(null), en.setEdited(null), en.setFkModule(null));
			List<Table> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				Map<Integer, String> session = super.getModule(moduleService, ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id, new Module().setName(null));
				for (Table data : datas) {
					String temp = session.get(data.getFkModule());
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", new String[] { data.getName(), !data.doIsEmpty(data.getNote()) ? data.getNote() : "暂无数据" });
					map.put("clazz", data.getClazz());
					map.put("frame", data.getFrame());
					map.put("grow", data.getGrow());
					map.put("build", data.getBuild());
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
					map.put("fk_module", temp != null ? temp.split(" | 表结构前缀：")[0] : "-");
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