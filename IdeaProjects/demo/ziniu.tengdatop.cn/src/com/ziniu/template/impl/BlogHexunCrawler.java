package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class BlogHexunCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public BlogHexunCrawler() {
		//super(11, "http://blog.search.hexun.com/blog?key={KEYWORD}&t=0&s=1&f=0&page={COORDS}", "GBK", false, "div[class=news-l-t]");
		super(11, "http://blog.search.hexun.com/blog?key={KEYWORD}&page={COORDS}", false, "div[class=news-l-t]");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("BLOG");
		res.setName("和讯博客");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("4002");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = node.selectFirst("a").attr("href");
		res[2] = node.selectFirst("span").text();
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("span[class=ArticleTitleText] a").text());
		res.setContent(HyperHelper.china(root.selectFirst("div[id=BlogArticleDetail]").text()));
		//res.setScreen(HyperHelper.time(screen.text(), null));
		res.setScreen(HyperHelper.time(param[2], "yyyy年MM月dd日 HH:mm"));
		//System.out.println(root.selectFirst("span[class=ArticleTitleText]").text());
		return res;
	}
}