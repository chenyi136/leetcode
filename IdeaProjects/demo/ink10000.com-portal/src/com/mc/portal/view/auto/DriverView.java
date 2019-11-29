package com.mc.portal.view.auto;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
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
import com.mc.core.entity.auto.Project;
import com.mc.core.service.auto.DriverService;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.JdbcTool;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/driver/")
public class DriverView extends SuperView<Integer, Driver> {
	@Autowired
	private ProjectService projectService;
	@Autowired
	public DriverView(DriverService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Driver en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setVersion(null), en.setClazz(null), en.setAddress(null), en.setUsername(null), en.setEngine(null), en.setUnicode(null), en.setIndexes(null), en.setSymbol(null), en.setFkWork(null));
		ModelAndView res = super.load(request, en.getId(), en, "auto/driver_load");
		Integer id = ((Driver) res.getModel().get("pages")).getFkWork();
		if (id != null && id != ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id) {
			response.sendRedirect(ROOT + "auto/driver/list.htm");
			return null;
		}
		return res;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Driver en) throws Exception {
		WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
		if (en.getId() == null) {
			if (en.getVersion() == null) {
				en.setVersion("-");
			}
			en.setFkWork(config.id);
			return super.jump(request, "auto/driver/list.htm", service.save(en) ? "创建驱动成功" : "创建驱动失败");
		} else {
			Driver temp = new Driver();
			temp.setId(en.getId());
			temp.setFkWork(config.id);
			if (!config.modify || service.count(temp) < 1) {
				return super.jump(request, "auto/driver/list.htm", "你没有更新驱动的权限");
			}
			
			en.setEdited(new Date());
			if (service.update(en)) {
				if (config.driver != null && config.driver.getId().intValue() == en.getId()) {
					config.driver = null;
				}
				return super.jump(request, "auto/driver/list.htm", "更新驱动成功");
			} else {
				return super.jump(request, "auto/driver/list.htm", "更新驱动失败");
			}
		}
	}
	public JMapView save(HttpServletRequest request, Driver en) {
		return null;
	}
	@DailyPoint(service = DriverService.class)
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
				res.setState("你没有删除驱动的权限");
				return res;
			}
			
			Driver en = new Driver();
			en.setFkWork(config.id);
			if (service.count(en) < 2) {
				res.setState("驱动总数不能少于1个");
				return res;
			}
			
			en.setId(ids[0]);
			int count = service.trash(en);
			if (count > 0) {
				if (config.driver != null && config.driver.getId().intValue() == ids[0]) {
					config.driver = null;
				}
				Project project = new Project();
				project.setFkDriver(ids[0]);
				project.setSqlUpdateNull(project.setFkDriver(null));
				projectService.alter(project);
			}
			res.put("count", count);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Driver en) throws Exception {
		en.setFkWork(ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Driver().setCreated(null), false);
		pages.setLink(0, "auto/driver/list.htm");
		pages.setLink(1, "auto/driver/drop.htm");
		pages.setLink(2, "auto/driver/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/driver_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Driver en = new Driver();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setVersion(null), en.setClazz(null), en.setAddress(null), en.setUsername(null), en.setEngine(null), en.setUnicode(null), en.setIndexes(null), en.setSymbol(null), en.setTacit(null), en.setCreated(null), en.setEdited(null));
			List<Driver> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Driver data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("version", data.getVersion());
					map.put("clazz", new String[] { data.getClazz(), data.getAddress() });
					map.put("username", data.getUsername());
					map.put("engine", data.getEngine());
					map.put("unicode", data.getUnicode());
					map.put("indexes", data.getIndexes());
					map.put("symbol", data.getSymbol());
					map.put("tacit", data.getTacit());
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
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "tacit", method = RequestMethod.POST)
	public JMapView tacit(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			if (id == null || id < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			WorkConfig config = ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class);
			Driver temp = new Driver();
			temp.setId(id);
			temp.setFkWork(config.id);
			if (!config.modify || service.count(temp) < 1) {
				res.setState("你没有设置默认驱动的权限");
				return res;
			}
			
			temp = new Driver();
			temp.setTacit(true);
			temp.setFkWork(config.id);
			temp.setSqlUpdateNew(temp.setTacit(null), false);
			temp.setSqlQueryTerm(true, temp.setId(null), Driver.Operation.NotEqualTo, id);
			service.alter(temp);
			
			temp = new Driver();
			temp.setTacit(false);
			temp.setFkWork(config.id);
			temp.setSqlUpdateNew(temp.setTacit(null), true);
			temp.setSqlQueryTerm(true, temp.setId(null), Driver.Operation.EqualTo, id);
			service.alter(temp);
			if (config.driver != null && config.driver.getId().intValue() != id) {
				config.driver = null;
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		Driver en = service.load(id);
		if (en == null || en.getFkWork() != ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id) {
			response.sendRedirect(ROOT + "auto/driver/list.htm");
			return null;
		}
		JdbcTool.DataBase dataBase = JdbcTool.product(null, en.getAddress());
		if (dataBase == null || !(dataBase instanceof JdbcTool.MySQL)) {
			super.out(response, "此功能目前只支持MySQL", null);
			return null;
		}
		
		Connection conn;
		try {
			conn = JdbcTool.open(en.getClazz(), en.getAddress(), en.getUsername(), CryptoTool.DES.decode(en.getPassword()));
		} catch (Exception e) {
			super.out(response, null, e);
			return null;
		}
		
		Map<String, Object> meta = JdbcTool.meta(conn);
		String version = meta.get("DatabaseMetaData.getDatabaseProductName()") + "(" + meta.get("DatabaseMetaData.getDatabaseProductVersion()") + ")";
		if (!en.getVersion().equals(version)) {
			Driver temp = new Driver();
			temp.setId(id);
			temp.setVersion(version);
			service.update(temp);
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/driver_detail");
		res.addObject("title", en.getName() + "@" + en.getUsername());
		res.addObject("meta", meta);
		JdbcTool.close(conn, null, null, null);
		return res;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "state", method = RequestMethod.GET)
	public ModelAndView state(HttpServletRequest request, HttpServletResponse response, Integer id) throws Exception {
		Driver en = service.load(id);
		if (en == null || en.getFkWork() != ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id) {
			response.sendRedirect(ROOT + "auto/driver/list.htm");
			return null;
		}
		JdbcTool.DataBase dataBase = JdbcTool.product(null, en.getAddress());
		if (dataBase == null || !(dataBase instanceof JdbcTool.MySQL)) {
			super.out(response, "此功能目前只支持MySQL", null);
			return null;
		}
		
		Connection conn;
		try {
			conn = JdbcTool.open(en.getClazz(), en.getAddress(), en.getUsername(), CryptoTool.DES.decode(en.getPassword()));
		} catch (Exception e) {
			super.out(response, null, e);
			return null;
		}
		
		DatabaseMetaData meta = conn.getMetaData();
		ModelAndView res = new ModelAndView("jsp/auto/driver_state");
		res.addObject("datas1", dataBase.state(conn, 1, null));
		res.addObject("datas2", dataBase.state(conn, 2, null));
		res.addObject("datas3", dataBase.state(conn, 3, null));
		res.addObject("datas4", dataBase.state(conn, 4, null));
		res.addObject("meta", new String[] { id.toString(), en.getName() + "@" + en.getUsername(), meta.getDatabaseProductName() + "-" + meta.getDatabaseProductVersion(), meta.getDriverVersion() });
		JdbcTool.close(conn, null, null, null);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value="state",method=RequestMethod.POST)
	public JMapView state(HttpServletRequest request, Integer id, @RequestParam("params[]") String[] params) {
		JMapView res = new JMapView();
		Connection conn = null;
		try {
			Driver en;
			if (id == null || id < 0 || params == null || params.length < 1 || (en = service.load(id)) == null || en.getFkWork() != ServletTool.getAttribute(request, KEY_SESSION_CONFIG, WorkConfig.class).id) {
				res.setState("请求参数非法");
				return res;
			}
			JdbcTool.DataBase dataBase = JdbcTool.product(null, en.getAddress());
			if (dataBase == null || !(dataBase instanceof JdbcTool.MySQL)) {
				res.setState("此功能目前只支持MySQL");
				return res;
			}
			
			try {
				conn = JdbcTool.open(en.getClazz(), en.getAddress(), en.getUsername(), CryptoTool.DES.decode(en.getPassword()));
			} catch (Exception e) {
				res.setState(e);
				return res;
			}
			
			List<String> field1 = new ArrayList<String>();
			List<String> field2 = new ArrayList<String>();
			List<String> field3 = new ArrayList<String>();
			List<String> field4 = new ArrayList<String>();
			for (String param : params) {
				String[] fields = param.substring(param.indexOf("=") + 1).replace("(", "").replace(")", "").replace("*100%", "").replace("+", "/").replace("-", "/").replace("*", "/").split("/");
				for (String field : fields) {
					if (field.length() < 2) {
						continue;
					}
					String data = field.substring(2);
					switch (Integer.parseInt(field.substring(0, 1))) {
						case 1:
							if (!field1.contains(data)) {
								field1.add(data);
							}
							break;
						case 2:
							if (!field2.contains(data)) {
								field2.add(data);
							}
							break;
						case 3:
							if (!field3.contains(data)) {
								field3.add(data);
							}
							break;
						case 4:
							if (!field4.contains(data)) {
								field4.add(data);
							}
							break;
					}
				}
			}
			
			List<String[]> data = new ArrayList<String[]>();
			if (field1.size() > 0) {
				Map<String, String> datas = dataBase.state(conn, 1, field1);
				if (datas.size() > 0) {
					for (Entry<String, String> temp: datas.entrySet()) {
						String value = temp.getValue();
						data.add(new String[] { "1:" + temp.getKey(), value != null && !value.equals("") ? value : "0" });
					}
				}
			}
			if (field2.size() > 0) {
				Map<String, String> datas = dataBase.state(conn, 2, field2);
				if (datas.size() > 0) {
					for (Entry<String,String> temp : datas.entrySet()) {
						String value = temp.getValue();
						data.add(new String[] { "2:" + temp.getKey(), value != null && !value.equals("") ? value : "0" });
					}
				}
			}
			if (field3.size() > 0) {
				Map<String, String> datas = dataBase.state(conn, 3, field3);
				if (datas.size() > 0) {
					for (Entry<String, String> temp : datas.entrySet()) {
						String value = temp.getValue();
						data.add(new String[] { "3:" + temp.getKey(), value != null && !value.equals("") ? value : "0" });
					}
				}
			}
			if (field4.size() > 0) {
				Map<String, String> datas = dataBase.state(conn, 4, field4);
				if (datas.size() > 0) {
					for (Entry<String, String> temp : datas.entrySet()) {
						String value = temp.getValue();
						data.add(new String[] { "4:" + temp.getKey(), value != null && !value.equals("") ? value : "0" });
					}
				}
			}
			res.put("data", data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		} finally {
			JdbcTool.close(conn, null, null, null);
		}
		return res;
	}
}