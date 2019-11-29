package com.mc.portal.tool;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.client.RestTemplate;
import com.mc.core.entity.blog.Catena;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.portal.pojo.FigureItem;
public class CatenaTool {
	private static final Log LOGGER = LogFactory.getLog(CatenaTool.class);
	public static File[] list(RestTemplate template, Map<Integer, Catena> datas, File root) throws Exception {
		for (Map.Entry<Integer, Catena> en : datas.entrySet()) {
			Catena data = en.getValue();
			FileTool.write(template.getForObject(data.getDouban(), String.class).getBytes(), new File(root, data.getId().toString()));
			Thread.sleep(System.currentTimeMillis() % 2000 + 1000);
		}
		File[] res = root.listFiles();
		return res != null ? res : new File[0];
	}
	public static void file(RestTemplate template, CatenaService service, Map<Integer, Catena> datas, File[] files) throws Exception {
		if (datas.size() != files.length) {
			throw new Exception("目标数据与网页文件总数不一致");
		}
		for (File file : files) {
			Catena data = datas.get(Integer.parseInt(file.getName()));
			Catena value = new Catena();
			logo(template, data.getId(), file(file, data.getName(), data.getEnglish(), value));
			Catena temp = new Catena();
			if (value.getAlias() != null && !value.getAlias().equals(data.getAlias())) {
				temp.setAlias(value.getAlias());
			}
			if (value.getDirect() != null && !value.getDirect().equals(data.getDirect())) {
				temp.setDirect(value.getDirect());
			}
			if (value.getWriter() != null && !value.getWriter().equals(data.getWriter())) {
				temp.setWriter(value.getWriter());
			}
			if (value.getActor() != null && !value.getActor().equals(data.getActor())) {
				temp.setActor(value.getActor());
			}
			if (value.getStyle() != null && !value.getStyle().equals(data.getStyle()) && !data.getType().equals("CART") && !data.getType().equals("TRUE")) {
				temp.setStyle(value.getStyle());
			}
			if (value.getZone() != null && !value.getZone().equals(data.getZone()) && !data.getType().equals("WARD")) {
				temp.setZone(value.getZone());
			}
			if (value.getScreen() != null && !value.getScreen().equals(data.getScreen())) {
				temp.setScreen(value.getScreen());
			}
			if (value.getScore() != null && value.getScore().intValue() != data.getScore()) {
				temp.setScore(value.getScore());
			}
			if (value.getJudge() != null && (data.getJudge() == null || value.getJudge().intValue() != data.getJudge())) {
				temp.setJudge(value.getJudge());
			}
			String line = JsonTool.write(temp);
			LOGGER.debug("[" + data.getName() + "]" + line);
			if (!"{}".equals(line)) {
				temp.setId(data.getId());
				service.update(temp);
			}
		}
	}
	private static String file(File file, String name, String english, Catena res) throws Exception {
		String data = FileTool.read(null, file).toString().replace(", ", "");
		res.setId(Integer.parseInt(file.getName()));
		
		int start = data.indexOf("<span class='pl'>导演</span>: <span class='attrs'>");
		int stop = 0;
		int last = 0;
		if (start != -1) {
			stop = data.indexOf("</span></span>", start + 48);
			res.setDirect(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		} else {
			start = last;
		}
		
		last = start;
		start = data.indexOf("<span class='pl'>编剧</span>: <span class='attrs'>", stop);
		if (start != -1) {
			stop = data.indexOf("</span></span>", start + 48);
			res.setWriter(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		} else {
			start = last;
		}
		
		last = start;
		start = data.indexOf("<span class='pl'>主演</span>: <span class='attrs'>", stop);
		if (start != -1) {
			stop = data.indexOf("</span></span>", start + 48);
			res.setActor(JsonTool.write(celebrity(data.substring(start + 48, stop))));
		} else {
			start = last;
		}
		
		last = start;
		start = data.indexOf("<span class=\"pl\">类型:</span> ", stop);
		if (start != -1) {
			stop = data.indexOf("<br/>", start + 28);
			res.setStyle(JsonTool.write(style(data.substring(start + 28, stop))));
		} else {
			start = last;
		}
		
		start = data.indexOf("<span class=\"pl\">制片国家/地区:</span> ", stop);
		stop = data.indexOf("<br/>", start + 33);
		res.setZone(JsonTool.write(zone(data.substring(start + 33, stop))));
		
		last = start;
		start = data.indexOf("<span class=\"pl\">上映日期:</span> ", stop);
		if (start != -1) {
			stop = data.indexOf("<br/>", start + 30);
			res.setScreen(screen(data.substring(start + 30, stop)));
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
		}
		
		start = data.indexOf("<img src=\"", data.indexOf("title=\"点击看更多海报\">")) + 10;
		String link = data.substring(start, data.indexOf("\"", start));
		if (link.endsWith(".jpg")) {
			return link;
		}
		return data.substring(start, data.indexOf("\"", start));
	}
	private static List<FigureItem> celebrity(String html) {
		List<FigureItem> res = new ArrayList<FigureItem>();
		String[] datas = html.replace("Joy Kecken /  Lusco", "Joy Kecken Lusco").split(" / ");
		for (String data : datas) {
			if (data.indexOf("/celebrity/") != -1) {
				String[] temp = data.replace("<a href=\"/celebrity/", "").replace(" rel=\"v:directedBy\"", "").replace(" rel=\"v:starring\"", "").replace("</a>", "").split("/\">");
				res.add(new FigureItem(String.valueOf(Integer.parseInt(temp[0])), temp[1]));
			} else {
				res.add(new FigureItem("0", data.substring(data.indexOf(">") + 1, data.lastIndexOf("<"))));
			}
		}
		if (res.size() > 0) {
			return res;
		}
		return null;
	}
	private static List<String> style(String html) {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			data = data.replace("<span property=\"v:genre\">", "").replace("</span>", "").replace("纪录片", "纪录");
			if (data.equals("短片") || data.equals("脱口秀") || data.equals("动画") || data.equals("纪录") || data.equals("鬼怪")) {
				continue;
			}
			res.add(data);
		}
		if (res.size() > 0) {
			return res;
		}
		return null;
	}
	private static List<String> zone(String html) {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			res.add(data.replace("中国大陆", "大陆").replace("新西兰 New Zealand", "新西兰"));
		}
		if (res.size() > 0) {
			return res;
		}
		return null;
	}
	private static String screen(String html) throws Exception {
		List<String> res = new ArrayList<String>();
		String[] datas = html.split(" / ");
		for (String data : datas) {
			data = data.split("\">")[1];
			int index = data.indexOf("(");
			data = index != -1 ? data.substring(0, index) : data.substring(0, data.indexOf("<"));
			if (data.length() == 10) {
				res.add(data);
			}
		}
		if (res.size() > 0) {
			String[] temp = res.toArray(new String[] {});
			Arrays.sort(temp);
			return temp[0];
		}
		return null;
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
		if (res.size() > 0) {
			return res;
		}
		return null;
	}
	private static void logo(RestTemplate template, Integer id, String link) throws Exception {
		File file = new File(new File(com.mc.portal.crux.Global.CACHE).getParent(), "player/poster/" + id + ".jpg");
		if (link != null && !file.exists()) {
			FileTool.write(template.getForObject(link, byte[].class), file);
			java.awt.image.BufferedImage image = javax.imageio.ImageIO.read(file);
			if (image.getWidth() != 270) {
				file.delete();
			}
			Thread.sleep(System.currentTimeMillis() % 2000 + 1000);
		}
	}
}