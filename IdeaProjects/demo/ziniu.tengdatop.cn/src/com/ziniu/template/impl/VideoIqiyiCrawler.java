package com.ziniu.template.impl;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.template.HyperCrawler;
import com.ziniu.template.HyperCrawlerImpl;
import com.ziniu.template.HyperHelper;
public class VideoIqiyiCrawler extends HyperCrawlerImpl implements HyperCrawler {
	public VideoIqiyiCrawler() {
		super(7, "http://so.iqiyi.com/so/q_{KEYWORD}_page_{COORDS}", false, "li[class=list_item] a:first-child");
	}
	public Media info() throws Exception {
		Media res = new Media();
		res.setId(ID);
		res.setEngine("VIDEO");
		res.setName("爱奇异");
		res.setAddress(ADDRESS);
		res.setEncode(ENCODE);
		res.setStart(1L);
		res.setGrads(1L);
		res.setBlend(BLEND);
		res.setNozzle(this.getClass().getName());
		res.setQueue("5001");
		return res;
	}
	public String[] work(Element node) throws Exception {
		String[] res = new String[3];
		res[0] = node.attr("href");
		if (res[0] != null && !res[0].startsWith("http://www.iqiyi.com/v_") && !res[0].startsWith("http://www.iqiyi.com/w_")) {
			res[0] = null;
		}
		return res;
	}
	public Hyper work(String source, String[] param) throws Exception {
		Document root = Jsoup.parse(source.replace("bbs-content clearfix", "bbs-content"), param[0]);
		Hyper res = new Hyper();
		res.setAddress(param[0]);
		res.setTitle(root.selectFirst("h1[class=mod-play-tit] a").text());
		res.setContent(HyperHelper.china(root.body().text()));
		Element node = root.selectFirst("div[class=dingyue-info-rt] p:first-child");
		if (node != null) {
			res.setScreen(HyperHelper.time(node.text().replace("发布时间：", ""), "yyyy-MM-dd"));
		}
		return res;
	}
}