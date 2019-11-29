package com.etoak.crawl.main;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.etoak.crawl.page.HyperText;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
public class HyperTextParser {
	public static Elements query(HyperText page, String cssQuery) throws Exception {
		return page.getRoot().select(cssQuery);
	}
	public static Element query(HyperText page, String cssQuery, int index) throws Exception {
		Elements res = query(page, cssQuery);
		if (index < 0) {
			index = res.size() + index;
		}
		return res.get(index);
	}
	public static Set<String> link(HyperText page, String cssQuery) throws Exception {
		Set<String> res = new HashSet<String>();
		Iterator<Element> it = query(page, cssQuery).iterator();
		while (it.hasNext()) {
			Element temp = it.next();
			if (temp.hasAttr("href")) {
				res.add(temp.attr("abs:href"));
			} else if (temp.hasAttr("src")) {
				res.add(temp.attr("abs:src"));
			}
		}
		return res;
	}
	public static ArrayList<String> attr(HyperText page, String cssQuery, String attributeKey) throws Exception {
		ArrayList<String> res = new ArrayList<String>();
		Elements datas = query(page, cssQuery);
		for (Element data : datas) {
			if (data.hasAttr(attributeKey)) {
				res.add(data.attr(attributeKey));
			}
		}
		return res;
	}
}