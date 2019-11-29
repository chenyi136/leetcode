package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class BlogSinaCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public BlogSinaCrawler() {
		super(3, "https://search.sina.com.cn/?c=blog&q={KEYWORD}&page={COORDS}", "GBK", false, "div[class=box-result clearfix] h2 a");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("BLOG");
		res.setName("新浪博客");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("4001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = node.attr("href");
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		Element title = root.selectFirst("h1[class=h1_tit]");
		Element content = root.selectFirst("div[class=BNE_cont]");
		Element screen = root.selectFirst("span[class=time SG_txtc]");
		Hyper res = new Hyper();
		if (title == null || content == null || screen == null) {
			title = root.selectFirst("h2[class=titName SG_txta]");
			content = root.selectFirst("div[id=sina_keyword_ad_area2]");
			screen = root.selectFirst("span[class=time SG_txtc]");
			res.setScreen(HyperHelper.time(screen.text().replace("(", "").replace(")", ""), null));
		} else {
			res.setScreen(HyperHelper.time(screen.text(), null));
		}
		res.setAddress(param[0]);
		res.setTitle(title.text());
		res.setContent(HyperHelper.china(content.text()));
		return res;
	}
}