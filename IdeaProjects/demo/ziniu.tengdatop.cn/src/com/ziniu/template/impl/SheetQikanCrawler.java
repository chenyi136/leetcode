package com.ziniu.template.impl;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class SheetQikanCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public SheetQikanCrawler() {
		super(6, "http://www.qikan.com.cn/searchArticle/{COORDS}.html?k={KEYWORD}", false, "div[class=wenkuList-wrap] h3 a", "http://www.qikan.com.cn");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("SHEET");
		res.setName("龙源期刊");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("8001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = NODE_PREFIX + node.attr("href");
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source.replace("bbs-content clearfix", "bbs-content"), param[0]);
		Iterator<Element> it = root.select("div[class=article] p").iterator();
		StringBuffer content = new StringBuffer();
		while (it.hasNext()) {
			String temp = HyperHelper.china(it.next().text());
			if (temp != null) {
				content.append(temp);
			}
		}
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("div[class=article] h1").text());
		res.setContent(content.toString());
		return res;
	}
}