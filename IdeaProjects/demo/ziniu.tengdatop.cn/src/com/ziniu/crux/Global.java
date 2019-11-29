package com.ziniu.crux;
import java.util.LinkedHashMap;
import java.util.Map;
import com.mc.core.crux.Core;
import com.ziniu.entity.core.Media;
public class Global extends Core {
	/**
	 * 当前会话全部媒体
	 * */
	public static final String KEY_SESSION_MEDIA = "KEY_SESSION_MEDIA";
	/**
	 * 在线用户会话信息
	 * */
	public static final String KEY_SESSION_ONLINE = "KEY_SESSION_ONLINE";
	/**
	 * 当前会话全部方案
	 * */
	public static final String KEY_SESSION_PROGRAM = "KEY_SESSION_PROGRAM";
	/**
	 * 网页分析情感判断
	 * */
	public static final Map<String, String> HYPER_ANALYZE_TREND = new LinkedHashMap<String, String>() {
		public static final long serialVersionUID = 1L;
		{
			super.put("ZHENGMIAN", "正面");
			super.put("ZHONGLI", "中立");
			super.put("FUMIAN", "负面");
			super.put("WUXIAO", "无效");
		}
	};
	/**
	 * 来源媒体任务引擎
	 * */
	public static final Map<Integer, Media> HYPER_MEDIA_ENGINE = new LinkedHashMap<Integer, Media>();
	/**
	 * 来源媒体网页类型
	 * */
	public static final Map<String, String> HYPER_MEDIA_TYPE = new LinkedHashMap<String, String>() {
		public static final long serialVersionUID = 1L;
		{
			super.put("NEWS", "新闻");
			super.put("FAQ", "问答");
			//微博
			super.put("BLOG", "博客");
			super.put("VIDEO", "视频");
			//微信
			super.put("WEIXIN", "微信");
			super.put("BAR", "贴吧");
			super.put("SHEET", "期刊");
		}
	};
	/**
	 * 网页分析负面词库
	 * */
	public static final Map<Integer, String> HYPER_SPIRIT_NEGATIVE = new LinkedHashMap<Integer, String>();
	/**
	 * 网页分析正面词库
	 * */
	public static final Map<Integer, String> HYPER_SPIRIT_POSITIVE = new LinkedHashMap<Integer, String>();
	/**
	 * 项目运行的上下文
	 * */
	public static String CONTEXT = "/";
	/**
	 * 项目异步登录入口
	 * */
	public static String LOGIN = "http://122.114.142.243:81/";
	/**
	 * 项目访问的根路径
	 * */
	public static String ROOT;
	/**
	 * 抓取网页最大页数
	 * */
	public static Long HYPER_CRAWLER_COORDS = 100L;
	/**
	 * 初始匿名构造方法
	 * */
	static {
		CRYPTO_SECRET_WORD = "1138789752@qq.com";
	}
	/**
	 * 文件访问链接
	 * @param id 文件标识
	 * @param tacit 有默认吗
	 * */
	public static final String file(String id, boolean... tacit) {
		if (id == null || id.length() < 3) {
			return tacit != null && tacit.length > 0 && tacit[0]? ROOT + "_/images/face.jpg" : "javascript:;";
		}
		return ROOT + "data/" + id.substring(0, 2) + "/" + id;
	}
}