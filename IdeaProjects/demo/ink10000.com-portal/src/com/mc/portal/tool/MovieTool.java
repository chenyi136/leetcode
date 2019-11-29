package com.mc.portal.tool;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.client.RestTemplate;
import com.mc.core.entity.blog.Movie;
import com.mc.core.service.blog.MovieService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.FigureItem;
public class MovieTool {
	private static final Log LOGGER = LogFactory.getLog(MovieTool.class);
	public static File[] list(RestTemplate template, MovieService service, Map<String, Movie> datas, File root) throws Exception {
		for (Map.Entry<String, Movie> en : datas.entrySet()) {
			try {
				Movie data = en.getValue();
				FileTool.write(template.getForObject(data.getDouban(), String.class).getBytes(), new File(root, data.getId()));
				Thread.sleep(System.currentTimeMillis() % 2000 + 2000);
			} catch (Exception e) {
				if (e.getMessage() != null && e.getMessage().indexOf("404") != -1) {
					Movie temp = new Movie();
					temp.setId(en.getKey());
					temp.setTrash(true);
					service.update(temp);
				}
				e.printStackTrace();
			}
		}
		File[] res = root.listFiles();
		return res != null ? res : new File[0];
	}
	public static String file(RestTemplate template, MovieService service, Map<String, Movie> datas, File[] files) throws Exception {
		if (datas.size() != files.length) {
			return "目标数据与网页文件总数不一致";
		}
		StringBuffer res = new StringBuffer();
		int count = 0;
		for (File file : files) {
			Movie data = datas.get(file.getName());
			Movie value = new Movie();
			logo(template, data.getId(), file(file, data.getName(), data.getEnglish(), value));
			Movie temp = new Movie();
			if (data.getName().indexOf(" ") != -1) {
				res.append("\n[有空格]" + data.getName());
			}
			if (value.getName().indexOf(data.getName().replace("小森林.夏秋篇", "小森林 夏秋篇").replace("小森林.冬春篇", "小森林 冬春篇").replace("三和人才市场.中国日结1500日元的年轻人们", "三和人才市场  中国日结1500日元的年轻人们")) == -1) {
				temp.setTrash(true);
				res.append("\n[重命名]" + data.getName());
			}
			if (!value.getAlias().equals(data.getAlias())) {
				temp.setAlias(value.getAlias());
			}
			if (!value.getDirect().equals(data.getDirect())) {
				temp.setDirect(value.getDirect());
			}
			if (!value.getWriter().equals(data.getWriter())) {
				temp.setWriter(value.getWriter());
			}
			if (!value.getActor().equals(data.getActor())) {
				temp.setActor(value.getActor());
			}
			if (!value.getStyle().equals(data.getStyle())) {
				temp.setStyle(value.getStyle());
				temp.setEdited(new Date());
			}
			if (!value.getZone().equals(data.getZone())) {
				temp.setZone(value.getZone());
				temp.setEdited(new Date());
			}
			if (value.getScreen() != null && !value.getScreen().equals(data.getScreen())) {
				temp.setScreen(value.getScreen());
				temp.setTrash(true);
				res.append("\n[改年了]" + data.getName());
			}
			if (!value.getImdb().equals(data.getImdb())) {
				temp.setImdb(value.getImdb());
			}
			if (value.getScore() != null && value.getScore().intValue() != data.getScore()) {
				temp.setScore(value.getScore());
			}
			if (value.getJudge().intValue() != data.getJudge()) {
				temp.setJudge(value.getJudge());
			}
			String line = JsonTool.write(temp);
			LOGGER.debug("[" + data.getName() + "]" + line);
			if (!"{}".equals(line)) {
				temp.setId(value.getId());
				if (service.update(temp)) {
					count++;
				}
			}
		}
		return res.length() > 0 ? res.substring(1) : (count > 0 ? Global.OK : "同步电影成功");
	}
	private static String file(File file, String name, String english, Movie res) throws Exception {
		String data = FileTool.read(null, file).toString().replace(", ", "");
		res.setId(file.getName());
		
		int start = data.indexOf("<span property=\"v:itemreviewed\">");
		int stop = data.indexOf("</", start + 32);
		int last = 0;
		res.setName(data.substring(start + 32, stop));
		
		start = data.indexOf("<span class='pl'>导演</span>: <span class='attrs'>", stop);
		stop = data.indexOf("</span></span>", start + 48);
		res.setDirect(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		
		last = start;
		start = data.indexOf("<span class='pl'>编剧</span>: <span class='attrs'>", stop);
		if (start != -1) {
			stop = data.indexOf("</span></span>", start + 48);
			res.setWriter(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		} else {
			start = last;
			res.setWriter("[]");
		}
		
		last = start;
		start = data.indexOf("<span class='pl'>主演</span>: <span class='attrs'>", stop);
		if (start != -1) {
			stop = data.indexOf("</span></span>", start + 48);
			res.setActor(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		} else {
			start = last;
			res.setActor("[]");
		}
		
		start = data.indexOf("<span class=\"pl\">类型:</span> ", stop);
		stop = data.indexOf("<br/>", start + 28);
		res.setStyle(JsonTool.write(style(data.substring(start + 28, stop))));
		
		start = data.indexOf("<span class=\"pl\">制片国家/地区:</span> ", stop);
		stop = data.indexOf("<br/>", start + 33);
		res.setZone(JsonTool.write(zone(data.substring(start + 33, stop))));
		
		last = start;
		start = data.indexOf("<span class=\"pl\">上映日期:</span> ", stop);
		if (start != -1) {
			stop = data.indexOf("<br/>", start + 30);
			res.setScreen(screen(res.getId(), data.substring(start + 30, stop)));
		} else {
			start = last;
		}
		
		last = start;
		start = data.indexOf("<span class=\"pl\">又名:</span> ", stop);
		if (start != -1) {
			stop = data.indexOf("<br/>", start + 28);
			res.setAlias(JsonTool.write(alias(data.substring(start + 28, stop), name, english)));
		} else {
			start = last;
			res.setAlias("[]");
		}
		
		last = start;
		start = data.indexOf("<span class=\"pl\">IMDb链接:</span> ", stop);
		if (start != -1) {
			stop = data.indexOf("<br>", start + 32);
			res.setImdb(imdb(data.substring(start + 32, stop)));
		} else {
			start = last;
			res.setImdb("javascript:;");
		}
		
		last = start;
		start = data.indexOf("<strong class=\"ll rating_num\" property=\"v:average\">", stop);
		if (start != -1) {
			stop = data.indexOf("</strong>", start + 51);
			String temp = data.substring(start + 51, stop);
			if (!temp.equals("")) {
				res.setScore(new Double(Double.parseDouble(temp) * 10).intValue());
			}
		} else {
			start = last;
		}
		
		last = start;
		start = data.indexOf("<span property=\"v:votes\">", stop);
		if (start != -1) {
			stop = data.indexOf("</span>", start + 25);
			res.setJudge(Integer.parseInt(data.substring(start + 25, stop)));
		} else {
			start = last;
			res.setJudge(0);
		}
		
		start = data.indexOf("<img src=\"", data.indexOf("title=\"点击看更多海报\">")) + 10;
		String link = data.substring(start, data.indexOf("\"", start));
		if (link.endsWith(".jpg")) {
			return link;
		}
		return null;
	}
	private static List<FigureItem> celebrity(String html) {
		List<FigureItem> res = new ArrayList<FigureItem>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			if (data.indexOf("/celebrity/") != -1) {
				String[] temp = data.replace("<a href=\"/celebrity/", "").replace(" rel=\"v:directedBy\"", "").replace(" rel=\"v:starring\"", "").replace("</a>", "").split("/\">");
				res.add(new FigureItem(String.valueOf(Integer.parseInt(temp[0])), temp[1]));
			} else {
				res.add(new FigureItem("0", data.substring(data.indexOf(">") + 1, data.lastIndexOf("<"))));
			}
		}
		return res;
	}
	private static List<String> style(String html) {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			String temp = data.replace("<span property=\"v:genre\">", "").replace("</span>", "").replace("纪录片", "纪录").replace("音乐", "歌舞").replace("同性", "情色");
			if (!res.contains(temp)) {
				res.add(temp);
			}
		}
		return res;
	}
	private static List<String> zone(String html) {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			String temp = data.replace("中国大陆", "大陆").replace("中国", "大陆").replace("原西德", "德国").replace("西德", "德国").replace("苏联", "俄罗斯").replace("印度 India", "印度");
			if (!res.contains(temp)) {
				res.add(temp);
			}
		}
		return res;
	}
	private static String screen(String id, String html) throws Exception {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			data = data.split("\">")[1];
			int index = data.indexOf("(");
			data = index != -1 ? data.substring(0, index) : data.substring(0, data.indexOf("<"));
			if (data.length() == 10) {
				res.add(data);
			} else if (data.equals("1961") && id.equals("1f750a3c959ece6a069f457659284de")) {
				res.add("1961-01-01");
			} else if (data.equals("1983") && id.equals("3f0bca7571e458d9c35212802aec3159")) {
				res.add("1983-01-01");
			} else if (data.equals("1963-05") && id.equals("d5ce1217ce5d633b3050959a8522d3c8")) {
				res.add("1963-05-01");
			} else if (data.equals("1996-11") && id.equals("8b3e09b1bc167fbad174fe0711297523")) {
				res.add("1996-11-01");
			} else if (data.equals("1997-02") && id.equals("4f634d997e982072baaa1908288c0ed9")) {
				res.add("1997-02-01");
			} else if (data.equals("1997-07") && id.equals("4fe315bfe403727e8d360ddf475e5007")) {
				res.add("1997-07-01");
			} else if (data.equals("2009-08") && id.equals("6fc6a6d77b59f7027bb4acef2a261a10")) {
				res.add("2009-08-01");
			} else if (data.equals("2009") && id.equals("bf367ae442f4a1287fe8fda6f82380fc")) {
				res.add("2009-04-07");
			}
		}
		String[] temp = res.toArray(new String[] {});
		Arrays.sort(temp);
		return temp[0];
	}
	private static List<String> alias(String html, String name, String english) {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			data = data.trim();
			int index = data.indexOf("(");
			if (index != -1) {
				data = data.substring(0, index);
			}
			if (data.equals(name) || data.equals(english)) {
				continue;
			}
			res.add(data);
		}
		return res;
	}
	private static String imdb(String html) {
		String res = html.split("\">")[1].replace("</a>", "");
		return "https://www.imdb.com/title/" + res + "/";
	}
	private static void logo(RestTemplate template, String id, String link) throws Exception {
		File logo = new File(new File(Global.CACHE).getParent(), "movie/" + id + ".jpg");
		if (link != null && !logo.exists()) {
			logo = new File("E:/pic/" + id + ".jpg");
			FileTool.write(template.getForObject(link, byte[].class), logo);
			java.awt.image.BufferedImage image = javax.imageio.ImageIO.read(logo);
			if (image.getWidth() != 270) {
				logo.delete();
			}
			Thread.sleep(System.currentTimeMillis() % 2000 + 1000);
		}
	}
}