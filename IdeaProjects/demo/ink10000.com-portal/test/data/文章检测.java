package data;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.codec.binary.Base64;
import com.mc.core.entity.blog.Article;
import com.mc.core.service.blog.ArticleService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
public class 文章检测 {
	public static void main(String[] args) {
		final String root = "E:/file/";
		Map<String, List<String>> keys = new HashMap<String, List<String>>();
		String[] files = new File(root).list();
		for (String file : files) {
			String key = file.split("-")[0];
			List<String> value = keys.get(key);
			if (value == null) {
				value = new ArrayList<String>();
				keys.put(key, value);
			}
			value.add(file);
		}
		System.out.println(keys.keySet().toString().replace(", ", "','").replace("[", "('").replace("]", "')"));
	}
	@SuppressWarnings("unchecked")
	public static void image(ArticleService service) throws Exception {
		final String time = "2019-01-10 11:17:21";
		Article en = new Article();
		en.setSqlQueryField(en.setEntry(null), en.setSuffix(null));
		en.setSqlQueryTerm(true, en.setCreated(null), Article.Operation.GreaterThan, TimeTool.getTime(time, null));
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(1L);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			Article data = service.list(en).get(0);
			Map<String, String> entry = JsonTool.read(data.getEntry(), Map.class);
			for (Map.Entry<String, String> temp : entry.entrySet()) {
				FileTool.write(Base64.decodeBase64(temp.getValue()), new File("E:/file/" + temp.getKey() + data.getSuffix()));
			}
		}
	}
	@SuppressWarnings("unchecked")
	public static void format(ArticleService service) throws Exception {
		final String root = "E:/file/";
		Map<String, List<String>> keys = new HashMap<String, List<String>>();
		String[] files = new File(root).list();
		for (String file : files) {
			String key = file.split("-")[0];
			List<String> value = keys.get(key);
			if (value == null) {
				value = new ArrayList<String>();
				keys.put(key, value);
			}
			value.add(file);
		}
		
		Article en = new Article();
		en.setSqlQueryField(en.setId(null), en.setSize(null), en.setUpload(null));
		en.setSqlQueryIn(true, en.setId(null), true, keys.keySet().toArray(new String[] {}));
		en.setSqlLeafSize(new Long(keys.size()));
		List<Article> datas = service.list(en);
		for (Article data : datas) {
			if (data.getUpload()) {
				keys.get(data.getId()).add(0, data.getSize().toString());
			} else {
				List<String> value = keys.remove(data.getId());
				for (String name : value) {
					if (name.indexOf(".") != -1) {
						new File(root + name).delete();
					}
				}
			}
		}
		
		for (Map.Entry<String, List<String>> file : keys.entrySet()) {
			String key = file.getKey();
			List<String> value = file.getValue();
			Map<String, String> entry;
			if (Integer.parseInt(value.get(0)) != value.size() - 1) {
				Article temp = new Article();
				temp.setId(key);
				temp.setSqlQueryField(temp.setEntry(null));
				temp = service.get(temp);
				entry = JsonTool.read(temp.getEntry(), Map.class);
			} else {
				entry = new HashMap<String, String>();
			}
			
			for (String name : value) {
				if (name.indexOf(".") != -1) {
					entry.put(key, Base64.encodeBase64String(Files.readAllBytes(Paths.get(new File(root + name).toURI()))));
				}
			}
			Article temp = new Article();
			temp.setId(key);
			temp.setEntry(JsonTool.write(entry));
			temp.setUpload(false);
			if (service.update(temp)) {
				System.out.println(temp.getId());
				for (String name : value) {
					if (name.indexOf(".") != -1) {
						new File(root + name).delete();
					}
				}
			}
		}
		System.out.println(keys.size());
	}
}