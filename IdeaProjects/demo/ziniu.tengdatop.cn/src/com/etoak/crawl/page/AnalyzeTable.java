package com.etoak.crawl.page;
import java.util.LinkedHashMap;
import java.util.Map;
public class AnalyzeTable {
	/**网页抓取全部总量*/
	public long TOTAL;
	/**今日网页抓取总量*/
	public long TODAY;
	/**今日抓取负面总量*/
	public long POOR;
	/**按照媒体类型分组*/
	public Map<String, AnalyzeType> ANALYZE_TYPE = new LinkedHashMap<String, AnalyzeType>();
	public static class AnalyzeType {
		/**来源类型唯一标识*/
		public String ID;
		/**来源类型中文名称*/
		public String NAME;
		/**今日网页抓取总量*/
		public long HYPER_TODAY_TOTAL;
		/**昨日网页抓取总量*/
		public long HYPER_YESTERDAY_TOTAL;
		/**一周网页抓取总量*/
		public long HYPER_WEEK_TOTAL;
		/**半月网页抓取总量*/
		public long HYPER_MOIETY_TOTAL;
		/**一月网页抓取总量*/
		public long HYPER_MONTH_TOTAL;
		/**按照媒体类型分组*/
		public Map<String, AnalyzeType> ANALYZE_TYPE = new LinkedHashMap<String, AnalyzeType>();
	}
	public static class AnalyzeMedia {
		/**来源媒体唯一标识*/
		public int ID;
		/**来源媒体媒体类型*/
		public String TYPE;
		/**来源媒体中文名称*/
		public String NAME;
		/**最近一周每日总量*/
		public long[] HYPER_EVERYDAY_TOTAL = new long[7];
		/**今日网页抓取总量*/
		public long HYPER_TODAY_TOTAL;
		/**昨日网页抓取总量*/
		public long HYPER_YESTERDAY_TOTAL;
		/**一周网页抓取总量*/
		public long HYPER_WEEK_TOTAL;
		/**半月网页抓取总量*/
		public long HYPER_MOIETY_TOTAL;
		/**一月网页抓取总量*/
		public long HYPER_MONTH_TOTAL;
		/**网页抓取全部总量*/
		public long HYPER_TOTAL;
		/**网页抓取正面总量*/
		public long HYPER_GOOD;
	}
}