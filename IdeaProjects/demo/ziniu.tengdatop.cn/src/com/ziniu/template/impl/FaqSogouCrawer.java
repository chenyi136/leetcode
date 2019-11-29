package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.http.HttpMethod;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class FaqSogouCrawer extends HyperCrawlerImpl implements HyperCrawler {
	public FaqSogouCrawer() {
		super(10, "https://www.sogou.com/sogou?insite=wenwen.sogou.com&query={KEYWORD}&page={COORDS}", false, "h3[class=vrTitle] a", "https://www.sogou.com");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("FAQ");
		res.setName("搜狗问答");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("2002");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String link = template.exchange(NODE_PREFIX + node.attr("href"), HttpMethod.GET, request, String.class).getBody();
		link = link.replace("<meta content=\"always\" name=\"referrer\"><script>window.location.replace(\"", "");
		String[] res = new String[3];
		res[0] = link.substring(0, link.indexOf("\""));
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		StringBuffer content = new StringBuffer();
		Element node = root.selectFirst("pre[class=detail-tit-info]");
		if (node != null) {
			String temp = HyperHelper.china(node.text());
			if (temp != null) {
				content.append(temp);
			}
		}
		node = root.selectFirst("div[class=main] div[class=section]");
		String temp = HyperHelper.china(node.text());
		if (temp != null) {
			content.append(temp);
		}
		
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("span[class=detail-tit]").text());
		res.setContent(content.toString());
		res.setScreen(HyperHelper.time(root.selectFirst("div[class=ft-info-box] div[class=user-txt] span").text().replace(" 提问", ""), "yyyy-MM-dd"));
		return res;
	}
}