package com.mc.portal.view.auto;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import com.mc.core.entity.SuperEntity;
import com.mc.core.entity.auto.Genre;
import com.mc.core.entity.auto.Inward;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Table;
import com.mc.core.entity.auto.Work;
import com.mc.core.service.SuperService;
import com.mc.core.service.auto.GenreService;
import com.mc.core.service.auto.InwardService;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
public abstract class SuperView<K, E extends SuperEntity> extends com.mc.portal.view.SuperView<K, E> {
	public SuperView(SuperService<K, E> service) {
		super(service);
	}
	public final void setGenre(List<Genre> datas, TemplateConfig config) {
		if (datas.size() > 0 && config != null) {
			config.getTypeMap().clear();
			for (Genre data : datas) {
				config.setTypeMap(data.getName(), new String[] { data.getClazz(), data.getMapper(), data.getFrame(), data.getFixed().toString(), data.getLength().toString() });
			}
		}
	}
	public final void setTable(WorkService workService, TableService tableService, Integer work, Integer id, Boolean grow, Boolean build) throws Exception {
		Table table = new Table();
		table.setId(id);
		table.setGrow(grow);
		table.setBuild(build);
		if (tableService.update(table) && build != null && !build) {
			Work en = new Work();
			en.setSqlUpdateMethod(en.setVersion(null), en.setVersion(null).FrameFieldName + " + 1");
			en.setSqlQueryTerm(true, en.setId(null), Work.Operation.EqualTo, work);
			workService.alter(en);
		}
	}
	public final void setTable(TableService service, List<Integer> ids) throws Exception {
		if (ids.size() > 0) {
			Table en = new Table();
			en.setBuild(false);
			en.setSqlUpdateNew(en.setBuild(null), true);
			en.setSqlQueryIn(true, en.setId(null), true, ids.toArray(new Integer[] {}));
			service.alter(en);
		}
	}
	@SuppressWarnings("unchecked")
	public final <T> T getLibrary(String[] keys, Class<T> clazz) throws Exception {
		if (keys.length < 1) {
			if (clazz.isArray()) {
				return (T) new URL[] { new File(PROJECT + "WEB-INF/lib/com.mc.helper.portal-0.0.0.jar").toURI().toURL() };
			} else {
				return (T) new String(PROJECT + "WEB-INF/lib/com.mc.helper.portal-0.0.0.jar;");
			}
		}
		if (clazz.isArray()) {
			List<URL> res = new ArrayList<URL>();
			for (String key : keys) {
				LibraryItem item = LIBRARY.get(key);
				if (item != null) {
					res.add(new File(PROJECT + "_/doc/jar/" + item.PATH).toURI().toURL());
				}
			}
			res.add(new File(PROJECT + "WEB-INF/lib/com.mc.helper.portal-0.0.0.jar").toURI().toURL());
			return (T) res.toArray(new URL[] {});
		} else {
			StringBuffer res = new StringBuffer();
			for (String key : keys) {
				LibraryItem item = LIBRARY.get(key);
				if (item != null) {
					res.append(PROJECT + "_/doc/jar/" + item.PATH + ";");
				}
			}
			res.append(PROJECT + "WEB-INF/lib/com.mc.helper.portal-0.0.0.jar;");
			return (T) res.toString();
		}
	}
	public final Map<Integer, String> getTable(TableService tableService, Integer id, boolean name, boolean frame, Integer... module) {
		Map<Integer, String> res = new LinkedHashMap<Integer, String>();
		Table en = new Table();
		if (module != null && module.length > 0 && module[0] != null && module[0] > 0) {
			en.setFkModule(module[0]);
		}
		en.setFkWork(id);
		en.setSqlQueryOrder(en.setFrame(null), true);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Table> datas = tableService.list(en);
		if (datas != null && datas.size() > 0) {
			if (name && frame) {
				for (Table data : datas) {
					res.put(data.getId(), data.getName() + "(" + data.getFrame() + ")");
				}
			} else if (name) {
				for (Table data : datas) {
					res.put(data.getId(), data.getName());
				}
			} else if (frame) {
				for (Table data : datas) {
					res.put(data.getId(), data.getFrame());
				}
			}
		}
		return res;
	}
	public final String getVersion(Integer version) {
		if (version > 0 && version < 100) {
			return "0.0." + version;
		} else if (version < 1000) {
			return "0." + (version / 100) + "." + (version % 100);
		} else if (version > 1000) {
			return (version / 1000)+"."+ (version % 1000 / 100) + "." + (version % 100);
		}
		return "0.0.0";
	}
	public static final List<Genre> getGenre(GenreService genreService, Integer id) throws Exception {
		Map<String, String[]> types = new TemplateConfig().getTypeMap();
		Genre en = new Genre();
		en.setFkWork(id);
		en.setSqlQueryField(en.setName(null));
		en.setSqlQueryIn(true, en.setName(null), true, types.keySet().toArray(new String[] {}));
		en.setSqlLeafSize(new Long(types.size()));
		List<Genre> temp = genreService.list(en);
		List<String> map = new ArrayList<String>();
		if (temp != null && temp.size() > 0) {
			for (Genre data : temp) {
				map.add(data.getName());
			}
		}
		List<Genre> datas = new ArrayList<Genre>();
		for (Map.Entry<String, String[]> type : types.entrySet()) {
			if (map.contains(type.getKey())) {
				continue;
			}
			String[] value = type.getValue();
			Genre data = new Genre();
			data.setName(type.getKey());
			data.setClazz(value[0]);
			data.setMapper(value[1]);
			data.setFrame(value[2]);
			data.setFixed(Boolean.valueOf(value[3]));
			data.setLength(Integer.parseInt(value[4]));
			data.setTacit(true);
			data.setFkWork(id);
			datas.add(data);
		}
		genreService.batch(datas);
		en = new Genre();
		en.setFkWork(id);
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setClazz(null), en.setMapper(null), en.setFrame(null), en.setFixed(null), en.setLength(null), en.setTacit(null));
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Genre> res = genreService.list(en);
		if (res == null) {
			res = new ArrayList<Genre>();
		}
		return res;
	}
	public static final Map<Integer, Inward> getInward(InwardService service, int work, boolean total) throws Exception {
		Map<Integer, Inward> res = new LinkedHashMap<Integer, Inward>();
		Inward en = new Inward();
		en.setFkWork(work);
		en.setSqlQueryField(total ? new Inward.Field[] { en.setId(null), en.setName(null), en.setClazz(null), en.setMajor(null), en.setEntry(null) } : new Inward.Field[] { en.setId(null), en.setClazz(null), en.setEntry(null) });
		en.setSqlQueryOrder(en.setClazz(null), true);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Inward> datas = service.list(en);
		if (datas != null && datas.size() > 0) {
			for (Inward data : datas) {
				res.put(data.getId(), data);
			}
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	public static final String getInward(Map<Integer, Inward> datas) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("package com.mc.core.crux;\n");
		res.append("import java.lang.annotation.Documented;\n");
		res.append("import java.lang.annotation.ElementType;\n");
		res.append("import java.lang.annotation.Retention;\n");
		res.append("import java.lang.annotation.RetentionPolicy;\n");
		res.append("import java.lang.annotation.Target;\n");
		res.append("import java.lang.reflect.Field;\n");
		res.append("import java.util.LinkedHashMap;\n");
		res.append("import java.util.Map;\n");
		res.append("/**\n");
		res.append(" * 字典层-取值标识\n");
		res.append(" * @author 1138789752@qq.com\n");
		res.append(" * @version " + TimeTool.getTime() + "\n");
		res.append(" * */\n");
		res.append("public class Legal {\n");
		if (datas != null && datas.size() > 0) {
			StringBuffer initial = new StringBuffer();
			for (Inward data : datas.values()) {
				Map<String, String> entry = JsonTool.read(data.getEntry(), Map.class);
				res.append("\t@Syllable(id = " + data.getId() + ", title = \"" + data.getName() + "\")\n");
				if (Integer.class.getName().equals(data.getMajor())) {
					res.append("\tpublic static final Map<Integer, String> " + data.getClazz() + ";\n");
					initial.append("\t\t" + data.getClazz() + " = new LinkedHashMap<Integer, String>() {\n");
					initial.append("\t\t\tpublic static final long serialVersionUID = " + System.currentTimeMillis() + "L;\n");
					if (entry.size() > 0) {
						initial.append("\t\t\t{\n");
						for (Map.Entry<String, String> temp : entry.entrySet()) {
							initial.append("\t\t\t\tsuper.put(" + temp.getKey() + ", \"" + temp.getValue() + "\");\n");
						}
						initial.append("\t\t\t}\n");
					}
					initial.append("\t\t};\n");
				} else if (Long.class.getName().equals(data.getMajor())) {
					res.append("\tpublic static final Map<Long, String> " + data.getClazz() + ";\n");
					initial.append("\t\t" + data.getClazz() + " = new LinkedHashMap<Long, String>() {\n");
					initial.append("\t\t\tpublic static final long serialVersionUID = " + System.currentTimeMillis() + "L;\n");
					if (entry.size() > 0) {
						initial.append("\t\t\t{\n");
						for (Map.Entry<String, String> temp : entry.entrySet()) {
							initial.append("\t\t\t\tsuper.put(" + temp.getKey() + ", \"" + temp.getValue() + "\");\n");
						}
						initial.append("\t\t\t}\n");
					}
					initial.append("\t\t};\n");
				} else if (String.class.getName().equals(data.getMajor())) {
					res.append("\tpublic static final Map<String, String> " + data.getClazz() + ";\n");
					initial.append("\t\t" + data.getClazz() + " = new LinkedHashMap<String, String>() {\n");
					initial.append("\t\t\tpublic static final long serialVersionUID = " + System.currentTimeMillis() + "L;\n");
					if (entry.size() > 0) {
						initial.append("\t\t\t{\n");
						for (Map.Entry<String, String> temp : entry.entrySet()) {
							initial.append("\t\t\t\tsuper.put(\"" + temp.getKey() + "\", \"" + temp.getValue() + "\");\n");
						}
						initial.append("\t\t\t}\n");
					}
					initial.append("\t\t};\n");
				}
			}
			res.append("\t/**\n");
			res.append("\t * 匿名构造方法\n");
			res.append("\t * */\n");
			res.append("\tstatic {\n");
			res.append(initial);
			res.append("\t}\n");
		}
		res.append("\t/**\n");
		res.append("\t * 获取选项的键\n");
		res.append("\t * */\n");
		res.append("\tpublic static Map<Integer, String> keys() {\n");
		res.append("\t\tMap<Integer, String> res = new LinkedHashMap<Integer, String>();\n");
		res.append("\t\ttry {\n");
		res.append("\t\t\tField[] fields = Legal.class.getDeclaredFields();\n");
		res.append("\t\t\tfor (Field field : fields) {\n");
		res.append("\t\t\t\tif (field.isAnnotationPresent(Syllable.class)) {\n");
		res.append("\t\t\t\t\tSyllable temp = field.getAnnotation(Syllable.class);\n");
		res.append("\t\t\t\t\tres.put(temp.id(), temp.title());\n");
		res.append("\t\t\t\t}\n");
		res.append("\t\t\t}\n");
		res.append("\t\t} catch (Exception e) {\n");
		res.append("\t\t\te.printStackTrace();\n");
		res.append("\t\t}\n");
		res.append("\t\treturn res;\n");
		res.append("\t}\n");
		res.append("\t/**\n");
		res.append("\t * 获取选项数据\n");
		res.append("\t * @param key 选项标识\n");
		res.append("\t * @param K 键的类型\n");
		res.append("\t * @param V 值的类型\n");
		res.append("\t * */\n");
		res.append("\t@SuppressWarnings(\"unchecked\")\n");
		res.append("\tpublic static <K, V> Map<K, V> get(String key, Class<K> K, Class<V> V) {\n");
		res.append("\t\tif (key == null || key.equals(\"\")) {\n");
		res.append("\t\t\treturn null;\n");
		res.append("\t\t}\n");
		res.append("\t\ttry {\n");
		res.append("\t\t\tClass<?> clazz = Legal.class;\n");
		res.append("\t\t\tField[] fields = clazz.getDeclaredFields();\n");
		res.append("\t\t\tfor (Field field : fields) {\n");
		res.append("\t\t\t\tif (key.equals(field.getName())) {\n");
		res.append("\t\t\t\t\tfield.setAccessible(true);\n");
		res.append("\t\t\t\t\treturn (Map<K, V>) field.get(clazz);\n");
		res.append("\t\t\t\t}\n");
		res.append("\t\t\t}\n");
		res.append("\t\t} catch (Exception e) {\n");
		res.append("\t\t\te.printStackTrace();\n");
		res.append("\t\t}\n");
		res.append("\t\treturn null;\n");
		res.append("\t}\n");
		res.append("\t/**\n");
		res.append("\t * 字典层-标识注解\n");
		res.append("\t * @author 1138789752@qq.com\n");
		res.append("\t * @version " + TimeTool.getTime() + "\n");
		res.append("\t * */\n");
		res.append("\t@Retention(RetentionPolicy.RUNTIME)\n");
		res.append("\t@Target({ ElementType.FIELD })\n");
		res.append("\t@Documented\n");
		res.append("\tprivate static @interface Syllable {\n");
		res.append("\t\tpublic int id();\n");
		res.append("\t\tpublic String title();\n");
		res.append("\t}\n");
		res.append("}");
		return res.toString();
	}
	public static final Map<Integer, String> getModule(ModuleService moduleService, Integer id, SuperEntity.Field field) {
		Map<Integer, String> res = new LinkedHashMap<Integer, String>();
		Module en = new Module();
		en.setFkWork(id);
		en.setSqlQueryOrder(en.setClazz(null), true);
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Module> datas = moduleService.list(en);
		if (datas != null && datas.size() > 0) {
			if (field == null) {
				for (Module data : datas) {
					res.put(data.getId(), data.getName() + " | 表结构前缀：" + (data.getFrame() != null ? data.getFrame() : ""));
				}
			} else {
				if (field.ClazzFieldName.equals(en.setName(null).ClazzFieldName)) {
					for (Module data : datas) {
						res.put(data.getId(), data.getName());
					}
				} else if (field.ClazzFieldName.equals(en.setClazz(null).ClazzFieldName)) {
					for (Module data : datas) {
						res.put(data.getId(), data.getClazz());
					}
				} else if (field.ClazzFieldName.equals(en.setFrame(null).ClazzFieldName)) {
					for (Module data : datas) {
						res.put(data.getId(), data.getFrame());
					}
				}
			}
		}
		return res;
	}
}