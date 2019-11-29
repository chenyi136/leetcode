package com.etoak.crawl.main;
import com.etoak.crawl.page.HyperText;

import org.jsoup.select.Elements;
import org.springframework.web.client.RestTemplate;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
public class MyCrawler {
	private static LinkedList<String> UNVISIT = new LinkedList<String>();
	private static Set<String> VISITED = new HashSet<String>();
	
	
	public static void grab(RestTemplate template, String... roots) throws Exception {
		for (String root : roots) {
			if (root != null && !root.trim().equals("") && !VISITED.contains(root) && !UNVISIT.contains(root)) {
				UNVISIT.add(root);
			}
		}

		while (!UNVISIT.isEmpty() && VISITED.size() <= 10000) {

			String line = UNVISIT.removeFirst();

			HyperText page = new HyperText(template, line);
			if (page.getData() == null) {
				continue;
			}
			Elements nodes = HyperTextParser.query(page, "a");
			if (!nodes.isEmpty()) {
				System.out.println("下面将打印所有a标签： ");
				System.out.println(nodes);
				//TODO
			}

			page.store(null);

			// 将已经访问过的链接放入已访问的链接中；
			VISITED.add(line);
			
			Set<String> links = HyperTextParser.link(page, "img");
			for (String link : links) {
				UNVISIT.add(link);
				System.out.println("新增爬取路径: " + link);
			}
		}
	}

	public static void main(String[] args) throws Exception {
		RestTemplate template = new RestTemplate();
		grab(template, "http://www.baidu.com");
	}
}