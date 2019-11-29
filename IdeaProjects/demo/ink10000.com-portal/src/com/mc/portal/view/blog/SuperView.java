package com.mc.portal.view.blog;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.mc.core.entity.SuperEntity;
import com.mc.core.entity.blog.Catena;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.SuperService;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.portal.pojo.FigureItem;
public abstract class SuperView<K, E extends SuperEntity> extends com.mc.portal.view.SuperView<K, E> {
	public SuperView(SuperService<K, E> service) {
		super(service);
	}
	public final Map<String, String[]> getEntry(EntryService service, List<String> ids) throws Exception {
		Map<String, String[]> res = new HashMap<String, String[]>();
		Entry en = new Entry();
		en.setSqlQueryField(en.setId(null), en.setLength(null), en.setCreated(null));
		en.setSqlQueryIn(true, en.setId(null), true, ids.toArray(new String[] {}));
		en.setSqlLeafSize(new Long(ids.size()));
		List<Entry> datas = service.list(en);
		if (datas != null && datas.size() > 0) {
			for (Entry data : datas) {
				res.put(data.getId(), new String[] { data.getLength() + "B", FileTool.volume(data.getLength(), "-"), TimeTool.getTime(data.getCreated(), null) });
			}
		}
		return res;
	}
	public final File[] getFile(String path, String... keys) {
		File parent = new File(path);
		if (path == null || path.equals("") || !(parent = new File(path)).exists()) {
			return null;
		}
		File[] res;
		if (parent.isDirectory()) {
			res = parent.listFiles();
			if (res == null || res.length < 1) {
				return null;
			}
		} else {
			res = new File[] { parent };
		}
		if (keys != null && keys.length > 0) {
			for (String key : keys) {
				if (path.indexOf(key) != -1) {
					return res;
				}
			}
			return null;
		}
		return res;
	}
	public final String getTrack(long time) {
		String res = "";
		time = time / 1000;
		if (time < 60) {
			res += "00:";
		} else if (time < 600) {
			res += "0" + (time / 60) + ":";
		} else {
			res += (time / 60) + ":";
		}
		time = time % 60;
		res += time < 10 ? "0" + time : time;
		return res;
	}
	public static final Map<String, String> getCatena(HttpServletRequest request, CatenaService catenaService, boolean movie, Boolean finish) throws Exception {
		File file = new File(CACHE + "blog/catena-" + (movie ? "movie" : "plaper") + ".json");
		if (catenaService == null) {
			file.delete();
		} else {
			Map<String, String> res = new LinkedHashMap<String, String>();
			if (file.exists() && finish == null) {
				List<FigureItem> items = JsonTool.list(file, FigureItem.class);
				for (FigureItem item : items) {
					res.put(item.id, item.name);
				}
				return res;
			}
			
			Catena en = new Catena();
			en.setFinish(finish);
			en.setSqlQueryField(en.setId(null), en.setName(null));
			if (movie) {
				en.setSqlQueryTerm(true, en.setType(null), Catena.Operation.EqualTo, "CINE");
				en.setSqlQueryOrder(en.setName(null), true);
			} else {
				en.setSqlQueryTerm(true, en.setType(null), Catena.Operation.NotEqualTo, "CINE");
				en.setSqlQueryOrder(en.setAddress(null), true);
			}
			en.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Catena> datas = catenaService.list(en);
			if (datas != null && datas.size() > 0) {
				List<FigureItem> items = new ArrayList<FigureItem>();
				for (Catena data : datas) {
					items.add(new FigureItem(data.getId().toString(), data.getName()));
					res.put(data.getId().toString(), data.getName());
				}
				File parent = file.getParentFile();
				if (!parent.exists() || !parent.isDirectory()) {
					parent.mkdirs();
				}
				if (finish == null) {
					JsonTool.write(items, file);
				}
			}
			return res;
		}
		return null;
	}
	public static final Entry getEntry(File file, String tray, boolean key) throws Exception {
		if (!BLOG_DISK_TRAY.containsKey(tray)) {
			return null;
		}
		String address = file.getAbsolutePath().replace("\\", "/");
		Entry res = new Entry();
		if (key) {
			res.setId(CryptoTool.MD5.encode(file, false).MD5);
		}
		res.setTray(tray);
		res.setAddress(address.substring(address.indexOf("/")));
		res.setName(file.getName());
		res.setLength(FileTool.length(null, file));
		res.setCreated(new Date(file.lastModified() - file.lastModified() % 1000));
		return res;
	}
}