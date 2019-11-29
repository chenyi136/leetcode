package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class NewsSinaCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public NewsSinaCrawler() {
		super(9, "http://search.sina.com.cn/?c=news&ie=utf-8&q={KEYWORD}&page={COORDS}&col=&range=&source=&from=&country=&size=&time=&a=&pf=2131425455&ps=2134309112&dpc=1", false, "h2 a[target=_blank]");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("NEWS");
		res.setName("新浪新闻");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("1002");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = node.attr("href");
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("h1[class=main-title]").text());
		res.setContent(HyperHelper.china(root.selectFirst("div[class=article]").text()));
		res.setScreen(HyperHelper.time(root.selectFirst("div[class=date-source] span[class=date]").text(), "yyyy年MM月dd日 HH:mm"));
		return res;
	}
}