package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class NewsIfengCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public NewsIfengCrawler() {
		super(1, "https://search.ifeng.com/sofeng/article?q={KEYWORD}&p={COORDS}", false, "p[class=fz16 line24] a");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("NEWS");
		res.setName("凤凰新闻");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("1001");
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
		res.setTitle(root.selectFirst("div[class=yc_tit] h1").text());
		res.setContent(HyperHelper.china(root.selectFirst("div[class=yc_con_l]").text()));
		res.setScreen(HyperHelper.time(root.selectFirst("div[class=yc_tit] p[class=clearfix] span").text(), null));
		return res;
	}
}