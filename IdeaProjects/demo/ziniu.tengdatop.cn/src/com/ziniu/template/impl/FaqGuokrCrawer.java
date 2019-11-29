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
public class FaqGuokrCrawer extends HyperCrawlerImpl implements HyperCrawler {
	public FaqGuokrCrawer() {
		super(4, "https://www.guokr.com/search/question/?wd={KEYWORD}&page={COORDS}", false, "li[class=items-post]", "https://www.guokr.com");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("FAQ");
		res.setName("果壳问答");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("2001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = NODE_PREFIX + node.selectFirst("h2 a").attr("href");
		res[2] = node.selectFirst("p:last-child").text().replace("  ", " ").split(" ")[1];
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		Iterator<Element> it = root.select("div[class=answer-txt answerTxt gbbcode-content] p").iterator();
		StringBuffer content = new StringBuffer();
		while (it.hasNext()) {
			String temp = HyperHelper.china(it.next().text());
			if (temp != null) {
				content.append(temp);
			}
		}
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("div[class=post-title] h1").text());
		res.setContent(content.toString());
		res.setScreen(HyperHelper.time(param[2], "yyyy-MM-dd"));
		return res;
	}
}