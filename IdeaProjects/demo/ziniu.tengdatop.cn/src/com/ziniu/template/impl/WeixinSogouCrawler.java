package com.ziniu.template.impl;
import java.util.Date;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.http.HttpMethod;
import com.mc.core.tool.CryptoTool;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
import com.ziniu.tool.JsonTool;
public class WeixinSogouCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public WeixinSogouCrawler() {
		super(8, "http://weixin.sogou.com/weixin?type=2&query={KEYWORD}&page={COORDS}", false, "ul[class=news-list] li");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("WEIXIN");
		res.setName("微信");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("6001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String link = node.selectFirst("div[class=txt-box] div[class=s-p] a").attr("href");
		Document root = Jsoup.parse(template.exchange(link, HttpMethod.GET, request, String.class).getBody(), link);
		Element title = node.selectFirst("div[class=txt-box] h3 a");
		Long time = Long.parseLong(node.selectFirst("div[class=txt-box] div[class=s-p]").attr("t"));
		String[] data = new String[] { title.text(), root.selectFirst("p[class=profile_account]").text(), time.toString() };
		String key = CryptoTool.MD5.encode(JsonTool.write(data));
		Hyper en = new Hyper();
		en.setId(key);
		if (service.count(en) > 0) {
			return new String[4];
		}
		
		String[] res = new String[4];
		res[0] = title.attr("href");
		res[2] = time.toString();
		res[3] = key;
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source, param[0]);
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("h2[class=rich_media_title]").text());
		res.setContent(HyperHelper.china(root.selectFirst("div[class=rich_media_content]").text()));
		res.setScreen(new Date(1000 * Long.parseLong(param[2])));
		return res;
	}
}