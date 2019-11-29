package data;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import com.mc.core.entity.blog.Movie;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.MovieService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.JsonTool;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.FigureItem;
public class 电影检测 {
	public static void main1(String[] args) throws Exception {
		boolean figure = true;
		String[] data = new String[] { "李小璐", "洛桑群培" };
		if (figure) {
			List<FigureItem> item = new ArrayList<FigureItem>();
			for (String value : data) {
				FigureItem temp = new FigureItem();
				temp.id = "0";
				temp.name = value;
				item.add(temp);
			}
			System.out.print(JsonTool.write(item));
		} else {
			System.out.print(JsonTool.write(data));
		}
	}
	public static void main(String[] args) throws Exception {
		Iterator<Element> it = Jsoup.parse(new URL("https://movie.douban.com/subject/1291585/reviews"), 30000).select("div[class='main review-item']").iterator();
		int index = 1;
		while (it.hasNext()) {
			Element node = it.next();
			Element link = node.selectFirst("div[class='main-bd'] h2 a");
			System.out.println(link.attr("href") + "->" + link.text());
			String good = node.selectFirst("a[class='action-btn up'] span").text();
			System.out.println(good);
			String poor = node.selectFirst("a[class='action-btn down'] span").text();
			System.out.println(poor);
			
			System.out.println();
			index++;
			if (index > 10) {
				break;
			}
		}
	}
	public static void brief(MovieService service) throws Exception {
		StringBuffer state = new StringBuffer();
		Movie en = new Movie();
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setBrief(null));
		en.setSqlQueryTerm(true, en.setBrief(null), Movie.Operation.Like, "%\n%");
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Movie> datas = service.list(en);
		for (Movie data : datas) {
			String[] items = data.getBrief().split("\n");
			for (String item : items) {
				if (!item.startsWith("　　")) {
					state.append("\n" + data.getName());
					break;
				}
			}
		}
		System.out.println(state);
	}
	public static void image(MovieService service) throws Exception {
		StringBuffer state = new StringBuffer("【电影海报检测】");
		Movie en = new Movie();
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		
		List<String> cache = new ArrayList<String>();
		String root = "C:/Users/Administrator/Workspaces/MyEclipse 2016/ink10000.com-portal/WebRoot/data/movie/";
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Movie> datas = service.list(en);
			if (datas != null && datas.size() > 0) {
				for (Movie data : datas) {
					if (new File(root + data.getId() + ".jpg").exists()) {
						cache.add(data.getId() + ".jpg");
					} else {
						state.append("\n缺少：" + data.getName());
					}
				}
			}
		}
		
		String[] files = new File(root).list();
		for (String file : files) {
			if (!cache.contains(file)) {
				state.append("\n删除：" + file);
			}
		}
		System.out.println(state);
	}
	public static void title(EntryService entryService, MovieService movieService) throws Exception {
		StringBuffer state = new StringBuffer();
		Movie en = new Movie();
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlLeafTotal(movieService.count(en));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			Map<String, String> cache = new HashMap<String, String>();
			List<Movie> datas = movieService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Movie data : datas) {
					cache.put(data.getId(), data.getName());
				}
				
				Entry entry = new Entry();
				entry.setSqlQueryField(entry.setId(null), entry.setName(null));
				entry.setSqlQueryIn(true, entry.setId(null), true, cache.keySet().toArray(new String[] {}));
				entry.setSqlLeafSize(new Long(cache.size()));
				List<Entry> entrys = entryService.list(entry);
				if (entrys != null && entrys.size() > 0) {
					for (Entry data : entrys) {
						String name = cache.get(data.getId());
						if (!data.getName().startsWith(name)) {
							state.append(",'" + data.getId() + "'");
						}
					}
				}
			}
		}
		System.out.println(state);
	}
}