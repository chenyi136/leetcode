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
public class BarTianyaCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public BarTianyaCrawler() {
		super(5, "http://search.tianya.cn/bbs?q={KEYWORD}&pn={COORDS}", false, "h3 a");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("BAR");
		res.setName("天涯贴吧");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("7001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = node.attr("href");
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source.replace("bbs-content clearfix", "bbs-content"), param[0]);
		Iterator<Element> it = root.select("div[class=bbs-content]").iterator();
		StringBuffer content = new StringBuffer();
		while (it.hasNext()) {
			String temp = HyperHelper.china(it.next().text());
			if (temp != null) {
				content.append(temp);
			}
		}
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("span[class=s_title] span").text());
		res.setContent(content.toString());
		res.setScreen(HyperHelper.time(root.selectFirst("div[class=atl-info] span:first-child").nextElementSibling().text().replace("时间：", "").trim(), null));
		return res;
	}
}