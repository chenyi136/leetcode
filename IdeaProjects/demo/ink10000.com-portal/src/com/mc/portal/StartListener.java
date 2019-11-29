package com.mc.portal;
import java.io.File;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.DispatcherServlet;
import com.mc.core.crux.Core;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Group;
import com.mc.core.entity.auth.Power;
import com.mc.core.entity.site.Config;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.service.site.ConfigService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Component
public class StartListener extends DispatcherServlet implements InitializingBean {
	public static final Map<String, String[]> MAPPER = new HashMap<String, String[]>();
	private static final long serialVersionUID = System.identityHashCode(StartListener.class);
	private static final Map<String, String> ONLINE = new ConcurrentHashMap<String, String>();
	private static ApplicationContext context;
	private static String FORBID; 
	public void setApplicationContext(ApplicationContext context) {
		super.setApplicationContext(context);
		StartListener.context = context;
	}
	public void afterPropertiesSet() throws Exception {
		Map<String, Config> source = new HashMap<String, Config>();
		this.config(Global.class, source);
		this.config(context.getBean(ConfigService.class), source);
		power(context.getBean(PowerService.class));
		group(context.getBean(GroupService.class));
	}
	public void init(ServletConfig config) {
		try {
			super.init(config);
			ServletContext context = config.getServletContext();
			File file = new File(context.getRealPath("/data/cache/"));
			FileTool.delete(file, true);
			if (!file.mkdirs()) {
				throw new Exception("创建缓存目录（/data/cache/）失败");
			}
			
			Global.CONTEXT = context.getContextPath() + "/";
			Global.CACHE = file.getAbsolutePath().replace("\\", "/");
			Global.PROJECT = context.getRealPath("/").replace("\\", "/");
			Global.ROOT = context.getInitParameter("ROOT");
			if (!Global.CACHE.endsWith("/")) {
				Global.CACHE += "/";
			}
			if (!Global.PROJECT.endsWith("/")) {
				Global.PROJECT += "/";
			}
			file = new File(Global.OUTPUT);
			if (!file.exists() || !file.isDirectory()) {
				Global.OUTPUT = null;
			}
			context.setAttribute("SITE", context.getInitParameter("SITE"));
			context.setAttribute("ROOT", Global.ROOT);
			
			String root = Global.PROJECT + "_/doc/jar/";
			File target = new File(root + "config.json");
			Map<String, Global.LibraryItem> verify = Collections.synchronizedMap(new TreeMap<String, Global.LibraryItem>(new Comparator<String>() {
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
			}));
			List<Global.LibraryItem> items = JsonTool.list(target, Global.LibraryItem.class);
			for (Global.LibraryItem item : items) {
				verify.put(item.PATH, item);
			}
			List<File> files = new ArrayList<File>();
			FileTool.list(new File(root), new String[] { ".jar" }, files);
			int count = 0;
			for (File temp : files) {
				String PATH = temp.getAbsolutePath().replace("\\", "/").replace(root, "");
				String NAME = temp.getName();
				String SOURCE = PATH.replace(".jar", "-sources.zip");
				if (!new File(root + SOURCE).exists()) {
					SOURCE = null;
				}
				Global.LibraryItem item = verify.get(PATH);
				if (item == null) {
					item = new Global.LibraryItem();
					item.ID = CryptoTool.MD5.encode(temp, false).MD5;
					item.PATH = PATH;
					item.NAME = NAME;
					item.SOURCE = SOURCE;
					verify.put(item.PATH, item);
					count++;
				} else {
					if (!item.PATH.equals(PATH)) {
						item.PATH = PATH;
						item.NAME = NAME;
						count++;
					}
					if (item.SOURCE == null && SOURCE != null || item.SOURCE != null && !item.SOURCE.equals(SOURCE) ) {
						item.SOURCE = SOURCE;
						count++;
					}
				}
			}
			for (Map.Entry<String, Global.LibraryItem> en : verify.entrySet()) {
				File temp = new File(root + en.getKey());
				if (temp.exists() && temp.isFile()) {
					Global.LibraryItem item = en.getValue();
					Global.LIBRARY.put(item.ID, item);
				} else {
					count++;
				}
			}
			if (count > 0) {
				JsonTool.write(Global.LIBRARY.values(), target);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
	}
	protected void doDispatch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = ServletTool.getURI(request);
		logger.info("请求地址 = " + uri + ", 来源地址 = " + request.getHeader("Referer"));
		if (!this.verify(request, response, uri)) {
			return;
		}
		super.doDispatch(request, response);
	}
	private void config(Class<?> clazz, Map<String, Config> source) throws Exception {
		String key = clazz.getName();
		Field[] fields = clazz.getDeclaredFields();
		for (Field field : fields) {
			if (field.isAnnotationPresent(Core.Syllable.class)) {
				Config value = new Config();
				value.setName(field.getAnnotation(Core.Syllable.class).title());
				value.setClazz(key);
				value.setField(field.getName());
				value.setTacit(String.valueOf(field.get(clazz)));
				source.put(value.getClazz() + "." + value.getField(), value);
			}
		}
		clazz = clazz.getSuperclass();
		if (clazz.getName().equals(Object.class.getName())) {
			return;
		}
		config(clazz, source);
	}
	private void config(ConfigService configService, Map<String, Config> source) throws Exception {
		Map<String, Config> target = new HashMap<String, Config>();
		Config en = new Config();
		en.setFkAccount(Global.SUPER_MANAGER_ACCOUNT);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setField(null), en.setTacit(null), en.setEntry(null));
		en.setSqlQueryTerm(true, en.setClazz(null), Config.Operation.NotEqualTo, "");
		en.setSqlQueryTerm(true, en.setField(null), Config.Operation.NotEqualTo, "");
		en.setSqlQueryNull(true, en.setClazz(null), true);
		en.setSqlQueryNull(true, en.setField(null), true);
		en.setSqlQueryOrder(en.setField(null), true);
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Config> datas = configService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Config data : datas) {
				target.put(data.getClazz() + "." + data.getField(), data);
			}
		}
		
		Map<String, Map<String, String>> task = new HashMap<String, Map<String, String>>();
		List<Config> batch = new ArrayList<Config>();
		for (Map.Entry<String, Config> temp : source.entrySet()) {
			Config value1 = temp.getValue();
			Config value2 = target.get(temp.getKey());
			if (value2 == null) {
				value1.setEntry(value1.getTacit() != null ? value1.getTacit() : "-");
				value1.setFkAccount(Global.SUPER_MANAGER_ACCOUNT);
				batch.add(value1);
			} else {
				Config center = new Config();
				if (!value1.getName().equals(value2.getName())) {
					center.setId(value2.getId());
					center.setName(value1.getName());
				}
				if (!value1.getTacit().equals(value2.getTacit())) {
					center.setId(value2.getId());
					center.setTacit(value1.getTacit());
				}
				if (!value1.getTacit().equals(value2.getEntry())) {
					Map<String, String> map = task.get(value2.getClazz());
					if (map == null) {
						map = new HashMap<String, String>();
						task.put(value2.getClazz(), map);
					}
					map.put(value2.getField(), value2.getEntry());
				}
				if (center.getId() != null) {
					configService.update(center);
				}
				target.remove(temp.getKey());
			}
		}
		configService.batch(batch);
		for (Config data : target.values()) {
			configService.delete(data.getId());
		}
		for (Map.Entry<String, Map<String, String>> temp : task.entrySet()) {
			config(temp.getKey(), temp.getValue());
		}
	}
	private boolean verify(HttpServletRequest request, HttpServletResponse response, String uri) throws Exception {
		if (FORBID != null && FORBID.indexOf(uri) != -1) {
			response.sendError(403);
			return false;
		}
		if (request.getMethod().toUpperCase().equals("GET")) {
			String[] keys = MAPPER.get(uri);
			if (keys != null) {
				request.setAttribute(Global.KEY_JUMP_POWER, power(null, keys[0]));
			}
		}
		if (Arrays.asList("login.htm", "logout.htm").contains(uri) || uri.startsWith("global/")) {
			return true;
		}
		OnlineInfo online = ServletTool.getOnline(request);
		if (online == null) {
			response.sendRedirect(Global.ROOT);
			return false;
		}
		String power = ONLINE.get(online.id);
		if (power == null) {
			power = online.power;
		} else {
			online.power = power;
			ONLINE.remove(online.id);
		}
		if (power == null || power.indexOf(";" + uri + ";") == -1) {
			response.sendError(403);
			return false;
		}
		if (uri.startsWith("auto/") && !uri.startsWith("auto/work/") && !uri.startsWith("auto/depend/") && !uri.equals("auto/field/library.htm")) {
			if (ServletTool.getAttribute(request, Global.KEY_SESSION_CONFIG, WorkConfig.class) == null) {
				response.sendRedirect(Global.ROOT + "auto/work/list.htm?" + Global.KEY_JUMP_MESSAGE + "=" + URLEncoder.encode("请【进入】你将要操作的工作空间；\\n若没有工作空间，请先【创建】新的空间。", "UTF-8"));
				return false;
			}
		}
		return true;
	}
	public static void config(String target, Map<String, String> map) throws Exception {
		Class<?> clazz = Class.forName(target);
		Field[] fields = clazz.getDeclaredFields();
		for (Field field : fields) {
			String value = map.get(field.getName());
			if (value != null) {
				if (value.equals("null")) {
					field.set(clazz, null);
					break;
				}
				String type = field.getType().getName();
				if (type.equals("java.lang.Integer")) {
					field.set(clazz, Integer.parseInt(value));
				} else if (type.equals("java.lang.Long")) {
					field.set(clazz, Long.parseLong(value));
				} else if (type.equals("java.lang.String")) {
					field.set(clazz, value);
				}
				break;
			}
		}
	}
	public static final synchronized void power(PowerService powerService) {
		Global.POWER.clear();
		MAPPER.clear();
		FORBID = ";";
		Power en = new Power();
		en.setSqlQueryOrder(en.setQueue(null), true);
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Power> datas = powerService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Power data : datas) {
				Global.POWER.put(data.getId(), data);
				if (data.getRoute().endsWith(".htm")) {
					if (data.getForbid()) {
						FORBID += data.getRoute() + ";";
					} else {
						MAPPER.put(data.getRoute(), new String[] { data.getId(), data.getName() });
					}
				}
			}
		}
	}
	public static final Power[] power(PowerService powerService, String id) {
		if (id == null || id.equals("")) {
			return new Power[3];
		}
		if (Global.POWER.size() < 1) {
			power(powerService != null ? powerService : context.getBean(PowerService.class));
		}
		Power[] res = new Power[3];
		Power temp;
		while ((temp = Global.POWER.get(id)) != null) {
			res[temp.getLevel() - 1] = temp;
			if (temp.getLevel() < 2) {
				break;
			}
			id = temp.getParent();
		}
		return res;
	}
	public static final Map<String, Power> power(PowerService powerService, GroupService groupService, Account account) throws Exception {
		if (Global.POWER.size() < 1) {
			power(powerService);
		}
		if (Global.GROUP.size() < 1) {
			group(groupService);
		}
		Map<String, Power> res = new LinkedHashMap<String, Power>();
		Group group = Global.GROUP.get(account.getFkGroup());
		if (group != null && !group.getForbid()) {
			String[] keys = JsonTool.read(group.getEntry(), String[].class);
			for (String key : keys) {
				Power value = Global.POWER.get(key);
				if (value != null) {
					res.put(key, value);
				}
			}
		}
		String[] keys = JsonTool.read(account.getPermit(), String[].class);
		for (String key : keys) {
			if (res.containsKey(key)) {
				continue;
			}
			Power value = Global.POWER.get(key);
			if (value != null) {
				res.put(key, value);
			}
		}
		keys = JsonTool.read(account.getForbid(), String[].class);
		for (String key : keys) {
			res.remove(key);
		}
		return res;
	}
	public static Map<String, Global.PowerItem> power(Map<String, Power> powers, String id, OnlineInfo online) throws Exception {
		Map<String, Global.PowerItem> res = new LinkedHashMap<String, Global.PowerItem>();
		StringBuffer accect = new StringBuffer(";");
		for (Power power : powers.values()) {
			if (power.getRoute().endsWith(".htm")) {
				accect.append(power.getRoute() + ";");
			}
			if (power.getMenu() && power.getLevel().intValue() == 1) {
				Global.PowerItem item = new Global.PowerItem();
				item.id = power.getId();
				item.name = power.getName();
				item.icon = power.getIcon();
				item.url = power.getRoute();
				item.next = new ArrayList<Global.PowerItem>();
				res.put(power.getId(), item);
			}
		}
		for (Power power : powers.values()) {
			if (power.getMenu() && power.getLevel().intValue() == 2) {
				Global.PowerItem item = new Global.PowerItem();
				item.name = power.getName();
				item.icon = power.getIcon();
				item.url = power.getRoute();
				Global.PowerItem parent = res.get(power.getParent());
				if (parent != null) {
					parent.next.add(item);
				} else {
					res.put(power.getId(), item);
				}
			}
		}
		if (online != null) {
			online.power = accect.toString();
			ONLINE.remove(online.id);
		} else {
			ONLINE.put(id, accect.toString());
		}
		return res;
	}
	public static synchronized final void group(GroupService groupService) {
		Global.GROUP.clear();
		Group en = new Group();
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Group> datas = groupService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Group data : datas) {
				Global.GROUP.put(data.getId(), data);
			}
		}
	}
}