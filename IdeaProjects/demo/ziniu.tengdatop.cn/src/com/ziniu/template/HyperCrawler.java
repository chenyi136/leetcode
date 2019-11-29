package com.ziniu.template;
import java.util.Map;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.web.client.RestTemplate;
import com.ziniu.entity.core.Hyper;
import com.ziniu.entity.core.Media;
import com.ziniu.service.core.AnalyzeService;
import com.ziniu.service.core.HyperService;
public interface HyperCrawler {
	/**
	 * 返回媒体信息
	 * */
	public Media info() throws Exception;
	/**
	 * 注入抓取接口
	 * @param template 远调接口
	 * @param service 业务接口
	 * @param analyze 分析接口
	 * */
	public void init(RestTemplate template, HyperService service, AnalyzeService analyze);
	/**
	 * 解析引擎网页
	 * @param node 地址节点
	 * */
	public String[] work(Element node) throws Exception;
	/**
	 * 解析单个网页
	 * @param source 网页源码
	 * @param param 抓取参数
	 * */
	public Hyper work(String source, String[] param) throws Exception;
	/**
	 * 处理单个网页
	 * @param root 列表节点
	 * @param coords 在第几页
	 * @param keyword 抓取词语
	 * @return Hyper(id,coords,place,blend)
	 * */
	public Map<String, Hyper> work(Document root, long coords, String keyword) throws Exception;
	/**
	 * 解析网页列表
	 * @param coords 抓取页数
	 * @param start 首页序号
	 * @param grads 每页梯度
	 * @param agent 用户代理
	 * @param keyword 抓取词语
	 * @return Hyper(id,coords,place,blend)
	 * */
	public Map<String, Hyper> work(long coords, long start, long grads, String agent, String keyword);
}