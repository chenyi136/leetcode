package com.mc.portal.view.auto;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import com.mc.core.entity.auto.Depend;
import com.mc.core.service.auto.DependService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.core.view.JTreeView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/auto/depend/")
public class DependView extends SuperView<Integer, Depend> {
	@Autowired
	public DependView(DependService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Depend en) throws Exception {
		if (OUTPUT == null) {
			response.sendRedirect(ROOT + "auto/depend/list.htm");
			return null;
		}
		
		en.setSqlQueryField(en.setName(null), en.setClazz(null), en.setEntry(null), en.setTotal(null));
		ModelAndView res = super.load(request, en.getId(), en, "auto/depend_load");
		en = (Depend) res.getModel().get("pages");
		if (en.getEntry() == null) {
			en.setEntry("[]");
			en.setTotal(0L);
		}
		
		List<String> files = new ArrayList<String>();
		String[] roots = new String[] {
			"com/mc/core/crux/",
			"com/mc/core/dao/",
			"com/mc/core/entity/",
			"com/mc/core/service/",
			"com/mc/core/template/",
			"com/mc/core/template/impl/",
			"com/mc/core/tool/",
			"com/mc/core/view/"
		};
		for (String root : roots) {
			File[] datas = new File(OUTPUT + root).listFiles();
			for (File data : datas) {
				String temp = data.getAbsolutePath().replace("\\", "/");
				if (data.isFile() && !temp.endsWith("com/mc/core/crux/Legal.java")) {
					files.add(temp.replace(OUTPUT, ""));
				}
			}
		}
		files.add("com/mc/core/entity/auto/Bound.java");
		files.add("com/mc/core/entity/auto/Field.java");
		files.add("com/mc/core/entity/auto/Genre.java");
		files.add("com/mc/core/entity/auto/Inward.java");
		files.add("com/mc/core/entity/auto/Table.java");
		FileTool.list(new File(OUTPUT + "com/mc/core/pojo/"), OUTPUT, files);
		FileTool.list(new File(OUTPUT + "com/mc/core/rest/"), OUTPUT, files);
		Collections.sort(files, new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		
		Map<JTreeView, int[]> pIds = new HashMap<JTreeView, int[]>();//<父级节点,[子文件的总数,选中子文件数,子文件夹总数,选中文件夹数]>
		List<String> entry = JsonTool.list(en.getEntry(), String.class);
		List<JTreeView> nodes = new ArrayList<JTreeView>();
		if (entry.size() > 0) {
			for (String file : files) {
				boolean checked = entry.contains(file);
				String pId = file.substring(0, file.lastIndexOf("/")).replace("/", ".");
				JTreeView key = checked ? new JTreeView(pId, pId.substring(0, pId.lastIndexOf(".")), pId, true, pIds.size() < 1, true) : new JTreeView(pId, pId.substring(0, pId.lastIndexOf(".")), pId, true, pIds.size() < 1);
				int[] value = pIds.get(key);
				if (value == null) {
					value = new int[] { 1, checked ? 1 : 0, 0, 0 };
					pIds.put(key, value);
					nodes.add(key);
				} else {
					value[0]++;
					if (checked) {
						value[1]++;
					}
				}
				nodes.add(checked ? new JTreeView(file, pId, file.substring(file.lastIndexOf("/") + 1), true) : new JTreeView(file, pId, file.substring(file.lastIndexOf("/") + 1)));
			}
		} else {
			for (String file : files) {
				String pId = file.substring(0, file.lastIndexOf("/")).replace("/", ".");
				JTreeView key = new JTreeView(pId, pId.substring(0, pId.lastIndexOf(".")), pId, true, pIds.size() < 1);
				int[] value = pIds.get(key);
				if (value == null) {
					value = new int[] { 1, 0, 0, 0 };
					pIds.put(key, value);
					nodes.add(key);
				} else {
					value[0]++;
				}
				nodes.add(new JTreeView(file, pId, file.substring(file.lastIndexOf("/") + 1)));
			}
		}
		
		for (Map.Entry<JTreeView, int[]> pId : pIds.entrySet()) {
			JTreeView key = pId.getKey();
			int[] value = pIds.get(new JTreeView(key.pId, key.pId, key.pId.toString()));
			if (value != null) {
				value[2]++;//修正子节点的总数
				if (key.checked != null && key.checked) {//修正选中文件夹数
					value[3]++;
				}
			}
		}
		
		for (Map.Entry<JTreeView, int[]> pId : pIds.entrySet()) {
			JTreeView key = pId.getKey();
			int[] value = pId.getValue();
			if (value[0] + value[2] == value[1] + value[3]) {//子节点全选时取消父节点半选（不存在子节点全部是文件夹的情况value[0] == 0 && value[2] > 0）
				key.setHalfCheck(false);
			} else {
				if (key.halfCheck == null && (value[1] > 0 || value[3] > 0)) {//修正选了子节点但父节点没有半选（及选中）
					pId.getKey().setHalfCheck(true);
				}
			}
		}
		res.addObject("nodes", nodes);
		return res;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Depend en) throws Exception {
		if (OUTPUT == null) {
			return super.jump(request, "auto/depend/list.htm", "仅限本地操作");
		}
		if (!ServletTool.getOnline(request).id.equals(SUPER_MANAGER_ACCOUNT)) {
			return super.jump(request, "auto/depend/list.htm", "你没有操作本地类库的权限");
		}
		if (!en.getClazz().endsWith(".jar")) {
			en.setClazz(en.getClazz() + ".jar");
		}
		return super.jump(request, "auto/depend/list.htm", en.getId() == null ? (service.save(en) ? "创建类库成功" : "创建类库失败") : (service.update(en) ? "更新类库成功" : "更新类库失败"));
	}
	public JMapView save(HttpServletRequest request, Depend en) {
		return null;
	}
	@DailyPoint(service = DependService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Depend en, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Depend en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Depend().setClazz(null), true);
		pages.setLink(0, "auto/depend/list.htm");
		pages.setLink(1, "auto/depend/drop.htm");
		pages.setLink(2, "auto/depend/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "auto/depend_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Depend en = new Depend();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setEntry(null), en.setTotal(null));
			List<Depend> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Depend data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("clazz", data.getClazz());
					map.put("entry", this.entry(data.getEntry()));
					map.put("total", data.getTotal());
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
	@RequestMapping(value = "export", method = RequestMethod.GET)
	public void export(HttpServletRequest request, HttpServletResponse response, Integer[] ids) throws Exception {
		if (OUTPUT == null) {
			super.out(response, "仅限本地导出", null);
			return;
		}
		Depend depend;
		if (ids == null || ids.length != 2 || ids[0] == null || ids[0] < 1 || (depend = service.load(ids[0])) == null) {
			super.out(response, "请求参数非法", null);
			return;
		}
		
		File source = new File(CACHE + "auto/src/");
		FileTool.delete(source, true);
		if (!source.mkdirs()) {
			super.out(response, "创建代码目录失败", null);
			return;
		}
		
		File destination;
		if (ids[1] != null && ids[1] == 1) {
			destination = source;
		} else {
			destination = new File(CACHE + "auto/classes/");
			FileTool.delete(destination, true);
			if (!destination.mkdirs()) {
				super.out(response, "创建编译目录失败", null);
				return;
			}
		}
		
		String[] entrys = JsonTool.read(depend.getEntry(), String[].class);
		for (String entry : entrys) {
			FileTool.copy(new File(OUTPUT + entry), new File(entry.endsWith(".java") ? source : destination, entry));
		}
		
		File target = new File(CACHE + "auto/" + depend.getClazz());
		try {
			String[] keys = new String[] {
				"b9a0e8cb8dd4001b94acd24903887251",//bcpkix-1.58.0/bcpkix-jdk15on-1.58.0.jar
				"a7ff186ae066c12e7ca5b96397ee233",//bcpkix-1.58.0/bcprov-jdk15on-1.58.0.jar
				"40b4b4d8eac886f6b4a2a3bd2f31b00",//commons-logging-1.2.0/commons-logging-1.2.0.jar
				"75615356605c8128013da9e3ac62a249",//commons-codec-1.9.0/commons-codec-1.9.0.jar
				"837309a10727ca78f1ce63adb3a29b08",//jackson-2.8.5/jackson-annotations-2.8.5.jar
				"a5512a5a5b4c61283138da691411a13d",//jackson-2.8.5/jackson-core-2.8.5.jar
				"723cb81b0d09f982efb8959caeea26a9",//jackson-2.8.5/jackson-databind-2.8.5.jar
				"fb87bd84e336ca3dc6b6c108f51bf25e",//log4j-1.2.17/log4j-1.2.17.jar
				"15f13709ae4d2dfb7a329ac89c2c7313",//zip4j-1.3.1/zip4j-1.3.1.jar
				"79de69e9f5ed8c7fcb8342585732bbf7",//servlet-api-3.1.0/javax.servlet-api-3.1.0.jar
				"319b0c64f774e5387f298e5b930bb39d",//spring-framework/4.3.10/Core Container/spring-core-4.3.10.jar
				"74741f42604171f363a8e935bc795fd",//spring-framework/4.3.10/Core Container/spring-beans-4.3.10.jar
				"1438f1671496db1500a18b5cb1875ece",//spring-framework/4.3.10/Core Container/spring-context-4.3.10.jar
				"ad0fd8c1498b109efeb7c655e3c0b0f5"//spring-framework/4.3.10/Web/spring-web-4.3.10.jar
			};
			new TemplateConfig().compile(target, null, source.getAbsolutePath(), destination.getAbsolutePath(), super.getLibrary(keys, String.class));
		} catch (Exception e) {
			super.out(response, null, e);
			return;
		} catch (Throwable e) {
			super.out(response, e.getMessage().replace("\n", "<br>").replace("${ROOT}", ROOT + "data/cache/src/"), null);
			return;
		}
		ServletTool.getDown(request, response, null, target, depend.getClazz());
		FileTool.delete(source, true);
		FileTool.delete(destination, true);
		FileTool.delete(target, false);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "library", method = RequestMethod.GET)
	public ModelAndView library(HttpServletRequest request, HttpServletResponse response, String project) throws Exception {
		return new ModelAndView(VIEW_PATH_PREFIX + "auto/depend_library");
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "library", method = RequestMethod.POST)
	public JMapView library(HttpServletRequest request, @RequestBody List<Map<String, String>> body) {
		JMapView res = new JMapView();
		try {
			for (Map<String, String> item : body) {
				LIBRARY.get(item.get("ID")).KIND = item.get("KIND");
			}
			JsonTool.write(LIBRARY.values(), new File(PROJECT + "_/doc/jar/config.json"));
			res.setState("保存配置成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private String[] entry(String entry) throws Exception {
		String[] data = JsonTool.read(entry, String[].class);
		if (data.length < 1) {
			return new String[] { "-", "-" };
		}
		if (data.length == 1) {
			return new String[] { data[0], data[0] };
		}
		String[] res = new String[] { data[0] + ", " + data[1], data[0] + ", " + data[1] };
		for (int i = 2; i < data.length; i++) {
			res[1] += (i % 2 == 0 ? "<br>" : ", ") + data[i];
		}
		if (res[1].endsWith("<br>")) {
			res[1] = res[1].substring(0, res[1].length() - 4);
		}
		return res;
	}
}