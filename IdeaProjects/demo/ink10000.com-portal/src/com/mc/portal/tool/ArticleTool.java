package com.mc.portal.tool;
import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Tag;
import org.springframework.web.client.RestTemplate;
import com.mc.core.entity.blog.Article;
import com.mc.core.service.blog.ArticleService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.crux.Global;
public class ArticleTool {
	private static final List<String> ALLOW = Arrays.asList("#document", "b", "blockquote", "body", "code", "h1", "h2", "h3", "head", "html", "i", "img", "li", "link", "ol", "p", "pre", "script", "sup", "table", "tbody", "tr", "td", "ul", "video");
	@SuppressWarnings("unchecked")
	public static void content(ArticleService service, Integer... type) throws Exception {
		StringBuffer state = new StringBuffer();
		Article en = new Article();
		en.setSqlQueryField(en.setId(null), en.setTitle(null), en.setContent(null), en.setBulk(null), en.setImage(null), en.setSize(null), en.setSuffix(null));
		en.setSqlQueryIn(true, en.setType(null), true, type);
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(100L);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Article> datas = service.list(en);
			for (Article data : datas) {
				Article temp = new Article();
				Map<String, String[]> files = new HashMap<String, String[]>();
				String content = verify(data, files, new HashMap<String, String>());
				if (files.size() != data.getSize()) {
					temp.setId(data.getId());
					temp.setFinish(false);
					temp.setUpload(true);
					System.out.println(temp.getId() + "->" + service.update(temp));
					continue;
				}
				
				temp.setContent(content);
				Map<String, List<String>> image = JsonTool.read(data.getImage(), Map.class);
				for (Map.Entry<String, List<String>> file : image.entrySet()) {
					String key = file.getValue().get(0);
					String title = data.getTitle().replace("\"", "");
					content = content.replace(key, "http://ink10000-home.oss-cn-beijing.aliyuncs.com/data/news/" + file.getKey() + data.getSuffix() + "\" alt=\"" + title);
					content = content.replace(key.replace("&", "&amp;"), "http://ink10000-home.oss-cn-beijing.aliyuncs.com/data/news/" + file.getKey() + data.getSuffix() + "\" alt=\"" + title);
				}
				if (data.getBulk().intValue() != content.length()) {
					temp.setId(data.getId());
					temp.setBulk(content.length());
				}
				if (data.getFinish() != null) {
					temp.setId(data.getId());
					temp.setFinish(data.getFinish());
				}
				if (temp.getId() != null) {
					state.append("\n" + temp.getId() + "->" + service.update(temp));
				}
			}
		}
		System.out.println(state);
	}
	@SuppressWarnings("unchecked")
	public static void entry(ArticleService service, String key) throws Exception {
		Article en = new Article();
		en.setId(key.split("-")[0]);
		en.setSqlQueryField(en.setImage(null), en.setEntry(null), en.setSize(null));
		en = service.get(en);
		if (en == null) {
			return;
		}
		
		Map<String, String> image = JsonTool.read(en.getImage(), Map.class);
		Map<String, List<String>> entry = JsonTool.read(en.getEntry(), Map.class);
		if (image.containsKey(key) || entry.containsKey(key)) {
			image.remove(key);
			entry.remove(key);
			en.setId(key.split("-")[0]);
			en.setImage(JsonTool.write(image));
			en.setEntry(JsonTool.write(entry));
			en.setSize(en.getSize() - 1);
			System.out.println(en.getId() + "->" + service.update(en));
		}
	}
	public static void html(ArticleService service, Integer... type) throws Exception {
		RestTemplate template = new RestTemplate();
		StringBuffer state = new StringBuffer();
		Article en = new Article();
		en.setFinish(true);
		en.setSqlQueryField(en.setId(null), en.setType(null));
		en.setSqlQueryIn(true, en.setType(null), true, type);
		en.setSqlQueryTerm(true, en.setCreated(null).FrameFieldName, Article.Operation.GreaterThan, "2019-01-25 15:18:25");
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(100L);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Article> datas = service.list(en);
			for (Article data : datas) {
				FileTool.write(template.getForObject(Global.CLOUD + "article/" + data.getId() + ".htm", String.class), new File("E:/demo/" + data.getType() + "/" + data.getId() + ".html"), "UTF-8");
			}
		}
		System.out.println(state);
	}
	public static String verify(Article data, Map<String, String[]> image, Map<String, String> part) throws Exception {
		String res = Jsoup.parse(data.getContent().replace("font-weight", "\" style1=\"font-weight:bold;\" lang=\"")).getAllElements().removeAttr("alt").removeAttr("class").removeAttr("height").removeAttr("href").removeAttr("id").removeAttr("lang").removeAttr("rel").removeAttr("style").removeAttr("target").removeAttr("title").removeAttr("width").select("body").get(0).html();
		Document doc = Jsoup.parse(res);
		Iterator<Element> it = doc.select("[style1]").iterator();
		while (it.hasNext()) {
			Element node = it.next();
			node.replaceWith(new Element(Tag.valueOf("b"), "").html(node.html()));
		}
		
		res = doc.select("body").get(0).html().trim().replace("\r", "").replace("\n", "");
		int index = res.indexOf("&nbsp;");
		while (index != -1) {
			res = res.replace("&nbsp;", "");
			index = res.indexOf("&nbsp;");
		}
		index = res.indexOf("　");
		while (index != -1) {
			res = res.replace("　", "");
			index = res.indexOf("　");
		}
		index = res.indexOf("	");
		while (index != -1) {
			res = res.replace("	", "");
			index = res.indexOf("	");
		}
		index = res.indexOf("> ");
		while (index != -1) {
			res = res.replace("> ", ">");
			index = res.indexOf("> ");
		}
		index = res.indexOf(" <");
		while (index != -1) {
			res = res.replace(" <", "<");
			index = res.indexOf(" <");
		}
		index = res.indexOf("<article>");
		while (index != -1) {
			res = res.replace("<article>", "<p>");
			index = res.indexOf("<article>");
		}
		index = res.indexOf("</article>");
		while (index != -1) {
			res = res.replace("</article>", "</p>");
			index = res.indexOf("</article>");
		}
		index = res.indexOf("<a>");
		while (index != -1) {
			res = res.replace("<a>", "");
			index = res.indexOf("<a>");
		}
		index = res.indexOf("</a>");
		while (index != -1) {
			res = res.replace("</a>", "");
			index = res.indexOf("</a>");
		}
		index = res.indexOf("<ins>");
		while (index != -1) {
			res = res.replace("<ins>", "");
			index = res.indexOf("<ins>");
		}
		index = res.indexOf("</ins>");
		while (index != -1) {
			res = res.replace("</ins>", "");
			index = res.indexOf("</ins>");
		}
		index = res.indexOf("<em>");
		while (index != -1) {
			res = res.replace("<em>", "<i>");
			index = res.indexOf("<em>");
		}
		index = res.indexOf("<strong>");
		while (index != -1) {
			res = res.replace("<strong>", "<b>");
			index = res.indexOf("<strong>");
		}
		index = res.indexOf("</strong>");
		while (index != -1) {
			res = res.replace("</strong>", "</b>");
			index = res.indexOf("</strong>");
		}
		index = res.indexOf("</em>");
		while (index != -1) {
			res = res.replace("</em>", "</i>");
			index = res.indexOf("</em>");
		}
		index = res.indexOf("<br>");
		while (index != -1) {
			res = res.replace("<br>", "");
			index = res.indexOf("<br>");
		}
		index = res.indexOf("<section>");
		while (index != -1) {
			res = res.replace("<section>", "");
			index = res.indexOf("<section>");
		}
		index = res.indexOf("</section>");
		while (index != -1) {
			res = res.replace("</section>", "");
			index = res.indexOf("</section>");
		}
		index = res.indexOf("<div>");
		while (index != -1) {
			res = res.replace("<div>", "");
			index = res.indexOf("<div>");
		}
		index = res.indexOf("</div>");
		while (index != -1) {
			res = res.replace("</div>", "");
			index = res.indexOf("</div>");
		}
		index = res.indexOf("<span>");
		while (index != -1) {
			res = res.replace("<span>", "");
			index = res.indexOf("<span>");
		}
		index = res.indexOf("</span>");
		while (index != -1) {
			res = res.replace("</span>", "");
			index = res.indexOf("</span>");
		}
		index = res.indexOf("<tbody>");
		while (index != -1) {
			res = res.replace("<tbody>", "");
			index = res.indexOf("<tbody>");
		}
		index = res.indexOf("</tbody>");
		while (index != -1) {
			res = res.replace("</tbody>", "");
			index = res.indexOf("</tbody>");
		}
		index = res.indexOf("<center>");
		while (index != -1) {
			res = res.replace("<center>", "");
			index = res.indexOf("<center>");
		}
		index = res.indexOf("</center>");
		while (index != -1) {
			res = res.replace("</center>", "");
			index = res.indexOf("</center>");
		}
		index = res.indexOf("<p></p>");
		while (index != -1) {
			res = res.replace("<p></p>", "");
			index = res.indexOf("<p></p>");
		}
		index = res.indexOf("<a></a>");
		while (index != -1) {
			res = res.replace("<a></a>", "");
			index = res.indexOf("<a></a>");
		}
		index = res.indexOf("<b></b>");
		while (index != -1) {
			res = res.replace("<b></b>", "");
			index = res.indexOf("<b></b>");
		}
		index = res.indexOf("<i></i>");
		while (index != -1) {
			res = res.replace("<i></i>", "");
			index = res.indexOf("<i></i>");
		}
		index = res.indexOf("<li></li>");
		while (index != -1) {
			res = res.replace("<li></li>", "");
			index = res.indexOf("<li></li>");
		}
		
		it = Jsoup.parse(res).getAllElements().iterator();
		StringBuffer state = new StringBuffer();
		Map<String, String> files = new HashMap<String, String>();
		while (it.hasNext()) {
			Element node = it.next();
			String name = node.nodeName();
			if (!name.equals("") && !ALLOW.contains(name)) {
				state.append("\n" + name);
			}
			String link = node.attr("src");
			if (link != null && !link.equals("") && !files.containsKey(link)) {
				files.put(link, data.getId() + "-" + CryptoTool.MD5.encode(link));
			}
			if (name.equals("pre") && node.hasAttr("data-primary")) {
				String key = node.attr("data-primary");
				if (!part.containsKey(key)) {
					part.put(key, null);
				}
			}
		}
		if (state.length() > 0) {
			data.setFinish(false);
			System.err.println("【" + data.getTitle() + "】" + state);
		}
		for (Map.Entry<String, String> en : files.entrySet()) {
			image.put(en.getValue(), new String[] { en.getKey(), Global.NO });
		}
		return res;
	}
}