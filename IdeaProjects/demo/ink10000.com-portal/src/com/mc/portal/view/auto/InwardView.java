package com.mc.portal.view.auto;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Inward;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.auto.FieldService;
import com.mc.core.service.auto.InwardService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/inward/")
public class InwardView extends SuperView<Integer, Inward> {
	@Autowired
	private FieldService fieldService;
	@Autowired
	private TableService tableService;
	@Autowired
	private WorkService workService;
	@Autowired
	public InwardView(InwardService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Inward en) throws Exception {
		return null;
	}
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Inward en = new Inward();
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setClazz(null), en.setEntry(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			res.put("name", en.getName());
			res.put("clazz", en.getClazz());
			res.setData(JsonTool.read(en.getEntry(), Map.class));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Inward en) throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Inward en) {
		JMapView res = new JMapView();
		try {
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			en.setName(en.getName().replace("\"", "“"));
			Inward temp = new Inward();
			if (en.getId() == null) {
				String clazz = new TemplateConfig().getVerifyClass(en.getClazz(), true);
				if (clazz == null) {
					res.setState("属性名称非法");
					return res;
				}
				
				temp.setClazz(clazz);
				temp.setFkWork(config.id);
				if (service.count(temp) > 0) {
					res.setState("该取值已存在");
				}
				
				Map<String, String> cache = JsonTool.read(en.getEntry(), Map.class);
				Map<String, String> entry = new LinkedHashMap<String, String>();
				if (en.getMajor().equals(Integer.class.getName())) {
					for (Entry<String, String> data : cache.entrySet()) {
						try {
							Integer.parseInt(data.getKey());
							entry.put(data.getKey(), data.getValue());
						} catch (Exception e) {}
					}
				} else if (en.getMajor().equals(Long.class.getName())){
					for (Entry<String, String> data : cache.entrySet()) {
						try {
							Long.parseLong(data.getKey());
							entry.put(data.getKey(), data.getValue());
						} catch (Exception e) {}
					}
				} else {
					for (Entry<String, String> data : cache.entrySet()) {
						entry.put(data.getKey(), data.getValue());
					}
				}
				
				en.setClazz(clazz);
				en.setEntry(JsonTool.write(entry));
				en.setFkWork(config.id);
				if (service.save(en)) {
					config.inward = null;
					res.put("id", en.getId());
					res.put("clazz", en.getClazz());
					res.setState(OK);
				} else {
					res.setState("创建取值失败");
				}
			} else {
				if (!config.modify || (temp = service.load(en.getId())) == null || temp.getFkWork() != config.id) {
					res.setState("你没有更新取值的权限");
					return res;
				}
				
				if (en.getEntry() != null) {
					Map<String, String> cache = JsonTool.read(en.getEntry(), Map.class);
					Map<String, String> entry = new LinkedHashMap<String, String>();
					if (en.getMajor().equals(Integer.class.getName())) {
						for (Entry<String, String> data : cache.entrySet()) {
							try {
								int key = Integer.parseInt(data.getKey(), 10);
								entry.put(String.valueOf(key), data.getValue());
							} catch (Exception e) {}
						}
					} else if (en.getMajor().equals(Long.class.getName())){
						for (Entry<String, String> data : cache.entrySet()) {
							try {
								long key = Long.parseLong(data.getKey(), 10);
								entry.put(String.valueOf(key), data.getValue());
							} catch (Exception e) {}
						}
					} else {
						entry = cache;
					}
					en.setEntry(JsonTool.write(entry));
				}
				
				if (service.update(en)) {
					if (en.getEntry() != null && !en.getEntry().equals(temp.getEntry())) {
						Field field = new Field();
						field.setFkInward(en.getId());
						field.setFkWork(config.id);
						field.setSqlQueryField(field.setFkTable(null));
						field.setSqlQueryGroup(field.setFkTable(null));
						field.setSqlLeafSize(LEAF_MAX_SIZE);
						List<Field> datas = fieldService.list(field);
						if (datas != null && datas.size() > 0) {
							List<Integer> ids = new ArrayList<Integer>();
							for (Field data : datas) {
								ids.add(data.getFkTable());
							}
							super.setTable(tableService, ids);
						}
					}
					config.inward = null;
					res.setState(OK);
				} else {
					res.setState("更新取值失败");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = InwardService.class)
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
			Inward en = new Inward();
			en.setId(id);
			en.setFkWork(config.id);
			if (!config.modify || service.count(en) < 1) {
				res.setState("你没有删除取值的权限");
				return res;
			}
			
			Field field = new Field();
			field.setFkInward(id);
			if (fieldService.count(field) > 0) {
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			if (service.delete(id)) {
				config.inward = null;
				res.setState(OK);
			} else {
				res.setState("删除取值失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Inward en) throws Exception {
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
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		Work work = workService.load(config.id);
		if (work == null) {
			response.sendRedirect(ROOT + "auto/work/list.htm?" + KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
			return null;
		}
		
		Map<String, Object> token = new HashMap<String, Object>();
		token.put("id", config.id);
		token.put("online", ServletTool.getOnline(request).id);
		Inward en = new Inward();
		en.setFkWork(config.id);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setMajor(null));
		en.setSqlQueryOrder(en.setClazz(null), true);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Inward> datas = service.list(en);
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/inward_index");
		res.addObject("datas", datas != null ? datas : new ArrayList<Inward>());
		res.addObject("token", config.id + "." + CryptoTool.AES.encode(JsonTool.write(token), work.getKeyt()));
		return res;
	}
}