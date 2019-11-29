package com.ziniu.template;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.web.client.RestTemplate;

import com.ziniu.entity.core.Analyze;
import com.ziniu.entity.core.Hyper;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
public abstract class HyperCrawlerImpl implements HyperCrawler {
	public final Log logger = LogFactory.getLog(HyperCrawlerImpl.class);
	public RestTemplate template;
	public HyperService service;
	public AnalyzeService analyze;
	public HttpEntity<String> request;
	public int ID;
	public String ADDRESS;
	public String ENCODE = "UTF-8";
	public boolean BLEND;
	public String NODE_ADDRESS;
	public String NODE_PREFIX;
	/**
	 * 构造方法
	 * @param ID 主键
	 * @param ADDRESS 请求地址
	 * @param BLEND 搜索引擎
	 * @param NODE_ADDRESS 地址节点
	 * */
	public HyperCrawlerImpl(int ID, String ADDRESS, boolean BLEND, String NODE_ADDRESS) {
		this.ID = ID;
		this.ADDRESS = ADDRESS;
		this.BLEND = BLEND;
		this.NODE_ADDRESS = NODE_ADDRESS;
	}
	/**
	 * 构造方法
	 * @param ID 主键
	 * @param ADDRESS 请求地址
	 * @param BLEND 搜索引擎
	 * @param NODE_ADDRESS 地址节点
	 * */
	public HyperCrawlerImpl(int ID, String ADDRESS, String ENCODE, boolean BLEND, String NODE_ADDRESS) {
		this.ID = ID;
		this.ADDRESS = ADDRESS;
		this.ENCODE = ENCODE;
		this.BLEND = BLEND;
		this.NODE_ADDRESS = NODE_ADDRESS;
	}
	/**
	 * 构造方法
	 * @param ID 主键
	 * @param ADDRESS 请求地址
	 * @param BLEND 搜索引擎
	 * @param NODE_ADDRESS 地址节点
	 * @param NODE_PREFIX 链接前缀
	 * */
	public HyperCrawlerImpl(int ID, String ADDRESS, boolean BLEND, String NODE_ADDRESS, String NODE_PREFIX) {
		this(ID, ADDRESS, BLEND, NODE_ADDRESS);
		this.NODE_PREFIX = NODE_PREFIX;
	}
	/**
	 * 注入接口
	 * @param template 远调接口
	 * @param service 业务接口
	 * @param analyze 分析接口
	 * */
	public void init(RestTemplate template, HyperService service, AnalyzeService analyze) {
		this.template = template;
		this.service = service;
		this.analyze = analyze;
	}
	public Map<String, Hyper> work(Document root, long coords, String keyword) throws Exception {
		Map<String, Hyper> res = new HashMap<String, Hyper>();
		Iterator<Element> it = root.select(NODE_ADDRESS).iterator();
		List<String> keys = new ArrayList<String>();
		long place = 0;
		while (it.hasNext()) {
			place++;
			Thread.sleep(System.currentTimeMillis() % 2000 + 2000);
			Element node = it.next();
			String[] param = this.work(node);
			if (param[0] == null || param[0].equals("")) {
				continue;
			}
			logger.info("[抓取页面]抓取引擎 = " + this.getClass().getName() + ", 详细地址 = " + param[0] + ", 抓取词语 = " + keyword);
			try {
				Hyper data = new Hyper();
				data.setAddress(param[0]);
				data.setSqlQueryField(data.setId(null), data.setBlend(null), data.setAbate(null));
				data.setSqlLeafSize(1L);
				List<Hyper> datas = service.list(data);
				if (datas == null || datas.size() < 1) {
					data = this.work(template.exchange(param[0], HttpMethod.GET, request, String.class).getBody(), param);
					if (data == null) {
						continue;
					}
					
					data.setId(param.length > 3 ? param[3] : UUID.randomUUID().toString().replace("-", ""));
					data.setCoords(coords);
					data.setPlace(place);
					data.setBlend(false);
					data.setAbate(false);
					data.setFkMedia(ID);
					if (service.save(data)) {
						res.put(data.getId(), data);
					}
				} else {
					if (!BLEND) {
						data = datas.get(0);
						if (data.getBlend()) {
							Hyper temp = this.work(template.exchange(param[0], HttpMethod.GET, request, String.class).getBody(), param);
							if (temp == null || temp.getTitle() == null || temp.getContent() == null) {
								Hyper en = new Hyper();
								en.setId(data.getId());
								en.setAbate(true);
								service.update(en);
							} else {
								Hyper en = new Hyper();
								en.setTitle(temp.getTitle());
								en.setContent(temp.getContent());
								en.setScreen(temp.getScreen());
								en.setCoords(coords);
								en.setPlace(place);
								en.setBlend(false);
								en.setAbate(false);
								en.setFkMedia(ID);
								service.update(en);
							}
							keys.add(data.getId());
						}
						
						if (!res.containsKey(data.getId())) {
							data.setCoords(coords);
							data.setPlace(place);
							res.put(data.getId(), data);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (keys.size() > 0) {
			Analyze en = new Analyze();
			en.setSqlUpdateNew(en.setJudge(null), true);
			en.setSqlQueryTerm(true, en.setJudge(null), Analyze.Operation.EqualTo, false);
			en.setSqlQueryTerm(true, en.setAffirm(null), Analyze.Operation.EqualTo, false);
			en.setSqlQueryIn(true, en.setFkHyper(null), true, keys.toArray(new String[] {}));
			analyze.alter(en);
		}
		return res;
	}
	public Map<String, Hyper> work(long coords, long start, long grads, String agent, String keyword) {
		HttpHeaders header = new HttpHeaders();
		header.add("User-Agent", agent);
		this.request = new HttpEntity<String>(null, header);
		Map<String, Hyper> res = new HashMap<String, Hyper>();
		try {
			String address = ENCODE.equals("UTF-8") ? ADDRESS.replace("{KEYWORD}", keyword) : ADDRESS.replace("{KEYWORD}", URLEncoder.encode(keyword, ENCODE));
			for (int i = 1; i <= coords; i++) {
				String link = address.replace("{COORDS}", String.valueOf(start + (i - 1) * grads));
				logger.info("[抓取列表]抓取引擎 = " + this.getClass().getName() + ", 列表地址 = " + link + ", 抓取词语 = " + keyword);
				
				
				String t = template.exchange(link, HttpMethod.GET, request, String.class).getBody();
				/*String t = template.execute(link, HttpMethod.GET, null, new ResponseExtractor<String>() {

					@Override
					public String extractData(ClientHttpResponse response)
							throws IOException {
						System.out.println(response.getStatusCode());
						
						return null;
					}});*/
				//System.out.println(t);
				
				Map<String, Hyper> datas = this.work(Jsoup.parse(t, address), i, keyword);
				if (datas.size() > 0) {
					for (Map.Entry<String, Hyper> temp : datas.entrySet()) {
						if (!res.containsKey(temp.getKey())) {
							res.put(temp.getKey(), temp.getValue());
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}