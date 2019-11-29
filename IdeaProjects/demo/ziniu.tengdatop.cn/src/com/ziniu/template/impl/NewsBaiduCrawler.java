package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class NewsBaiduCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public NewsBaiduCrawler() {
		super(2, "http://news.baidu.com/ns?word={KEYWORD}&pn={COORDS}&ct=1&tn=news&rn=20&ie=utf-8&bt=0&et=0", true, "div[class=result]");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("NEWS");
		res.setName("百度新闻");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(0L);
		res.setGrads(2L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("1901");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		Element head = node.selectFirst("h3[class=c-title] a");
		Element screen = node.selectFirst("p[class=c-author]");
		if (head == null || screen == null) {
			return res;
		}
		res[0] = head.attr("href");
		res[1] = head.text();
		res[2] = screen.text().split(" ")[1];
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		if (param[0] == null || param[1] == null || param[2] == null) {
			return null;
		}
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(param[1]);
		res.setContent(HyperHelper.china(Jsoup.parse(source, param[0]).body().text()));
		if (param[2].indexOf("年") != -1) {
			res.setScreen(HyperHelper.time(param[2], "yyyy年MM月dd日 HH:mm"));
		}
		return res;
	}
}