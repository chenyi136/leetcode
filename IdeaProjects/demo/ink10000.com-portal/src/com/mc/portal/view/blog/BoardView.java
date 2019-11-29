package com.mc.portal.view.blog;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.blog.Board;
import com.mc.core.service.blog.BoardService;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/board/")
public class BoardView extends SuperView<String, Board> {
	@Autowired
	public BoardView(BoardService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Board en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Board en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Board en) {
		JMapView res = new JMapView();
		try {
			String id2 = request.getParameter("id2");
			if (en.getId() == null) {
				en.setId(id2);
				res.setState(service.save(en) ? OK : "创建排行失败");
			} else {
				Board temp = new Board();
				temp.setId(en.getId());
				temp.setSqlUpdateNew(temp.setName(null), en.getName());
				temp.setSqlUpdateNew(temp.setQueue(null), en.getQueue());
				temp.setSqlUpdateNew(temp.setAddress(null), en.getAddress());
				temp.setSqlUpdateNew(temp.setField(null), en.getField());
				if (!en.getId().equals(id2)) {
					temp.setSqlUpdateNew(temp.setId(null), id2);
				}
				res.setState(service.alter(temp) > 0 ? OK : "更新排行失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Board en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Board().setId(null), true);
		pages.setLink(0, "blog/board/list.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/board_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Board en = new Board();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setQueue(null), en.setAddress(null), en.setField(null), en.setEdited(null));
			List<Board> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Board data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("queue", data.getQueue());
					map.put("address", data.getAddress());
					map.put("field", data.getField());
					map.put("edited", TimeTool.getTime(data.getEdited(), null));
					res.setDatas(map);
				}
				res.put("pages", pages);
				res.setState(OK);
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "pull", method = RequestMethod.POST)
	public JMapView pull(HttpServletRequest request, String id, String time) {
		JMapView res = new JMapView();
		try {
			if (id == null || id.equals("") || time == null || time.equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			
			LinkedHashMap<String, String[]> entry = new LinkedHashMap<String, String[]>();
			if (id.equals("douban250")) {
				entry.put("豆瓣电影 Top 250", new String[] { time, "https://movie.douban.com/top250" });
				for (int i = 0; i < 20; i++) {
					Iterator<Element> it = Jsoup.parse(new URL("https://movie.douban.com/top250?start=" + i * 25), 30000).select("div[class='info']").iterator();
					while (it.hasNext()) {
						Element node = it.next();
						entry.put(node.selectFirst("div[class='hd'] a").attr("href") + ",,,douban250", new String[] { node.selectFirst("span[class='title']").text(), String.valueOf(new Double(Double.parseDouble(node.selectFirst("span[class='rating_num']").text()) * 10).intValue()) });
					}
				}
			} else if (id.equals("imdb250")) {
				entry.put("IMDB 250 Top Rated Movies", new String[] { time, "https://www.imdb.com/chart/top" });
				Iterator<Element> it = Jsoup.parse(new URL("https://www.imdb.com/chart/top"), 30000).select("tbody[class='lister-list'] tr").iterator();
				while (it.hasNext()) {
					Element node = it.next();
					Element title = node.selectFirst("td[class='titleColumn'] a");
					String key = title.attr("href").replace("/title/", "");
					String value = node.selectFirst("td[class='ratingColumn imdbRating'] strong").text();
					entry.put("https://www.imdb.com/title/" + key.substring(0, key.indexOf("/")) + "/,,,imdb250", new String[] { title.text(), String.valueOf(new Double(Double.parseDouble(value) * 10).intValue()) });
				}
			} else if (id.equals("imdb-indian")) {
				entry.put("IMDB Top Rated Indian Movies", new String[] { time, "https://www.imdb.com/india/top-rated-indian-movies/" });
				Iterator<Element> it = Jsoup.parse(new URL("https://www.imdb.com/india/top-rated-indian-movies/"), 30000).select("tbody[class='lister-list'] tr").iterator();
				while (it.hasNext()) {
					Element node = it.next();
					Element title = node.selectFirst("td[class='titleColumn'] a");
					String key = title.attr("href").replace("/title/", "");
					String value = node.selectFirst("td[class='ratingColumn imdbRating'] strong").text();
					entry.put("https://www.imdb.com/title/" + key.substring(0, key.indexOf("/")) + "/,,,indian", new String[] { title.text(), String.valueOf(new Double(Double.parseDouble(value) * 10).intValue()) });
				}
			} else if (id.equals("imdb-lowest")) {
				entry.put("IMDB Lowest Rated Movies", new String[] { time, "https://www.imdb.com/chart/bottom" });
				Iterator<Element> it = Jsoup.parse(new URL("https://www.imdb.com/chart/bottom"), 30000).select("tbody[class='lister-list'] tr").iterator();
				while (it.hasNext()) {
					Element node = it.next();
					Element title = node.selectFirst("td[class='titleColumn'] a");
					String key = title.attr("href").replace("/title/", "");
					String value = node.selectFirst("td[class='ratingColumn imdbRating'] strong").text();
					entry.put("https://www.imdb.com/title/" + key.substring(0, key.indexOf("/")) + "/,,,lowest", new String[] { title.text(), String.valueOf(new Double(Double.parseDouble(value) * 10).intValue()) });
				}
			} else {
				this.pull(id, time, entry);
			}
			if (entry.size() > 0) {
				Board en = new Board();
				en.setId(id);
				en.setEntry(JsonTool.write(entry));
				res.setState(service.update(en) ? "抓取榜单成功" : "抓取榜单失败");
			} else {
				res.setState("抓取榜单失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private void pull(String id, String time, LinkedHashMap<String, String[]> res) throws Exception {
		if (id.equals("douban2014")) {
			res.put("1.评分最高的外语电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1889243/,,,1", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/21318488/,,,1", new String[] { "消失的爱人", "87" });
			res.put("https://movie.douban.com/subject/11525673/,,,1", new String[] { "布达佩斯大饭店", "88" });
			res.put("https://movie.douban.com/subject/1793929/,,,1", new String[] { "达拉斯买家俱乐部", "87" });
			res.put("https://movie.douban.com/subject/2209575/,,,1", new String[] { "少年时代", "85" });
			res.put("https://movie.douban.com/subject/6538833/,,,1", new String[] { "内布拉斯加", "86" });
			res.put("https://movie.douban.com/subject/10485647/,,,1", new String[] { "X战警：逆转未来", "82" });
			res.put("https://movie.douban.com/subject/6722879/,,,1", new String[] { "她", "83" });
			res.put("https://movie.douban.com/subject/6874403/,,,1", new String[] { "再次出发之纽约遇见你", "85" });
			res.put("https://movie.douban.com/subject/2133323/,,,1", new String[] { "白日梦想家", "84" });
			
			res.put("2.评分最高的华语电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25798222/,,,2", new String[] { "亲爱的", "84" });
			res.put("https://movie.douban.com/subject/10807909/,,,2", new String[] { "智取威虎山", "77" });
			res.put("https://movie.douban.com/subject/20020577/,,,2", new String[] { "推拿", "78" });
			res.put("https://baike.baidu.com/item/天注定/1095784,,,2", new String[] { "天注定", "71" });
			res.put("https://movie.douban.com/subject/24743711/,,,2", new String[] { "催眠大师", "76" });
			res.put("https://movie.douban.com/subject/21352814/,,,2", new String[] { "归来", "78" });
			res.put("https://movie.douban.com/subject/24745500/,,,2", new String[] { "绣春刀", "75" });
			res.put("https://movie.douban.com/subject/25805741/,,,2", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/21941804/,,,2", new String[] { "白日焰火", "73" });
			res.put("https://movie.douban.com/subject/10771216/,,,2", new String[] { "郊游", "72" });
			
			res.put("https://movie.douban.com/subject/1889243/,,,3", new String[] { "爱是一种力量，能让我们超越时空的维度来感知它的存在。" });
			
			res.put("4.最受关注的院线电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25805741/,,,4", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/1889243/,,,4", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/10485647/,,,4", new String[] { "X战警：逆转未来", "82" });
			res.put("https://movie.douban.com/subject/7054604/,,,4", new String[] { "变形金刚4：绝迹重生", "65" });
			res.put("https://movie.douban.com/subject/6390823/,,,4", new String[] { "美国队长2", "79" });
			res.put("https://movie.douban.com/subject/25717233/,,,4", new String[] { "心花路放", "71" });
			res.put("https://movie.douban.com/subject/4746257/,,,4", new String[] { "明日边缘", "81" });
			res.put("https://movie.douban.com/subject/24743711/,,,4", new String[] { "催眠大师", "76" });
			res.put("https://movie.douban.com/subject/7065154/,,,4", new String[] { "银河护卫队", "80" });
			res.put("https://movie.douban.com/subject/21352814/,,,4", new String[] { "归来", "78" });
			
			res.put("5.最受关注的非院线电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/11525673/,,,5", new String[] { "布达佩斯大饭店", "88" });
			res.put("https://movie.douban.com/subject/6722879/,,,5", new String[] { "她", "83" });
			res.put("https://movie.douban.com/subject/2997076/,,,5", new String[] { "华尔街之狼", "77" });
			res.put("https://movie.douban.com/subject/10577869/,,,5", new String[] { "时空恋旅人", "87" });
			res.put("https://movie.douban.com/subject/1793929/,,,5", new String[] { "达拉斯买家俱乐部", "87" });
			res.put("https://movie.douban.com/subject/2133323/,,,5", new String[] { "白日梦想家", "84" });
			res.put("https://movie.douban.com/subject/21318488/,,,5", new String[] { "消失的爱人", "87" });
			res.put("https://baike.baidu.com/item/天注定/1095784,,,5", new String[] { "天注定", "71" });
			res.put("https://movie.douban.com/subject/6985803/,,,5", new String[] { "少年斯派维的奇异旅行", "85" });
			res.put("https://movie.douban.com/subject/2209575/,,,5", new String[] { "少年时代", "85" });
			
			res.put("https://movie.douban.com/subject/7065154/,,,6", new String[] { "I Am Groot!" });
			
			res.put("7.年度冷门佳片", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/22265121/,,,7", new String[] { "另一个故乡", "86" });
			res.put("https://movie.douban.com/subject/25740192/,,,7", new String[] { "骄傲", "83" });
			res.put("https://movie.douban.com/subject/20441632/,,,7", new String[] { "爱，简单", "82" });
			res.put("https://movie.douban.com/subject/25750969/,,,7", new String[] { "夜行者", "83" });
			res.put("https://movie.douban.com/subject/21770915/,,,7", new String[] { "冬眠", "81" });
			res.put("https://movie.douban.com/subject/25794230/,,,7", new String[] { "吸血鬼生活", "79" });
			res.put("https://movie.douban.com/subject/25817712/,,,7", new String[] { "一路有你", "80" });
			res.put("https://movie.douban.com/subject/10546747/,,,7", new String[] { "法官老爹", "78" });
			res.put("https://movie.douban.com/subject/25858604/,,,7", new String[] { "普罗旺斯的夏天", "83" });
			res.put("https://movie.douban.com/subject/25840484/,,,7", new String[] { "教师日记", "78" });
			
			res.put("8.评分最高的韩国电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/21937445/,,,8", new String[] { "辩护人", "92" });
			res.put("https://movie.douban.com/subject/24879820/,,,8", new String[] { "奇怪的她", "83" });
			res.put("https://movie.douban.com/subject/6080840/,,,8", new String[] { "回家的路", "85" });
			res.put("https://movie.douban.com/subject/25823035/,,,8", new String[] { "夜间飞行", "82" });
			res.put("https://movie.douban.com/subject/25766529/,,,8", new String[] { "走到尽头", "79" });
			res.put("https://movie.douban.com/subject/25780578/,,,8", new String[] { "好朋友们", "76" });
			res.put("https://movie.douban.com/subject/23712691/,,,8", new String[] { "优雅的谎言", "75" });
			res.put("https://movie.douban.com/subject/25762566/,,,8", new String[] { "道熙呀", "77" });
			res.put("https://movie.douban.com/subject/24879816/,,,8", new String[] { "计划男", "73" });
			res.put("https://movie.douban.com/subject/3071441/,,,8", new String[] { "雪国列车", "73" });
			
			res.put("9.评分最高的日本电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/24741412/,,,9", new String[] { "哪啊哪啊神去村", "85" });
			res.put("https://movie.douban.com/subject/10571509/,,,9", new String[] { "如父如子", "85" });
			res.put("https://movie.douban.com/subject/20389706/,,,9", new String[] { "小小的家", "81" });
			res.put("https://movie.douban.com/subject/10540062/,,,9", new String[] { "少年H", "83" });
			res.put("https://movie.douban.com/subject/20426995/,,,9", new String[] { "向阳处的她", "79" });
			res.put("https://movie.douban.com/subject/20445157/,,,9", new String[] { "神的病历簿2", "79" });
			res.put("https://movie.douban.com/subject/11523496/,,,9", new String[] { "去见小洋葱的母亲", "77" });
			res.put("https://movie.douban.com/subject/21339392/,,,9", new String[] { "三分之一", "77" });
			res.put("https://movie.douban.com/subject/24858414/,,,9", new String[] { "白雪公主杀人事件", "75" });
			res.put("https://movie.douban.com/subject/19955790/,,,9", new String[] { "地狱为何恶劣", "75" });
			
			res.put("10.评分最高的欧洲电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/10577869/,,,10", new String[] { "时空恋旅人", "87" });
			res.put("https://movie.douban.com/subject/6985803/,,,10", new String[] { "少年斯派维的奇异旅行", "85" });
			res.put("https://movie.douban.com/subject/19973780/,,,10", new String[] { "菲洛梅娜", "84" });
			res.put("https://movie.douban.com/subject/19955828/,,,10", new String[] { "穿裘皮的维纳斯", "81" });
			res.put("https://movie.douban.com/subject/10763928/,,,10", new String[] { "弗兰克", "79" });
			res.put("https://movie.douban.com/subject/6827727/,,,10", new String[] { "女性瘾者：第一部", "77" });
			res.put("https://movie.douban.com/subject/24815950/,,,10", new String[] { "万物理论", "82" });
			res.put("https://movie.douban.com/subject/10598440/,,,10", new String[] { "空中营救", "75" });
			res.put("https://movie.douban.com/subject/25785124/,,,10", new String[] { "盲视", "74" });
			res.put("https://movie.douban.com/subject/21624974/,,,10", new String[] { "两天一夜", "75" });
			
			res.put("https://movie.douban.com/subject/21318488/,,,11", new String[] { "我爱过你，可后来我们做的一切就只有互相怨恨、互相控制，带给我们的只有痛苦……这就是婚姻！" });
			
			res.put("12.评分最高的动画片", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25769362/,,,12", new String[] { "哆啦A梦：伴我同行", "79" });
			res.put("https://movie.douban.com/subject/25741398/,,,12", new String[] { "男孩与世界", "87" });
			res.put("https://movie.douban.com/subject/25884416/,,,12", new String[] { "麦兜我和我妈妈", "84" });
			res.put("https://movie.douban.com/subject/4099231/,,,12", new String[] { "辉夜姬物语", "84" });
			res.put("https://movie.douban.com/subject/4824512/,,,12", new String[] { "驯龙高手2", "79" });
			res.put("https://movie.douban.com/subject/24723061/,,,12", new String[] { "魁拔Ⅲ战神崛起", "82" });
			res.put("https://movie.douban.com/subject/3927734/,,,12", new String[] { "乐高大电影", "79" });
			res.put("https://movie.douban.com/subject/6791750/,,,12", new String[] { "起风了", "79" });
			res.put("https://movie.douban.com/subject/11443314/,,,12", new String[] { "里约大冒险2", "76" });
			res.put("https://movie.douban.com/subject/21350559/,,,12", new String[] { "盒子怪", "77" });
			
			res.put("13.评分最高的纪录片", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25785114/,,,13", new String[] { "互联网之子", "91" });
			res.put("https://movie.douban.com/subject/25763481/,,,13", new String[] { "92班", "88" });
			res.put("https://movie.douban.com/subject/25833522/,,,13", new String[] { "心竞技", "88" });
			res.put("https://movie.douban.com/subject/24851523/,,,13", new String[] { "梦与狂想的王国", "87" });
			res.put("https://movie.douban.com/subject/20254243/,,,13", new String[] { "熊世界", "88" });
			res.put("https://movie.douban.com/subject/21356379/,,,13", new String[] { "寻找薇薇安·迈尔", "87" });
			res.put("https://movie.douban.com/subject/24704954/,,,13", new String[] { "一首摇滚上月球", "86" });
			res.put("https://movie.douban.com/subject/24312655/,,,13", new String[] { "佐杜洛夫斯基的沙丘", "87" });
			res.put("https://movie.douban.com/subject/25747689/,,,13", new String[] { "我们为何骑车", "85" });
			res.put("https://movie.douban.com/subject/23431760/,,,13", new String[] { "人生如戏", "81" });
			
			res.put("https://movie.douban.com/subject/25805741/,,,15", new String[] { "喜欢就会放肆，但爱就是克制。" });
			
			res.put("16.评分最高的英美剧（非新剧）", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/23232876/,,,16-CATENA", new String[] { "权力的游戏 第四季", "96" });
			res.put("https://movie.douban.com/subject/25719291/,,,16-CATENA", new String[] { "新闻编辑室 第三季", "95" });
			res.put("https://movie.douban.com/subject/25837185/,,,16-CATENA", new String[] { "疑犯追踪 第四季", "94" });
			res.put("javascript:;,,,16-CATENA", new String[] { "无耻之徒(美版) 第四季", "0" });
			res.put("javascript:;,,,16-CATENA", new String[] { "行尸走肉第五季", "0" });
			res.put("https://movie.douban.com/subject/22523356/,,,16-CATENA", new String[] { "纸牌屋 第二季", "92" });
			res.put("https://movie.douban.com/subject/25845393/,,,16-CATENA", new String[] { "生活大爆炸 第八季", "90" });
			res.put("https://movie.douban.com/subject/10455629/,,,16-CATENA", new String[] { "神探夏洛克 第三季", "89" });
			res.put("javascript:;,,,16-CATENA", new String[] { "汉尼拔第二季", "0" });
			res.put("https://movie.douban.com/subject/25768128/,,,16-CATENA", new String[] { "唐顿庄园 第五季", "88" });
			
			res.put("17.评分最高的英美剧（新剧）", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/10748120/,,,17-CATENA", new String[] { "真探 第一季", "92" });
			res.put("https://movie.douban.com/subject/25811267/,,,17-CATENA", new String[] { "废柴舅舅 第一季", "90" });
			res.put("https://movie.douban.com/subject/20644938/,,,17-CATENA", new String[] { "硅谷 第一季", "91" });
			res.put("https://movie.douban.com/subject/24297912/,,,17-CATENA", new String[] { "冰血暴 第一季", "89" });
			res.put("https://movie.douban.com/subject/20452350/,,,17-CATENA", new String[] { "9号秘事 第一季", "89" });
			res.put("https://movie.douban.com/subject/24705628/,,,17-CATENA", new String[] { "寻 第一季", "86" });
			res.put("https://movie.douban.com/subject/25884422/,,,17-CATENA", new String[] { "逍遥法外 第一季", "86" });
			res.put("javascript:;,,,17-CATENA", new String[] { "暴君第一季", "0" });
			res.put("https://movie.douban.com/subject/25733164/,,,17-CATENA", new String[] { "哥谭 第一季", "82" });
			res.put("https://movie.douban.com/subject/23116614/,,,17-CATENA", new String[] { "血族 第一季", "73" });
			
			res.put("https://movie.douban.com/subject/23232876/,,,18-CATENA", new String[] { "权力的游戏 第四季" });
			
			res.put("19.评分最高的大陆电视剧", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/20258941/,,,19-CATENA", new String[] { "战长沙", "92" });
			res.put("https://movie.douban.com/subject/25966028/,,,19-CATENA", new String[] { "红色", "92" });
			res.put("https://movie.douban.com/subject/24695611/,,,19-CATENA", new String[] { "北平无战事", "88" });
			res.put("https://movie.douban.com/subject/19965220/,,,19-CATENA", new String[] { "父母爱情", "93" });
			res.put("https://movie.douban.com/subject/25840705/,,,19-CATENA", new String[] { "匆匆那年", "81" });
			res.put("https://movie.douban.com/subject/25800263/,,,19-CATENA", new String[] { "灵魂摆渡", "83" });
			res.put("https://movie.douban.com/subject/24867835/,,,19-CATENA", new String[] { "红高粱", "78" });
			res.put("https://movie.douban.com/subject/10793510/,,,19-CATENA", new String[] { "爱情公寓4", "72" });
			res.put("https://movie.douban.com/subject/25711530/,,,19-CATENA", new String[] { "离婚律师", "72" });
			res.put("https://movie.douban.com/subject/24298399/,,,19-CATENA", new String[] { "金玉良缘", "68" });
			
			res.put("20.评分最高的韩剧", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25870057/,,,20-CATENA", new String[] { "未生", "93" });
			res.put("https://movie.douban.com/subject/25802411/,,,20-CATENA", new String[] { "神的礼物-14天", "85" });
			res.put("https://movie.douban.com/subject/25792815/,,,20-CATENA", new String[] { "密会", "88" });
			res.put("https://movie.douban.com/subject/25809181/,,,20-CATENA", new String[] { "没关系，是爱情啊", "86" });
			res.put("https://movie.douban.com/subject/25851801/,,,20-CATENA", new String[] { "恋爱的发现", "84" });
			res.put("https://movie.douban.com/subject/25928794/,,,20-CATENA", new String[] { "匹诺曹", "82" });
			res.put("https://movie.douban.com/subject/25773973/,,,20-CATENA", new String[] { "需要浪漫3", "82" });
			res.put("https://movie.douban.com/subject/25811005/,,,20-CATENA", new String[] { "坏家伙们", "83" });
			res.put("https://movie.douban.com/subject/25876765/,,,20-CATENA", new String[] { "不要恋爱要结婚", "78" });
			res.put("https://movie.douban.com/subject/25785224/,,,20-CATENA", new String[] { "急诊男女", "72" });
			
			res.put("21.评分最高的日剧", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25897313/,,,21-CATENA", new String[] { "昼颜：工作日下午3点的恋人们", "86" });
			res.put("https://movie.douban.com/subject/25940269/,,,21-CATENA", new String[] { "对不起青春", "90" });
			res.put("https://movie.douban.com/subject/25958786/,,,21-CATENA", new String[] { "深夜食堂3", "89" });
			res.put("https://movie.douban.com/subject/25960944/,,,21-CATENA", new String[] { "为了N", "88" });
			res.put("https://movie.douban.com/subject/25780651/,,,21-CATENA", new String[] { "明天，妈妈不在", "88" });
			res.put("https://movie.douban.com/subject/25804453/,,,21-CATENA", new String[] { "大川端侦探社", "85" });
			res.put("https://movie.douban.com/subject/25823110/,,,21-CATENA", new String[] { "BORDER", "85" });
			res.put("https://movie.douban.com/subject/25975924/,,,21-CATENA", new String[] { "亲密姐妹", "80" });
			res.put("https://movie.douban.com/subject/25874886/,,,21-CATENA", new String[] { "律政英雄2014", "81" });
			res.put("https://movie.douban.com/subject/25933326/,,,21-CATENA", new String[] { "今天不上班", "74" });
			
			res.put("22.最受关注的大陆综艺", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25826679/,,,22-CATENA", new String[] { "爸爸去哪儿 第二季", "74" });
			res.put("https://movie.douban.com/subject/25864150/,,,22-CATENA", new String[] { "十二道锋味", "69" });
			res.put("https://movie.douban.com/subject/25864698/,,,22-CATENA", new String[] { "花儿与少年 第一季", "71" });
			res.put("https://movie.douban.com/subject/25899362/,,,22-CATENA", new String[] { "奔跑吧兄弟 第一季", "74" });
			res.put("https://movie.douban.com/subject/25804684/,,,22-CATENA", new String[] { "我是歌手 第二季", "76" });
			res.put("https://movie.douban.com/subject/25868112/,,,22-CATENA", new String[] { "爸爸回来了 第一季", "74" });
			res.put("https://movie.douban.com/subject/25903028/,,,22-CATENA", new String[] { "中国好声音 第三季", "58" });
			res.put("https://movie.douban.com/subject/26021814/,,,22-CATENA", new String[] { "极速前进 第一季", "87" });
			res.put("https://movie.douban.com/subject/25777375/,,,22-CATENA", new String[] { "中国好歌曲 第一季", "83" });
			res.put("https://movie.douban.com/subject/25985617/,,,22-CATENA", new String[] { "一年级·小学季", "78" });
			
			res.put("https://movie.douban.com/subject/2209575/,,,23", new String[] { "我只是以为会有更多。" });
			
			res.put("https://movie.douban.com/subject/20020577/,,,28", new String[] { "对面走过来一个人，你撞上去了，那是爱情；对面开过来一辆车，你撞上去了，是车祸。但是呢，车和车总是撞，人和人总是让。" });
			
			res.put("https://movie.douban.com/subject/6985803/,,,31", new String[] { "水的特别之处在于，它们总能找到阻力最小的道路，对人类而言，情况刚刚相反。" });
			
			res.put("32.最受关注的影评", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25805741/,,,32", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/24404677/,,,32", new String[] { "超体", "72" });
			res.put("https://movie.douban.com/subject/24847340/,,,32", new String[] { "小时代3：刺金时代", "44" });
			res.put("https://movie.douban.com/subject/25717233/,,,32", new String[] { "心花路放", "71" });
			res.put("https://movie.douban.com/subject/7065154/,,,32", new String[] { "银河护卫队", "80" });
			res.put("https://movie.douban.com/subject/21941804/,,,32", new String[] { "白日焰火", "73" });
			res.put("https://movie.douban.com/subject/10485647/,,,32", new String[] { "X战警：逆转未来", "82" });
			res.put("https://movie.douban.com/subject/10545939/,,,32", new String[] { "黄金时代", "72" });
			
			res.put("33.最受关注的预告片", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/10545939/,,,33", new String[] { "黄金时代", "72" });
			res.put("https://movie.douban.com/subject/25798222/,,,33", new String[] { "亲爱的", "84" });
			res.put("https://movie.douban.com/subject/24404677/,,,33", new String[] { "超体", "72" });
			res.put("https://movie.douban.com/subject/11525673/,,,33", new String[] { "布达佩斯大饭店", "88" });
			res.put("https://movie.douban.com/subject/25805741/,,,33", new String[] { "后会无期", "71" });
			
			res.put("34.最受关注的问答", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1889243/,,,34", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/6390823/,,,34", new String[] { "美国队长2", "79" });
			res.put("https://movie.douban.com/subject/25805741/,,,34", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/21352814/,,,34", new String[] { "归来", "78" });
			res.put("https://baike.baidu.com/item/天注定/1095784,,,34", new String[] { "天注定", "71" });
			res.put("https://movie.douban.com/subject/21941804/,,,34", new String[] { "白日焰火", "73" });
			res.put("https://movie.douban.com/subject/7054604/,,,34", new String[] { "变形金刚4", "65" });
			res.put("https://movie.douban.com/subject/6722879/,,,34", new String[] { "她", "83" });
			res.put("https://movie.douban.com/subject/4746257/,,,34", new String[] { "明日边缘", "81" });
			res.put("https://movie.douban.com/subject/25807345/,,,34", new String[] { "彗星来的那一夜", "85" });
			
			res.put("36.2014豆瓣APP热门讨论电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25805741/,,,36", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/1889243/,,,36", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/6126442/,,,36", new String[] { "一步之遥", "64" });
			res.put("https://movie.douban.com/subject/24745500/,,,36", new String[] { "绣春刀", "75" });
			res.put("https://movie.douban.com/subject/25779218/,,,36", new String[] { "匆匆那年", "54" });
			
			res.put("37.1月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/4915857/,,,37", new String[] { "神偷奶爸2", "80" });
			res.put("https://movie.douban.com/subject/3804891/,,,37", new String[] { "无人区", "82" });
			res.put("https://movie.douban.com/subject/5323957/,,,37", new String[] { "安德的游戏", "69" });
			res.put("https://movie.douban.com/subject/21937452/,,,37", new String[] { "素媛", "92" });
			res.put("https://movie.douban.com/subject/10577869/,,,37", new String[] { "时空恋旅人", "87" });
			
			res.put("38.2月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/4202982/,,,38", new String[] { "冰雪奇缘", "83" });
			res.put("https://movie.douban.com/subject/11606328/,,,38", new String[] { "霍比特人2：史矛革之战", "82" });
			res.put("https://movie.douban.com/subject/25785314/,,,38", new String[] { "爸爸去哪儿", "59" });
			res.put("https://movie.douban.com/subject/5317291/,,,38", new String[] { "西游记之大闹天宫", "42" });
			res.put("https://movie.douban.com/subject/24736566/,,,38", new String[] { "北京爱情故事", "61" });
			
			res.put("39.3月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/3071441/,,,39", new String[] { "雪国列车", "73" });
			res.put("https://movie.douban.com/subject/21941804/,,,39", new String[] { "白日焰火", "73" });
			res.put("https://movie.douban.com/subject/20257326/,,,39", new String[] { "极品飞车", "72" });
			res.put("https://movie.douban.com/subject/1793929/,,,39", new String[] { "达拉斯买家俱乐部", "87" });
			res.put("https://baike.baidu.com/item/天注定/1095784,,,34", new String[] { "天注定", "71" });
			
			res.put("https://movie.douban.com/subject/22733673/,,,40", new String[] { "这世上你没办法选择不受伤害，但你可以选择被谁伤害。" });
			
			res.put("41.4月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/6390823/,,,41", new String[] { "美国队长2", "79" });
			res.put("https://movie.douban.com/subject/11443314/,,,41", new String[] { "里约大冒险2", "76" });
			res.put("https://movie.douban.com/subject/24843198/,,,41", new String[] { "同桌的你", "59" });
			res.put("https://movie.douban.com/subject/10810745/,,,41", new String[] { "超验骇客", "65" });
			res.put("https://movie.douban.com/subject/2133323/,,,41", new String[] { "白日梦想家", "84" });
			
			res.put("42.5月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/10485647/,,,42", new String[] { "X战警：逆转未来", "82" });
			res.put("https://movie.douban.com/subject/24743711/,,,42", new String[] { "催眠大师", "76" });
			res.put("https://movie.douban.com/subject/6082518/,,,42", new String[] { "超凡蜘蛛侠2", "74" });
			res.put("https://movie.douban.com/subject/21352814/,,,42", new String[] { "归来", "78" });
			res.put("https://movie.douban.com/subject/24879820/,,,42", new String[] { "奇怪的她", "83" });
			
			res.put("43.6月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/4746257/,,,43", new String[] { "明日边缘", "81" });
			res.put("https://movie.douban.com/subject/2063914/,,,43", new String[] { "哥斯拉", "84" });
			res.put("https://movie.douban.com/subject/7054604/,,,43", new String[] { "变形金刚4：绝迹重生", "65" });
			res.put("https://movie.douban.com/subject/11525673/,,,43", new String[] { "布达佩斯大饭店", "88" });
			res.put("https://movie.douban.com/subject/4301224/,,,43", new String[] { "沉睡魔咒", "69" });
			
			res.put("https://movie.douban.com/subject/6874403/,,,44", new String[] { "我之所以爱音乐，是因为它让每一个平凡的瞬间，都充满了意义。生活里的很多细节，因为有了音乐而变成闪亮的珍珠。" });
			
			res.put("45.7月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25805741/,,,45", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/24847340/,,,45", new String[] { "小时代3：刺金时代", "44" });
			res.put("https://movie.douban.com/subject/24879858/,,,45", new String[] { "分手大师", "50" });
			res.put("https://movie.douban.com/subject/25755645/,,,45", new String[] { "老男孩猛龙过江", "57" });
			res.put("https://movie.douban.com/subject/6985803/,,,45", new String[] { "少年斯派维的奇异旅行", "85" });
			
			res.put("46.8月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/4824512/,,,46", new String[] { "驯龙高手2", "79" });
			res.put("https://movie.douban.com/subject/24745500/,,,46", new String[] { "绣春刀", "75" });
			res.put("https://movie.douban.com/subject/3718269/,,,46", new String[] { "暴力街区", "69" });
			res.put("https://movie.douban.com/subject/25777330/,,,46", new String[] { "闺蜜", "54" });
			res.put("https://movie.douban.com/subject/24743711/,,,46", new String[] { "催眠大师", "76" });
			
			res.put("47.9月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/7046723/,,,47", new String[] { "猩球崛起2：黎明之战", "75" });
			res.put("https://movie.douban.com/subject/25798222/,,,47", new String[] { "亲爱的", "84" });
			res.put("https://movie.douban.com/subject/11610281/,,,47", new String[] { "敢死队3", "67" });
			res.put("https://movie.douban.com/subject/25713408/,,,47", new String[] { "一生一世", "51" });
			res.put("https://movie.douban.com/subject/6424814/,,,47", new String[] { "分歧者：异类觉醒", "64" });
			
			res.put("https://movie.douban.com/subject/24815950/,,,48", new String[] { "我爱过你，我尽力了。" });
			
			res.put("49.10月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25717233/,,,49", new String[] { "心花路放", "71" });
			res.put("https://movie.douban.com/subject/7065154/,,,49", new String[] { "银河护卫队", "80" });
			res.put("https://movie.douban.com/subject/10545939/,,,49", new String[] { "黄金时代", "72" });
			res.put("https://movie.douban.com/subject/25807345/,,,49", new String[] { "彗星来的那一夜", "85" });
			res.put("https://movie.douban.com/subject/6874403/,,,49", new String[] { "再次出发之纽约遇见你", "85" });
			
			res.put("50.11月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1889243/,,,50", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/24404677/,,,50", new String[] { "超体", "72" });
			res.put("https://movie.douban.com/subject/3217149/,,,50", new String[] { "忍者神龟：变种时代", "64" });
			res.put("https://movie.douban.com/subject/21349345/,,,50", new String[] { "移动迷宫", "68" });
			res.put("https://movie.douban.com/subject/23331914/,,,50", new String[] { "狂怒", "78" });
			
			res.put("51.12月最受关注电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/6126442/,,,51", new String[] { "一步之遥", "64" });
			res.put("https://movie.douban.com/subject/25779218/,,,51", new String[] { "匆匆那年", "54" });
			res.put("https://movie.douban.com/subject/21318488/,,,51", new String[] { "消失的爱人", "87" });
			res.put("https://movie.douban.com/subject/3078390/,,,51", new String[] { "太平轮(上)", "58" });
			res.put("https://movie.douban.com/subject/4881607/,,,51", new String[] { "撒娇女人最好命", "57" });
			
			res.put("53.年度最受关注的2010s电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/3541415/,,,53", new String[] { "盗梦空间", "93" });
			res.put("https://movie.douban.com/subject/3793783/,,,53", new String[] { "地心引力", "78" });
			res.put("https://movie.douban.com/subject/21937452/,,,53", new String[] { "素媛", "92" });
			res.put("https://movie.douban.com/subject/5912992/,,,53", new String[] { "熔炉", "93" });
			res.put("https://movie.douban.com/subject/3319755/,,,53", new String[] { "怦然心动", "90" });
			res.put("https://movie.douban.com/subject/1929463/,,,53", new String[] { "少年派的奇幻漂流", "90" });
			res.put("https://movie.douban.com/subject/3742360/,,,53", new String[] { "让子弹飞", "87" });
			res.put("https://movie.douban.com/subject/1907966/,,,53", new String[] { "疯狂原始人", "87" });
			res.put("https://movie.douban.com/subject/4920528/,,,53", new String[] { "那些年，我们一起追的女孩", "81" });
			res.put("https://movie.douban.com/subject/6786002/,,,53", new String[] { "触不可及", "92" });
			
			res.put("54.年度最受关注的2000s电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/3793023/,,,54", new String[] { "三傻大闹宝莱坞", "92" });
			res.put("https://movie.douban.com/subject/1291561/,,,54", new String[] { "千与千寻", "93" });
			res.put("https://movie.douban.com/subject/3011091/,,,54", new String[] { "忠犬八公的故事", "93" });
			res.put("https://movie.douban.com/subject/1849031/,,,54", new String[] { "当幸福来敲门", "90" });
			res.put("https://movie.douban.com/subject/1309046/,,,54", new String[] { "V字仇杀队", "88" });
			res.put("https://movie.douban.com/subject/1291549/,,,54", new String[] { "放牛班的春天", "93" });
			res.put("https://movie.douban.com/subject/2129039/,,,54", new String[] { "飞屋环游记", "89" });
			res.put("https://movie.douban.com/subject/1652587/,,,54", new String[] { "阿凡达", "87" });
			res.put("https://movie.douban.com/subject/1292215/,,,54", new String[] { "天使爱美丽", "87" });
			res.put("https://movie.douban.com/subject/2131459/,,,54", new String[] { "机器人总动员", "93" });
			
			res.put("55.年度最受关注的90年代电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1295644/,,,55", new String[] { "这个杀手不太冷", "94" });
			res.put("https://movie.douban.com/subject/1292052/,,,55", new String[] { "肖申克的救赎", "96" });
			res.put("https://movie.douban.com/subject/1292722/,,,55", new String[] { "泰坦尼克号", "93" });
			res.put("https://movie.douban.com/subject/1292720/,,,55", new String[] { "阿甘正传", "94" });
			res.put("https://movie.douban.com/subject/1292213/,,,55", new String[] { "大话西游之大圣娶亲", "92" });
			res.put("https://movie.douban.com/subject/1291546/,,,55", new String[] { "霸王别姬", "96" });
			res.put("https://movie.douban.com/subject/1292001/,,,55", new String[] { "海上钢琴师", "92" });
			res.put("https://movie.douban.com/subject/1292370/,,,55", new String[] { "剪刀手爱德华", "87" });
			res.put("https://movie.douban.com/subject/1292064/,,,55", new String[] { "楚门的世界", "92" });
			res.put("https://movie.douban.com/subject/1292000/,,,55", new String[] { "搏击俱乐部", "90" });
			
			res.put("56.年度最受关注的80年代电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1291560/,,,56", new String[] { "龙猫", "92" });
			res.put("https://movie.douban.com/subject/1291828/,,,56", new String[] { "天堂电影院", "92" });
			res.put("https://movie.douban.com/subject/1291548/,,,56", new String[] { "死亡诗社", "90" });
			res.put("https://movie.douban.com/subject/1297447/,,,56", new String[] { "情女幽魂", "87" });
			res.put("https://movie.douban.com/subject/1291870/,,,56", new String[] { "雨人", "87" });
			res.put("https://movie.douban.com/subject/1292262/,,,56", new String[] { "美国往事", "91" });
			res.put("https://movie.douban.com/subject/1293172/,,,56", new String[] { "末代皇帝", "91" });
			res.put("https://movie.douban.com/subject/1297574/,,,56", new String[] { "英雄本色", "86" });
			res.put("https://movie.douban.com/subject/1294638/,,,56", new String[] { "E.T. 外星人", "85" });
			res.put("https://movie.douban.com/subject/1306505/,,,56", new String[] { "红高粱", "83" });
			
			res.put("57.年度最受关注的70年代及以前电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1293839/,,,57", new String[] { "罗马假日", "90" });
			res.put("https://movie.douban.com/subject/1291841/,,,57", new String[] { "教父", "92" });
			res.put("https://movie.douban.com/subject/1292224/,,,57", new String[] { "飞越疯人院", "91" });
			res.put("https://movie.douban.com/subject/1300267/,,,57", new String[] { "乱世佳人", "92" });
			res.put("https://movie.douban.com/subject/1293182/,,,57", new String[] { "十二怒汉", "94" });
			res.put("https://movie.douban.com/subject/1294408/,,,57", new String[] { "音乐之声", "90" });
			res.put("https://movie.douban.com/subject/1292233/,,,57", new String[] { "发条橙", "85" });
			res.put("https://movie.douban.com/subject/1292226/,,,57", new String[] { "2001太空漫游", "87" });
			res.put("https://movie.douban.com/subject/1291879/,,,57", new String[] { "罗生门", "87" });
			res.put("https://movie.douban.com/subject/1292222/,,,57", new String[] { "出租车司机", "84" });
			
			res.put("58.2014豆瓣电影微博热门内容", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/1889243/,,,58", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/1458891/,,,58", new String[] { "哆啦A梦：大雄的大魔境", "83" });
			res.put("https://movie.douban.com/subject/1299398/,,,58", new String[] { "大话西游之月光宝盒", "89" });
			res.put("https://movie.douban.com/subject/1292213/,,,58", new String[] { "大话西游之大圣娶亲", "92" });
			res.put("https://movie.douban.com/subject/11810348/,,,58", new String[] { "马达加斯加的企鹅", "75" });
			
			res.put("59.评分最低的外语电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25715111/,,,59", new String[] { "绝命航班", "34" });
			res.put("https://movie.douban.com/subject/24859795/,,,59", new String[] { "大力神", "48" });
			res.put("https://movie.douban.com/subject/23398777/,,,59", new String[] { "热血高校3", "49" });
			res.put("https://movie.douban.com/subject/3680627/,,,59", new String[] { "屠魔战士", "52" });
			res.put("https://movie.douban.com/subject/10456894/,,,59", new String[] { "盟军夺宝队", "55" });
			res.put("https://movie.douban.com/subject/3014957/,,,59", new String[] { "一触即发", "57" });
			res.put("https://movie.douban.com/subject/6959152/,,,59", new String[] { "诺亚方舟：创世之旅", "58" });
			res.put("https://movie.douban.com/subject/2083735/,,,59", new String[] { "庞贝末日", "60" });
			res.put("https://movie.douban.com/subject/3148089/,,,59", new String[] { "300勇士：帝国崛起", "61" });
			res.put("https://movie.douban.com/subject/3157583/,,,59", new String[] { "宙斯之子：赫拉克勒斯", "60" });
			
			res.put("60.评分最低的华语电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/24163542/,,,60", new String[] { "放手爱", "23" });
			res.put("https://movie.douban.com/subject/6973460/,,,60", new String[] { "冰封：重生之门", "37" });
			res.put("https://movie.douban.com/subject/10807916/,,,60", new String[] { "白发魔女传之明月天国", "37" });
			res.put("https://movie.douban.com/subject/5317291/,,,60", new String[] { "西游记之大闹天宫", "42" });
			res.put("https://movie.douban.com/subject/24847340/,,,60", new String[] { "小时代3：刺金时代", "44" });
			res.put("https://movie.douban.com/subject/11614603/,,,60", new String[] { "整容日记", "46" });
			res.put("https://movie.douban.com/subject/10604893/,,,60", new String[] { "四大名捕大结局", "48" });
			res.put("https://movie.douban.com/subject/25831326/,,,60", new String[] { "临时同居", "50" });
			res.put("https://movie.douban.com/subject/25713408/,,,60", new String[] { "一生一世", "51" });
			res.put("https://movie.douban.com/subject/20513061/,,,60", new String[] { "京城81号", "48" });
			
			res.put("https://movie.douban.com/subject/25769362/,,,61", new String[] { "之前一直觉得很平常的事，到了这时才觉得如此重要。" });
			
			res.put("62.年度电影原声", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/25805741/,,,62", new String[] { "后会无期", "71" });
			res.put("https://movie.douban.com/subject/1889243/,,,62", new String[] { "星际穿越", "92" });
			res.put("https://movie.douban.com/subject/7065154/,,,62", new String[] { "银河护卫队", "80" });
			res.put("https://movie.douban.com/subject/6887029/,,,62", new String[] { "醉乡民谣", "81" });
			res.put("https://movie.douban.com/subject/4202982/,,,62", new String[] { "冰雪奇缘", "83" });
			res.put("https://movie.douban.com/subject/6722879/,,,62", new String[] { "她", "83" });
			res.put("https://movie.douban.com/subject/6874403/,,,62", new String[] { "再次出发之纽约遇见你", "85" });
			res.put("https://movie.douban.com/subject/11525673/,,,62", new String[] { "布达佩斯大饭店", "88" });
			res.put("https://movie.douban.com/subject/2209575/,,,62", new String[] { "少年时代", "85" });
			res.put("https://movie.douban.com/subject/5265471/,,,62", new String[] { "唯爱永生", "75" });
			
			res.put("63.2015最值得期待的电影", new String[] { time, "https://movie.douban.com/review2014/" });
			res.put("https://movie.douban.com/subject/10741834/,,,63", new String[] { "复仇者联盟2：奥创纪元", "73" });
			res.put("javascript:;,,,63", new String[] { "五十度灰", "0" });
			res.put("https://movie.douban.com/subject/3993588/,,,63", new String[] { "狼图腾", "69" });
			res.put("https://movie.douban.com/subject/25858759/,,,63", new String[] { "有一个地方只有我们知道", "49" });
			res.put("https://movie.douban.com/subject/5154799/,,,63", new String[] { "木星上行", "54" });
			res.put("https://movie.douban.com/subject/6966617/,,,63", new String[] { "圣杯骑士", "59" });
			res.put("https://movie.douban.com/subject/20645098/,,,63", new String[] { "小王子", "81" });
			res.put("https://movie.douban.com/subject/24879839/,,,63", new String[] { "道士下山", "54" });
			res.put("https://movie.douban.com/subject/11540651/,,,63", new String[] { "许三观", "72" });
			res.put("https://movie.douban.com/subject/11624706/,,,63", new String[] { "小黄人大眼萌", "74" });
		} else if (id.equals("douban2015")) {
			res.put("1.2015评分最高的外语电影", new String[] { time, "https://movie.douban.com/annual/2015#1" });
			res.put("https://movie.douban.com/subject/24750126/,,,1", new String[] { "荒蛮故事", "88" });
			res.put("https://movie.douban.com/subject/10757577/,,,1", new String[] { "卡罗尔", "83" });
			res.put("https://movie.douban.com/subject/24405378/,,,1", new String[] { "王牌特工：特工学院", "84" });
			res.put("https://movie.douban.com/subject/26393561/,,,1", new String[] { "小萝莉的猴神大叔", "85" });
			res.put("https://movie.douban.com/subject/3592854/,,,1", new String[] { "疯狂的麦克斯4：狂暴之路", "86" });
			res.put("https://movie.douban.com/subject/25864085/,,,1", new String[] { "火星救援", "84" });
			res.put("https://movie.douban.com/subject/23761370/,,,1", new String[] { "速度与激情7", "83" });
			res.put("https://movie.douban.com/subject/25955491/,,,1", new String[] { "罪恶之家", "83" });
			res.put("https://movie.douban.com/subject/25766754/,,,1", new String[] { "年轻气盛", "82" });
			res.put("https://movie.douban.com/subject/25738406/,,,1", new String[] { "如晴天，似雨天", "83" });
			
			res.put("2.2015评分最高的华语电影", new String[] { time, "https://movie.douban.com/annual/2015#2" });
			res.put("https://movie.douban.com/subject/25917973/,,,2", new String[] { "心迷宫", "87" });
			res.put("https://movie.douban.com/subject/24751756/,,,2", new String[] { "老炮儿", "78" });
			res.put("https://movie.douban.com/subject/25919910/,,,2", new String[] { "师父", "81" });
			res.put("https://movie.douban.com/subject/26366465/,,,2", new String[] { "我的少女时代", "78" });
			res.put("https://movie.douban.com/subject/24875534/,,,2", new String[] { "十二公民", "83" });
			res.put("https://movie.douban.com/subject/25890005/,,,2", new String[] { "山河故人", "79" });
			res.put("https://movie.douban.com/subject/25798448/,,,2", new String[] { "解救吾先生", "78" });
			res.put("https://movie.douban.com/subject/24719063/,,,2", new String[] { "烈日灼心", "80" });
			res.put("https://movie.douban.com/subject/25926267/,,,2", new String[] { "一个勺子", "77" });
			res.put("https://movie.douban.com/subject/20514902/,,,2", new String[] { "闯入者", "76" });
			
			res.put("https://movie.douban.com/subject/2303845/,,,3", new String[] { "汝今剑术已成，唯不能斩绝人伦之情" });
			
			res.put("4.2015最受关注的院线电影", new String[] { time, "https://movie.douban.com/annual/2015#4" });
			res.put("https://movie.douban.com/subject/26277313/,,,4", new String[] { "西游记之大圣归来", "83" });
			res.put("https://movie.douban.com/subject/24405378/,,,4", new String[] { "王牌特工：特工学院", "84" });
			res.put("https://movie.douban.com/subject/25964071/,,,4", new String[] { "夏洛特烦恼", "75" });
			res.put("https://movie.douban.com/subject/23761370/,,,4", new String[] { "速度与激情7", "83" });
			res.put("https://movie.douban.com/subject/25723907/,,,4", new String[] { "捉妖记", "67" });
			res.put("https://movie.douban.com/subject/10440138/,,,4", new String[] { "侏罗纪世界", "77" });
			res.put("https://movie.douban.com/subject/10741834/,,,4", new String[] { "复仇者联盟2：奥创纪元", "73" });
			res.put("https://movie.douban.com/subject/25895276/,,,4", new String[] { "煎饼侠", "59" });
			res.put("https://movie.douban.com/subject/25710912/,,,4", new String[] { "港囧", "56" });
			res.put("https://movie.douban.com/subject/24719063/,,,4", new String[] { "烈日灼心", "80" });
			
			res.put("5.2015最受关注的非院线电影", new String[] { time, "https://movie.douban.com/annual/2015#5" });
			res.put("https://movie.douban.com/subject/3592854/,,,5", new String[] { "疯狂的麦克斯4：狂暴之路", "86" });
			res.put("https://movie.douban.com/subject/4160540/,,,5", new String[] { "机械姬", "76" });
			res.put("javascript:;,,,5", new String[] { "五十度灰", "51" });
			res.put("https://movie.douban.com/subject/25752261/,,,5", new String[] { "女间谍", "75" });
			res.put("https://movie.douban.com/subject/25814705/,,,5", new String[] { "小森林.夏秋篇", "89" });
			res.put("https://movie.douban.com/subject/24750126/,,,5", new String[] { "荒蛮故事", "88" });
			res.put("https://movie.douban.com/subject/19957083/,,,5", new String[] { "泰迪熊2", "65" });
			res.put("https://movie.douban.com/subject/25932086/,,,5", new String[] { "我是谁：没有绝对安全的系统", "81" });
			res.put("https://movie.douban.com/subject/6845667/,,,5", new String[] { "秘密特工", "80" });
			res.put("https://movie.douban.com/subject/25738406/,,,5", new String[] { "如晴天，似雨天", "83" });
			
			res.put("6.2015-2016贺岁档电影推荐", new String[] { time, "https://movie.douban.com/annual/2015#6" });
			res.put("https://movie.douban.com/subject/25827963/,,,6", new String[] { "西游记之孙悟空三打白骨精", "56" });
			res.put("https://movie.douban.com/subject/11589036/,,,6", new String[] { "功夫熊猫3", "76" });
			res.put("https://movie.douban.com/subject/20326665/,,,6", new String[] { "星球大战7：原力觉醒", "71" });
			res.put("https://movie.douban.com/subject/19944106/,,,6", new String[] { "美人鱼", "67" });
			res.put("https://movie.douban.com/subject/26637534/,,,6", new String[] { "奔爱", "38" });
			res.put("https://movie.douban.com/subject/3077412/,,,6", new String[] { "寻龙诀", "75" });
			res.put("https://movie.douban.com/subject/24751756/,,,6", new String[] { "老炮儿", "78" });
			res.put("https://movie.douban.com/subject/26311973/,,,6", new String[] { "唐人街探案", "75" });
			res.put("https://movie.douban.com/subject/25845910/,,,6", new String[] { "小门神", "68" });
			res.put("https://movie.douban.com/subject/25920885/,,,6", new String[] { "神探夏洛克：可恶的新娘", "69" });
			
			res.put("https://movie.douban.com/subject/3592854/,,,7", new String[] { "血袋，见证我吧！我就是那个以最璀璨夺目之姿，直奔英灵殿的人" });
			
			res.put("8.2015年度冷门佳片", new String[] { time, "https://movie.douban.com/annual/2015#8" });
			res.put("https://movie.douban.com/subject/25855951/,,,8", new String[] { "贝利叶一家", "84" });
			res.put("https://movie.douban.com/subject/25882861/,,,8", new String[] { "危楼愚夫", "84" });
			res.put("https://movie.douban.com/subject/10773239/,,,8", new String[] { "小男孩", "82" });
			res.put("https://movie.douban.com/subject/24325923/,,,8", new String[] { "我和厄尔以及将死的女孩", "81" });
			res.put("https://movie.douban.com/subject/11520649/,,,8", new String[] { "麦克法兰", "83" });
			res.put("https://movie.douban.com/subject/26304167/,,,8", new String[] { "出租车", "80" });
			res.put("https://movie.douban.com/subject/25687245/,,,8", new String[] { "诉讼", "83" });
			res.put("https://movie.douban.com/subject/21098725/,,,8", new String[] { "和谐课程", "79" });
			res.put("https://movie.douban.com/subject/26372545/,,,8", new String[] { "野马", "79" });
			res.put("https://movie.douban.com/subject/25821461/,,,8", new String[] { "旅行终点", "79" });
			
			res.put("9.2015评分最高的韩国电影", new String[] { time, "https://movie.douban.com/annual/2015#9" });
			res.put("https://movie.douban.com/subject/25859495/,,,9", new String[] { "思悼", "84" });
			res.put("https://movie.douban.com/subject/21937450/,,,9", new String[] { "国际市场", "83" });
			res.put("https://movie.douban.com/subject/25823132/,,,9", new String[] { "暗杀", "80" });
			res.put("https://movie.douban.com/subject/25919385/,,,9", new String[] { "长寿商会", "78" });
			res.put("https://movie.douban.com/subject/26235839/,,,9", new String[] { "内在美", "75" });
			res.put("https://movie.douban.com/subject/25728010/,,,9", new String[] { "老手", "76" });
			res.put("https://movie.douban.com/subject/25834457/,,,9", new String[] { "偷狗的完美方法", "73" });
			res.put("https://movie.douban.com/subject/26297388/,,,9", new String[] { "这时对那时错", "75" });
			res.put("https://movie.douban.com/subject/11540651/,,,9", new String[] { "许三观", "72" });
			res.put("https://movie.douban.com/subject/26050295/,,,9", new String[] { "妻子小姐", "73" });
			
			res.put("10.2015评分最高的韩国电影", new String[] { time, "https://movie.douban.com/annual/2015#10" });
			res.put("https://movie.douban.com/subject/25814705/,,,10", new String[] { "小森林.夏秋篇", "89" });
			res.put("https://movie.douban.com/subject/25814707/,,,10", new String[] { "小森林.冬春篇", "90" });
			res.put("https://movie.douban.com/subject/25895901/,,,10", new String[] { "海街日记", "87" });
			res.put("https://movie.douban.com/subject/25761178/,,,10", new String[] { "百元之恋", "83" });
			res.put("https://movie.douban.com/subject/26259677/,,,10", new String[] { "垫底辣妹", "82" });
			res.put("https://movie.douban.com/subject/25969201/,,,10", new String[] { "投靠女与出走男", "82" });
			res.put("https://movie.douban.com/subject/21767183/,,,10", new String[] { "0.5毫米", "83" });
			res.put("https://movie.douban.com/subject/25958787/,,,10", new String[] { "深夜食堂电影版", "78" });
			res.put("https://movie.douban.com/subject/26270517/,,,10", new String[] { "愚人节", "78" });
			res.put("https://movie.douban.com/subject/26140405/,,,10", new String[] { "爱的成人式", "76" });
			
			res.put("11.2015评分最高的欧洲电影", new String[] { time, "https://movie.douban.com/annual/2015#11" });
			res.put("https://movie.douban.com/subject/24405378/,,,11", new String[] { "王牌特工：特工学院", "84" });
			res.put("https://movie.douban.com/subject/25955491/,,,11", new String[] { "罪恶之家", "83" });
			res.put("https://movie.douban.com/subject/25882861/,,,11", new String[] { "危楼愚夫", "84" });
			res.put("https://movie.douban.com/subject/25855951/,,,11", new String[] { "贝利叶一家", "84" });
			res.put("https://movie.douban.com/subject/25766754/,,,11", new String[] { "年轻气盛", "82" });
			res.put("https://movie.douban.com/subject/20514947/,,,11", new String[] { "龙虾", "76" });
			res.put("https://movie.douban.com/subject/25932086/,,,11", new String[] { "我是谁：没有绝对安全的系统", "81" });
			res.put("https://movie.douban.com/subject/25727048/,,,11", new String[] { "福尔摩斯先生", "78" });
			res.put("https://movie.douban.com/subject/6521506/,,,11", new String[] { "寒枝雀静", "78" });
			res.put("https://movie.douban.com/subject/19976774/,,,11", new String[] { "锡尔斯玛利亚", "78" });
			
			res.put("https://movie.douban.com/subject/10757577/,,,12", new String[] { "你像是从宇宙中飞来，我的天使" });
			
			res.put("13.2015评分最高的动画片", new String[] { time, "https://movie.douban.com/annual/2015#13" });
			res.put("https://movie.douban.com/subject/10533913/,,,13", new String[] { "头脑特工队", "87" });
			res.put("https://movie.douban.com/subject/11584019/,,,13", new String[] { "海洋之歌", "88" });
			res.put("https://movie.douban.com/subject/24397586/,,,13", new String[] { "小羊肖恩", "84" });
			res.put("https://movie.douban.com/subject/26277313/,,,13", new String[] { "西游记之大圣归来", "83" });
			res.put("https://movie.douban.com/subject/20645098/,,,13", new String[] { "小王子", "81" });
			res.put("https://movie.douban.com/subject/26147706/,,,13", new String[] { "花与爱丽丝杀人事件", "80" });
			res.put("https://movie.douban.com/subject/21327493/,,,13", new String[] { "精灵旅社2", "76" });
			res.put("https://movie.douban.com/subject/25790555/,,,13", new String[] { "记忆中的玛妮", "77" });
			res.put("https://movie.douban.com/subject/6875863/,,,13", new String[] { "恐龙当家", "72" });
			res.put("https://movie.douban.com/subject/20482777/,,,13", new String[] { "不忠", "77" });
			
			res.put("14.2015评分最高的纪录片", new String[] { time, "https://movie.douban.com/annual/2015#14" });
			res.put("https://movie.douban.com/subject/10741871/,,,14", new String[] { "地球之盐", "92" });
			res.put("javascript:;,,,14", new String[] { "穹顶之下", "92" });
			res.put("javascript:;,,,14", new String[] { "大同", "92" });
			res.put("https://movie.douban.com/subject/26276373/,,,14", new String[] { "攀登梅鲁峰", "91" });
			res.put("https://movie.douban.com/subject/26334993/,,,14", new String[] { "科比的缪斯", "91" });
			res.put("https://movie.douban.com/subject/26336727/,,,14", new String[] { "印度的女儿", "89" });
			res.put("https://movie.douban.com/subject/26582012/,,,14", new String[] { "人类", "88" });
			res.put("https://movie.douban.com/subject/25978207/,,,14", new String[] { "亲爱的，不要跨过那条江", "90" });
			res.put("https://movie.douban.com/subject/24532442/,,,14", new String[] { "艾米", "86" });
			res.put("https://movie.douban.com/subject/26279370/,,,14", new String[] { "科特·柯本：烦恼的蒙太奇", "86" });
			
			res.put("16.2015年度LGBT电影", new String[] { time, "https://movie.douban.com/annual/2015#16" });
			res.put("https://movie.douban.com/subject/10757577/,,,16", new String[] { "卡罗尔", "83" });
			res.put("https://movie.douban.com/subject/25785108/,,,16", new String[] { "审判八号提案", "89" });
			res.put("https://movie.douban.com/subject/3071604/,,,16", new String[] { "丹麦女孩", "82" });
			res.put("https://movie.douban.com/subject/25755608/,,,16", new String[] { "新女友", "75" });
			res.put("https://movie.douban.com/subject/6048838/,,,16", new String[] { "爱森斯坦在瓜纳华托", "75" });
			res.put("https://movie.douban.com/subject/26306656/,,,16", new String[] { "醉·生梦死", "72" });
			res.put("https://movie.douban.com/subject/25965348/,,,16", new String[] { "男孩遇见女孩", "75" });
			res.put("https://movie.douban.com/subject/25767853/,,,16", new String[] { "四个月亮", "78" });
			res.put("https://movie.douban.com/subject/25825586/,,,16", new String[] { "圈子", "75" });
			res.put("https://movie.douban.com/subject/21370611/,,,16", new String[] { "圣罗兰传", "71" });
			
			res.put("https://movie.douban.com/subject/20645098/,,,17", new String[] { "所有的大人都曾经是小孩，虽然只有少数的人记得" });
			
			res.put("18.2015评分最高的英美剧（新剧）", new String[] { time, "https://movie.douban.com/annual/2015#18" });
			res.put("https://movie.douban.com/subject/25726259/,,,18-CATENA", new String[] { "风骚律师 第一季", "93" });
			res.put("https://movie.douban.com/subject/26388908/,,,18-CATENA", new String[] { "福斯特医生 第一季", "89" });
			res.put("https://movie.douban.com/subject/25850640/,,,18-CATENA", new String[] { "毒枭 第一季", "93" });
			res.put("https://movie.douban.com/subject/25770124/,,,18-CATENA", new String[] { "政局边缘", "92" });
			res.put("https://movie.douban.com/subject/23011215/,,,18-CATENA", new String[] { "超感猎杀 第一季", "88" });
			res.put("https://movie.douban.com/subject/26170816/,,,18-CATENA", new String[] { "真实的人类 第一季", "84" });
			res.put("https://movie.douban.com/subject/25986676/,,,18-CATENA", new String[] { "伦敦谍影", "80" });
			res.put("https://movie.douban.com/subject/25867544/,,,18-CATENA", new String[] { "特工卡特 第一季", "83" });
			res.put("https://movie.douban.com/subject/25769160/,,,18-CATENA", new String[] { "超胆侠 第一季", "83" });
			res.put("https://movie.douban.com/subject/25832936/,,,18-CATENA", new String[] { "嘻哈帝国 第一季", "81" });
			
			res.put("19.2015评分最高的英美剧（非新剧）", new String[] { time, "https://movie.douban.com/annual/2015#19" });
			res.put("https://movie.douban.com/subject/25826612/,,,19-CATENA", new String[] { "权力的游戏 第五季", "93" });
			res.put("https://movie.douban.com/subject/25831924/,,,19-CATENA", new String[] { "无耻之徒(美版) 第五季", "93" });
			res.put("https://movie.douban.com/subject/25919897/,,,19-CATENA", new String[] { "冰血暴 第二季", "92" });
			res.put("https://movie.douban.com/subject/24748854/,,,19-CATENA", new String[] { "极品基老伴 第二季", "94" });
			res.put("https://movie.douban.com/subject/25871679/,,,19-CATENA", new String[] { "硅谷 第二季", "92" });
			res.put("https://baike.baidu.com/item/行尸走肉第六季,,,19-CATENA", new String[] { "行尸走肉 第六季", "88" });
			res.put("https://movie.douban.com/subject/26254370/,,,19-CATENA", new String[] { "唐顿庄园 第六季", "93" });
			res.put("https://movie.douban.com/subject/26385630/,,,19-CATENA", new String[] { "摩登家庭 第七季", "93" });
			res.put("https://movie.douban.com/subject/25875022/,,,19-CATENA", new String[] { "废柴舅舅 第二季", "88" });
			res.put("https://movie.douban.com/subject/25823412/,,,19-CATENA", new String[] { "纸牌屋 第三季", "84" });
			
			res.put("20.2015告别我们的英美剧（最终季）", new String[] { time, "https://movie.douban.com/annual/2015#20" });
			res.put("https://movie.douban.com/subject/24859448/,,,20-CATENA", new String[] { "广告狂人 第七季", "94" });
			res.put("https://movie.douban.com/subject/26254370/,,,20-CATENA", new String[] { "唐顿庄园 第六季", "93" });
			res.put("https://movie.douban.com/subject/25923092/,,,20-CATENA", new String[] { "公园与游憩 第七季", "93" });
			res.put("https://movie.douban.com/subject/25885786/,,,20-CATENA", new String[] { "超感神探 第七季", "89" });
			res.put("https://movie.douban.com/subject/25905702/,,,20-CATENA", new String[] { "火线警探 第六季", "92" });
			res.put("https://movie.douban.com/subject/25947054/,,,20-CATENA", new String[] { "燃情克利夫兰 第六季", "94" });
			res.put("https://movie.douban.com/subject/25742234/,,,20-CATENA", new String[] { "欢乐合唱团 第六季", "83" });
			res.put("https://movie.douban.com/subject/25834551/,,,20-CATENA", new String[] { "反击 第五季", "81" });
			res.put("https://movie.douban.com/subject/25846035/,,,20-CATENA", new String[] { "好汉两个半 第十二季", "77" });
			res.put("https://movie.douban.com/subject/26263771/,,,20-CATENA", new String[] { "熟女镇 第六季", "81" });
			
			res.put("https://movie.douban.com/subject/23011215/,,,21-CATENA", new String[] { "真正的暴行，是我们太害怕成为真实的自己的时候对自己施加的，这才是不可原谅的" });
			
			res.put("22.2015评分最高的大陆剧", new String[] { time, "https://movie.douban.com/annual/2015#22" });
			res.put("https://movie.douban.com/subject/25754848/,,,22-CATENA", new String[] { "琅琊榜", "92" });
			res.put("https://movie.douban.com/subject/26603847/,,,22-CATENA", new String[] { "毛骗 终结篇", "96" });
			res.put("https://movie.douban.com/subject/26298756/,,,22-CATENA", new String[] { "无心法师", "83" });
			res.put("https://movie.douban.com/subject/25994712/,,,22-CATENA", new String[] { "伪装者", "84" });
			res.put("https://movie.douban.com/subject/25851665/,,,22-CATENA", new String[] { "平凡的世界", "84" });
			res.put("https://movie.douban.com/subject/26100709/,,,22-CATENA", new String[] { "灵魂摆渡2", "79" });
			res.put("https://movie.douban.com/subject/26345152/,,,22-CATENA", new String[] { "心理罪", "76" });
			res.put("https://movie.douban.com/subject/25865536/,,,22-CATENA", new String[] { "嘿，老头", "79" });
			res.put("https://movie.douban.com/subject/25777370/,,,22-CATENA", new String[] { "长大", "75" });
			res.put("https://movie.douban.com/subject/21961912/,,,22-CATENA", new String[] { "青岛往事", "79" });
			
			res.put("23.2015评分最高的韩剧", new String[] { time, "https://movie.douban.com/annual/2015#23" });
			res.put("https://movie.douban.com/subject/26302614/,,,23-CATENA", new String[] { "请回答1988", "97" });
			res.put("https://movie.douban.com/subject/25994747/,,,23-CATENA", new String[] { "杀了我治愈我", "88" });
			res.put("https://movie.douban.com/subject/26297399/,,,23-CATENA", new String[] { "特殊失踪专案组：失踪的黑色M", "90" });
			res.put("https://movie.douban.com/subject/26367601/,,,23-CATENA", new String[] { "哦我的鬼神大人", "82" });
			res.put("https://movie.douban.com/subject/26282488/,,,23-CATENA", new String[] { "陷入纯情", "81" });
			res.put("https://movie.douban.com/subject/26334946/,,,23-CATENA", new String[] { "制作人", "77" });
			res.put("https://movie.douban.com/subject/26334949/,,,23-CATENA", new String[] { "你是谁 - 学校2015", "78" });
			res.put("https://movie.douban.com/subject/26125890/,,,23-CATENA", new String[] { "一起用餐吧2", "79" });
			res.put("https://movie.douban.com/subject/26284619/,,,23-CATENA", new String[] { "愤怒的妈妈", "77" });
			res.put("https://movie.douban.com/subject/26334229/,,,23-CATENA", new String[] { "恋人们", "82" });
			
			res.put("24.2015评分最高的日剧", new String[] { time, "https://movie.douban.com/annual/2015#24" });
			res.put("https://movie.douban.com/subject/26271868/,,,24-CATENA", new String[] { "约会～恋爱究竟是什么呢", "86" });
			res.put("https://movie.douban.com/subject/26266666/,,,24-CATENA", new String[] { "问题餐厅", "88" });
			res.put("https://movie.douban.com/subject/25953663/,,,24-CATENA", new String[] { "无间双龙：这份爱，才是正义", "83" });
			res.put("https://movie.douban.com/subject/26588970/,,,24-CATENA", new String[] { "朝5晚9：帅气和尚爱上我", "74" });
			res.put("https://movie.douban.com/subject/26387719/,,,24-CATENA", new String[] { "民王", "84" });
			res.put("https://movie.douban.com/subject/26277318/,,,24-CATENA", new String[] { "天皇的御厨", "84" });
			res.put("https://movie.douban.com/subject/26588676/,,,24-CATENA", new String[] { "孤独的美食家 第五季", "93" });
			res.put("https://movie.douban.com/subject/26602200/,,,24-CATENA", new String[] { "小小食杂铺", "85" });
			res.put("https://movie.douban.com/subject/26273478/,,,24-CATENA", new String[] { "代笔作家", "82" });
			res.put("https://movie.douban.com/subject/26309935/,,,24-CATENA", new String[] { "暗之伴走者", "85" });
			
			res.put("25.2015最受关注的大陆综艺", new String[] { time, "https://movie.douban.com/annual/2015#25" });
			res.put("https://movie.douban.com/subject/26387728/,,,25-CATENA", new String[] { "极限挑战 第一季", "90" });
			res.put("https://movie.douban.com/subject/25984531/,,,25-CATENA", new String[] { "爸爸去哪儿 第三季", "84" });
			res.put("https://movie.douban.com/subject/26279203/,,,25-CATENA", new String[] { "奔跑吧兄弟 第二季", "63" });
			res.put("https://movie.douban.com/subject/26261188/,,,25-CATENA", new String[] { "花儿与少年", "70" });
			res.put("javascript:;,,,25-CATENA", new String[] { "奇葩说 第二季", "85" });
			res.put("https://movie.douban.com/subject/26261185/,,,25-CATENA", new String[] { "我是歌手 第三季", "72" });
			res.put("https://movie.douban.com/subject/26347994/,,,25-CATENA", new String[] { "了不起的挑战", "88" });
			res.put("https://movie.douban.com/subject/26292732/,,,25-CATENA", new String[] { "花样姐姐 第一季", "71" });
			res.put("https://movie.douban.com/subject/26261192/,,,25-CATENA", new String[] { "真正男子汉 第一季", "84" });
			res.put("https://movie.douban.com/subject/26261184/,,,25-CATENA", new String[] { "偶像来了", "67" });
			
			res.put("26.2015评分最高的动画剧集", new String[] { time, "https://movie.douban.com/annual/2015#26" });
			res.put("https://movie.douban.com/subject/25865470/,,,26-CATENA", new String[] { "瑞克和莫蒂 第二季", "98" });
			res.put("https://movie.douban.com/subject/26287119/,,,26-CATENA", new String[] { "银魂 第三季", "96" });
			res.put("https://movie.douban.com/subject/26295873/,,,26-CATENA", new String[] { "马男波杰克 第二季", "95" });
			res.put("https://movie.douban.com/subject/26528597/,,,26-CATENA", new String[] { "咱们裸熊 第一季", "93" });
			res.put("https://movie.douban.com/subject/25984031/,,,26-CATENA", new String[] { "JOJO的奇妙冒险 星尘斗士 埃及篇", "95" });
			res.put("https://movie.douban.com/subject/26339248/,,,26-CATENA", new String[] { "一拳超人", "93" });
			res.put("https://movie.douban.com/subject/26169716/,,,26-CATENA", new String[] { "吹响悠风号", "91" });
			res.put("https://movie.douban.com/subject/25945110/,,,26-CATENA", new String[] { "元气少女缘结神 第二季", "88" });
			res.put("https://movie.douban.com/subject/25846907/,,,26-CATENA", new String[] { "无头骑士异闻录第二季：承", "88" });
			res.put("https://movie.douban.com/subject/25912261/,,,26-CATENA", new String[] { "暗杀教室", "84" });
			
			res.put("https://movie.douban.com/subject/25754848/,,,27-CATENA", new String[] { "下雪了，最适合杀人了" });
			
			res.put("32.1月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#32" });
			res.put("https://movie.douban.com/subject/25870084/,,,32", new String[] { "重返20岁", "71" });
			res.put("https://movie.douban.com/subject/2973079/,,,32", new String[] { "霍比特人3：五军之战", "83" });
			res.put("https://movie.douban.com/subject/21349734/,,,32", new String[] { "博物馆奇妙夜3", "70" });
			res.put("https://movie.douban.com/subject/20278505/,,,32", new String[] { "前目的地", "78" });
			res.put("https://movie.douban.com/subject/26274910/,,,32", new String[] { "奔跑吧！兄弟", "33" });
			
			res.put("33.2月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#33" });
			res.put("https://movie.douban.com/subject/3993588/,,,33", new String[] { "狼图腾", "69" });
			res.put("https://movie.douban.com/subject/11026735/,,,33", new String[] { "超能陆战队", "86" });
			res.put("https://movie.douban.com/subject/25858759/,,,33", new String[] { "有一个地方只有我们知道", "49" });
			res.put("https://movie.douban.com/subject/6533054/,,,33", new String[] { "饥饿游戏3：嘲笑鸟(上)", "59" });
			res.put("https://movie.douban.com/subject/25858785/,,,33", new String[] { "澳门风云2", "55" });
			
			res.put("34.3月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#34" });
			res.put("https://movie.douban.com/subject/24405378/,,,34", new String[] { "王牌特工：特工学院", "84" });
			res.put("https://movie.douban.com/subject/6875263/,,,34", new String[] { "灰姑娘", "68" });
			res.put("javascript:;,,,34", new String[] { "穹顶之下", "92" });
			res.put("javascript:;,,,34", new String[] { "五十度灰", "51" });
			res.put("https://movie.douban.com/subject/2998373/,,,34", new String[] { "帕丁顿熊", "77" });
			
			res.put("35.4月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#35" });
			res.put("https://movie.douban.com/subject/23761370/,,,35", new String[] { "速度与激情7", "83" });
			res.put("https://movie.douban.com/subject/24753810/,,,35", new String[] { "战狼", "68" });
			res.put("https://movie.douban.com/subject/25872931/,,,35", new String[] { "万物生长", "57" });
			res.put("https://movie.douban.com/subject/25745752/,,,35", new String[] { "左耳", "54" });
			res.put("https://movie.douban.com/subject/26140241/,,,35", new String[] { "咱们结婚吧", "59" });
			
			res.put("36.5月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#36" });
			res.put("https://movie.douban.com/subject/10741834/,,,36", new String[] { "复仇者联盟2：奥创纪元", "73" });
			res.put("https://movie.douban.com/subject/6846893/,,,36", new String[] { "超能查派", "72" });
			res.put("https://movie.douban.com/subject/26259634/,,,36", new String[] { "何以笙箫默", "36" });
			res.put("https://movie.douban.com/subject/4160540/,,,36", new String[] { "机械姬", "76" });
			res.put("https://movie.douban.com/subject/10741643/,,,36", new String[] { "我的个神啊", "84" });
			
			res.put("37.6月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#37" });
			res.put("https://movie.douban.com/subject/10440138/,,,37", new String[] { "侏罗纪世界", "77" });
			res.put("https://movie.douban.com/subject/25786077/,,,37", new String[] { "末日崩塌", "70" });
			res.put("https://movie.douban.com/subject/3592854/,,,37", new String[] { "疯狂的麦克斯4：狂暴之路", "86" });
			res.put("https://movie.douban.com/subject/23788440/,,,37", new String[] { "杀破狼2", "74" });
			res.put("https://movie.douban.com/subject/25908042/,,,37", new String[] { "横冲直撞好莱坞", "44" });
			
			res.put("https://movie.douban.com/subject/25890005/,,,38", new String[] { "每个人都只能陪你走一段路" });
			
			res.put("39.7月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#39" });
			res.put("https://movie.douban.com/subject/26277313/,,,39", new String[] { "西游记之大圣归来", "83" });
			res.put("https://movie.douban.com/subject/25723907/,,,39", new String[] { "捉妖记", "67" });
			res.put("https://movie.douban.com/subject/25895276/,,,39", new String[] { "键盘侠", "59" });
			res.put("https://movie.douban.com/subject/24847343/,,,39", new String[] { "小时代4：灵魂尽头", "46" });
			res.put("https://movie.douban.com/subject/24879839/,,,39", new String[] { "道士下山", "54" });
			
			res.put("40.8月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#40" });
			res.put("https://movie.douban.com/subject/26289144/,,,40", new String[] { "滚蛋吧！肿瘤君", "74" });
			res.put("https://movie.douban.com/subject/24719063/,,,40", new String[] { "烈日灼心", "80" });
			res.put("https://movie.douban.com/subject/3338862/,,,40", new String[] { "终结者：创世纪", "69" });
			res.put("https://movie.douban.com/subject/2303845/,,,40", new String[] { "刺客聂隐娘", "72" });
			res.put("https://movie.douban.com/subject/25853727/,,,40", new String[] { "破风", "72" });
			
			res.put("41.9月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#41" });
			res.put("https://movie.douban.com/subject/10727641/,,,41", new String[] { "碟中谍5：神秘国度", "77" });
			res.put("https://movie.douban.com/subject/25710912/,,,41", new String[] { "港囧", "56" });
			res.put("https://movie.douban.com/subject/11624706/,,,41", new String[] { "小黄人大眼萌", "74" });
			res.put("https://movie.douban.com/subject/25823132/,,,41", new String[] { "暗杀", "80" });
			res.put("https://movie.douban.com/subject/25746375/,,,41", new String[] { "我是路人甲", "71" });
			
			res.put("42.10月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#42" });
			res.put("https://movie.douban.com/subject/25964071/,,,42", new String[] { "夏洛特烦恼", "75" });
			res.put("https://movie.douban.com/subject/10533913/,,,42", new String[] { "头脑特工队", "87" });
			res.put("https://movie.douban.com/subject/1866473/,,,42", new String[] { "蚁人", "76" });
			res.put("https://movie.douban.com/subject/24827406/,,,42", new String[] { "九层妖塔", "42" });
			res.put("https://movie.douban.com/subject/25798448/,,,42", new String[] { "解救吾先生", "78" });
			
			res.put("43.11月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#43" });
			res.put("https://movie.douban.com/subject/26366465/,,,43", new String[] { "我的少女时代", "78" });
			res.put("https://movie.douban.com/subject/11620560/,,,43", new String[] { "007：幽灵党", "62" });
			res.put("https://movie.douban.com/subject/25995508/,,,43", new String[] { "移动迷宫2", "58" });
			res.put("https://movie.douban.com/subject/6845667/,,,43", new String[] { "秘密特工", "80" });
			res.put("https://movie.douban.com/subject/25890005/,,,43", new String[] { "山河故人", "79" });
			
			res.put("44.12月最受关注的电影", new String[] { time, "https://movie.douban.com/annual/2015#44" });
			res.put("https://movie.douban.com/subject/25864085/,,,44", new String[] { "火星救援", "84" });
			res.put("https://movie.douban.com/subject/3077412/,,,44", new String[] { "寻龙诀", "75" });
			res.put("https://movie.douban.com/subject/24751756/,,,44", new String[] { "老炮儿", "78" });
			res.put("https://movie.douban.com/subject/26320029/,,,44", new String[] { "万万没想到", "55" });
			res.put("https://movie.douban.com/subject/26290365/,,,44", new String[] { "恶棍天使", "40" });
			
			res.put("https://movie.douban.com/subject/25761178/,,,45", new String[] { "好想赢，就算赢一次也好" });
			
			res.put("46.2015上映10周年的电影", new String[] { time, "https://movie.douban.com/annual/2015#46" });
			res.put("https://movie.douban.com/subject/1418834/,,,46", new String[] { "断背山", "87" });
			res.put("https://movie.douban.com/subject/1309046/,,,46", new String[] { "V字仇杀队", "88" });
			res.put("https://movie.douban.com/subject/1418200/,,,46", new String[] { "傲慢与偏见", "85" });
			res.put("https://movie.douban.com/subject/1309199/,,,46", new String[] { "史密斯夫妇", "76" });
			res.put("https://movie.douban.com/subject/1309060/,,,46", new String[] { "僵尸新娘", "82" });
			res.put("https://movie.douban.com/subject/1309027/,,,46", new String[] { "罪恶之城", "84" });
			res.put("https://movie.douban.com/subject/1309101/,,,46", new String[] { "查理和巧克力工厂", "80" });
			res.put("https://movie.douban.com/subject/1309043/,,,46", new String[] { "金刚", "78" });
			res.put("https://movie.douban.com/subject/1419936/,,,46", new String[] { "战争之王", "86" });
			res.put("https://movie.douban.com/subject/1418070/,,,46", new String[] { "如果·爱", "76" });
			
			res.put("47.2015上映20周年的电影", new String[] { time, "https://movie.douban.com/annual/2015#47" });
			res.put("https://movie.douban.com/subject/1292213/,,,47", new String[] { "大话西游之大圣娶亲", "92" });
			res.put("https://movie.douban.com/subject/1299398/,,,47", new String[] { "大话西游之月光宝盒", "89" });
			res.put("https://movie.douban.com/subject/1292223/,,,47", new String[] { "七宗罪", "88" });
			res.put("https://movie.douban.com/subject/1292220/,,,47", new String[] { "情书", "89" });
			res.put("https://movie.douban.com/subject/1294639/,,,47", new String[] { "勇敢的心", "88" });
			res.put("https://movie.douban.com/subject/1296339/,,,47", new String[] { "爱在黎明破晓前", "88" });
			res.put("https://movie.douban.com/subject/1297052/,,,47", new String[] { "侧耳倾听", "88" });
			res.put("https://movie.douban.com/subject/1291575/,,,47", new String[] { "玩具总动员", "83" });
			res.put("https://movie.douban.com/subject/1298744/,,,47", new String[] { "十二猴子", "81" });
			res.put("https://movie.douban.com/subject/1292214/,,,47", new String[] { "非常嫌疑犯", "86" });
			
			res.put("48.2015上映30周年的电影", new String[] { time, "https://movie.douban.com/annual/2015#48" });
			res.put("https://movie.douban.com/subject/1300555/,,,48", new String[] { "回到未来", "86" });
			res.put("https://movie.douban.com/subject/1291840/,,,48", new String[] { "走出非洲", "85" });
			res.put("https://movie.douban.com/subject/1400868/,,,48", new String[] { "警察故事", "78" });
			res.put("https://movie.douban.com/subject/1293926/,,,48", new String[] { "看得见风景的房间", "77" });
			res.put("https://movie.douban.com/subject/1296196/,,,48", new String[] { "乱", "88" });
			res.put("https://movie.douban.com/subject/1300361/,,,48", new String[] { "第一滴血2", "77" });
			res.put("https://movie.douban.com/subject/1300572/,,,48", new String[] { "童年往事", "88" });
			res.put("https://movie.douban.com/subject/1295933/,,,48", new String[] { "僵尸先生", "81" });
			res.put("https://movie.douban.com/subject/1291976/,,,48", new String[] { "狗脸的岁月", "85" });
			res.put("https://movie.douban.com/subject/1294503/,,,48", new String[] { "紫色", "84" });
			
			res.put("49.2015上映40周年的电影", new String[] { time, "https://movie.douban.com/annual/2015#49" });
			res.put("https://movie.douban.com/subject/1292224/,,,49", new String[] { "飞越疯人院", "91" });
			res.put("https://movie.douban.com/subject/1294941/,,,49", new String[] { "大白鲨", "77" });
			res.put("https://movie.douban.com/subject/1293374/,,,49", new String[] { "热天午后", "86" });
			res.put("javascript:;,,,49", new String[] { "索多玛120天", "64" });
			res.put("https://movie.douban.com/subject/1292050/,,,49", new String[] { "洛基恐怖秀", "80" });
			res.put("https://movie.douban.com/subject/1294917/,,,49", new String[] { "巨蟒与圣杯", "79" });
			res.put("https://movie.douban.com/subject/1291866/,,,49", new String[] { "佐罗", "80" });
			res.put("https://movie.douban.com/subject/1293870/,,,49", new String[] { "阿黛尔·雨果的故事", "81" });
			res.put("https://movie.douban.com/subject/1292472/,,,49", new String[] { "巴里·林登", "88" });
			res.put("https://movie.douban.com/subject/1299248/,,,49", new String[] { "镜子", "89" });
			
			res.put("50.2015上映50周年的电影", new String[] { time, "https://movie.douban.com/annual/2015#50" });
			res.put("https://movie.douban.com/subject/1294408/,,,50", new String[] { "音乐之声", "90" });
			res.put("https://movie.douban.com/subject/3033864/,,,50", new String[] { "地道战", "82" });
			res.put("https://movie.douban.com/subject/1295586/,,,50", new String[] { "黄昏双镖客", "87" });
			res.put("https://movie.douban.com/subject/1389949/,,,50", new String[] { "日瓦戈医生", "85" });
			res.put("https://movie.douban.com/subject/1292533/,,,50", new String[] { "狂人皮埃罗", "83" });
			res.put("https://movie.douban.com/subject/1292638/,,,50", new String[] { "007之霹雳弹", "69" });
			res.put("https://movie.douban.com/subject/1441189/,,,50", new String[] { "飞行器里的好小伙，或我是怎样花25小时11分从伦敦飞到巴黎", "84" });
			res.put("https://movie.douban.com/subject/1301647/,,,50", new String[] { "冷血惊魂", "77" });
			res.put("https://movie.douban.com/subject/1293190/,,,50", new String[] { "柏林谍影", "84" });
			res.put("https://movie.douban.com/subject/1316524/,,,50", new String[] { "阿尔法城", "77" });
			
			res.put("https://movie.douban.com/subject/26366465/,,,51", new String[] { "当女生说我没事就是有事，说没关系就是有关系；当她说再也不想理你，不是真的讨厌你，而是她很在乎你" });
			
			res.put("52.2015评分最低的外语电影", new String[] { time, "https://movie.douban.com/annual/2015#52" });
			res.put("javascript:;,,,52", new String[] { "人体蜈蚣3", "40" });
			res.put("https://movie.douban.com/subject/4014396/,,,52", new String[] { "神奇四侠2015", "43" });
			res.put("javascript:;,,,52", new String[] { "五十度灰", "51" });
			res.put("https://movie.douban.com/subject/6866928/,,,52", new String[] { "进击的巨人真人版：前篇", "50" });
			res.put("https://movie.douban.com/subject/24872023/,,,52", new String[] { "贵族大盗", "53" });
			res.put("https://movie.douban.com/subject/5154799/,,,52", new String[] { "木星上行", "54" });
			res.put("https://movie.douban.com/subject/26326395/,,,52", new String[] { "真实魔鬼游戏", "56" });
			res.put("https://movie.douban.com/subject/25995508/,,,52", new String[] { "移动迷宫2", "58" });
			res.put("https://movie.douban.com/subject/25794212/,,,52", new String[] { "分歧者2：绝地反击", "59" });
			res.put("https://movie.douban.com/subject/24718797/,,,52", new String[] { "玩命速递：重启之战", "59" });
			
			res.put("53.2015评分最低的华语电影", new String[] { time, "https://movie.douban.com/annual/2015#53" });
			res.put("https://movie.douban.com/subject/26416155/,,,53", new String[] { "汽车人总动员", "24" });
			res.put("https://movie.douban.com/subject/26274910/,,,53", new String[] { "奔跑吧！兄弟", "33" });
			res.put("https://movie.douban.com/subject/26259634/,,,53", new String[] { "何以笙箫默", "36" });
			res.put("https://movie.douban.com/subject/5993138/,,,53", new String[] { "王朝的女人·杨贵妃", "36" });
			res.put("https://movie.douban.com/subject/26290365/,,,53", new String[] { "恶棍天使", "40" });
			res.put("https://movie.douban.com/subject/26279120/,,,53", new String[] { "从天“儿”降", "35" });
			res.put("https://movie.douban.com/subject/26021055/,,,53", new String[] { "栀子花开", "41" });
			res.put("https://movie.douban.com/subject/25713420/,,,53", new String[] { "钟馗伏魔：雪妖魔灵", "42" });
			res.put("https://movie.douban.com/subject/24827406/,,,53", new String[] { "九层妖塔", "42" });
			res.put("https://movie.douban.com/subject/25908042/,,,53", new String[] { "横冲直撞好莱坞", "44" });
			
			res.put("https://movie.douban.com/subject/23761370/,,,54", new String[] { "怎么说得出口再见" });
			
			res.put("55.2016最值得期待的外语电影", new String[] { time, "https://movie.douban.com/annual/2015#55" });
			res.put("https://movie.douban.com/subject/2131940/,,,55", new String[] { "魔兽", "77" });
			res.put("https://movie.douban.com/subject/25786060/,,,55", new String[] { "X战警：天启", "77" });
			res.put("https://movie.douban.com/subject/3569910/,,,55", new String[] { "自杀小队", "63" });
			res.put("https://movie.douban.com/subject/24750534/,,,55", new String[] { "蝙蝠侠大战超人：正义黎明", "67" });
			res.put("https://movie.douban.com/subject/3543318/,,,55", new String[] { "傲慢与偏见与僵尸", "55" });
			res.put("https://movie.douban.com/subject/25820460/,,,55", new String[] { "美国队长3", "76" });
			res.put("https://movie.douban.com/subject/3718279/,,,55", new String[] { "死侍", "77" });
			res.put("https://movie.douban.com/subject/21817627/,,,55", new String[] { "爱宠大机密", "76" });
			res.put("https://movie.douban.com/subject/11526817/,,,55", new String[] { "刺客信条", "53" });
			res.put("https://movie.douban.com/subject/25726614/,,,55", new String[] { "神奇动物在哪里", "78" });
			
			res.put("56.2016最值得期待的华语电影", new String[] { time, "https://movie.douban.com/annual/2015#56" });
			res.put("https://movie.douban.com/subject/21335171/,,,56", new String[] { "三体", "0" });
			res.put("https://movie.douban.com/subject/5045678/,,,56", new String[] { "大鱼海棠", "67" });
			res.put("https://movie.douban.com/subject/25727544/,,,56", new String[] { "寻找罗麦", "43" });
			res.put("https://movie.douban.com/subject/19944106/,,,56", new String[] { "美人鱼", "67" });
			res.put("https://movie.douban.com/subject/24751763/,,,56", new String[] { "罗曼蒂克消亡史", "77" });
			res.put("https://movie.douban.com/subject/10467754/,,,56", new String[] { "放浪记", "0" });
			res.put("https://movie.douban.com/subject/25911694/,,,56", new String[] { "摆渡人", "40" });
			res.put("https://movie.douban.com/subject/6982558/,,,56", new String[] { "长城", "49" });
			res.put("https://movie.douban.com/subject/11598977/,,,56", new String[] { "叶问3", "63" });
			res.put("https://movie.douban.com/subject/20505982/,,,56", new String[] { "寒战2", "70" });
		} else if (id.equals("douban2016")) {
			res.put("1.2016评分最高的华语电影", new String[] { time, "https://movie.douban.com/annual/2016#1" });
			res.put("https://movie.douban.com/subject/25921812/,,,1", new String[] { "驴得水", "83" });
			res.put("https://movie.douban.com/subject/25815034/,,,1", new String[] { "湄公河行动", "79" });
			res.put("javascript:;,,,1", new String[] { "树大招风", "80" });
			res.put("https://movie.douban.com/subject/10831445/,,,1", new String[] { "百鸟朝凤", "80" });
			res.put("https://movie.douban.com/subject/26351526/,,,1", new String[] { "幸运是我", "80" });
			res.put("https://movie.douban.com/subject/24751763/,,,1", new String[] { "罗曼蒂克消亡史", "77" });
			res.put("https://movie.douban.com/subject/26337866/,,,1", new String[] { "路边野餐", "78" });
			res.put("https://movie.douban.com/subject/25827935/,,,1", new String[] { "七月与安生", "76" });
			res.put("https://movie.douban.com/subject/26284621/,,,1", new String[] { "追凶者也", "77" });
			res.put("https://movie.douban.com/subject/25966085/,,,1", new String[] { "踏血寻梅", "74" });
			
			res.put("2.2016评分最高的外语电影", new String[] { time, "https://movie.douban.com/annual/2016#2" });
			res.put("https://movie.douban.com/subject/26325320/,,,2", new String[] { "血战钢锯岭", "87" });
			res.put("https://movie.douban.com/subject/26628357/,,,2", new String[] { "一个叫欧维的男人决定去死", "88" });
			res.put("https://movie.douban.com/subject/25983044/,,,2", new String[] { "比利·林恩的中场战事", "84" });
			res.put("https://movie.douban.com/subject/26614893/,,,2", new String[] { "完美陌生人", "85" });
			res.put("https://movie.douban.com/subject/26416603/,,,2", new String[] { "萨利机长", "83" });
			res.put("https://movie.douban.com/subject/26303622/,,,2", new String[] { "大空头", "84" });
			res.put("https://movie.douban.com/subject/25855071/,,,2", new String[] { "初恋这首情歌", "83" });
			res.put("https://movie.douban.com/subject/25726614/,,,2", new String[] { "神奇动物在哪里", "78" });
			res.put("https://movie.douban.com/subject/25786060/,,,2", new String[] { "X战警：天启", "77" });
			res.put("https://movie.douban.com/subject/3025375/,,,2", new String[] { "奇异博士", "76" });
			
			res.put("https://movie.douban.com/subject/26614893/,,,3", new String[] { "如果你深爱一个人，你会为他挡下全世界的子弹。" });
			
			res.put("4.2016最受关注的院线电影", new String[] { time, "https://movie.douban.com/annual/2016#4" });
			res.put("https://movie.douban.com/subject/25662329/,,,4", new String[] { "疯狂动物城", "92" });
			res.put("https://movie.douban.com/subject/19944106/,,,4", new String[] { "美人鱼", "67" });
			res.put("https://movie.douban.com/subject/26683290/,,,4", new String[] { "你的名字", "84" });
			res.put("https://movie.douban.com/subject/25815034/,,,4", new String[] { "湄公河行动", "79" });
			res.put("https://movie.douban.com/subject/25820460/,,,4", new String[] { "美国队长3", "78" });
			res.put("https://movie.douban.com/subject/5045678/,,,4", new String[] { "大鱼海棠", "67" });
			res.put("https://movie.douban.com/subject/25726614/,,,4", new String[] { "神奇动物在哪里", "78" });
			res.put("https://movie.douban.com/subject/25827935/,,,4", new String[] { "七月与安生", "76" });
			res.put("https://movie.douban.com/subject/25786060/,,,4", new String[] { "X战警：天启", "77" });
			res.put("https://movie.douban.com/subject/2131940/,,,4", new String[] { "魔兽", "77" });
			
			res.put("5.2016最受关注的非院线电影", new String[] { time, "https://movie.douban.com/annual/2016#5" });
			res.put("https://movie.douban.com/subject/25986180/,,,5", new String[] { "釜山行", "83" });
			res.put("https://movie.douban.com/subject/3718279/,,,5", new String[] { "死侍", "77" });
			res.put("https://movie.douban.com/subject/26614893/,,,5", new String[] { "完美陌生人", "85" });
			res.put("javascript:;,,,5", new String[] { "树大招风", "80" });
			res.put("https://movie.douban.com/subject/25977027/,,,5", new String[] { "小姐", "80" });
			res.put("https://movie.douban.com/subject/25966085/,,,5", new String[] { "踏血寻梅", "74" });
			res.put("https://movie.douban.com/subject/25929151/,,,5", new String[] { "遇见你之前", "77" });
			res.put("https://movie.douban.com/subject/3569910/,,,5", new String[] { "自杀小队", "63" });
			res.put("https://movie.douban.com/subject/26410594/,,,5", new String[] { "隧道", "77" });
			res.put("https://movie.douban.com/subject/26628357/,,,5", new String[] { "一个叫欧维的男人决定去死", "88" });
			
			res.put("https://movie.douban.com/subject/25983044/,,,6", new String[] { "这感觉其实挺奇怪的，有人来表扬你这辈子最惨的一天。" });
			
			res.put("7.2016年度大陆独立佳作", new String[] { time, "https://movie.douban.com/annual/2016#7" });
			res.put("https://movie.douban.com/subject/26657126/,,,7", new String[] { "不成问题的问题", "82" });
			res.put("https://movie.douban.com/subject/26306897/,,,7", new String[] { "李文漫游东湖", "81" });
			res.put("https://movie.douban.com/subject/26606242/,,,7", new String[] { "冈仁波齐", "77" });
			res.put("https://movie.douban.com/subject/26324750/,,,7", new String[] { "河", "77" });
			res.put("https://movie.douban.com/subject/26671361/,,,7", new String[] { "喜丧", "80" });
			res.put("https://movie.douban.com/subject/26820833/,,,7", new String[] { "中邪", "68" });
			res.put("https://movie.douban.com/subject/26820836/,,,7", new String[] { "八月", "71" });
			res.put("https://movie.douban.com/subject/26821298/,,,7", new String[] { "国界", "73" });
			res.put("javascript:;,,,7", new String[] { "诗人出差了", "72" });
			res.put("https://movie.douban.com/subject/26632642/,,,7", new String[] { "德兰", "67" });
			
			res.put("8.2016年度冷门佳片", new String[] { time, "https://movie.douban.com/annual/2016#8" });
			res.put("https://movie.douban.com/subject/25958717/,,,8", new String[] { "海蒂和爷爷", "91" });
			res.put("https://movie.douban.com/subject/26390631/,,,8", new String[] { "总有一天", "87" });
			res.put("https://movie.douban.com/subject/26591654/,,,8", new String[] { "地雷区", "86" });
			res.put("https://movie.douban.com/subject/26245360/,,,8", new String[] { "感化院", "84" });
			res.put("https://movie.douban.com/subject/25845397/,,,8", new String[] { "飞不起来的童年", "84" });
			res.put("https://movie.douban.com/subject/26356789/,,,8", new String[] { "心房客", "84" });
			res.put("https://movie.douban.com/subject/26304901/,,,8", new String[] { "处子之山", "82" });
			res.put("https://movie.douban.com/subject/26411201/,,,8", new String[] { "追捕野蛮人", "81" });
			res.put("https://movie.douban.com/subject/10484117/,,,8", new String[] { "天空之眼", "78" });
			res.put("https://movie.douban.com/subject/25834735/,,,8", new String[] { "神奇队长", "78" });
			
			res.put("https://movie.douban.com/subject/25834735/,,,9", new String[] { "永远保持真诚，保持高尚的品行。把每天过成你的最后一天，活得充实、不留遗憾，有冒险精神、要英勇，但也要尽情享受，因为人生本短。" });
			
			res.put("10.2016评分最高的韩国电影", new String[] { time, "https://movie.douban.com/annual/2016#10" });
			res.put("https://movie.douban.com/subject/25986180/,,,10", new String[] { "釜山行", "83" });
			res.put("https://movie.douban.com/subject/26307755/,,,10", new String[] { "季春奶奶", "84" });
			res.put("https://movie.douban.com/subject/26713504/,,,10", new String[] { "酒神小姐", "82" });
			res.put("https://movie.douban.com/subject/25977027/,,,10", new String[] { "小姐", "80" });
			res.put("https://movie.douban.com/subject/26410594/,,,10", new String[] { "隧道", "77" });
			res.put("https://movie.douban.com/subject/25862354/,,,10", new String[] { "局内人", "77" });
			res.put("https://movie.douban.com/subject/25835285/,,,10", new String[] { "男与女", "80" });
			res.put("https://movie.douban.com/subject/26752337/,,,10", new String[] { "春梦", "74" });
			res.put("https://movie.douban.com/subject/26322928/,,,10", new String[] { "鬼乡", "74" });
			res.put("https://movie.douban.com/subject/25817534/,,,10", new String[] { "哭声", "72" });
			
			res.put("11.2016评分最高的日本电影", new String[] { time, "https://movie.douban.com/annual/2016#11" });
			res.put("https://movie.douban.com/subject/26694988/,,,11", new String[] { "比海更深", "87" });
			res.put("https://movie.douban.com/subject/26584763/,,,11", new String[] { "少爷", "85" });
			res.put("https://movie.douban.com/subject/26362351/,,,11", new String[] { "濑户内海", "83" });
			res.put("https://movie.douban.com/subject/26810837/,,,11", new String[] { "为你取名的那一天", "84" });
			res.put("https://movie.douban.com/subject/26020796/,,,11", new String[] { "家族之苦", "81" });
			res.put("https://movie.douban.com/subject/26413269/,,,11", new String[] { "早死早投胎之地狱摇滚篇", "78" });
			res.put("https://movie.douban.com/subject/25905124/,,,11", new String[] { "澄沙之味", "80" });
			res.put("https://movie.douban.com/subject/25880986/,,,11", new String[] { "食梦者", "77" });
			res.put("https://movie.douban.com/subject/26820450/,,,11", new String[] { "我被爸爸绑架了", "77" });
			res.put("https://movie.douban.com/subject/26592040/,,,11", new String[] { "瑞普·凡·温克尔的新娘", "75" });
			
			res.put("12.2016评分最高的欧洲电影", new String[] { time, "https://movie.douban.com/annual/2016#12" });
			res.put("https://movie.douban.com/subject/26628357/,,,12", new String[] { "一个叫欧维的男人决定去死", "88" });
			res.put("https://movie.douban.com/subject/26614893/,,,12", new String[] { "完美陌生人", "85" });
			res.put("https://movie.douban.com/subject/25855071/,,,12", new String[] { "初恋这首情歌", "83" });
			res.put("https://movie.douban.com/subject/25726614/,,,12", new String[] { "神奇动物在哪里", "78" });
			res.put("https://movie.douban.com/subject/3072064/,,,12", new String[] { "飞鹰艾迪", "80" });
			res.put("https://movie.douban.com/subject/26215216/,,,12", new String[] { "将来的事", "82" });
			res.put("https://movie.douban.com/subject/26340305/,,,12", new String[] { "毕业会考", "77" });
			res.put("https://movie.douban.com/subject/24872189/,,,12", new String[] { "托尼·厄德曼", "76" });
			res.put("https://movie.douban.com/subject/25839662/,,,12", new String[] { "45周年", "78" });
			res.put("https://movie.douban.com/subject/26022182/,,,12", new String[] { "她", "77" });
			
			res.put("13.2016年度LGBT电影", new String[] { time, "https://movie.douban.com/annual/2016#13" });
			res.put("https://movie.douban.com/subject/25977027/,,,13", new String[] { "小姐", "80" });
			res.put("https://movie.douban.com/subject/26354587/,,,13", new String[] { "寻：电影版", "79" });
			res.put("https://movie.douban.com/subject/26381767/,,,13", new String[] { "同志宝贝", "86" });
			res.put("https://movie.douban.com/subject/26279353/,,,13", new String[] { "与外婆同行", "77" });
			res.put("https://movie.douban.com/subject/4881217/,,,13", new String[] { "被拒人生", "75" });
			res.put("https://movie.douban.com/subject/26416569/,,,13", new String[] { "出柜第4格", "75" });
			res.put("https://movie.douban.com/subject/26309618/,,,13", new String[] { "当我们17岁", "76" });
			res.put("https://movie.douban.com/subject/26689198/,,,13", new String[] { "同船爱歌", "76" });
			res.put("https://movie.douban.com/subject/26013293/,,,13", new String[] { "抱紧他", "76" });
			res.put("https://movie.douban.com/subject/26331185/,,,13", new String[] { "离别是美丽的", "75" });
			
			res.put("https://movie.douban.com/subject/25827935/,,,14", new String[] { "你是我最好的朋友，我恨过你，但我也只有你。" });
			
			res.put("15.2016评分最高的喜剧片", new String[] { time, "https://movie.douban.com/annual/2016#15" });
			res.put("https://movie.douban.com/subject/26614893/,,,15", new String[] { "完美陌生人", "85" });
			res.put("https://movie.douban.com/subject/26362351/,,,15", new String[] { "濑户内海", "83" });
			res.put("https://movie.douban.com/subject/26020796/,,,15", new String[] { "家族之苦", "81" });
			res.put("https://movie.douban.com/subject/24872189/,,,15", new String[] { "托尼·厄德曼", "76" });
			res.put("https://movie.douban.com/subject/26412106/,,,15", new String[] { "电击女孩", "77" });
			res.put("https://movie.douban.com/subject/26585014/,,,15", new String[] { "希特勒回来了", "77" });
			res.put("https://movie.douban.com/subject/26279353/,,,15", new String[] { "与外婆同行", "77" });
			res.put("https://movie.douban.com/subject/3868141/,,,15", new String[] { "单身日记：好孕来袭", "73" });
			res.put("https://movie.douban.com/subject/26680247/,,,15", new String[] { "最爽的一天", "78" });
			res.put("https://movie.douban.com/subject/3718279/,,,15", new String[] { "死侍", "77" });
			
			res.put("16.2016评分最高的爱情片", new String[] { time, "https://movie.douban.com/annual/2016#16" });
			res.put("https://movie.douban.com/subject/26683290/,,,16", new String[] { "你的名字", "84" });
			res.put("https://movie.douban.com/subject/25855071/,,,16", new String[] { "初恋这首情歌", "83" });
			res.put("https://movie.douban.com/subject/26354587/,,,16", new String[] { "寻：电影版", "79" });
			res.put("https://movie.douban.com/subject/25839662/,,,16", new String[] { "45周年", "78" });
			res.put("https://movie.douban.com/subject/25827935/,,,16", new String[] { "七月与安生", "76" });
			res.put("https://movie.douban.com/subject/3868141/,,,16", new String[] { "单身日记：好孕来袭", "73" });
			res.put("https://movie.douban.com/subject/25843022/,,,16", new String[] { "我的国王", "77" });
			res.put("https://movie.douban.com/subject/25929151/,,,16", new String[] { "遇见你之前", "77" });
			res.put("https://movie.douban.com/subject/10745397/,,,16", new String[] { "已经开始想你", "76" });
			res.put("https://movie.douban.com/subject/26726098/,,,16", new String[] { "他是龙", "74" });
			
			res.put("17.2016评分最高的科幻/动作片", new String[] { time, "https://movie.douban.com/annual/2016#17" });
			res.put("https://movie.douban.com/subject/25986180/,,,17", new String[] { "釜山行", "83" });
			res.put("https://movie.douban.com/subject/25815034/,,,17", new String[] { "湄公河行动", "79" });
			res.put("https://movie.douban.com/subject/25786060/,,,17", new String[] { "X战警：天启", "77" });
			res.put("https://movie.douban.com/subject/3025375/,,,17", new String[] { "奇异博士", "76" });
			res.put("https://movie.douban.com/subject/2131940/,,,17", new String[] { "魔兽", "77" });
			res.put("https://movie.douban.com/subject/25820460/,,,17", new String[] { "美国队长3", "78" });
			res.put("https://movie.douban.com/subject/26220717/,,,17", new String[] { "危机13小时", "77" });
			res.put("https://movie.douban.com/subject/3718279/,,,17", new String[] { "死侍", "77" });
			res.put("https://movie.douban.com/subject/25706773/,,,17", new String[] { "硬核亨利", "76" });
			res.put("https://movie.douban.com/subject/26266072/,,,17", new String[] { "谍影重重5", "73" });
			
			res.put("18.2016评分最高的恐怖片", new String[] { time, "https://movie.douban.com/annual/2016#18" });
			res.put("https://movie.douban.com/subject/24860563/,,,18", new String[] { "招魂2", "77" });
			res.put("https://movie.douban.com/subject/26339213/,,,18", new String[] { "无名女尸", "75" });
			res.put("https://movie.douban.com/subject/26820833/,,,18", new String[] { "中邪", "68" });
			res.put("https://movie.douban.com/subject/25817534/,,,18", new String[] { "哭声", "72" });
			res.put("https://movie.douban.com/subject/26704620/,,,18", new String[] { "屏住呼吸", "70" });
			res.put("https://movie.douban.com/subject/26649095/,,,18", new String[] { "恐吓运动", "69" });
			res.put("https://movie.douban.com/subject/26276364/,,,18", new String[] { "女巫", "68" });
			res.put("https://movie.douban.com/subject/26684564/,,,18", new String[] { "关灯后", "66" });
			res.put("https://movie.douban.com/subject/26700688/,,,18", new String[] { "阴影之下", "64" });
			res.put("https://movie.douban.com/subject/26602794/,,,18", new String[] { "死亡占卜2：恶灵始源", "62" });
			
			res.put("https://movie.douban.com/subject/5045678/,,,19", new String[] { "真正的忘记是不需要努力的。" });
			
			res.put("20.2016评分最高的动画片", new String[] { time, "https://movie.douban.com/annual/2016#20" });
			res.put("https://movie.douban.com/subject/25662329/,,,20", new String[] { "疯狂动物城", "92" });
			res.put("https://movie.douban.com/subject/26683290/,,,20", new String[] { "你的名字", "84" });
			res.put("javascript:;,,,20", new String[] { "同级生", "88" });
			res.put("https://movie.douban.com/subject/26147991/,,,20", new String[] { "明月守护者", "83" });
			res.put("https://movie.douban.com/subject/26598021/,,,20", new String[] { "航海王之黄金城", "77" });
			res.put("https://movie.douban.com/subject/25821673/,,,20", new String[] { "阿薇尔与虚构世界", "78" });
			res.put("https://movie.douban.com/subject/11589036/,,,20", new String[] { "功夫熊猫3", "76" });
			res.put("https://movie.douban.com/subject/25793398/,,,20", new String[] { "海洋奇缘", "75" });
			res.put("https://movie.douban.com/subject/26287884/,,,20", new String[] { "魔弦传说", "74" });
			res.put("https://movie.douban.com/subject/26374205/,,,20", new String[] { "逗鸟外传：萌宝满天飞", "75" });
			
			res.put("21.2016评分最高的纪录片", new String[] { time, "https://movie.douban.com/annual/2016#21" });
			res.put("https://movie.douban.com/subject/26914034/,,,21", new String[] { "不了神话.宫崎骏", "91" });
			res.put("https://movie.douban.com/subject/26718518/,,,21", new String[] { "如何死亡：西蒙的抉择", "92" });
			res.put("https://movie.douban.com/subject/26707093/,,,21", new String[] { "超音速", "92" });
			res.put("https://movie.douban.com/subject/26662337/,,,21", new String[] { "大路朝天", "0" });
			res.put("https://movie.douban.com/subject/26857715/,,,21", new String[] { "洪水泛滥之前", "88" });
			res.put("https://movie.douban.com/subject/26602234/,,,21", new String[] { "冲天", "93" });
			res.put("https://movie.douban.com/subject/26836588/,,,21", new String[] { "生门", "87" });
			res.put("https://movie.douban.com/subject/26807676/,,,21", new String[] { "BIGBANG MADE", "88" });
			res.put("https://movie.douban.com/subject/25894885/,,,21", new String[] { "舌尖上的新年", "84" });
			res.put("https://movie.douban.com/subject/26376454/,,,21", new String[] { "我们诞生在中国", "80" });
			
			res.put("https://movie.douban.com/subject/11524967/,,,23", new String[] { "不要计划相遇，最美好的事情总是偶然发生的。" });
			
			res.put("24.2016评分最高的大陆电视剧", new String[] { time, "https://movie.douban.com/annual/2016#24" });
			res.put("https://movie.douban.com/subject/26391976/,,,24-CATENA", new String[] { "一起同过窗 第一季", "90" });
			res.put("https://movie.douban.com/subject/26602244/,,,24-CATENA", new String[] { "最好的我们", "88" });
			res.put("https://movie.douban.com/subject/26298935/,,,24-CATENA", new String[] { "鬼吹灯之精绝古城", "80" });
			res.put("https://movie.douban.com/subject/20444535/,,,24-CATENA", new String[] { "遇见王沥川", "86" });
			res.put("https://movie.douban.com/subject/26363830/,,,24-CATENA", new String[] { "余罪 第一季", "83" });
			res.put("javascript:;,,,24-CATENA", new String[] { "上瘾", "82" });
			res.put("https://movie.douban.com/subject/26670687/,,,24-CATENA", new String[] { "灵魂摆渡3", "77" });
			res.put("https://movie.douban.com/subject/26322639/,,,24-CATENA", new String[] { "小别离", "78" });
			res.put("https://movie.douban.com/subject/26345137/,,,24-CATENA", new String[] { "如果蜗牛有爱情", "72" });
			res.put("https://movie.douban.com/subject/26430092/,,,24-CATENA", new String[] { "欢乐颂", "73" });
			
			res.put("25.2016评分最高的英美剧(新剧)", new String[] { time, "https://movie.douban.com/annual/2016#25" });
			res.put("https://movie.douban.com/subject/26794215/,,,25-CATENA", new String[] { "我们这一天 第一季", "95" });
			res.put("https://movie.douban.com/subject/26719562/,,,25-CATENA", new String[] { "百年酒馆", "93" });
			res.put("https://movie.douban.com/subject/26427152/,,,25-CATENA", new String[] { "王冠 第一季", "92" });
			res.put("https://movie.douban.com/subject/25884125/,,,25-CATENA", new String[] { "年轻的教宗", "91" });
			res.put("https://movie.douban.com/subject/2338055/,,,25-CATENA", new String[] { "西部世界 第一季", "88" });
			res.put("https://movie.douban.com/subject/26359270/,,,25-CATENA", new String[] { "怪奇物语 第一季", "88" });
			res.put("https://movie.douban.com/subject/26838164/,,,25-CATENA", new String[] { "伦敦生活 第一季", "87" });
			res.put("https://movie.douban.com/subject/20558374/,,,25-CATENA", new String[] { "罪夜之奔", "87" });
			res.put("https://movie.douban.com/subject/26200198/,,,25-CATENA", new String[] { "亿万 第一季", "88" });
			res.put("https://movie.douban.com/subject/26101233/,,,25-CATENA", new String[] { "美国犯罪故事 第一季", "87" });
			
			res.put("26.2016评分最高的英美剧(非新剧)", new String[] { time, "https://movie.douban.com/annual/2016#26" });
			res.put("https://movie.douban.com/subject/26707767/,,,26-CATENA", new String[] { "无耻之徒(美版) 第七季", "95" });
			res.put("https://movie.douban.com/subject/25862357/,,,26-CATENA", new String[] { "权力的游戏 第六季", "95" });
			res.put("https://movie.douban.com/subject/25976733/,,,26-CATENA", new String[] { "风骚律师 第二季", "94" });
			res.put("https://movie.douban.com/subject/26387813/,,,26-CATENA", new String[] { "疑犯追踪 第五季", "93" });
			res.put("https://movie.douban.com/subject/26604456/,,,26-CATENA", new String[] { "毒枭 第二季", "94" });
			res.put("https://movie.douban.com/subject/26366492/,,,26-CATENA", new String[] { "硅谷 第三季", "92" });
			res.put("https://movie.douban.com/subject/25845401/,,,26-CATENA", new String[] { "生活大爆炸 第十季", "92" });
			res.put("https://movie.douban.com/subject/26336281/,,,26-CATENA", new String[] { "纸牌屋 第四季", "89" });
			res.put("https://baike.baidu.com/item/行尸走肉第七季,,,26-CATENA", new String[] { "行尸走肉 第七季", "81" });
			res.put("https://movie.douban.com/subject/25966044/,,,26-CATENA", new String[] { "黑镜 第三季", "88" });
			
			res.put("https://movie.douban.com/subject/2338055/,,,27-CATENA", new String[] { "有些人选择看到这个世界上的丑恶，那些无秩序的混乱。我选择看到美好。" });
			
			res.put("28.2016评分最高的韩剧", new String[] { time, "https://movie.douban.com/annual/2016#28" });
			res.put("https://movie.douban.com/subject/26636816/,,,28-CATENA", new String[] { "我亲爱的朋友们", "95" });
			res.put("https://movie.douban.com/subject/26310143/,,,28-CATENA", new String[] { "信号", "92" });
			res.put("https://movie.douban.com/subject/26435723/,,,28-CATENA", new String[] { "心里的声音", "91" });
			res.put("https://movie.douban.com/subject/26815052/,,,28-CATENA", new String[] { "青春时代", "88" });
			res.put("https://movie.douban.com/subject/26761935/,,,28-CATENA", new String[] { "孤单又灿烂的神：鬼怪", "85" });
			res.put("https://movie.douban.com/subject/26722100/,,,28-CATENA", new String[] { "又是吴海英", "83" });
			res.put("https://movie.douban.com/subject/26727298/,,,28-CATENA", new String[] { "W-两个世界", "79" });
			res.put("https://movie.douban.com/subject/26722118/,,,28-CATENA", new String[] { "嫉妒的化身", "80" });
			res.put("https://movie.douban.com/subject/25831874/,,,28-CATENA", new String[] { "太阳的后裔", "78" });
			res.put("https://movie.douban.com/subject/26633183/,,,28-CATENA", new String[] { "回来吧大叔", "76" });
			
			res.put("29.2016评分最高的日剧", new String[] { time, "https://movie.douban.com/annual/2016#29" });
			res.put("https://movie.douban.com/subject/26635329/,,,29-CATENA", new String[] { "火花", "93" });
			res.put("https://movie.douban.com/subject/26602304/,,,29-CATENA", new String[] { "重版出来", "91" });
			res.put("https://movie.douban.com/subject/26741568/,,,29-CATENA", new String[] { "我的恐怖妻子", "90" });
			res.put("https://movie.douban.com/subject/26663070/,,,29-CATENA", new String[] { "家族的形式", "88" });
			res.put("https://movie.douban.com/subject/26724684/,,,29-CATENA", new String[] { "宽松世代又如何", "87" });
			res.put("https://movie.douban.com/subject/26798436/,,,29-CATENA", new String[] { "深夜食堂4：东京故事", "87" });
			res.put("https://movie.douban.com/subject/26816519/,,,29-CATENA", new String[] { "逃避虽可耻但有用", "83" });
			res.put("https://movie.douban.com/subject/26689409/,,,29-CATENA", new String[] { "我的家里空无一物", "83" });
			res.put("https://movie.douban.com/subject/26720117/,,,29-CATENA", new String[] { "卖房子的女人", "83" });
			res.put("https://movie.douban.com/subject/26667644/,,,29-CATENA", new String[] { "不让我走", "80" });
			
			res.put("30.2016评分最高的其它地区剧集", new String[] { time, "https://movie.douban.com/annual/2016#30" });
			res.put("https://movie.douban.com/subject/26811832/,,,30-CATENA", new String[] { "羞耻 第三季", "96" });
			res.put("https://movie.douban.com/subject/26742360/,,,30-CATENA", new String[] { "玛嘉烈与大卫", "89" });
			res.put("https://movie.douban.com/subject/26862270/,,,30-CATENA", new String[] { "一年生", "89" });
			res.put("https://movie.douban.com/subject/26785286/,,,30-CATENA", new String[] { "荼蘼", "86" });
			res.put("https://movie.douban.com/subject/26358795/,,,30-CATENA", new String[] { "凡尔赛 第一季", "86" });
			res.put("https://movie.douban.com/subject/26667080/,,,30-CATENA", new String[] { "一屋老友记", "82" });
			res.put("https://movie.douban.com/subject/26381346/,,,30-CATENA", new String[] { "城寨英雄", "81" });
			res.put("https://movie.douban.com/subject/26342366/,,,30-CATENA", new String[] { "EU超时任务", "83" });
			res.put("https://movie.douban.com/subject/26667082/,,,30-CATENA", new String[] { "律政强人", "78" });
			res.put("https://movie.douban.com/subject/26715657/,,,30-CATENA", new String[] { "幕后玩家", "74" });
			
			res.put("https://movie.douban.com/subject/26602304/,,,31-CATENA", new String[] { "人如果不知道自己身处在何处，是无法前进的。" });
			
			res.put("32.2016最受关注的大陆电视综艺", new String[] { time, "https://movie.douban.com/annual/2016#32" });
			res.put("https://movie.douban.com/subject/26615572/,,,32-CATENA", new String[] { "极限挑战 第二季", "92" });
			res.put("https://movie.douban.com/subject/26705307/,,,32-CATENA", new String[] { "欢乐喜剧人", "79" });
			res.put("https://movie.douban.com/subject/26627743/,,,32-CATENA", new String[] { "我是歌手 第四季", "68" });
			res.put("https://movie.douban.com/subject/26641637/,,,32-CATENA", new String[] { "极速前进 第三季", "83" });
			res.put("https://movie.douban.com/subject/26740041/,,,32-CATENA", new String[] { "非凡搭档", "83" });
			res.put("https://movie.douban.com/subject/26575151/,,,32-CATENA", new String[] { "真正男子汉 第二季", "74" });
			res.put("https://movie.douban.com/subject/26710402/,,,32-CATENA", new String[] { "奔跑吧兄弟 第四季", "50" });
			res.put("https://movie.douban.com/subject/26613450/,,,32-CATENA", new String[] { "我们相爱吧 第二季", "66" });
			res.put("https://movie.douban.com/subject/26703893/,,,32-CATENA", new String[] { "我们来了 第一季", "70" });
			res.put("https://movie.douban.com/subject/26639186/,,,32-CATENA", new String[] { "我去上学啦 第二季", "76" });
			
			res.put("33.2016最受关注的大陆网络综艺", new String[] { time, "https://movie.douban.com/annual/2016#33" });
			res.put("https://movie.douban.com/subject/26581134/,,,33-CATENA", new String[] { "奇葩说 第三季", "86" });
			res.put("https://movie.douban.com/subject/26737158/,,,33-CATENA", new String[] { "明星大侦探 第一季", "91" });
			res.put("https://movie.douban.com/subject/26759650/,,,33-CATENA", new String[] { "火星情报局 第一季", "73" });
			res.put("https://movie.douban.com/subject/26649931/,,,33-CATENA", new String[] { "爸爸去哪儿 第四季", "67" });
			res.put("https://movie.douban.com/subject/26820671/,,,33-CATENA", new String[] { "饭局的诱惑 第一季", "74" });
			res.put("https://movie.douban.com/subject/26760485/,,,33-CATENA", new String[] { "姐姐好饿 第一季", "58" });
			res.put("https://movie.douban.com/subject/26794795/,,,33-CATENA", new String[] { "拜托了冰箱 第二季", "76" });
			res.put("https://movie.douban.com/subject/26873826/,,,33-CATENA", new String[] { "瓣嘴 第一季", "67" });
			res.put("https://movie.douban.com/subject/26897019/,,,33-CATENA", new String[] { "圆桌派 第一季", "89" });
			res.put("https://movie.douban.com/subject/26821032/,,,33-CATENA", new String[] { "放开我北鼻 第一季", "84" });
			
			res.put("34.2016评分最高的动画剧集", new String[] { time, "https://movie.douban.com/annual/2016#34" });
			res.put("https://movie.douban.com/subject/26581673/,,,34-CATENA", new String[] { "马男波杰克 第三季", "95" });
			res.put("https://movie.douban.com/subject/26727361/,,,34-CATENA", new String[] { "咱们裸熊 第二季", "95" });
			res.put("https://movie.douban.com/subject/26754896/,,,34-CATENA", new String[] { "夏目友人帐", "94" });
			res.put("https://movie.douban.com/subject/26677934/,,,34-CATENA", new String[] { "灵能百分百", "93" });
			res.put("https://movie.douban.com/subject/26277363/,,,34-CATENA", new String[] { "昭和元禄落语心中", "94" });
			res.put("https://movie.douban.com/subject/26801048/,,,34-CATENA", new String[] { "齐木楠雄的灾难", "93" });
			res.put("https://movie.douban.com/subject/26427106/,,,34-CATENA", new String[] { "只有我不存在的城市", "88" });
			res.put("https://movie.douban.com/subject/26375693/,,,34-CATENA", new String[] { "暗杀教室 第2季", "89" });
			res.put("https://movie.douban.com/subject/26756212/,,,34-CATENA", new String[] { "冰上的尤里", "86" });
			res.put("https://movie.douban.com/subject/26608268/,,,34-CATENA", new String[] { "亚人", "85" });
			
			res.put("35.2016评分最高的纪录剧集", new String[] { time, "https://movie.douban.com/annual/2016#35" });
			res.put("https://movie.douban.com/subject/26733371/,,,35-CATENA", new String[] { "地球脉动 第二季", "99" });
			res.put("https://movie.douban.com/subject/26815163/,,,35-CATENA", new String[] { "人间世 第一季", "96" });
			res.put("https://movie.douban.com/subject/26681664/,,,35-CATENA", new String[] { "辛普森：美国制造", "95" });
			res.put("https://movie.douban.com/subject/26703457/,,,35-CATENA", new String[] { "我在故宫修文物", "94" });
			res.put("https://movie.douban.com/subject/26717015/,,,35-CATENA", new String[] { "同行 第一季", "92" });
			res.put("https://movie.douban.com/subject/26884383/,,,35-CATENA", new String[] { "超级工程2", "88" });
			res.put("https://movie.douban.com/subject/26784894/,,,35-CATENA", new String[] { "寻味顺德", "90" });
			res.put("https://movie.douban.com/subject/26717834/,,,35-CATENA", new String[] { "本草中国", "85" });
			res.put("https://movie.douban.com/subject/26712210/,,,35-CATENA", new String[] { "中国新年：全球最大庆典", "81" });
			res.put("https://movie.douban.com/subject/26862279/,,,35-CATENA", new String[] { "法医密档", "81" });
			
			res.put("https://movie.douban.com/subject/26581673/,,,36-CATENA", new String[] { "爱到最后，要么伤人，要么受伤。有什么意义呢？" });
			
			res.put("41.1月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#41" });
			res.put("https://movie.douban.com/subject/25920885/,,,41", new String[] { "神探夏洛克：可恶的新娘", "69" });
			res.put("https://movie.douban.com/subject/24751756/,,,41", new String[] { "老炮儿", "78" });
			res.put("https://movie.douban.com/subject/26311973/,,,41", new String[] { "唐人街探案", "75" });
			res.put("https://movie.douban.com/subject/20326665/,,,41", new String[] { "星球大战7：原力觉醒", "71" });
			res.put("https://movie.douban.com/subject/3077412/,,,41", new String[] { "寻龙诀", "75" });
			
			res.put("42.2月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#42" });
			res.put("https://movie.douban.com/subject/19944106/,,,42", new String[] { "美人鱼", "67" });
			res.put("https://movie.douban.com/subject/11589036/,,,42", new String[] { "功夫熊猫3", "76" });
			res.put("https://movie.douban.com/subject/25827963/,,,42", new String[] { "西游记之孙悟空三打白骨精", "56" });
			res.put("https://movie.douban.com/subject/26726098/,,,42", new String[] { "他是龙", "74" });
			res.put("https://movie.douban.com/subject/26334559/,,,42", new String[] { "澳门风云3", "40" });
			
			res.put("43.3月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#43" });
			res.put("https://movie.douban.com/subject/25662329/,,,43", new String[] { "疯狂动物城", "92" });
			res.put("https://movie.douban.com/subject/5327268/,,,43", new String[] { "荒野猎人", "79" });
			res.put("https://movie.douban.com/subject/24750534/,,,43", new String[] { "蝙蝠侠大战超人：正义黎明", "67" });
			res.put("https://movie.douban.com/subject/11598977/,,,43", new String[] { "叶问3", "63" });
			res.put("https://movie.douban.com/subject/25724855/,,,43", new String[] { "房间", "88" });
			
			res.put("https://movie.douban.com/subject/25855071/,,,44", new String[] { "为你的悲伤而快乐，那就是爱的感觉，悲喜交加。" });
			
			res.put("45.4月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#45" });
			res.put("https://movie.douban.com/subject/25777636/,,,45", new String[] { "奇幻森林", "78" });
			res.put("https://movie.douban.com/subject/25662327/,,,45", new String[] { "火锅英雄", "72" });
			res.put("https://movie.douban.com/subject/26259677/,,,45", new String[] { "垫底辣妹", "82" });
			res.put("https://movie.douban.com/subject/3718279/,,,45", new String[] { "死侍", "77" });
			res.put("https://movie.douban.com/subject/25757186/,,,45", new String[] { "伦敦陷落", "61" });
			
			res.put("46.5月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#46" });
			res.put("https://movie.douban.com/subject/25820460/,,,46", new String[] { "美国队长3", "78" });
			res.put("https://movie.douban.com/subject/26322792/,,,46", new String[] { "北京遇上西雅图之不二情书", "64" });
			res.put("https://movie.douban.com/subject/10831445/,,,46", new String[] { "百鸟朝凤", "80" });
			res.put("https://movie.douban.com/subject/25966085/,,,46", new String[] { "踏血寻梅", "74" });
			res.put("https://movie.douban.com/subject/6873736/,,,46", new String[] { "愤怒的小鸟", "71" });
			
			res.put("47.6月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#47" });
			res.put("https://movie.douban.com/subject/2131940/,,,47", new String[] { "魔兽", "77" });
			res.put("https://movie.douban.com/subject/25786060/,,,47", new String[] { "X战警：天启", "77" });
			res.put("https://movie.douban.com/subject/25662337/,,,47", new String[] { "惊天魔盗团2", "66" });
			res.put("https://movie.douban.com/subject/4811813/,,,47", new String[] { "独立日2：卷土重来", "56" });
			res.put("javascript:;,,,47", new String[] { "树大招风", "80" });
			
			res.put("https://movie.douban.com/subject/26337866/,,,48", new String[] { "当我的光曝在你身上，重逢就是一间暗室。" });
			
			res.put("49.7月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#49" });
			res.put("https://movie.douban.com/subject/5045678/,,,49", new String[] { "大鱼海棠", "67" });
			res.put("https://movie.douban.com/subject/20505982/,,,49", new String[] { "寒战2", "70" });
			res.put("https://movie.douban.com/subject/25929151/,,,49", new String[] { "遇见你之前", "77" });
			res.put("https://movie.douban.com/subject/26614893/,,,49", new String[] { "完美陌生人", "85" });
			res.put("https://movie.douban.com/subject/26337866/,,,49", new String[] { "路边野餐", "78" });
			
			res.put("50.8月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#50" });
			res.put("https://movie.douban.com/subject/24827387/,,,50", new String[] { "盗墓笔记", "47" });
			res.put("https://movie.douban.com/subject/21817627/,,,50", new String[] { "爱宠大机密", "76" });
			res.put("https://movie.douban.com/subject/26266072/,,,50", new String[] { "谍影重重5", "73" });
			res.put("https://movie.douban.com/subject/26336253/,,,50", new String[] { "使徒行者", "67" });
			res.put("https://movie.douban.com/subject/25977027/,,,50", new String[] { "小姐", "80" });
			
			res.put("51.9月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#51" });
			res.put("https://movie.douban.com/subject/25986180/,,,51", new String[] { "釜山行", "83" });
			res.put("https://movie.douban.com/subject/22939161/,,,51", new String[] { "星际迷航3：超越星辰 ", "74" });
			res.put("https://movie.douban.com/subject/25827935/,,,51", new String[] { "七月与安生", "76" });
			res.put("https://movie.douban.com/subject/26284621/,,,51", new String[] { "追凶者也", "77" });
			res.put("https://movie.douban.com/subject/26410594/,,,51", new String[] { "隧道", "77" });
			
			res.put("https://movie.douban.com/subject/26630781/,,,52", new String[] { "我们觉得她是小白菜，她前夫说她是潘金莲，她自己觉得自己冤得像窦娥，这三个妇女，单拎出来一个都不好对付，三个难缠的人缠在一起，都变成三头六臂了。" });
			
			res.put("53.10月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#53" });
			res.put("https://movie.douban.com/subject/25815034/,,,53", new String[] { "湄公河行动", "79" });
			res.put("https://movie.douban.com/subject/26280528/,,,53", new String[] { "从你的全世界路过", "52" });
			res.put("https://movie.douban.com/subject/26354336/,,,53", new String[] { "爵迹", "38" });
			res.put("https://movie.douban.com/subject/25921812/,,,53", new String[] { "驴得水", "83" });
			res.put("https://movie.douban.com/subject/26437237/,,,53", new String[] { "瑞士军刀男", "78" });
			
			res.put("54.11月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#54" });
			res.put("https://movie.douban.com/subject/3025375/,,,54", new String[] { "奇异博士", "76" });
			res.put("https://movie.douban.com/subject/25983044/,,,54", new String[] { "比利·林恩的中场战事", "84" });
			res.put("https://movie.douban.com/subject/25726614/,,,54", new String[] { "神奇动物在哪里", "78" });
			res.put("https://movie.douban.com/subject/26630781/,,,54", new String[] { "我不是潘金莲", "67" });
			res.put("https://movie.douban.com/subject/25899379/,,,54", new String[] { "请叫我英雄", "70" });
			
			res.put("55.12月最热门电影", new String[] { time, "https://movie.douban.com/annual/2016#55" });
			res.put("https://movie.douban.com/subject/26683290/,,,55", new String[] { "你的名字", "84" });
			res.put("https://movie.douban.com/subject/26325320/,,,55", new String[] { "血战钢锯岭", "87" });
			res.put("https://movie.douban.com/subject/6982558/,,,55", new String[] { "长城", "49" });
			res.put("https://movie.douban.com/subject/24751763/,,,55", new String[] { "罗曼蒂克消亡史", "77" });
			res.put("https://movie.douban.com/subject/25911694/,,,55", new String[] { "摆渡人", "40" });
			
			res.put("https://movie.douban.com/subject/25726614/,,,56", new String[] { "世界上最好的魔法学校是霍格沃茨。" });
			
			res.put("57.2016上映10周年的电影", new String[] { time, "https://movie.douban.com/annual/2016#57" });
			res.put("https://movie.douban.com/subject/1849031/,,,57", new String[] { "当幸福来敲门", "90" });
			res.put("https://movie.douban.com/subject/1780330/,,,57", new String[] { "致命魔术", "88" });
			res.put("https://movie.douban.com/subject/1482072/,,,57", new String[] { "穿普拉达的女王", "80" });
			res.put("https://movie.douban.com/subject/1862151/,,,57", new String[] { "疯狂的石头", "84" });
			res.put("https://movie.douban.com/subject/1760622/,,,57", new String[] { "香水", "84" });
			res.put("https://movie.douban.com/subject/1787291/,,,57", new String[] { "被嫌弃的松子的一生", "89" });
			res.put("https://movie.douban.com/subject/1900841/,,,57", new String[] { "窃听风暴", "91" });
			res.put("https://movie.douban.com/subject/1777612/,,,57", new String[] { "阳光小美女", "83" });
			res.put("https://movie.douban.com/subject/1767042/,,,57", new String[] { "潘神的迷宫", "78" });
			res.put("https://movie.douban.com/subject/1865703/,,,57", new String[] { "红辣椒", "89" });
			
			res.put("58.2016上映20周年的电影", new String[] { time, "https://movie.douban.com/annual/2016#58" });
			res.put("https://movie.douban.com/subject/1292528/,,,58", new String[] { "猜火车", "85" });
			res.put("https://movie.douban.com/subject/1305164/,,,58", new String[] { "甜蜜蜜", "88" });
			res.put("https://movie.douban.com/subject/1293351/,,,58", new String[] { "食神", "79" });
			res.put("https://movie.douban.com/subject/1291853/,,,58", new String[] { "英国病人", "85" });
			res.put("https://movie.douban.com/subject/1329936/,,,58", new String[] { "大内密探零零发", "77" });
			res.put("https://movie.douban.com/subject/1292728/,,,58", new String[] { "勇闯夺命岛", "86" });
			res.put("https://movie.douban.com/subject/1293013/,,,58", new String[] { "独立日", "80" });
			res.put("https://movie.douban.com/subject/1292484/,,,58", new String[] { "碟中谍", "80" });
			res.put("https://movie.douban.com/subject/1307793/,,,58", new String[] { "燕尾蝶", "86" });
			res.put("https://movie.douban.com/subject/1433736/,,,58", new String[] { "古惑仔之人在江湖", "78" });
			
			res.put("59.2016上映30周年的电影", new String[] { time, "https://movie.douban.com/annual/2016#59" });
			res.put("https://movie.douban.com/subject/1291583/,,,59", new String[] { "天空之城", "91" });
			res.put("https://movie.douban.com/subject/1297574/,,,59", new String[] { "英雄本色", "86" });
			res.put("https://movie.douban.com/subject/1293792/,,,59", new String[] { "异形2", "79" });
			res.put("https://movie.douban.com/subject/1292925/,,,59", new String[] { "伴我同行", "89" });
			res.put("https://movie.douban.com/subject/1293799/,,,59", new String[] { "壮志凌云", "76" });
			res.put("https://movie.douban.com/subject/1297880/,,,59", new String[] { "芙蓉镇", "91" });
			res.put("javascript:;,,,59", new String[] { "巴黎野玫瑰", "81" });
			res.put("https://movie.douban.com/subject/1293396/,,,59", new String[] { "野战排", "82" });
			res.put("https://movie.douban.com/subject/1305261/,,,59", new String[] { "恐怖分子", "88" });
			res.put("https://movie.douban.com/subject/1294366/,,,59", new String[] { "霹雳五号", "86" });
			
			res.put("https://movie.douban.com/subject/26694988/,,,60", new String[] { "所谓幸福，都必须放弃一些东西后才能得到。" });
			
			res.put("61.2016上映40周年的电影", new String[] { time, "https://movie.douban.com/annual/2016#61" });
			res.put("https://movie.douban.com/subject/1292222/,,,61", new String[] { "出租车司机", "84" });
			res.put("javascript:;,,,61", new String[] { "感官世界", "68" });
			res.put("https://movie.douban.com/subject/1295742/,,,61", new String[] { "洛奇", "86" });
			res.put("https://movie.douban.com/subject/1292664/,,,61", new String[] { "魔女嘉莉", "74" });
			res.put("https://movie.douban.com/subject/1291863/,,,61", new String[] { "追捕", "82" });
			res.put("https://movie.douban.com/subject/1298917/,,,61", new String[] { "卡桑德拉大桥", "82" });
			res.put("https://movie.douban.com/subject/1448758/,,,61", new String[] { "半斤八两", "82" });
			res.put("https://movie.douban.com/subject/1297399/,,,61", new String[] { "怪房客", "79" });
			res.put("https://movie.douban.com/subject/1297531/,,,61", new String[] { "电视台风云", "84" });
			res.put("https://movie.douban.com/subject/1300956/,,,61", new String[] { "一九零零", "87" });
			
			res.put("62.2016上映50周年的电影", new String[] { time, "https://movie.douban.com/annual/2016#62" });
			res.put("https://movie.douban.com/subject/1296909/,,,62", new String[] { "虎口脱险", "89" });
			res.put("https://movie.douban.com/subject/1401118/,,,62", new String[] { "黄金三镖客", "91" });
			res.put("https://movie.douban.com/subject/1310176/,,,62", new String[] { "放大", "85" });
			res.put("https://movie.douban.com/subject/1294438/,,,62", new String[] { "假面", "87" });
			res.put("https://movie.douban.com/subject/1293864/,,,62", new String[] { "偷龙转凤", "81" });
			res.put("https://movie.douban.com/subject/1297606/,,,62", new String[] { "一个男人和一个女人", "84" });
			res.put("https://movie.douban.com/subject/1440164/,,,62", new String[] { "大菩萨岭", "86" });
			res.put("https://movie.douban.com/subject/1301946/,,,62", new String[] { "大醉侠", "75" });
			res.put("https://movie.douban.com/subject/1298248/,,,62", new String[] { "安德烈·卢布廖夫", "89" });
			res.put("https://movie.douban.com/subject/1303081/,,,62", new String[] { "严密监视的列车", "82" });
			
			res.put("https://movie.douban.com/subject/3718279/,,,63", new String[] { "当你的生活变成一坨屎的时候，通常都是因为你当时做的傻逼决定。" });
			
			res.put("64.2016开播10周年的剧集", new String[] { time, "https://movie.douban.com/annual/2016#64" });
			res.put("https://movie.douban.com/subject/3882715/,,,64-CATENA", new String[] { "武林外传", "94" });
			res.put("https://movie.douban.com/subject/1997685/,,,64-CATENA", new String[] { "交响情人梦", "91" });
			res.put("https://movie.douban.com/subject/2154096/,,,64-CATENA", new String[] { "士兵突击", "93" });
			res.put("https://movie.douban.com/subject/1758810/,,,64-CATENA", new String[] { "IT狂人 第一季", "90" });
			res.put("https://movie.douban.com/subject/2031438/,,,64-CATENA", new String[] { "白夜行", "83" });
			res.put("https://movie.douban.com/subject/1837856/,,,64-CATENA", new String[] { "英雄 第一季", "83" });
			res.put("https://movie.douban.com/subject/2360882/,,,64-CATENA", new String[] { "搞笑一家人", "95" });
			res.put("https://movie.douban.com/subject/1922656/,,,64-CATENA", new String[] { "法证先锋", "84" });
			res.put("https://movie.douban.com/subject/2160933/,,,64-CATENA", new String[] { "不能结婚的男人", "89" });
			res.put("javascript:;,,,64-CATENA", new String[] { "嗜血法医 第一季", "85" });
			
			res.put("65.2016开播20周年的剧集", new String[] { time, "https://movie.douban.com/annual/2016#65" });
			res.put("https://movie.douban.com/subject/1436674/,,,65-CATENA", new String[] { "悠长假期", "92" });
			res.put("https://movie.douban.com/subject/2148799/,,,65-CATENA", new String[] { "一吻定情", "84" });
			res.put("https://movie.douban.com/subject/2294255/,,,65-CATENA", new String[] { "笑傲江湖", "83" });
			res.put("https://movie.douban.com/subject/1906453/,,,65-CATENA", new String[] { "天地男儿", "85" });
			res.put("https://movie.douban.com/subject/1440973/,,,65-CATENA", new String[] { "绅士刑警2 古畑任三郎", "93" });
			res.put("https://movie.douban.com/subject/1440406/,,,65-CATENA", new String[] { "人人都爱雷蒙德 第一季", "86" });
			res.put("https://movie.douban.com/subject/2342578/,,,65-CATENA", new String[] { "900重案追凶", "82" });
			res.put("https://movie.douban.com/subject/1417489/,,,65-CATENA", new String[] { "伪装者 第一季", "87" });
			res.put("https://movie.douban.com/subject/1981850/,,,65-CATENA", new String[] { "白线流", "90" });
			res.put("https://movie.douban.com/subject/2222635/,,,65-CATENA", new String[] { "塞外奇侠", "81" });
			
			res.put("66.2016开播30周年的剧集", new String[] { time, "https://movie.douban.com/annual/2016#66" });
			res.put("https://movie.douban.com/subject/2156663/,,,66-CATENA", new String[] { "西游记", "95" });
			res.put("https://movie.douban.com/subject/1441948/,,,66-CATENA", new String[] { "是，首相 第一季", "97" });
			res.put("https://movie.douban.com/subject/1484601/,,,66-CATENA", new String[] { "黑爵士二世", "92" });
			res.put("https://movie.douban.com/subject/1476257/,,,66-CATENA", new String[] { "福尔摩斯归来记", "96" });
			res.put("https://movie.douban.com/subject/4160349/,,,66-CATENA", new String[] { "狄仁杰断案传奇", "89" });
			
			res.put("https://movie.douban.com/subject/25921812/,,,67", new String[] { "过去的如果就这么过去了，以后只会越来越糟。" });
			
			res.put("68.2017最值得期待的华语电影", new String[] { time, "https://movie.douban.com/annual/2016#68" });
			res.put("https://movie.douban.com/subject/25801066/,,,68", new String[] { "西游伏妖篇", "55" });
			res.put("https://movie.douban.com/subject/25823277/,,,68", new String[] { "三生三世十里桃花", "39" });
			res.put("https://movie.douban.com/subject/26606743/,,,68", new String[] { "嫌疑人X的献身", "63" });
			res.put("https://movie.douban.com/subject/26728669/,,,68", new String[] { "风中有朵雨做的云", "79" });
			res.put("https://movie.douban.com/subject/6874741/,,,68", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26035290/,,,68", new String[] { "悟空传", "51" });
			res.put("https://movie.douban.com/subject/5350027/,,,68", new String[] { "妖猫传", "69" });
			res.put("https://movie.douban.com/subject/25884801/,,,68", new String[] { "记忆大师", "71" });
			res.put("https://movie.douban.com/subject/26639958/,,,68", new String[] { "春娇救志明", "70" });
			res.put("https://movie.douban.com/subject/26862259/,,,68", new String[] { "乘风波浪", "67" });
			
			res.put("69.2017最值得期待的外语电影", new String[] { time, "https://movie.douban.com/annual/2016#69" });
			res.put("https://movie.douban.com/subject/6311303/,,,69", new String[] { "加勒比海盗5：死无对证", "72" });
			res.put("https://movie.douban.com/subject/25818101/,,,69", new String[] { "攻壳机动队", "64" });
			res.put("https://movie.douban.com/subject/26607693/,,,69", new String[] { "敦刻尔克", "84" });
			res.put("https://movie.douban.com/subject/11803087/,,,69", new String[] { "异形：契约", "73" });
			res.put("https://movie.douban.com/subject/22263645/,,,69", new String[] { "猜火车2", "80" });
			res.put("https://movie.douban.com/subject/1578714/,,,69", new String[] { "神奇女侠", "71" });
			res.put("https://movie.douban.com/subject/2158490/,,,69", new String[] { "正义联盟", "65" });
			res.put("https://movie.douban.com/subject/25937854/,,,69", new String[] { "银河护卫队2", "80" });
			res.put("https://movie.douban.com/subject/6854414/,,,69", new String[] { "歌声不绝", "56" });
			res.put("https://movie.douban.com/subject/25821634/,,,69", new String[] { "雷神3：诸神黄昏", "74" });
			
			res.put("70.2016-2017北美颁奖季热门佳片", new String[] { time, "https://movie.douban.com/annual/2016#70" });
			res.put("https://movie.douban.com/subject/25934014/,,,70", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/25980443/,,,70", new String[] { "海边的曼彻斯特", "86" });
			res.put("https://movie.douban.com/subject/26325320/,,,70", new String[] { "血战钢锯岭", "87" });
			res.put("https://movie.douban.com/subject/1884684/,,,70", new String[] { "沉默", "76" });
			res.put("https://movie.douban.com/subject/26416603/,,,70", new String[] { "萨利机长", "83" });
			res.put("https://movie.douban.com/subject/26389148/,,,70", new String[] { "赴汤蹈火", "80" });
			res.put("https://movie.douban.com/subject/26353372/,,,70", new String[] { "夜行动物", "74" });
			res.put("https://movie.douban.com/subject/26648249/,,,70", new String[] { "月光男孩", "83" });
			res.put("https://movie.douban.com/subject/21324900/,,,70", new String[] { "降临", "77" });
			res.put("https://movie.douban.com/subject/4849728/,,,70", new String[] { "第一夫人", "66" });
		} else if (id.equals("douban2017")) {
			res.put("1.2017评分最高的外语电影", new String[] { time, "https://movie.douban.com/annual/2017#1" });
			res.put("https://movie.douban.com/subject/26387939/,,,1", new String[] { "摔跤吧！爸爸", "90" });
			res.put("https://movie.douban.com/subject/26799731/,,,1", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/26580232/,,,1", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/25980443/,,,1", new String[] { "海边的曼彻斯特", "86" });
			res.put("https://movie.douban.com/subject/10512661/,,,1", new String[] { "银翼杀手2049", "83" });
			res.put("https://movie.douban.com/subject/26761416/,,,1", new String[] { "至暗时刻", "85" });
			res.put("https://movie.douban.com/subject/26607693/,,,1", new String[] { "敦刻尔克", "84" });
			res.put("https://movie.douban.com/subject/25934014/,,,1", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/26844922/,,,1", new String[] { "杰出公民", "84" });
			res.put("https://movie.douban.com/subject/27024903/,,,1", new String[] { "天才枪手", "82" });
			
			res.put("2.2017评分最高的华语电影", new String[] { time, "https://movie.douban.com/annual/2017#2" });
			res.put("https://movie.douban.com/subject/27019527/,,,2", new String[] { "嘉年华", "82" });
			res.put("https://movie.douban.com/subject/26773744/,,,2", new String[] { "相爱相亲", "84" });
			res.put("https://movie.douban.com/subject/26657126/,,,2", new String[] { "不成问题的问题", "82" });
			res.put("https://movie.douban.com/subject/11600078/,,,2", new String[] { "目击者之追凶", "82" });
			res.put("https://movie.douban.com/subject/26862829/,,,2", new String[] { "芳华", "76" });
			res.put("https://movie.douban.com/subject/26704590/,,,2", new String[] { "一念无明", "79" });
			res.put("https://movie.douban.com/subject/26606242/,,,2", new String[] { "冈仁波齐", "77" });
			res.put("https://movie.douban.com/subject/26270502/,,,2", new String[] { "绣春刀II：修罗战场", "72" });
			res.put("https://movie.douban.com/subject/26790961/,,,2", new String[] { "闪光少女", "73" });
			res.put("https://movie.douban.com/subject/26877237/,,,2", new String[] { "29+1", "72" });
			
			res.put("https://movie.douban.com/subject/26799731/,,,3", new String[] { "别让这些痛苦消失，也别丧失你感受到的快乐。" });
			
			res.put("4.2017最受关注的院线电影", new String[] { time, "https://movie.douban.com/annual/2017#4" });
			res.put("https://movie.douban.com/subject/26363254/,,,4", new String[] { "战狼2", "70" });
			res.put("https://movie.douban.com/subject/26387939/,,,4", new String[] { "摔跤吧！爸爸", "90" });
			res.put("https://movie.douban.com/subject/25934014/,,,4", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/20495023/,,,4", new String[] { "寻梦环游记", "90" });
			res.put("https://movie.douban.com/subject/26862259/,,,4", new String[] { "乘风破浪", "67" });
			res.put("https://movie.douban.com/subject/26580232/,,,4", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/26607693/,,,4", new String[] { "敦刻尔克", "84" });
			res.put("https://movie.douban.com/subject/27038183/,,,4", new String[] { "羞羞的铁拳", "69" });
			res.put("https://movie.douban.com/subject/27024903/,,,4", new String[] { "天才枪手", "82" });
			res.put("https://movie.douban.com/subject/25765735/,,,4", new String[] { "金刚狼3：殊死一战", "83" });
			
			res.put("5.2017最受关注的非院线电影", new String[] { time, "https://movie.douban.com/annual/2017#5" });
			res.put("https://movie.douban.com/subject/26688480/,,,5", new String[] { "逃出绝命镇", "76" });
			res.put("https://movie.douban.com/subject/26648249/,,,5", new String[] { "月光男孩", "73" });
			res.put("https://movie.douban.com/subject/26279289/,,,5", new String[] { "怒", "77" });
			res.put("https://movie.douban.com/subject/26600660/,,,5", new String[] { "分裂", "73" });
			res.put("https://movie.douban.com/subject/26799731/,,,5", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/3604148/,,,5", new String[] { "小丑回魂", "73" });
			res.put("https://movie.douban.com/subject/26593587/,,,5", new String[] { "天才少女", "82" });
			res.put("https://movie.douban.com/subject/11600078/,,,5", new String[] { "目击者之追凶", "82" });
			res.put("https://movie.douban.com/subject/26615208/,,,5", new String[] { "隐藏人物", "87" });
			res.put("https://movie.douban.com/subject/22263645/,,,5", new String[] { "猜火车2", "80" });
			
			res.put("https://movie.douban.com/subject/26580232/,,,6", new String[] { "欲要得到救赎，必先承受痛苦。" });
			
			res.put("8.2017年度最期待华语独立佳作", new String[] { time, "https://movie.douban.com/annual/2017#8" });
			res.put("https://movie.douban.com/subject/26961159/,,,8", new String[] { "囚", "92" });
			res.put("https://movie.douban.com/subject/27059130/,,,8", new String[] { "大佛普拉斯", "87" });
			res.put("https://movie.douban.com/subject/26738204/,,,8", new String[] { "村戏", "82" });
			res.put("https://movie.douban.com/subject/26903993/,,,8", new String[] { "中国梵高", "77" });
			res.put("https://movie.douban.com/subject/27113517/,,,8", new String[] { "血观音", "83" });
			res.put("https://movie.douban.com/subject/26954003/,,,8", new String[] { "大世界", "70" });
			res.put("https://movie.douban.com/subject/27077266/,,,8", new String[] { "米花之味", "75" });
			res.put("https://movie.douban.com/subject/26647117/,,,8", new String[] { "暴裂无声", "82" });
			res.put("https://movie.douban.com/subject/26930782/,,,8", new String[] { "强尼凯克 強尼·凱克", "68" });
			res.put("https://movie.douban.com/subject/26969821/,,,8", new String[] { "笨鸟", "68" });
			
			res.put("9.2017年度中国大陆网络/电视电影", new String[] { time, "https://movie.douban.com/annual/2017#9" });
			res.put("https://movie.douban.com/subject/26951951/,,,9-CATENA", new String[] { "小戏骨：红楼梦之刘姥姥进大观园", "91" });
			res.put("https://movie.douban.com/subject/26951953/,,,9-CATENA", new String[] { "小戏骨：放开那三国", "80" });
			res.put("https://movie.douban.com/subject/26990713/,,,9", new String[] { "我的上高", "80" });
			res.put("https://movie.douban.com/subject/26771100/,,,9", new String[] { "星游记之风暴法米拉", "76" });
			res.put("https://movie.douban.com/subject/26296026/,,,9", new String[] { "在勾引中学会爱2", "77" });
			res.put("https://movie.douban.com/subject/26959223/,,,9", new String[] { "灵魂摆渡之风华绝代", "75" });
			res.put("https://movie.douban.com/subject/27041519/,,,9", new String[] { "哀乐女子天团", "67" });
			res.put("https://movie.douban.com/subject/26891314/,,,9-CATENA", new String[] { "小戏骨：花木兰", "68" });
			res.put("https://movie.douban.com/subject/27133264/,,,9", new String[] { "海带", "66" });
			res.put("https://movie.douban.com/subject/27065880/,,,9-CATENA", new String[] { "暴走刑警", "62" });
			
			res.put("10.2017年度冷门佳片", new String[] { time, "https://movie.douban.com/annual/2017#10" });
			res.put("https://movie.douban.com/subject/25938803/,,,10", new String[] { "莫娣", "90" });
			res.put("https://movie.douban.com/subject/25822430/,,,10", new String[] { "炙热", "85" });
			res.put("https://movie.douban.com/subject/26586432/,,,10", new String[] { "契克", "84" });
			res.put("https://movie.douban.com/subject/26881114/,,,10", new String[] { "沃伦", "83" });
			res.put("https://movie.douban.com/subject/26942631/,,,10", new String[] { "起跑线", "79" });
			res.put("https://movie.douban.com/subject/26384493/,,,10", new String[] { "以女儿之名", "84" });
			res.put("https://movie.douban.com/subject/26593587/,,,10", new String[] { "天才少女", "82" });
			res.put("https://movie.douban.com/subject/26685451/,,,10", new String[] { "流浪猫鲍勃", "80" });
			res.put("https://movie.douban.com/subject/26700276/,,,10", new String[] { "我去哪儿", "81" });
			res.put("https://movie.douban.com/subject/26727890/,,,10", new String[] { "女教师", "81" });
			
			res.put("https://movie.douban.com/subject/26773744/,,,11", new String[] { "现在车有了，歌也有了，你倒没兴致了。" });
			
			res.put("12.2017评分最高的韩国电影", new String[] { time, "https://movie.douban.com/annual/2017#12" });
			res.put("https://movie.douban.com/subject/27000061/,,,12", new String[] { "我能说", "88" });
			res.put("https://movie.douban.com/subject/26616436/,,,12", new String[] { "我们的世界", "84" });
			res.put("https://movie.douban.com/subject/26445216/,,,12", new String[] { "军舰岛", "78" });
			res.put("https://movie.douban.com/subject/26800978/,,,12", new String[] { "南汉山城", "78" });
			res.put("https://movie.douban.com/subject/26748688/,,,12", new String[] { "恋爱谈", "77" });
			res.put("https://movie.douban.com/subject/27018296/,,,12", new String[] { "之后", "75" });
			res.put("https://movie.douban.com/subject/26410593/,,,12", new String[] { "王者", "75" });
			res.put("https://movie.douban.com/subject/26169607/,,,12", new String[] { "潘多拉", "76" });
			res.put("https://movie.douban.com/subject/26340301/,,,12", new String[] { "被操纵的城市", "74" });
			res.put("https://movie.douban.com/subject/26718282/,,,12", new String[] { "独自在夜晚的海边", "73" });
			
			res.put("13.2017评分最高的日本电影", new String[] { time, "https://movie.douban.com/annual/2017#13" });
			res.put("https://movie.douban.com/subject/26754513/,,,13", new String[] { "人生密密缝", "84" });
			res.put("https://movie.douban.com/subject/26848504/,,,13", new String[] { "家族之苦2", "84" });
			res.put("https://movie.douban.com/subject/26815162/,,,13", new String[] { "生存家族", "81" });
			res.put("https://movie.douban.com/subject/26798437/,,,13", new String[] { "深夜食堂2", "80" });
			res.put("https://movie.douban.com/subject/26691320/,,,13", new String[] { "帝一之国", "81" });
			res.put("https://movie.douban.com/subject/26842503/,,,13", new String[] { "啊，荒野.前篇", "82" });
			res.put("https://movie.douban.com/subject/26279289/,,,13", new String[] { "怒", "77" });
			res.put("https://movie.douban.com/subject/26421442/,,,13", new String[] { "滚烫的爱", "78" });
			res.put("https://movie.douban.com/subject/26751899/,,,13", new String[] { "愚行录", "77" });
			res.put("https://movie.douban.com/subject/26809007/,,,13", new String[] { "奇迹，那天如此重要", "76" });
			
			res.put("14.2017评分最高的欧洲电影", new String[] { time, "https://movie.douban.com/annual/2017#14" });
			res.put("https://movie.douban.com/subject/26580232/,,,14", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/26799731/,,,14", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/26761416/,,,14", new String[] { "至暗时刻", "85" });
			res.put("https://movie.douban.com/subject/26340419/,,,14", new String[] { "帕丁顿熊2", "81" });
			res.put("https://movie.douban.com/subject/26653676/,,,14", new String[] { "我是布莱克", "82" });
			res.put("https://movie.douban.com/subject/26616719/,,,14", new String[] { "弗兰兹", "83" });
			res.put("https://movie.douban.com/subject/26746559/,,,14", new String[] { "每分钟120击", "83" });
			res.put("https://movie.douban.com/subject/22263645/,,,14", new String[] { "猜火车2", "80" });
			res.put("https://movie.douban.com/subject/26678509/,,,14", new String[] { "希望的另一面", "78" });
			res.put("https://movie.douban.com/subject/26964434/,,,14", new String[] { "肌肤", "76" });
			
			res.put("https://movie.douban.com/subject/20495023/,,,15", new String[] { "死亡不是真的逝去，遗忘才是永恒的消亡。" });
			
			res.put("16.2017年度LGBT电影", new String[] { time, "https://movie.douban.com/annual/2017#16" });
			res.put("https://movie.douban.com/subject/26799731/,,,16", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/26754513/,,,16", new String[] { "人生密密缝", "84" });
			res.put("https://movie.douban.com/subject/26746559/,,,16", new String[] { "每分钟120击", "83" });
			res.put("https://movie.douban.com/subject/26884826/,,,16", new String[] { "日常对话", "83" });
			res.put("https://movie.douban.com/subject/26279289/,,,16", new String[] { "怒", "77" });
			res.put("https://movie.douban.com/subject/26617395/,,,16", new String[] { "心之石", "77" });
			res.put("https://movie.douban.com/subject/26748688/,,,16", new String[] { "恋爱谈", "77" });
			res.put("https://movie.douban.com/subject/26360518/,,,16", new String[] { "二次旅程", "77" });
			res.put("https://movie.douban.com/subject/26648249/,,,16", new String[] { "月光男孩", "73" });
			res.put("https://movie.douban.com/subject/26781921/,,,16", new String[] { "跆拳道", "73" });
			
			res.put("17.2017评分最高的喜剧片", new String[] { time, "https://movie.douban.com/annual/2017#17" });
			res.put("https://movie.douban.com/subject/26340419/,,,17", new String[] { "帕丁顿熊2", "81" });
			res.put("https://movie.douban.com/subject/26700276/,,,17", new String[] { "我去哪儿", "81" });
			res.put("https://movie.douban.com/subject/6873143/,,,17", new String[] { "一条狗的使命", "77" });
			res.put("https://movie.douban.com/subject/26266085/,,,17", new String[] { "三个老枪手", "77" });
			res.put("https://movie.douban.com/subject/26884892/,,,17", new String[] { "大病", "75" });
			res.put("https://movie.douban.com/subject/26710371/,,,17", new String[] { "酒会", "73" });
			res.put("https://movie.douban.com/subject/27038183/,,,17", new String[] { "羞羞的铁拳", "69" });
			res.put("https://movie.douban.com/subject/22266126/,,,17", new String[] { "王牌保镖", "72" });
			res.put("https://movie.douban.com/subject/26769480/,,,17", new String[] { "一路顺风", "74" });
			res.put("https://movie.douban.com/subject/26723165/,,,17", new String[] { "神偷联盟", "71" });
			
			res.put("18.2017评分最高的爱情片", new String[] { time, "https://movie.douban.com/annual/2017#18" });
			res.put("https://movie.douban.com/subject/26799731/,,,18", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/25934014/,,,18", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/26616719/,,,18", new String[] { "弗兰兹", "83" });
			res.put("https://movie.douban.com/subject/26748688/,,,18", new String[] { "恋爱谈", "77" });
			res.put("https://movie.douban.com/subject/26884892/,,,18", new String[] { "大病", "75" });
			res.put("https://movie.douban.com/subject/26707472/,,,18", new String[] { "明日的我与昨日的你约会", "75" });
			res.put("https://movie.douban.com/subject/26920017/,,,18", new String[] { "鬼魅浮生", "75" });
			res.put("https://movie.douban.com/subject/26381195/,,,18", new String[] { "恋爱诊疗中", "77" });
			res.put("https://movie.douban.com/subject/26457368/,,,18", new String[] { "流浪巴黎", "75" });
			res.put("https://movie.douban.com/subject/26639958/,,,18", new String[] { "春娇救志明", "70" });
			
			res.put("https://movie.douban.com/subject/25934014/,,,19", new String[] { "等你拿到这个角色，你必须要付出一切，全力以赴，这是你的梦想。" });
			
			res.put("20.2017评分最高的科幻/动作片", new String[] { time, "https://movie.douban.com/annual/2017#20" });
			res.put("https://movie.douban.com/subject/10512661/,,,20", new String[] { "银翼杀手2049", "83" });
			res.put("https://movie.douban.com/subject/25765735/,,,20", new String[] { "金刚狼3：殊死一战", "83" });
			res.put("https://movie.douban.com/subject/25937854/,,,20", new String[] { "银河护卫队2", "80" });
			res.put("https://movie.douban.com/subject/21324900/,,,20", new String[] { "降临", "77" });
			res.put("https://movie.douban.com/subject/25821634/,,,20", new String[] { "雷神3：诸神黄昏", "77" });
			res.put("https://movie.douban.com/subject/24753477/,,,20", new String[] { "蜘蛛侠：英雄归来", "74" });
			res.put("https://movie.douban.com/subject/11803087/,,,20", new String[] { "异形：契约", "73" });
			res.put("https://movie.douban.com/subject/26333560/,,,20", new String[] { "疾速特攻", "74" });
			res.put("https://movie.douban.com/subject/1578714/,,,20", new String[] { "神奇女侠", "71" });
			res.put("https://movie.douban.com/subject/25933890/,,,20", new String[] { "极盗车神", "70" });
			
			res.put("21.2017评分最高的恐怖片", new String[] { time, "https://movie.douban.com/annual/2017#21" });
			res.put("https://movie.douban.com/subject/26688480/,,,21", new String[] { "逃出绝命镇", "76" });
			res.put("https://movie.douban.com/subject/3604148/,,,21", new String[] { "小丑回魂", "73" });
			res.put("https://movie.douban.com/subject/11803087/,,,21", new String[] { "异形：契约", "73" });
			res.put("https://movie.douban.com/subject/27027913/,,,21", new String[] { "忌日快乐", "71" });
			res.put("https://movie.douban.com/subject/26653833/,,,21", new String[] { "生吃", "71" });
			res.put("https://movie.douban.com/subject/26363201/,,,21", new String[] { "救命解药", "70" });
			res.put("https://movie.douban.com/subject/26704623/,,,21", new String[] { "天赐之女", "69" });
			res.put("https://movie.douban.com/subject/26704621/,,,21", new String[] { "辣手保姆", "67" });
			res.put("https://movie.douban.com/subject/26616731/,,,21", new String[] { "莱姆豪斯的杀人魔", "66" });
			res.put("https://movie.douban.com/subject/26720627/,,,21", new String[] { "报告老师！怪怪怪怪物！", "65" });
			
			res.put("22.2017评分最高的惊悚/犯罪片", new String[] { time, "https://movie.douban.com/annual/2017#22" });
			res.put("https://movie.douban.com/subject/26580232/,,,22", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/27024903/,,,22", new String[] { "天才枪手", "82" });
			res.put("https://movie.douban.com/subject/11600078/,,,22", new String[] { "目击者之追凶", "82" });
			res.put("https://movie.douban.com/subject/26357945/,,,22", new String[] { "恐袭波士顿", "81" });
			res.put("https://movie.douban.com/subject/26389601/,,,22", new String[] { "猎凶风河谷", "78" });
			res.put("https://movie.douban.com/subject/26751899/,,,22", new String[] { "愚行录", "77" });
			res.put("https://movie.douban.com/subject/26333560/,,,22", new String[] { "疾速特攻", "74" });
			res.put("https://movie.douban.com/subject/26391916/,,,22", new String[] { "杀人者的记忆法", "75" });
			res.put("https://movie.douban.com/subject/26661229/,,,22", new String[] { "隧道尽头", "74" });
			res.put("https://movie.douban.com/subject/26600660/,,,22", new String[] { "分裂", "73" });
			
			res.put("https://movie.douban.com/subject/27024903/,,,23", new String[] { "就算你诚实，可生活一样在欺骗你。" });
			
			res.put("24.2017评分最高的动画片", new String[] { time, "https://movie.douban.com/annual/2017#24" });
			res.put("https://movie.douban.com/subject/20495023/,,,24", new String[] { "寻梦环游记", "90" });
			res.put("https://movie.douban.com/subject/25837262/,,,24", new String[] { "至爱梵高·星空之谜", "85" });
			res.put("https://movie.douban.com/subject/26935251/,,,24", new String[] { "春宵苦短，少女前进吧", "86" });
			res.put("https://movie.douban.com/subject/5327189/,,,24", new String[] { "伦敦一家人", "87" });
			res.put("https://movie.douban.com/subject/26354572/,,,24", new String[] { "欢乐好声音", "81" });
			res.put("https://movie.douban.com/subject/24860289/,,,24", new String[] { "西葫芦的生活", "84" });
			res.put("https://movie.douban.com/subject/26145033/,,,24", new String[] { "乐高蝙蝠侠大电影", "80" });
			res.put("https://movie.douban.com/subject/26958502/,,,24", new String[] { "宣告黎明的露之歌", "80" });
			res.put("https://movie.douban.com/subject/26811587/,,,24", new String[] { "大护法", "78" });
			res.put("https://movie.douban.com/subject/11611021/,,,24", new String[] { "在这世界的角落", "76" });
			
			res.put("25.2017评分最高的纪录片", new String[] { time, "https://movie.douban.com/annual/2017#25" });
			res.put("https://movie.douban.com/subject/26430107/,,,25", new String[] { "二十二", "87" });
			res.put("https://movie.douban.com/subject/26764928/,,,25", new String[] { "脸庞，村庄", "91" });
			res.put("https://movie.douban.com/subject/26679188/,,,25", new String[] { "天梯：蔡国强的艺术", "86" });
			res.put("https://movie.douban.com/subject/26679190/,,,25", new String[] { "我们是X", "91" });
			res.put("https://movie.douban.com/subject/27120369/,,,25", new String[] { "嘎嘎：五尺二寸", "89" });
			res.put("https://movie.douban.com/subject/26806099/,,,25", new String[] { "爱猫之城", "84" });
			res.put("https://movie.douban.com/subject/27047887/,,,25", new String[] { "和食双神：最后的约定", "86" });
			res.put("https://movie.douban.com/subject/26920269/,,,25", new String[] { "重返·狼群", "83" });
			res.put("https://movie.douban.com/subject/26647876/,,,25", new String[] { "地球：神奇的一天", "82" });
			res.put("https://movie.douban.com/subject/26324232/,,,25", new String[] { "摇摇晃晃的人间", "80" });
			
			res.put("27.2017年度最佳电影原声", new String[] { time, "https://movie.douban.com/annual/2017#27" });
			res.put("https://movie.douban.com/subject/25934014/,,,27", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/26799731/,,,27", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/25937854/,,,27", new String[] { "银河护卫队2", "80" });
			res.put("https://movie.douban.com/subject/25933890/,,,27", new String[] { "极盗车神", "70" });
			res.put("https://movie.douban.com/subject/26920017/,,,27", new String[] { "鬼魅浮生", "75" });
			res.put("https://movie.douban.com/subject/26528871/,,,27", new String[] { "好时光", "70" });
			res.put("https://movie.douban.com/subject/20495023/,,,27", new String[] { "寻梦环游记", "90" });
			res.put("https://movie.douban.com/subject/26387939/,,,27", new String[] { "摔跤吧！爸爸", "90" });
			res.put("https://movie.douban.com/subject/25837262/,,,27", new String[] { "至爱梵高·星空之谜", "85" });
			res.put("https://movie.douban.com/subject/11803087/,,,27", new String[] { "异形：契约", "73" });
			
			res.put("https://movie.douban.com/subject/25837262/,,,28", new String[] { "每个人心里都有一团火，路过的人只看到烟。" });
			
			res.put("29.2017评分最高的大陆网络剧集", new String[] { time, "https://movie.douban.com/annual/2017#29" });
			res.put("https://movie.douban.com/subject/26883064/,,,29-CATENA", new String[] { "白夜追凶", "90" });
			res.put("https://movie.douban.com/subject/26979979/,,,29-CATENA", new String[] { "一起同过窗 第二季", "88" });
			res.put("https://movie.douban.com/subject/26581830/,,,29-CATENA", new String[] { "你好，旧时光", "86" });
			res.put("https://movie.douban.com/subject/26776350/,,,29-CATENA", new String[] { "河神", "82" });
			res.put("https://movie.douban.com/subject/26930540/,,,29-CATENA", new String[] { "无证之罪", "82" });
			res.put("https://movie.douban.com/subject/26772013/,,,29-CATENA", new String[] { "杀不死", "82" });
			res.put("https://movie.douban.com/subject/26868416/,,,29-CATENA", new String[] { "花间提壶方大厨", "79" });
			res.put("https://movie.douban.com/subject/26865362/,,,29-CATENA", new String[] { "盲侠大律师", "77" });
			res.put("https://movie.douban.com/subject/26322999/,,,29-CATENA", new String[] { "九州·海上牧云记", "68" });
			res.put("https://movie.douban.com/subject/27008416/,,,29-CATENA", new String[] { "致我们单纯的小美好", "72" });
			
			res.put("30.2017评分最高的大陆电视剧集", new String[] { time, "https://movie.douban.com/annual/2017#30" });
			res.put("https://movie.douban.com/subject/26322644/,,,30-CATENA", new String[] { "白鹿原", "88" });
			res.put("https://movie.douban.com/subject/5923466/,,,30-CATENA", new String[] { "大秦帝国之崛起", "85" });
			res.put("https://movie.douban.com/subject/26727273/,,,30-CATENA", new String[] { "人民的名义", "82" });
			res.put("https://movie.douban.com/subject/26685864/,,,30-CATENA", new String[] { "鸡毛飞上天", "82" });
			res.put("https://movie.douban.com/subject/26605881/,,,30-CATENA", new String[] { "大军师司马懿之军师联盟", "81" });
			res.put("https://movie.douban.com/subject/26663086/,,,30-CATENA", new String[] { "射雕英雄传", "79" });
			res.put("https://movie.douban.com/subject/26683725/,,,30-CATENA", new String[] { "外科风云", "74" });
			res.put("https://movie.douban.com/subject/26801052/,,,30-CATENA", new String[] { "那年花开月正圆", "72" });
			res.put("https://movie.douban.com/subject/26776469/,,,30-CATENA", new String[] { "我的！体育老师", "69" });
			res.put("https://movie.douban.com/subject/24827545/,,,30-CATENA", new String[] { "大唐荣耀", "69" });
			
			res.put("https://movie.douban.com/subject/26727273/,,,31-CATENA", new String[] { "用权力得来的利益终究会被新的权力所没收。" });
			
			res.put("32.2017评分最高的英美剧（新剧）", new String[] { time, "https://movie.douban.com/annual/2017#32" });
			res.put("https://movie.douban.com/subject/27031389/,,,32-CATENA", new String[] { "去他*的世界 第一季", "90" });
			res.put("https://movie.douban.com/subject/26798481/,,,32-CATENA", new String[] { "傲骨之战 第一季", "92" });
			res.put("https://movie.douban.com/subject/26813221/,,,32-CATENA", new String[] { "了不起的麦瑟尔夫人 第一季", "88" });
			res.put("https://movie.douban.com/subject/25884125/,,,32-CATENA", new String[] { "年轻的教宗", "91" });
			res.put("https://movie.douban.com/subject/26691486/,,,32-CATENA", new String[] { "心灵猎人 第一季", "89" });
			res.put("https://movie.douban.com/subject/26787149/,,,32-CATENA", new String[] { "宿敌：贝蒂和琼 第一季", "90" });
			res.put("https://movie.douban.com/subject/25953429/,,,32-CATENA", new String[] { "大小谎言 第一季", "89" });
			res.put("https://movie.douban.com/subject/26926437/,,,32-CATENA", new String[] { "追缉：炸弹客 第一季", "89" });
			res.put("https://movie.douban.com/subject/26784967/,,,32-CATENA", new String[] { "使女的故事 第一季", "88" });
			res.put("https://movie.douban.com/subject/26710394/,,,32-CATENA", new String[] { "惩罚者 第一季", "86" });
			
			res.put("33.2017评分最高的英美剧（非新剧）", new String[] { time, "https://movie.douban.com/annual/2017#33" });
			res.put("https://movie.douban.com/subject/26748847/,,,33-CATENA", new String[] { "风骚律师 第三季", "96" });
			res.put("https://movie.douban.com/subject/26958597/,,,33-CATENA", new String[] { "我们这一天 第二季", "94" });
			res.put("https://movie.douban.com/subject/26938395/,,,33-CATENA", new String[] { "无耻之徒(美版) 第八季", "95" });
			res.put("https://movie.douban.com/subject/26869684/,,,33-CATENA", new String[] { "毒枭 第三季", "94" });
			res.put("https://movie.douban.com/subject/26717030/,,,33-CATENA", new String[] { "亿万 第二季", "93" });
			res.put("https://movie.douban.com/subject/26235354/,,,33-CATENA", new String[] { "权力的游戏 第七季", "93" });
			res.put("https://movie.douban.com/subject/26588239/,,,33-CATENA", new String[] { "超感猎杀 第二季", "91" });
			res.put("https://movie.douban.com/subject/26776807/,,,33-CATENA", new String[] { "硅谷 第四季", "92" });
			res.put("https://movie.douban.com/subject/26844438/,,,33-CATENA", new String[] { "怪奇物语 第二季", "88" });
			res.put("https://movie.douban.com/subject/26684329/,,,33-CATENA", new String[] { "国土安全 第六季", "88" });
			
			res.put("https://movie.douban.com/subject/26784967/,,,34-CATENA", new String[] { "很多事情现在都不能做了，你们现在可能觉得这“不正常”，但时间会改变一切，这会成为新“正常”。" });
			
			res.put("35.2017评分最高的日剧", new String[] { time, "https://movie.douban.com/annual/2017#35" });
			res.put("https://movie.douban.com/subject/26895171/,,,35-CATENA", new String[] { "四重奏", "91" });
			res.put("https://movie.douban.com/subject/26947873/,,,35-CATENA", new String[] { "孤独的美食家 第六季", "93" });
			res.put("https://movie.douban.com/subject/26951886/,,,35-CATENA", new String[] { "紧急救命3", "84" });
			res.put("https://movie.douban.com/subject/27097746/,,,35-CATENA", new String[] { "监狱的公主大人", "82" });
			res.put("https://movie.douban.com/subject/26930506/,,,35-CATENA", new String[] { "山田孝之的戛纳电影节", "83" });
			res.put("https://movie.douban.com/subject/26924729/,,,35-CATENA", new String[] { "Byplayers：如果这6名配角共同生活的话", "83" });
			res.put("https://movie.douban.com/subject/26972675/,,,35-CATENA", new String[] { "紧急审讯室2", "82" });
			res.put("https://movie.douban.com/subject/27062635/,,,35-CATENA", new String[] { "温室里的加穗子", "81" });
			res.put("https://movie.douban.com/subject/26986846/,,,35-CATENA", new String[] { "百万日元的女人们", "80" });
			res.put("https://movie.douban.com/subject/27054593/,,,35-CATENA", new String[] { "下北泽之人生最糟的一天", "79" });
			
			res.put("36.2017评分最高的韩剧", new String[] { time, "https://movie.douban.com/annual/2017#36" });
			res.put("https://movie.douban.com/subject/26934346/,,,36-CATENA", new String[] { "秘密森林", "92" });
			res.put("https://movie.douban.com/subject/27081753/,,,36-CATENA", new String[] { "机智牢房生活", "94" });
			res.put("https://movie.douban.com/subject/27011834/,,,36-CATENA", new String[] { "暧昧男子", "89" });
			res.put("https://movie.douban.com/subject/27103757/,,,36-CATENA", new String[] { "今生是第一次", "85" });
			res.put("https://movie.douban.com/subject/27097812/,,,36-CATENA", new String[] { "付岩洞复仇者们", "83" });
			res.put("https://movie.douban.com/subject/26889608/,,,36-CATENA", new String[] { "被告人", "84" });
			res.put("https://movie.douban.com/subject/26887064/,,,36-CATENA", new String[] { "当你沉睡时", "81" });
			res.put("https://movie.douban.com/subject/26972688/,,,36-CATENA", new String[] { "三流之路", "83" });
			res.put("https://movie.douban.com/subject/26870796/,,,36-CATENA", new String[] { "有品位的她", "78" });
			res.put("https://movie.douban.com/subject/26815054/,,,36-CATENA", new String[] { "大力女子都奉顺", "76" });
			
			res.put("37.2017评分最高的其他地区剧集", new String[] { time, "https://movie.douban.com/annual/2017#37" });
			res.put("https://movie.douban.com/subject/27012497/,,,37-CATENA", new String[] { "羞耻 第四季", "95" });
			res.put("https://movie.douban.com/subject/26905456/,,,37-CATENA", new String[] { "夸世代", "84" });
			res.put("https://movie.douban.com/subject/27112705/,,,37-CATENA", new String[] { "短暂的婚姻", "86" });
			res.put("https://movie.douban.com/subject/26328109/,,,37-CATENA", new String[] { "人生波动", "83" });
			res.put("https://movie.douban.com/subject/27016390/,,,37-CATENA", new String[] { "逐月之月", "80" });
			res.put("https://movie.douban.com/subject/26786561/,,,37-CATENA", new String[] { "迷", "81" });
			res.put("https://movie.douban.com/subject/26949201/,,,37-CATENA", new String[] { "玛嘉烈与大卫 前度", "81" });
			res.put("https://movie.douban.com/subject/26808226/,,,37-CATENA", new String[] { "心理追凶", "76" });
			res.put("https://movie.douban.com/subject/26863096/,,,37-CATENA", new String[] { "降魔的", "76" });
			res.put("https://movie.douban.com/subject/26873132/,,,37-CATENA", new String[] { "超时空男臣", "71" });
			
			res.put("https://movie.douban.com/subject/26951886/,,,38-CATENA", new String[] { "灰心丧气会使人成长，但这只限年轻人！现在的我们需要的不是成长，而是结果。" });
			
			res.put("39.2017最受关注的大陆电视综艺", new String[] { time, "https://movie.douban.com/annual/2017#39" });
			res.put("https://movie.douban.com/subject/27186619/,,,39-CATENA", new String[] { "国家宝藏 第一季", "90" });
			res.put("https://movie.douban.com/subject/26830087/,,,39-CATENA", new String[] { "极限挑战 第三季", "82" });
			res.put("https://movie.douban.com/subject/27039382/,,,39-CATENA", new String[] { "演员的诞生", "54" });
			res.put("https://movie.douban.com/subject/26818263/,,,39-CATENA", new String[] { "朗读者 第一季", "85" });
			res.put("https://movie.douban.com/subject/26873657/,,,39-CATENA", new String[] { "向往的生活 第一季", "74" });
			res.put("https://movie.douban.com/subject/26789755/,,,39-CATENA", new String[] { "花儿与少年 第三季", "75" });
			res.put("https://movie.douban.com/subject/27079327/,,,39-CATENA", new String[] { "中餐厅 第一季", "62" });
			res.put("https://movie.douban.com/subject/26830085/,,,39-CATENA", new String[] { "奔跑吧 第一季", "57" });
			res.put("https://movie.douban.com/subject/26768316/,,,39-CATENA", new String[] { "歌手 第一季", "65" });
			res.put("https://movie.douban.com/subject/26933239/,,,39-CATENA", new String[] { "高能少年团 第一季", "56" });
			
			res.put("40.2017最受关注的大陆网络综艺", new String[] { time, "https://movie.douban.com/annual/2017#40" });
			res.put("https://movie.douban.com/subject/27037043/,,,40-CATENA", new String[] { "中国有嘻哈", "72" });
			res.put("https://movie.douban.com/subject/26999861/,,,40-CATENA", new String[] { "明星大侦探 第三季", "91" });
			res.put("https://movie.douban.com/subject/26747853/,,,40-CATENA", new String[] { "奇葩说 第四季", "78" });
			res.put("https://movie.douban.com/subject/26912438/,,,40-CATENA", new String[] { "奇葩大会 第一季", "77" });
			res.put("https://movie.douban.com/subject/27086865/,,,40-CATENA", new String[] { "爸爸去哪儿 第五季", "82" });
			res.put("https://movie.douban.com/subject/27046738/,,,40-CATENA", new String[] { "圆桌派 第二季", "91" });
			res.put("javascript:;,,,40-CATENA", new String[] { "火星情报局 第三季", "65" });
			res.put("https://movie.douban.com/subject/26966703/,,,40-CATENA", new String[] { "放开我北鼻 第二季", "81" });
			res.put("https://movie.douban.com/subject/27064932/,,,40-CATENA", new String[] { "如是 第一季", "77" });
			res.put("https://movie.douban.com/subject/27058214/,,,40-CATENA", new String[] { "瓣嘴 第三季", "74" });
			
			res.put("41.2017最受关注的韩国综艺", new String[] { time, "https://movie.douban.com/annual/2017#41" });
			res.put("https://movie.douban.com/subject/27068899/,,,41-CATENA", new String[] { "孝利家民宿 第一季", "94" });
			res.put("https://movie.douban.com/subject/26946588/,,,41-CATENA", new String[] { "新婚日记", "86" });
			res.put("https://movie.douban.com/subject/26995050/,,,41-CATENA", new String[] { "新西游记 第四季", "96" });
			res.put("https://movie.douban.com/subject/26989826/,,,41-CATENA", new String[] { "尹食堂 第一季", "91" });
			res.put("https://movie.douban.com/subject/26895418/,,,41-CATENA", new String[] { "新西游记 第三季", "95" });
			res.put("https://movie.douban.com/subject/27089211/,,,41-CATENA", new String[] { "同床异梦2：你是我的命运", "82" });
			res.put("https://movie.douban.com/subject/27097857/,,,41-CATENA", new String[] { "三时三餐 海洋牧场篇", "93" });
			res.put("https://movie.douban.com/subject/27168792/,,,41-CATENA", new String[] { "花样青春：WINNER篇", "91" });
			res.put("https://movie.douban.com/subject/26966833/,,,41-CATENA", new String[] { "给我钱 第6季", "90" });
			res.put("https://movie.douban.com/subject/27098641/,,,41-CATENA", new String[] { "被子外面好危险", "85" });
			
			res.put("https://movie.douban.com/subject/26235354/,,,42-CATENA", new String[] { "敌人一直都胜券在握，但我们依旧奋战如初，这就是我所知道的全部意义。" });
			
			res.put("43.2017评分最高的动画剧集", new String[] { time, "https://movie.douban.com/annual/2017#43" });
			res.put("https://movie.douban.com/subject/26592971/,,,43-CATENA", new String[] { "瑞克和莫蒂 第三季", "98" });
			res.put("https://movie.douban.com/subject/26842335/,,,43-CATENA", new String[] { "马男波杰克 第四季", "94" });
			res.put("https://movie.douban.com/subject/26939247/,,,43-CATENA", new String[] { "夏目友人帐 第六季", "95" });
			res.put("https://movie.douban.com/subject/26999946/,,,43-CATENA", new String[] { "咱们裸熊 第三季", "95" });
			res.put("https://movie.douban.com/subject/26940008/,,,43-CATENA", new String[] { "来自深渊", "92" });
			res.put("javascript:;,,,43-CATENA", new String[] { "进击的巨人 第二季", "92" });
			res.put("https://movie.douban.com/subject/27047873/,,,43-CATENA", new String[] { "宝石之国", "89" });
			res.put("https://movie.douban.com/subject/26963810/,,,43-CATENA", new String[] { "月色真美", "90" });
			res.put("https://movie.douban.com/subject/26435736/,,,43-CATENA", new String[] { "狐妖小红娘", "89" });
			res.put("https://movie.douban.com/subject/26899726/,,,43-CATENA", new String[] { "小林家的龙女仆", "85" });
			
			res.put("44.2017评分最高的纪录剧集", new String[] { time, "https://movie.douban.com/annual/2017#44" });
			res.put("https://movie.douban.com/subject/26979545/,,,44-CATENA", new String[] { "蓝色星球2", "98" });
			res.put("https://movie.douban.com/subject/26959212/,,,44-CATENA", new String[] { "荒野间谍 第一季", "94" });
			res.put("https://movie.douban.com/subject/26961333/,,,44-CATENA", new String[] { "抽象：设计的艺术", "94" });
			res.put("https://movie.douban.com/subject/27034707/,,,44-CATENA", new String[] { "守护者", "93" });
			res.put("https://movie.douban.com/subject/26694967/,,,44-CATENA", new String[] { "航拍中国 第一季", "92" });
			res.put("https://movie.douban.com/subject/26980982/,,,44-CATENA", new String[] { "我们的侣行 第一季", "91" });
			res.put("https://movie.douban.com/subject/27119498/,,,44-CATENA", new String[] { "本草中华", "87" });
			res.put("https://movie.douban.com/subject/26954791/,,,44-CATENA", new String[] { "寻找手艺", "88" });
			res.put("https://movie.douban.com/subject/27091593/,,,44-CATENA", new String[] { "苏东坡", "87" });
			res.put("https://movie.douban.com/subject/27141911/,,,44-CATENA", new String[] { "辉煌中国", "82" });
			
			res.put("https://movie.douban.com/subject/26842335/,,,45-CATENA", new String[] { "你是我认识的最渣的混蛋，也是唯一让我感到有意义的同伴，我的人生需要你。" });
			
			res.put("https://movie.douban.com/subject/25980443/,,,50", new String[] { "心一旦碎了，就会永远一直碎着。" });
			
			res.put("https://movie.douban.com/subject/26862829/,,,55", new String[] { "一个始终不被善待的人，最能识别善良，也最珍惜善良。" });
			
			res.put("56.1月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#56" });
			res.put("https://movie.douban.com/subject/21324900/,,,56", new String[] { "降临", "77" });
			res.put("https://movie.douban.com/subject/25801066/,,,56", new String[] { "西游伏妖篇", "55" });
			res.put("https://movie.douban.com/subject/25894431/,,,56", new String[] { "星球大战外传：侠盗一号", "73" });
			res.put("https://movie.douban.com/subject/26862259/,,,56", new String[] { "乘风破浪", "67" });
			res.put("https://movie.douban.com/subject/3434070/,,,56", new String[] { "太空旅客", "69" });
			res.put("https://movie.douban.com/subject/26879060/,,,56", new String[] { "情圣", "60" });
			res.put("https://movie.douban.com/subject/26182910/,,,56", new String[] { "功夫瑜伽", "49" });
			res.put("https://movie.douban.com/subject/26389696/,,,56", new String[] { "大闹天竺", "37" });
			res.put("https://movie.douban.com/subject/26287884/,,,56", new String[] { "魔弦传说", "74" });
			res.put("https://movie.douban.com/subject/3868141/,,,56", new String[] { "单身日记：好孕来袭", "73" });
			
			res.put("57.2月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#57" });
			res.put("https://movie.douban.com/subject/25934014/,,,57", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/20471852/,,,57", new String[] { "生化危机：终章", "65" });
			res.put("https://movie.douban.com/subject/3230115/,,,57", new String[] { "极限特工3：终极回归", "56" });
			res.put("https://movie.douban.com/subject/25980443/,,,57", new String[] { "海边的曼彻斯特", "86" });
			res.put("https://movie.douban.com/subject/26354572/,,,57", new String[] { "欢乐好声音", "81" });
			res.put("https://movie.douban.com/subject/11526817/,,,57", new String[] { "刺客信条", "53" });
			res.put("https://movie.douban.com/subject/26648249/,,,57", new String[] { "月光男孩", "73" });
			res.put("https://movie.douban.com/subject/26685451/,,,57", new String[] { "流浪猫鲍勃", "80" });
			res.put("https://movie.douban.com/subject/6873905/,,,57", new String[] { "成长边缘", "77" });
			res.put("https://movie.douban.com/subject/26615208/,,,57", new String[] { "隐藏人物", "87" });
			
			res.put("58.3月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#58" });
			res.put("https://movie.douban.com/subject/25765735/,,,58", new String[] { "金刚狼3：殊死一战", "83" });
			res.put("https://movie.douban.com/subject/25900945/,,,58", new String[] { "美女与野兽", "71" });
			res.put("https://movie.douban.com/subject/6873143/,,,58", new String[] { "一条狗的使命", "77" });
			res.put("https://movie.douban.com/subject/26309788/,,,58", new String[] { "金刚：骷髅岛", "65" });
			res.put("https://movie.douban.com/subject/26145033/,,,58", new String[] { "乐高蝙蝠侠大电影", "80" });
			res.put("https://movie.douban.com/subject/5262339/,,,58", new String[] { "天才捕手", "75" });
			res.put("https://movie.douban.com/subject/26820836/,,,58", new String[] { "八月", "71" });
			res.put("https://movie.douban.com/subject/26762709/,,,58", new String[] { "最终幻想15：王者之剑", "72" });
			res.put("https://movie.douban.com/subject/26703158/,,,58", new String[] { "斯隆女士", "87" });
			res.put("https://movie.douban.com/subject/26323031/,,,58", new String[] { "五十度黑", "51" });
			
			res.put("https://movie.douban.com/subject/26279289/,,,59", new String[] { "真正值得在乎的东西，不会越来越多，只会越来越少。" });
			
			res.put("60.4月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#60" });
			res.put("https://movie.douban.com/subject/26260853/,,,60", new String[] { "速度与激情8", "70" });
			res.put("https://movie.douban.com/subject/26606743/,,,60", new String[] { "嫌疑人X的献身", "63" });
			res.put("https://movie.douban.com/subject/25818101/,,,60", new String[] { "攻壳机动队", "64" });
			res.put("https://movie.douban.com/subject/26580232/,,,60", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/26816383/,,,60", new String[] { "喜欢你", "68" });
			res.put("https://movie.douban.com/subject/26279289/,,,60", new String[] { "怒", "77" });
			res.put("https://movie.douban.com/subject/26616690/,,,60", new String[] { "非凡任务", "63" });
			res.put("https://movie.douban.com/subject/26600660/,,,60", new String[] { "分裂", "73" });
			res.put("https://movie.douban.com/subject/26704590/,,,60", new String[] { "一念无明", "79" });
			res.put("https://movie.douban.com/subject/26602933/,,,60", new String[] { "绑架者", "49" });
			
			res.put("61.5月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#61" });
			res.put("https://movie.douban.com/subject/26387939/,,,61", new String[] { "摔跤吧！爸爸", "90" });
			res.put("https://movie.douban.com/subject/25937854/,,,61", new String[] { "银河护卫队2", "80" });
			res.put("https://movie.douban.com/subject/6311303/,,,61", new String[] { "加勒比海盗5：死无对证", "72" });
			res.put("https://movie.douban.com/subject/25884801/,,,61", new String[] { "记忆大师", "71" });
			res.put("https://movie.douban.com/subject/26718838/,,,61", new String[] { "异星觉醒", "65" });
			res.put("https://movie.douban.com/subject/26639958/,,,61", new String[] { "春娇救志明", "70" });
			res.put("https://movie.douban.com/subject/26688480/,,,61", new String[] { "逃出绝命镇", "76" });
			res.put("https://movie.douban.com/subject/25864124/,,,61", new String[] { "亚瑟王：斗兽争霸", "70" });
			res.put("https://movie.douban.com/subject/26748673/,,,61", new String[] { "拆弹专家", "63" });
			res.put("https://movie.douban.com/subject/26593587/,,,61", new String[] { "天才少女", "82" });
			
			res.put("62.6月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#62" });
			res.put("https://movie.douban.com/subject/1578714/,,,62", new String[] { "神奇女侠", "71" });
			res.put("https://movie.douban.com/subject/11803087/,,,62", new String[] { "异形：契约", "73" });
			res.put("https://movie.douban.com/subject/25824686/,,,62", new String[] { "变形金刚5：最后的骑士", "49" });
			res.put("https://movie.douban.com/subject/20451290/,,,62", new String[] { "新木乃伊", "47" });
			res.put("https://movie.douban.com/subject/26606242/,,,62", new String[] { "冈仁波齐", "77" });
			res.put("https://movie.douban.com/subject/22263645/,,,62", new String[] { "猜火车2", "80" });
			res.put("https://movie.douban.com/subject/26333560/,,,62", new String[] { "疾速特攻", "74" });
			res.put("https://movie.douban.com/subject/26653833/,,,62", new String[] { "生吃", "71" });
			res.put("https://movie.douban.com/subject/26707472/,,,62", new String[] { "明日的我与昨日的你约会", "75" });
			res.put("https://movie.douban.com/subject/3008691/,,,62", new String[] { "贝尔科实验", "61" });
			
			res.put("https://movie.douban.com/subject/26677495/,,,63", new String[] { "有时候白纸一张更能呈现无尽可能。" });
			
			res.put("64.7月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#64" });
			res.put("https://movie.douban.com/subject/26811587/,,,64", new String[] { "大护法", "78" });
			res.put("https://movie.douban.com/subject/26270502/,,,64", new String[] { "绣春刀II：修罗战场", "72" });
			res.put("https://movie.douban.com/subject/25812712/,,,64", new String[] { "神偷奶爸3", "68" });
			res.put("https://movie.douban.com/subject/26035290/,,,64", new String[] { "悟空传", "51" });
			res.put("https://movie.douban.com/subject/26754831/,,,64", new String[] { "绝世高手", "59" });
			res.put("https://movie.douban.com/subject/26425072/,,,64", new String[] { "明月几时有", "69" });
			res.put("https://movie.douban.com/subject/26790961/,,,64", new String[] { "闪光少女", "73" });
			res.put("https://movie.douban.com/subject/26667056/,,,64", new String[] { "逆时营救", "48" });
			res.put("https://movie.douban.com/subject/26279202/,,,64", new String[] { "“吃吃”的爱", "53" });
			res.put("https://movie.douban.com/subject/26798437/,,,64", new String[] { "深夜食堂2", "80" });
			
			res.put("65.8月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#65" });
			res.put("https://movie.douban.com/subject/26363254/,,,65", new String[] { "战狼2", "70" });
			res.put("https://movie.douban.com/subject/25823277/,,,65", new String[] { "三生三世十里桃花", "39" });
			res.put("https://movie.douban.com/subject/26430107/,,,65", new String[] { "二十二", "87" });
			res.put("https://movie.douban.com/subject/26698000/,,,65", new String[] { "心理罪", "49" });
			res.put("https://movie.douban.com/subject/26826398/,,,65", new String[] { "杀破狼·贪狼", "71" });
			res.put("https://movie.douban.com/subject/11502973/,,,65", new String[] { "星际特工：千星之城", "70" });
			res.put("https://movie.douban.com/subject/25933890/,,,65", new String[] { "极盗车神", "70" });
			res.put("https://movie.douban.com/subject/11600078/,,,65", new String[] { "目击者之追凶", "82" });
			res.put("https://movie.douban.com/subject/26759539/,,,65", new String[] { "十万个冷笑话2", "73" });
			res.put("https://movie.douban.com/subject/25858758/,,,65", new String[] { "侠盗联盟", "52" });
			
			res.put("66.9月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#66" });
			res.put("https://movie.douban.com/subject/26607693/,,,66", new String[] { "敦刻尔克", "84" });
			res.put("https://movie.douban.com/subject/24753477/,,,66", new String[] { "蜘蛛侠：英雄归来", "74" });
			res.put("https://movie.douban.com/subject/26580232/,,,66", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/25808075/,,,66", new String[] { "猩球崛起3：终极之战", "69" });
			res.put("https://movie.douban.com/subject/26816086/,,,66", new String[] { "银魂", "70" });
			res.put("https://movie.douban.com/subject/22266126/,,,66", new String[] { "王牌保镖", "72" });
			res.put("https://movie.douban.com/subject/26264454/,,,66", new String[] { "声之形", "68" });
			res.put("https://movie.douban.com/subject/26445216/,,,66", new String[] { "军舰岛", "78" });
			res.put("https://movie.douban.com/subject/26754513/,,,66", new String[] { "人生密密缝", "84" });
			res.put("https://movie.douban.com/subject/26920017/,,,66", new String[] { "鬼魅浮生", "75" });
			
			res.put("https://movie.douban.com/subject/10512661/,,,67", new String[] { "有时候如果你爱一个人，就要当一个陌生人。" });
			
			res.put("68.10月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#68" });
			res.put("https://movie.douban.com/subject/27024903/,,,68", new String[] { "天才枪手", "82" });
			res.put("https://movie.douban.com/subject/27038183/,,,68", new String[] { "羞羞的铁拳", "69" });
			res.put("https://movie.douban.com/subject/26378579/,,,68", new String[] { "王牌特工2：黄金圈", "69" });
			res.put("https://movie.douban.com/subject/10512661/,,,68", new String[] { "银翼杀手2049", "83" });
			res.put("https://movie.douban.com/subject/26425068/,,,68", new String[] { "追龙", "72" });
			res.put("https://movie.douban.com/subject/25723583/,,,68", new String[] { "英伦对决", "70" });
			res.put("https://movie.douban.com/subject/26926321/,,,68", new String[] { "缝纫机乐队", "66" });
			res.put("https://movie.douban.com/subject/26386034/,,,68", new String[] { "极寒之城", "72" });
			res.put("https://movie.douban.com/subject/26389601/,,,68", new String[] { "猎凶风河谷", "78" });
			res.put("https://movie.douban.com/subject/26815162/,,,68", new String[] { "生存家族", "81" });
			
			res.put("69.11月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#69" });
			res.put("https://movie.douban.com/subject/20495023/,,,69", new String[] { "寻梦环游记", "90" });
			res.put("https://movie.douban.com/subject/25821634/,,,69", new String[] { "雷神3：诸神黄昏", "77" });
			res.put("https://movie.douban.com/subject/2158490/,,,69", new String[] { "正义联盟", "65" });
			res.put("https://movie.douban.com/subject/25790761/,,,69", new String[] { "东方快车谋杀案", "69" });
			res.put("https://movie.douban.com/subject/27019527/,,,69", new String[] { "嘉年华", "82" });
			res.put("https://movie.douban.com/subject/26773744/,,,69", new String[] { "相亲相爱", "84" });
			res.put("https://movie.douban.com/subject/3604148/,,,69", new String[] { "小丑回魂", "73" });
			res.put("https://movie.douban.com/subject/26935251/,,,69", new String[] { "春宵苦短，少女前进吧", "86" });
			res.put("https://movie.douban.com/subject/26657126/,,,69", new String[] { "不成问题的问题", "82" });
			res.put("https://movie.douban.com/subject/26357945/,,,69", new String[] { "恐袭波士顿", "81" });
			
			res.put("70.12月最热门电影", new String[] { time, "https://movie.douban.com/annual/2017#70" });
			res.put("https://movie.douban.com/subject/26862829/,,,70", new String[] { "芳华", "76" });
			res.put("https://movie.douban.com/subject/5350027/,,,70", new String[] { "猫妖传", "69" });
			res.put("https://movie.douban.com/subject/25837262/,,,70", new String[] { "至爱梵高·星空之谜", "85" });
			res.put("https://movie.douban.com/subject/26799731/,,,70", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/26340419/,,,70", new String[] { "帕丁顿熊2", "81" });
			res.put("https://movie.douban.com/subject/26761416/,,,70", new String[] { "至暗时刻", "85" });
			res.put("https://movie.douban.com/subject/26774722/,,,70", new String[] { "心理罪之城市之光", "59" });
			res.put("https://movie.douban.com/subject/26661191/,,,70", new String[] { "奇门遁甲", "44" });
			res.put("https://movie.douban.com/subject/26718828/,,,70", new String[] { "勇往直前", "84" });
			res.put("https://movie.douban.com/subject/26718836/,,,70", new String[] { "底特律", "78" });
			
			res.put("https://movie.douban.com/subject/2158490/,,,71", new String[] { "你的超能力是什么？ - 有钱。" });
			
			res.put("72.2017上映10周年的电影", new String[] { time, "https://movie.douban.com/annual/2017#72" });
			res.put("https://movie.douban.com/subject/2043546/,,,72", new String[] { "秒速5厘米", "83" });
			res.put("https://movie.douban.com/subject/2124724/,,,72", new String[] { "不能说的秘密", "77" });
			res.put("https://movie.douban.com/subject/1828115/,,,72", new String[] { "色，戒", "83" });
			res.put("https://movie.douban.com/subject/1794171/,,,72", new String[] { "变形金刚", "82" });
			res.put("https://movie.douban.com/subject/2365260/,,,72", new String[] { "爱在暹罗", "83" });
			res.put("https://movie.douban.com/subject/2053515/,,,72", new String[] { "曾经", "83" });
			res.put("https://movie.douban.com/subject/2300586/,,,72", new String[] { "这个男人来自地球", "85" });
			res.put("https://movie.douban.com/subject/2132495/,,,72", new String[] { "朱诺", "79" });
			res.put("https://movie.douban.com/subject/1793491/,,,72", new String[] { "美食总动员", "83" });
			res.put("https://movie.douban.com/subject/1905462/,,,72", new String[] { "荒野生存", "86" });
			
			res.put("73.2017上映20周年的电影", new String[] { time, "https://movie.douban.com/annual/2017#73" });
			res.put("https://movie.douban.com/subject/1292722/,,,73", new String[] { "泰坦尼克号", "93" });
			res.put("https://movie.douban.com/subject/1292063/,,,73", new String[] { "美丽人生", "95" });
			res.put("https://movie.douban.com/subject/1292656/,,,73", new String[] { "心灵捕手", "88" });
			res.put("https://movie.douban.com/subject/1292679/,,,73", new String[] { "春光乍泄", "89" });
			res.put("https://movie.douban.com/subject/1297359/,,,73", new String[] { "幽灵公主", "88" });
			res.put("https://movie.douban.com/subject/1292659/,,,73", new String[] { "变脸", "84" });
			res.put("https://movie.douban.com/subject/1303021/,,,73", new String[] { "小鞋子", "92" });
			res.put("https://movie.douban.com/subject/1303173/,,,73", new String[] { "甲方乙方", "83" });
			res.put("https://movie.douban.com/subject/1293531/,,,73", new String[] { "第五元素", "79" });
			res.put("https://movie.douban.com/subject/1300618/,,,73", new String[] { "空中监狱", "81" });
			
			res.put("74.2017上映30周年的电影", new String[] { time, "https://movie.douban.com/annual/2017#74" });
			res.put("https://movie.douban.com/subject/1297447/,,,74", new String[] { "情女幽魂", "87" });
			res.put("https://movie.douban.com/subject/1293172/,,,74", new String[] { "末代皇帝", "91" });
			res.put("https://movie.douban.com/subject/1300055/,,,74", new String[] { "全金属外壳", "85" });
			res.put("https://movie.douban.com/subject/1959195/,,,74", new String[] { "忠犬八公物语", "91" });
			res.put("https://movie.douban.com/subject/1297862/,,,74", new String[] { "英雄本色2", "82" });
			res.put("https://movie.douban.com/subject/1301912/,,,74", new String[] { "秋天的童话", "84" });
			res.put("https://movie.douban.com/subject/1293422/,,,74", new String[] { "监狱风云", "82" });
			res.put("https://movie.douban.com/subject/1292330/,,,74", new String[] { "恋恋风尘", "85" });
			res.put("https://movie.douban.com/subject/1293456/,,,74", new String[] { "莫里斯", "88" });
			res.put("https://movie.douban.com/subject/1292504/,,,74", new String[] { "柏林苍穹下", "85" });
			
			res.put("75.2017上映40周年的电影", new String[] { time, "https://movie.douban.com/annual/2017#75" });
			res.put("https://movie.douban.com/subject/1293838/,,,75", new String[] { "星球大战", "84" });
			res.put("https://movie.douban.com/subject/1296987/,,,75", new String[] { "安妮·霍尔", "86" });
			res.put("https://movie.douban.com/subject/1302205/,,,75", new String[] { "办公室的故事", "88" });
			res.put("https://movie.douban.com/subject/1298405/,,,75", new String[] { "第三类接触", "73" });
			res.put("https://movie.douban.com/subject/1293925/,,,75", new String[] { "橡皮头", "79" });
			res.put("https://movie.douban.com/subject/1296684/,,,75", new String[] { "小熊维尼历险记", "83" });
			res.put("https://movie.douban.com/subject/1305294/,,,75", new String[] { "幸福的黄手帕", "82" });
			res.put("https://movie.douban.com/subject/1296332/,,,75", new String[] { "阴风阵阵", "73" });
			res.put("https://movie.douban.com/subject/1291861/,,,75", new String[] { "人证", "81" });
			res.put("https://movie.douban.com/subject/1300201/,,,75", new String[] { "金玉良缘红楼梦", "74" });
			
			res.put("76.2017上映50周年的电影", new String[] { time, "https://movie.douban.com/annual/2017#76" });
			res.put("https://movie.douban.com/subject/1292271/,,,76", new String[] { "毕业生", "79" });
			res.put("https://movie.douban.com/subject/1294584/,,,76", new String[] { "雌雄大盗", "82" });
			res.put("https://movie.douban.com/subject/1301649/,,,76", new String[] { "白日美人", "76" });
			res.put("https://movie.douban.com/subject/1300966/,,,76", new String[] { "独行杀手", "84" });
			res.put("https://movie.douban.com/subject/1303543/,,,76", new String[] { "玩乐时间", "86" });
			res.put("https://movie.douban.com/subject/1459054/,,,76", new String[] { "龙门客栈", "80" });
			res.put("https://movie.douban.com/subject/1300738/,,,76", new String[] { "夺命剑", "89" });
			res.put("https://movie.douban.com/subject/1293489/,,,76", new String[] { "丽人行", "81" });
			res.put("https://movie.douban.com/subject/1293698/,,,76", new String[] { "铁窗喋血", "81" });
			res.put("https://movie.douban.com/subject/1302413/,,,76", new String[] { "穆谢特", "85" });
			
			res.put("https://movie.douban.com/subject/26844922/,,,77", new String[] { "我笔下的人物没法离开那里，而我却永远无法回去。" });
			
			res.put("78.2017开播10周年的剧集", new String[] { time, "https://movie.douban.com/annual/2017#78" });
			res.put("https://movie.douban.com/subject/2156528/,,,78-CATENA", new String[] { "生活大爆炸 第一季", "94" });
			res.put("https://movie.douban.com/subject/2018131/,,,78-CATENA", new String[] { "求婚大作战", "88" });
			res.put("https://movie.douban.com/subject/2270390/,,,78-CATENA", new String[] { "神探伽利略", "82" });
			res.put("https://movie.douban.com/subject/1979063/,,,78-CATENA", new String[] { "皮囊 第一季", "87" });
			res.put("https://movie.douban.com/subject/2210001/,,,78-CATENA", new String[] { "大明王朝1566", "97" });
			res.put("https://movie.douban.com/subject/2274948/,,,78-CATENA", new String[] { "恶作剧2吻", "84" });
			res.put("https://movie.douban.com/subject/2340927/,,,78-CATENA", new String[] { "怪化猫", "93" });
			res.put("https://movie.douban.com/subject/2149047/,,,78-CATENA", new String[] { "广告狂人 第一季", "87" });
			res.put("https://movie.douban.com/subject/2346994/,,,78-CATENA", new String[] { "我们无处安放的青春", "82" });
			res.put("https://movie.douban.com/subject/2222629/,,,78-CATENA", new String[] { "金婚", "83" });
			
			res.put("79.2017开播20周年的剧集", new String[] { time, "https://movie.douban.com/annual/2017#79" });
			res.put("https://movie.douban.com/subject/1863941/,,,79-CATENA", new String[] { "天龙八部", "88" });
			res.put("https://movie.douban.com/subject/2993424/,,,79-CATENA", new String[] { "中华小当家", "84" });
			res.put("https://movie.douban.com/subject/2190925/,,,79-CATENA", new String[] { "鉴证实录", "85" });
			res.put("https://movie.douban.com/subject/1830575/,,,79-CATENA", new String[] { "雍正王朝", "90" });
			res.put("https://movie.douban.com/subject/2015069/,,,79-CATENA", new String[] { "宠物小精灵", "89" });
			res.put("https://movie.douban.com/subject/1432448/,,,79-CATENA", new String[] { "南方公园", "91" });
			res.put("https://movie.douban.com/subject/1438759/,,,79-CATENA", new String[] { "恋爱世纪", "87" });
			res.put("https://movie.douban.com/subject/1761707/,,,79-CATENA", new String[] { "天桥风云", "84" });
			res.put("https://movie.douban.com/subject/2155335/,,,79-CATENA", new String[] { "十七岁不哭", "88" });
			res.put("https://movie.douban.com/subject/1475579/,,,79-CATENA", new String[] { "难兄难弟", "89" });
			
			res.put("80.2017开播30周年的剧集", new String[] { time, "https://movie.douban.com/annual/2017#80" });
			res.put("https://movie.douban.com/subject/1864810/,,,80-CATENA", new String[] { "红楼梦", "96" });
			res.put("https://movie.douban.com/subject/1817169/,,,80-CATENA", new String[] { "邋遢大王奇遇记", "86" });
			res.put("https://movie.douban.com/subject/1845625/,,,80-CATENA", new String[] { "忍者神龟", "82" });
			res.put("https://movie.douban.com/subject/1845571/,,,80-CATENA", new String[] { "布雷斯塔警长", "81" });
			res.put("https://movie.douban.com/subject/3010196/,,,80-CATENA", new String[] { "聊斋", "84" });
			
			res.put("https://movie.douban.com/subject/26616719/,,,81", new String[] { "我们所爱的人，是永远不能被替代的。" });
			
			res.put("https://movie.douban.com/subject/26920017/,,,84", new String[] { "我想他们不会回来了。" });
			
			res.put("85.2018最值得期待的外语电影", new String[] { time, "https://movie.douban.com/annual/2017#85" });
			res.put("https://movie.douban.com/subject/24773958/,,,85", new String[] { "复仇者联盟3：无限战争", "81" });
			res.put("https://movie.douban.com/subject/20435622/,,,85", new String[] { "环太平洋：雷霆再起", "54" });
			res.put("https://movie.douban.com/subject/26640371/,,,85", new String[] { "犬之岛", "83" });
			res.put("https://movie.douban.com/subject/1652592/,,,85", new String[] { "阿丽塔：战斗天使", "76" });
			res.put("https://movie.douban.com/subject/6390825/,,,85", new String[] { "黑豹", "65" });
			res.put("https://movie.douban.com/subject/26147417/,,,85", new String[] { "神奇动物：格林德沃之罪", "71" });
			res.put("https://movie.douban.com/subject/26636712/,,,85", new String[] { "蚁人2：黄蜂女现身", "73" });
			res.put("https://movie.douban.com/subject/4920389/,,,85", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/3878007/,,,85", new String[] { "海王", "77" });
			res.put("https://movie.douban.com/subject/26588308/,,,85", new String[] { "死侍2：我爱我家", "73" });
			
			res.put("86.2018最值得期待的华语电影", new String[] { time, "https://movie.douban.com/annual/2017#86" });
			res.put("https://movie.douban.com/subject/26575103/,,,86", new String[] { "捉妖记2", "50" });
			res.put("https://movie.douban.com/subject/26698897/,,,86", new String[] { "唐人街探案2", "67" });
			res.put("https://movie.douban.com/subject/25882296/,,,86", new String[] { "狄仁杰之四大天王", "61" });
			res.put("https://movie.douban.com/subject/25829175/,,,86", new String[] { "西游记女儿国", "44" });
			res.put("https://movie.douban.com/subject/6874741/,,,86", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26728669/,,,86", new String[] { "风中有朵雨做的云", "79" });
			res.put("https://movie.douban.com/subject/26861685/,,,86", new String[] { "红海行动", "83" });
			res.put("https://movie.douban.com/subject/26351864/,,,86", new String[] { "风林火山", "0" });
			res.put("https://movie.douban.com/subject/26633257/,,,86", new String[] { "地球最后的夜晚", "69" });
			res.put("https://movie.douban.com/subject/26827040/,,,86", new String[] { "英雄本色2018", "47" });
			
			res.put("87.2017-2018北美颁奖季最期待获奖佳片", new String[] { time, "https://movie.douban.com/annual/2017#87" });
			res.put("https://movie.douban.com/subject/26588314/,,,87", new String[] { "伯德小姐", "79" });
			res.put("https://movie.douban.com/subject/26809592/,,,87", new String[] { "魅影缝匠", "75" });
			res.put("https://movie.douban.com/subject/26611804/,,,87", new String[] { "三块广告牌", "87" });
			res.put("https://movie.douban.com/subject/26787574/,,,87", new String[] { "奇迹男孩", "86" });
			res.put("https://movie.douban.com/subject/25944886/,,,87", new String[] { "灾难艺术家", "75" });
			res.put("https://movie.douban.com/subject/26778790/,,,87", new String[] { "佛罗里达乐园", "80" });
			res.put("https://movie.douban.com/subject/26990609/,,,87", new String[] { "华盛顿邮报", "82" });
			res.put("https://movie.douban.com/subject/26756049/,,,87", new String[] { "我，花样女王", "80" });
			res.put("https://movie.douban.com/subject/26610229/,,,87", new String[] { "方形", "77" });
			res.put("https://movie.douban.com/subject/26752852/,,,87", new String[] { "水形物语", "72" });
			
			res.put("https://movie.douban.com/subject/21324900/,,,88", new String[] { "尽管知道整个旅程，知道它通向哪里，我仍然倾心接受，欢迎它的每一个时刻。" });
			
			res.put("89.2017-2018北美颁奖季最期待获奖佳片", new String[] { time, "https://movie.douban.com/annual/2017#89" });
			res.put("https://movie.douban.com/subject/26764928/,,,89", new String[] { "脸庞，村庄", "91" });
			res.put("https://movie.douban.com/subject/26387939/,,,89", new String[] { "摔跤吧！爸爸", "90" });
			res.put("https://movie.douban.com/subject/20495023/,,,89", new String[] { "寻梦环游记", "90" });
			res.put("https://movie.douban.com/subject/26799731/,,,89", new String[] { "请以你的名字呼唤我", "88" });
			res.put("https://movie.douban.com/subject/27120369/,,,89", new String[] { "嘎嘎：五尺二寸", "89" });
			res.put("https://movie.douban.com/subject/26430107/,,,89", new String[] { "二十二", "87" });
			res.put("https://movie.douban.com/subject/27000061/,,,89", new String[] { "我能说", "88" });
			res.put("https://movie.douban.com/subject/26580232/,,,89", new String[] { "看不见的客人", "87" });
			res.put("https://movie.douban.com/subject/26703158/,,,89", new String[] { "斯隆女士", "87" });
			res.put("https://movie.douban.com/subject/26935251/,,,89", new String[] { "春宵苦短，少女前进吧", "86" });
			res.put("https://movie.douban.com/subject/5327189/,,,89", new String[] { "伦敦一家人", "87" });
			res.put("https://movie.douban.com/subject/26679188/,,,89", new String[] { "天梯：蔡国强的艺术", "86" });
			res.put("https://movie.douban.com/subject/25938803/,,,89", new String[] { "莫娣", "90" });
			res.put("https://movie.douban.com/subject/25980443/,,,89", new String[] { "海边的曼彻斯特", "86" });
			res.put("https://movie.douban.com/subject/25837262/,,,89", new String[] { "至爱梵高·星空之谜", "85" });
			res.put("https://movie.douban.com/subject/26761416/,,,89", new String[] { "至暗时刻", "85" });
			res.put("https://movie.douban.com/subject/26615208/,,,89", new String[] { "隐藏人物", "87" });
			res.put("https://movie.douban.com/subject/26607693/,,,89", new String[] { "敦刻尔克", "84" });
			res.put("https://movie.douban.com/subject/10512661/,,,89", new String[] { "银翼杀手2049", "83" });
			res.put("https://movie.douban.com/subject/27019527/,,,89", new String[] { "嘉年华", "82" });
			res.put("https://movie.douban.com/subject/26773744/,,,89", new String[] { "相爱相亲", "84" });
			res.put("https://movie.douban.com/subject/26848504/,,,89", new String[] { "家族之苦2", "84" });
			res.put("https://movie.douban.com/subject/25822430/,,,89", new String[] { "炙热", "85" });
			res.put("https://movie.douban.com/subject/26844922/,,,89", new String[] { "杰出公民", "84" });
			res.put("https://movie.douban.com/subject/26754513/,,,89", new String[] { "人生密密缝", "84" });
			res.put("https://movie.douban.com/subject/26616436/,,,89", new String[] { "我们的世界", "84" });
			res.put("https://movie.douban.com/subject/26718828/,,,89", new String[] { "勇往直前", "84" });
			res.put("https://movie.douban.com/subject/25934014/,,,89", new String[] { "爱乐之城", "83" });
			res.put("https://movie.douban.com/subject/25765735/,,,89", new String[] { "金刚狼3：殊死一战", "83" });
			res.put("https://movie.douban.com/subject/26340419/,,,89", new String[] { "帕丁顿熊2", "81" });
			res.put("https://movie.douban.com/subject/26586432/,,,89", new String[] { "契克", "84" });
			res.put("https://movie.douban.com/subject/24860289/,,,89", new String[] { "西葫芦的生活", "84" });
			res.put("https://movie.douban.com/subject/27024903/,,,89", new String[] { "天才枪手", "82" });
			res.put("https://movie.douban.com/subject/26354572/,,,89", new String[] { "欢乐好声音", "81" });
			res.put("https://movie.douban.com/subject/26657126/,,,89", new String[] { "不成问题的问题", "82" });
			res.put("https://movie.douban.com/subject/26653676/,,,89", new String[] { "我是布莱克", "82" });
			res.put("https://movie.douban.com/subject/26616719/,,,89", new String[] { "弗兰兹", "83" });
			res.put("https://movie.douban.com/subject/26920269/,,,89", new String[] { "重返·狼群", "83" });
			res.put("https://movie.douban.com/subject/26881114/,,,89", new String[] { "沃伦", "83" });
			res.put("https://movie.douban.com/subject/26942631/,,,89", new String[] { "起跑线", "79" });
			res.put("https://movie.douban.com/subject/26691320/,,,89", new String[] { "帝一之国", "81" });
			res.put("https://movie.douban.com/subject/26324232/,,,89", new String[] { "摇摇晃晃的人间", "80" });
			res.put("https://movie.douban.com/subject/26384493/,,,89", new String[] { "以女儿之名", "84" });
			res.put("https://movie.douban.com/subject/26746559/,,,89", new String[] { "每分钟120击", "83" });
			res.put("https://movie.douban.com/subject/25937854/,,,89", new String[] { "银河护卫队2", "80" });
			res.put("https://movie.douban.com/subject/26593587/,,,89", new String[] { "天才少女", "82" });
			res.put("https://movie.douban.com/subject/26357945/,,,89", new String[] { "恐袭波士顿", "81" });
			res.put("https://movie.douban.com/subject/11600078/,,,89", new String[] { "目击者之追凶", "82" });
			res.put("https://movie.douban.com/subject/26685451/,,,89", new String[] { "流浪猫鲍勃", "80" });
			res.put("https://movie.douban.com/subject/26815162/,,,89", new String[] { "生存家族", "81" });
			res.put("https://movie.douban.com/subject/26700276/,,,89", new String[] { "我去哪儿", "81" });
			res.put("https://movie.douban.com/subject/27063335/,,,89", new String[] { "捍卫者", "75" });
			res.put("https://movie.douban.com/subject/26842503/,,,89", new String[] { "啊，荒野.前篇", "82" });
			res.put("https://movie.douban.com/subject/26884826/,,,89", new String[] { "日常对话", "83" });
			res.put("https://movie.douban.com/subject/22263645/,,,89", new String[] { "猜火车2", "80" });
			res.put("https://movie.douban.com/subject/26145033/,,,89", new String[] { "乐高蝙蝠侠大电影", "80" });
			res.put("https://movie.douban.com/subject/26798437/,,,89", new String[] { "深夜食堂2", "81" });
			res.put("https://movie.douban.com/subject/25799331/,,,89", new String[] { "废纸板拳击手", "80" });
			res.put("https://movie.douban.com/subject/26727890/,,,89", new String[] { "女教师", "81" });
			res.put("https://movie.douban.com/subject/26704590/,,,89", new String[] { "一念无明", "79" });
			res.put("https://movie.douban.com/subject/26677495/,,,89", new String[] { "帕特森", "80" });
			res.put("https://movie.douban.com/subject/26862829/,,,89", new String[] { "芳华", "76" });
			res.put("https://movie.douban.com/subject/26811587/,,,89", new String[] { "大护法", "78" });
			res.put("https://movie.douban.com/subject/26421442/,,,89", new String[] { "滚烫的爱", "78" });
			res.put("https://movie.douban.com/subject/26678509/,,,89", new String[] { "希望的另一面", "78" });
			res.put("https://movie.douban.com/subject/21324900/,,,89", new String[] { "降临", "77" });
			res.put("https://movie.douban.com/subject/6873143/,,,89", new String[] { "一条狗的使命", "77" });
			res.put("https://movie.douban.com/subject/26606242/,,,89", new String[] { "冈仁波齐", "77" });
			res.put("https://movie.douban.com/subject/26279289/,,,89", new String[] { "怒", "77" });
			res.put("https://movie.douban.com/subject/26445216/,,,89", new String[] { "军舰岛", "77" });
			res.put("https://movie.douban.com/subject/26389601/,,,89", new String[] { "猎凶风河谷", "78" });
			res.put("https://movie.douban.com/subject/26389928/,,,89", new String[] { "二十世纪女人", "78" });
			res.put("https://movie.douban.com/subject/26748688/,,,89", new String[] { "恋爱谈", "77" });
			res.put("https://movie.douban.com/subject/26642163/,,,89", new String[] { "父亲与伊藤先生", "77" });
			res.put("https://movie.douban.com/subject/26581774/,,,89", new String[] { "永远的托词", "76" });
			res.put("https://movie.douban.com/subject/26266085/,,,89", new String[] { "三个老枪手", "77" });
			res.put("https://movie.douban.com/subject/6873905/,,,89", new String[] { "成长边缘", "77" });
			res.put("https://movie.douban.com/subject/11611021/,,,89", new String[] { "在这世界的角落", "76" });
			res.put("https://movie.douban.com/subject/26964434/,,,89", new String[] { "肌肤", "76" });
			res.put("https://movie.douban.com/subject/26751899/,,,89", new String[] { "愚行录", "77" });
			res.put("https://movie.douban.com/subject/26884892/,,,89", new String[] { "大病", "75" });
			res.put("https://movie.douban.com/subject/26688480/,,,89", new String[] { "逃出绝命镇", "76" });
			res.put("https://movie.douban.com/subject/26707472/,,,89", new String[] { "明日的我与昨日的你约会", "75" });
			res.put("https://movie.douban.com/subject/26920017/,,,89", new String[] { "鬼魅浮生", "75" });
			res.put("https://movie.douban.com/subject/26809007/,,,89", new String[] { "奇迹，那天如此重要", "76" });
			res.put("https://movie.douban.com/subject/27018296/,,,89", new String[] { "之后", "75" });
			res.put("https://movie.douban.com/subject/26710371/,,,89", new String[] { "酒会", "73" });
			res.put("https://movie.douban.com/subject/26935675/,,,89", new String[] { "肉与灵", "75" });
			res.put("https://movie.douban.com/subject/26790961/,,,89", new String[] { "闪光少女", "73" });
			res.put("https://movie.douban.com/subject/3604148/,,,89", new String[] { "小丑回魂", "73" });
			res.put("https://movie.douban.com/subject/26304310/,,,89", new String[] { "美国行动", "74" });
			res.put("https://movie.douban.com/subject/26457368/,,,89", new String[] { "流浪巴黎", "75" });
			res.put("https://movie.douban.com/subject/26270502/,,,89", new String[] { "绣春刀II：修罗战场", "72" });
			res.put("https://movie.douban.com/subject/11803087/,,,89", new String[] { "异形：契约", "73" });
			res.put("https://movie.douban.com/subject/26333560/,,,89", new String[] { "疾速特攻", "74" });
			res.put("https://movie.douban.com/subject/27027913/,,,89", new String[] { "忌日快乐", "71" });
			res.put("https://movie.douban.com/subject/26877237/,,,89", new String[] { "29+1", "72" });
			res.put("https://movie.douban.com/subject/26769480/,,,89", new String[] { "一路顺风", "74" });
			res.put("https://movie.douban.com/subject/26661229/,,,89", new String[] { "隧道尽头", "74" });
			res.put("https://movie.douban.com/subject/26653833/,,,89", new String[] { "生吃", "71" });
		} else if (id.equals("douban2018")) {
			res.put("1.2018评分最高的华语电影", new String[] { time, "https://movie.douban.com/annual/2018#1" });
			res.put("https://movie.douban.com/subject/26752088/,,,1", new String[] { "我不是药神", "90" });
			res.put("https://movie.douban.com/subject/27059130/,,,1", new String[] { "大佛普拉斯", "87" });
			res.put("https://movie.douban.com/subject/26861685/,,,1", new String[] { "红海行动", "83" });
			res.put("https://movie.douban.com/subject/25716096/,,,1", new String[] { "狗十三", "82" });
			res.put("https://movie.douban.com/subject/26425063/,,,1", new String[] { "无双", "80" });
			res.put("https://movie.douban.com/subject/27110296/,,,1", new String[] { "无名之辈", "81" });
			res.put("https://movie.douban.com/subject/26647117/,,,1", new String[] { "暴裂无声", "82" });
			res.put("https://movie.douban.com/subject/27113517/,,,1", new String[] { "血观音", "83" });
			res.put("https://movie.douban.com/subject/27172891/,,,1", new String[] { "大象席地而坐", "80" });
			res.put("https://movie.douban.com/subject/6874741/,,,1", new String[] { "无问西东", "75" });
			
			res.put("2.2018评分最高的外语语电影", new String[] { time, "https://movie.douban.com/annual/2018#2" });
			res.put("https://movie.douban.com/subject/4920389/,,,2", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/26611804/,,,2", new String[] { "三块广告牌", "87" });
			res.put("https://movie.douban.com/subject/27622447/,,,2", new String[] { "小偷家族", "87" });
			res.put("https://movie.douban.com/subject/26787574/,,,2", new String[] { "奇迹男孩", "86" });
			res.put("https://movie.douban.com/subject/27072795/,,,2", new String[] { "幸福的拉扎罗", "86" });
			res.put("https://movie.douban.com/subject/27615441/,,,2", new String[] { "网络谜踪", "85" });
			res.put("https://movie.douban.com/subject/26654498/,,,2", new String[] { "爱你，西蒙", "83" });
			res.put("https://movie.douban.com/subject/26683421/,,,2", new String[] { "特工", "84" });
			res.put("https://movie.douban.com/subject/26336252/,,,2", new String[] { "碟中谍6：全面瓦解", "81" });
			res.put("https://movie.douban.com/subject/26990609/,,,2", new String[] { "华盛顿邮报", "82" });
			
			res.put("https://movie.douban.com/subject/4920389/,,,3", new String[] { "谢谢你玩我的游戏。" });
			
			res.put("4.2018最受关注的院线电影", new String[] { time, "https://movie.douban.com/annual/2018#4" });
			res.put("https://movie.douban.com/subject/26752088/,,,4", new String[] { "我不是药神", "90" });
			res.put("https://movie.douban.com/subject/4920389/,,,4", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/26861685/,,,4", new String[] { "红海行动", "83" });
			res.put("https://movie.douban.com/subject/26698897/,,,4", new String[] { "唐人街探案2", "67" });
			res.put("https://movie.douban.com/subject/27605698/,,,4", new String[] { "西虹市首富", "65" });
			res.put("https://movie.douban.com/subject/26985127/,,,4", new String[] { "一出好戏", "71" });
			res.put("https://movie.douban.com/subject/24773958/,,,4", new String[] { "复仇者联盟3：无限战争", "81" });
			res.put("https://movie.douban.com/subject/6874741/,,,4", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26611804/,,,4", new String[] { "三块广告牌", "87" });
			res.put("https://movie.douban.com/subject/26366496/,,,4", new String[] { "邪不压正", "70" });
			
			res.put("5.2018最受关注的非院线电影", new String[] { time, "https://movie.douban.com/annual/2018#5" });
			res.put("https://movie.douban.com/subject/26588314/,,,5", new String[] { "伯德小姐", "79" });
			res.put("https://movie.douban.com/subject/26588308/,,,5", new String[] { "死侍2：我爱我家", "73" });
			res.put("https://movie.douban.com/subject/27113517/,,,5", new String[] { "血观音", "83" });
			res.put("https://movie.douban.com/subject/27059130/,,,5", new String[] { "大佛普拉斯", "87" });
			res.put("https://movie.douban.com/subject/11584016/,,,5", new String[] { "与神同行：罪与罚", "77" });
			res.put("https://movie.douban.com/subject/26842702/,,,5", new String[] { "燃烧", "79" });
			res.put("https://movie.douban.com/subject/26654269/,,,5", new String[] { "瞒天过海：美人计", "67" });
			res.put("https://movie.douban.com/subject/26945085/,,,5", new String[] { "昆池岩", "61" });
			res.put("https://movie.douban.com/subject/26654498/,,,5", new String[] { "爱你，西蒙", "83" });
			res.put("https://movie.douban.com/subject/26725678/,,,5", new String[] { "解除好友2：暗网", "79" });
			
			res.put("https://movie.douban.com/subject/27059130/,,,7", new String[] { "我想虽然现在是太空时代，人们早就可以坐太空船去月球，但永远无法探索别人内心的宇宙。" });
			
			res.put("8.2018年度最期待华语独立佳作", new String[] { time, "https://movie.douban.com/annual/2018#8" });
			res.put("https://movie.douban.com/subject/27191492/,,,8", new String[] { "四个春天", "89" });
			res.put("https://movie.douban.com/subject/27119586/,,,8", new String[] { "谁先爱上他的", "86" });
			res.put("https://movie.douban.com/subject/27191431/,,,8", new String[] { "过春天", "81" });
			res.put("https://movie.douban.com/subject/26958485/,,,8", new String[] { "逆流大叔", "75" });
			res.put("https://movie.douban.com/subject/26900391/,,,8", new String[] { "女他", "75" });
			res.put("https://movie.douban.com/subject/27193255/,,,8", new String[] { "驯马", "77" });
			res.put("https://movie.douban.com/subject/26633257/,,,8", new String[] { "地球最后的夜晚", "69" });
			res.put("https://movie.douban.com/subject/30283308/,,,8", new String[] { "阿浪的远方", "70" });
			res.put("https://movie.douban.com/subject/26845720/,,,8", new String[] { "只有大海知道", "73" });
			res.put("https://movie.douban.com/subject/30283179/,,,8", new String[] { "撞死了一只羊", "73" });
			
			res.put("9.2018年度冷门佳片", new String[] { time, "https://movie.douban.com/annual/2018#9" });
			res.put("https://movie.douban.com/subject/26952704/,,,9", new String[] { "巴斯特·斯克鲁格斯的歌谣", "84" });
			res.put("https://movie.douban.com/subject/27114240/,,,9", new String[] { "冒牌上尉", "85" });
			res.put("https://movie.douban.com/subject/26951692/,,,9", new String[] { "阿德尔曼夫妇", "83" });
			res.put("https://movie.douban.com/subject/26793852/,,,9", new String[] { "信笺故事", "82" });
			res.put("https://movie.douban.com/subject/1950330/,,,9", new String[] { "罗马", "81" });
			res.put("https://movie.douban.com/subject/27608785/,,,9", new String[] { "沉默的教室", "84" });
			res.put("https://movie.douban.com/subject/26731376/,,,9", new String[] { "天上再见", "82" });
			res.put("https://movie.douban.com/subject/26965165/,,,9", new String[] { "马斯顿教授与神奇女侠", "79" });
			res.put("https://movie.douban.com/subject/27615398/,,,9", new String[] { "罪人", "76" });
			res.put("https://movie.douban.com/subject/26979007/,,,9", new String[] { "九三年夏天", "79" });
			
			res.put("https://movie.douban.com/subject/26611804/,,,10", new String[] { "仇恨解决不了问题，但冷静可以，思考可以，试试吧。" });
			
			res.put("11.2018评分最高的韩国电影", new String[] { time, "https://movie.douban.com/annual/2018#11" });
			res.put("https://movie.douban.com/subject/26683421/,,,11", new String[] { "特工", "84" });
			res.put("https://movie.douban.com/subject/27018285/,,,11", new String[] { "现在去见你", "82" });
			res.put("https://movie.douban.com/subject/26863778/,,,11", new String[] { "铁雨", "82" });
			res.put("https://movie.douban.com/subject/26842702/,,,11", new String[] { "燃烧", "79" });
			res.put("https://movie.douban.com/subject/27017288/,,,11", new String[] { "小公女", "79" });
			res.put("https://movie.douban.com/subject/11584016/,,,11", new String[] { "与神同行：罪与罚", "77" });
			res.put("https://movie.douban.com/subject/27621192/,,,11", new String[] { "文集", "76" });
			res.put("https://movie.douban.com/subject/26980827/,,,11", new String[] { "那就是我的世界", "77" });
			res.put("https://movie.douban.com/subject/27003543/,,,11", new String[] { "与神同行2：因与缘", "75" });
			res.put("https://movie.douban.com/subject/26877492/,,,11", new String[] { "小森林", "73" });
			
			res.put("12.2018评分最高的日本电影", new String[] { time, "https://movie.douban.com/annual/2018#12" });
			res.put("https://movie.douban.com/subject/27622447/,,,12", new String[] { "小偷家族", "87" });
			res.put("https://movie.douban.com/subject/30234315/,,,12", new String[] { "摄影机不要停", "83" });
			res.put("https://movie.douban.com/subject/27147739/,,,12", new String[] { "有熊谷守一在的地方", "83" });
			res.put("https://movie.douban.com/subject/27040737/,,,12", new String[] { "祈祷落幕时", "81" });
			res.put("https://movie.douban.com/subject/26784898/,,,12", new String[] { "花牌情缘：结", "79" });
			res.put("https://movie.douban.com/subject/27108740/,,,12", new String[] { "家族之苦3", "79" });
			res.put("https://movie.douban.com/subject/26992114/,,,12", new String[] { "孤狼之血", "78" });
			res.put("https://movie.douban.com/subject/27102505/,,,12", new String[] { "去年冬天与你分手", "76" });
			res.put("https://movie.douban.com/subject/26742730/,,,12", new String[] { "浪矢解忧杂货店", "72" });
			res.put("https://movie.douban.com/subject/26972275/,,,12", new String[] { "恋爱回旋", "71" });
			
			res.put("https://movie.douban.com/subject/27622447/,,,13", new String[] { "子女是没法选择父母的，所以自己选择的羁绊更牢靠吧。" });
			
			res.put("14.2018评分最高的欧洲电影", new String[] { time, "https://movie.douban.com/annual/2018#14" });
			res.put("https://movie.douban.com/subject/27072795/,,,14", new String[] { "幸福的拉扎罗", "86" });
			res.put("https://movie.douban.com/subject/26346327/,,,14", new String[] { "养家之人", "83" });
			res.put("https://movie.douban.com/subject/26781703/,,,14", new String[] { "上帝之国", "83" });
			res.put("https://movie.douban.com/subject/3036465/,,,14", new String[] { "爱在记忆消逝前", "82" });
			res.put("https://movie.douban.com/subject/27098888/,,,14", new String[] { "羞辱", "82" });
			res.put("https://movie.douban.com/subject/26872545/,,,14", new String[] { "24帧", "82" });
			res.put("https://movie.douban.com/subject/26894602/,,,14", new String[] { "冷战", "78" });
			res.put("https://movie.douban.com/subject/26979199/,,,14", new String[] { "喜欢，轻吻，快跑", "78" });
			res.put("https://movie.douban.com/subject/26610229/,,,14", new String[] { "方形", "77" });
			res.put("https://movie.douban.com/subject/30162520/,,,14", new String[] { "盛夏", "78" });
			
			res.put("15.2018年度LGBT电影", new String[] { time, "https://movie.douban.com/annual/2018#15" });
			res.put("https://movie.douban.com/subject/26654498/,,,15", new String[] { "爱你，西蒙", "83" });
			res.put("https://movie.douban.com/subject/26781703/,,,15", new String[] { "上帝之国", "83" });
			res.put("https://movie.douban.com/subject/26979199/,,,15", new String[] { "喜欢，轻吻，快跑", "78" });
			res.put("https://movie.douban.com/subject/26870023/,,,15", new String[] { "换季期", "76" });
			res.put("https://movie.douban.com/subject/30172472/,,,15", new String[] { "好朋友", "75" });
			res.put("https://movie.douban.com/subject/30159390/,,,15", new String[] { "我的冠军男友", "73" });
			res.put("https://movie.douban.com/subject/26656655/,,,15", new String[] { "怪奇秀", "74" });
			res.put("https://movie.douban.com/subject/11524958/,,,15", new String[] { "快乐王子", "72" });
			res.put("https://movie.douban.com/subject/28461121/,,,15", new String[] { "妮娜", "71" });
			res.put("https://movie.douban.com/subject/26929023/,,,15", new String[] { "梦呓雨林", "74" });
			
			res.put("https://movie.douban.com/subject/26894602/,,,16", new String[] { "到那边去吧，那边风景更好。" });
			
			res.put("17.2018评分最高的喜剧片", new String[] { time, "https://movie.douban.com/annual/2018#17" });
			res.put("https://movie.douban.com/subject/26752088/,,,17", new String[] { "我不是药神", "90" });
			res.put("https://movie.douban.com/subject/27059130/,,,17", new String[] { "大佛普拉斯", "87" });
			res.put("https://movie.douban.com/subject/30234315/,,,17", new String[] { "摄影机不要停", "83" });
			res.put("https://movie.douban.com/subject/26952704/,,,17", new String[] { "巴斯特·斯克鲁格斯的歌谣", "84" });
			res.put("https://movie.douban.com/subject/27110296/,,,17", new String[] { "无名之辈", "81" });
			res.put("https://movie.douban.com/subject/25944886/,,,17", new String[] { "灾难艺术家", "75" });
			res.put("https://movie.douban.com/subject/26588308/,,,17", new String[] { "死侍2：我爱我家", "73" });
			res.put("https://movie.douban.com/subject/30140571/,,,17", new String[] { "嗝嗝老师", "75" });
			res.put("https://movie.douban.com/subject/27050259/,,,17", new String[] { "妈妈咪呀2", "71" });
			res.put("https://movie.douban.com/subject/26985127/,,,17", new String[] { "一出好戏", "71" });
			
			res.put("18.2018评分最高的爱情片", new String[] { time, "https://movie.douban.com/annual/2018#18" });
			res.put("https://movie.douban.com/subject/26654498/,,,18", new String[] { "爱你，西蒙", "83" });
			res.put("https://movie.douban.com/subject/27018285/,,,18", new String[] { "现在去见你", "82" });
			res.put("https://movie.douban.com/subject/26781703/,,,18", new String[] { "上帝之国", "83" });
			res.put("https://movie.douban.com/subject/26951692/,,,18", new String[] { "阿德尔曼夫妇", "83" });
			res.put("https://movie.douban.com/subject/3036465/,,,18", new String[] { "爱在记忆消逝前", "82" });
			res.put("https://movie.douban.com/subject/26965165/,,,18", new String[] { "马斯顿教授与神奇女侠", "79" });
			res.put("https://movie.douban.com/subject/6874741/,,,18", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26972258/,,,18", new String[] { "江湖儿女", "76" });
			res.put("https://movie.douban.com/subject/26809592/,,,18", new String[] { "魅影缝匠", "75" });
			res.put("https://movie.douban.com/subject/26752852/,,,18", new String[] { "水形物语", "72" });
			
			res.put("https://movie.douban.com/subject/26683723/,,,19", new String[] { "后来的我们什么都有了，却没有了我们。" });
			
			res.put("20.2018评分最高的科幻/动作片", new String[] { time, "https://movie.douban.com/annual/2018#20" });
			res.put("https://movie.douban.com/subject/4920389/,,,20", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/24773958/,,,20", new String[] { "复仇者联盟3：无限战争", "81" });
			res.put("https://movie.douban.com/subject/3878007/,,,20", new String[] { "海王", "78" });
			res.put("https://movie.douban.com/subject/27093707/,,,20", new String[] { "升级", "81" });
			res.put("https://movie.douban.com/subject/26588308/,,,20", new String[] { "死侍2：我爱我家", "73" });
			res.put("https://movie.douban.com/subject/3168101/,,,20", new String[] { "毒液：致命守护者", "72" });
			res.put("https://movie.douban.com/subject/26636712/,,,20", new String[] { "蚁人2：黄蜂女现身", "73" });
			res.put("https://movie.douban.com/subject/26384741/,,,20", new String[] { "湮灭", "71" });
			res.put("https://movie.douban.com/subject/22265634/,,,20", new String[] { "星球大战8：最后的绝地武士", "71" });
			res.put("https://movie.douban.com/subject/26586766/,,,20", new String[] { "勇敢者游戏：决战丛林", "69" });
			
			res.put("21.2018评分最高的恐怖/惊悚片", new String[] { time, "https://movie.douban.com/annual/2018#21" });
			res.put("https://movie.douban.com/subject/27615441/,,,21", new String[] { "网络谜踪", "85" });
			res.put("https://movie.douban.com/subject/26725678/,,,21", new String[] { "解除好友2：暗网", "79" });
			res.put("https://movie.douban.com/subject/26369884/,,,21", new String[] { "此房是我造", "74" });
			res.put("https://movie.douban.com/subject/30201003/,,,21", new String[] { "寄宿学校", "73" });
			res.put("https://movie.douban.com/subject/26961821/,,,21", new String[] { "马柔本宅秘事", "73" });
			res.put("https://movie.douban.com/subject/27621727/,,,21", new String[] { "遗传厄运", "71" });
			res.put("https://movie.douban.com/subject/26721644/,,,21", new String[] { "鬼故事", "71" });
			res.put("https://movie.douban.com/subject/27012731/,,,21", new String[] { "噩梦娃娃屋", "69" });
			res.put("https://movie.douban.com/subject/27188152/,,,21", new String[] { "诡怪疑云", "68" });
			res.put("https://movie.douban.com/subject/26997663/,,,21", new String[] { "寂静之地", "63" });
			
			res.put("https://movie.douban.com/subject/26384741/,,,22", new String[] { "几乎没有人会去自杀，但几乎所有人都在自我毁灭。" });
			
			res.put("23.2018评分最高的动画片", new String[] { time, "https://movie.douban.com/annual/2018#23" });
			res.put("https://movie.douban.com/subject/26640371/,,,23", new String[] { "犬之岛", "83" });
			res.put("https://movie.douban.com/subject/20438964/,,,23", new String[] { "无敌破坏王2：大闹互联网", "81" });
			res.put("https://movie.douban.com/subject/26346327/,,,23", new String[] { "养家之人", "83" });
			res.put("https://movie.douban.com/subject/27042405/,,,23", new String[] { "大坏狐狸的故事", "83" });
			res.put("https://movie.douban.com/subject/26359235/,,,23", new String[] { "克里斯托弗·罗宾", "80" });
			res.put("https://movie.douban.com/subject/25849049/,,,23", new String[] { "超人总动员2", "79" });
			res.put("https://movie.douban.com/subject/26944582/,,,23", new String[] { "雪怪大冒险", "74" });
			res.put("https://movie.douban.com/subject/26649604/,,,23", new String[] { "比得兔", "71" });
			res.put("https://movie.douban.com/subject/25846857/,,,23", new String[] { "公牛历险记", "72" });
			res.put("https://movie.douban.com/subject/26954003/,,,23", new String[] { "大世界", "70" });
			
			res.put("24.2018评分最高的纪录片", new String[] { time, "https://movie.douban.com/annual/2018#24" });
			res.put("https://movie.douban.com/subject/26874505/,,,24", new String[] { "人生果实", "96" });
			res.put("https://movie.douban.com/subject/30163799/,,,24", new String[] { "那天，大海", "93" });
			res.put("https://movie.douban.com/subject/30263943/,,,24", new String[] { "日本之耻", "91" });
			res.put("https://movie.douban.com/subject/26984189/,,,24", new String[] { "坂本龙一：终曲", "89" });
			res.put("https://movie.douban.com/subject/30268753/,,,24", new String[] { "天才之击", "91" });
			res.put("https://movie.douban.com/subject/30167539/,,,24", new String[] { "珠峰清道夫", "90" });
			res.put("https://movie.douban.com/subject/27615467/,,,24", new String[] { "鲁斯·巴德·金斯伯格", "90" });
			res.put("https://movie.douban.com/subject/30234901/,,,24", new String[] { "尖端医疗的真相", "89" });
			res.put("https://movie.douban.com/subject/27012433/,,,24", new String[] { "阿尔法围棋", "88" });
			res.put("https://movie.douban.com/subject/26720946/,,,24", new String[] { "舞者", "88" });
			
			res.put("https://movie.douban.com/subject/20438964/,,,25", new String[] { "上网第一条原则，不要看评论！" });
			
			res.put("27.2018年度电影原声", new String[] { time, "https://movie.douban.com/annual/2018#27" });
			res.put("https://movie.douban.com/subject/5300054/,,,27", new String[] { "波西米亚狂想曲", "88" });
			res.put("https://movie.douban.com/subject/26809592/,,,27", new String[] { "魅影缝匠", "75" });
			res.put("https://movie.douban.com/subject/26791455/,,,27", new String[] { "你从未在此", "68" });
			res.put("https://movie.douban.com/subject/4058933/,,,27", new String[] { "一个明星的诞生", "71" });
			res.put("https://movie.douban.com/subject/3095514/,,,27", new String[] { "阴风阵阵", "68" });
			res.put("https://movie.douban.com/subject/26640371/,,,27", new String[] { "犬之岛", "83" });
			res.put("https://movie.douban.com/subject/3026559/,,,27", new String[] { "登月第一人", "77" });
			res.put("https://movie.douban.com/subject/26952704/,,,27", new String[] { "巴斯特·斯克鲁格斯的歌谣", "84" });
			res.put("https://movie.douban.com/subject/4920389/,,,27", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/6390825/,,,27", new String[] { "黑豹", "65" });
			
			res.put("https://movie.douban.com/subject/27172891/,,,28", new String[] { "一头大象，每天坐在动物园里，它他妈就一直坐那。你真不想去看看？" });
			
			res.put("29.2018评分最高的大陆剧集", new String[] { time, "https://movie.douban.com/annual/2018#29" });
			res.put("https://movie.douban.com/subject/26797690/,,,29-CATENA", new String[] { "大江大河", "89" });
			res.put("https://movie.douban.com/subject/26761328/,,,29-CATENA", new String[] { "天盛长歌", "82" });
			res.put("https://movie.douban.com/subject/27041389/,,,29-CATENA", new String[] { "忽而今夏", "82" });
			res.put("https://movie.douban.com/subject/26828285/,,,29-CATENA", new String[] { "和平饭店", "79" });
			res.put("https://movie.douban.com/subject/26920281/,,,29-CATENA", new String[] { "香蜜沉沉烬如霜", "77" });
			res.put("https://movie.douban.com/subject/27119802/,,,29-CATENA", new String[] { "天坑鹰猎", "76" });
			res.put("https://movie.douban.com/subject/27083735/,,,29-CATENA", new String[] { "疯人院", "77" });
			res.put("https://movie.douban.com/subject/27029233/,,,29-CATENA", new String[] { "东方华尔街", "76" });
			res.put("https://movie.douban.com/subject/27005229/,,,29-CATENA", new String[] { "夜天子", "77" });
			res.put("https://movie.douban.com/subject/25812730/,,,29-CATENA", new String[] { "如懿传", "74" });
			
			res.put("30.2018评分最高的英美剧(新剧)", new String[] { time, "https://movie.douban.com/annual/2018#30" });
			res.put("https://movie.douban.com/subject/28427782/,,,30-CATENA", new String[] { "我的天才女友 第一季", "93" });
			res.put("https://movie.douban.com/subject/26985973/,,,30-CATENA", new String[] { "梅尔罗斯", "90" });
			res.put("https://movie.douban.com/subject/26869686/,,,30-CATENA", new String[] { "毒枭：墨西哥 第一季", "91" });
			res.put("https://movie.douban.com/subject/26997983/,,,30-CATENA", new String[] { "姿态 第一季", "92" });
			res.put("https://movie.douban.com/subject/30145148/,,,30-CATENA", new String[] { "少年犯 第一季", "91" });
			res.put("https://movie.douban.com/subject/27038857/,,,30-CATENA", new String[] { "英国式丑闻", "88" });
			res.put("https://movie.douban.com/subject/27016554/,,,30-CATENA", new String[] { "鬼入侵", "87" });
			res.put("https://movie.douban.com/subject/27163287/,,,30-CATENA", new String[] { "贴身保镖", "85" });
			res.put("https://movie.douban.com/subject/26915602/,,,30-CATENA", new String[] { "杀死伊芙 第一季", "86" });
			res.put("https://movie.douban.com/subject/26252279/,,,30-CATENA", new String[] { "利器", "83" });
			
			res.put("31.2018评分最高的英美剧(非新剧)", new String[] { time, "https://movie.douban.com/annual/2018#31" });
			res.put("https://movie.douban.com/subject/27194302/,,,31-CATENA", new String[] { "无耻之徒(美版) 第九季", "97" });
			res.put("https://movie.douban.com/subject/27077785/,,,31-CATENA", new String[] { "风骚律师 第四季", "95" });
			res.put("https://movie.douban.com/subject/26997533/,,,31-CATENA", new String[] { "傲骨之战 第二季", "95" });
			res.put("https://movie.douban.com/subject/26961208/,,,31-CATENA", new String[] { "9号秘事 第四季", "94" });
			res.put("https://movie.douban.com/subject/27001001/,,,31-CATENA", new String[] { "生活大爆炸 第十二季", "94" });
			res.put("https://movie.douban.com/subject/27055699/,,,31-CATENA", new String[] { "硅谷 第五季", "92" });
			res.put("https://movie.douban.com/subject/27007669/,,,31-CATENA", new String[] { "真爱不死 第二季", "91" });
			res.put("https://movie.douban.com/subject/27036735/,,,31-CATENA", new String[] { "使女的故事 第二季", "90" });
			res.put("https://movie.douban.com/subject/26887174/,,,31-CATENA", new String[] { "西部世界 第二季", "89" });
			res.put("https://movie.douban.com/subject/27016555/,,,31-CATENA", new String[] { "了不起的麦瑟尔夫人 第二季", "86" });
			
			res.put("https://movie.douban.com/subject/26252279/,,,32-CATENA", new String[] { "与其受人喜爱，让人害怕才更安全。" });
			
			res.put("33.2018评分最高的日剧", new String[] { time, "https://movie.douban.com/annual/2018#33" });
			res.put("https://movie.douban.com/subject/27140017/,,,33-CATENA", new String[] { "非自然死亡", "93" });
			res.put("https://movie.douban.com/subject/30183785/,,,33-CATENA", new String[] { "我是大哥大", "91" });
			res.put("https://movie.douban.com/subject/30232260/,,,33-CATENA", new String[] { "人生删除事务所", "85" });
			res.put("https://movie.douban.com/subject/27065652/,,,33-CATENA", new String[] { "99.9：刑事专业律师 第二季", "84" });
			res.put("https://movie.douban.com/subject/30156023/,,,33-CATENA", new String[] { "大叔之爱", "82" });
			res.put("https://movie.douban.com/subject/27605548/,,,33-CATENA", new String[] { "行骗天下JP", "83" });
			res.put("https://movie.douban.com/subject/30271241/,,,33-CATENA", new String[] { "情色小说家", "82" });
			res.put("https://movie.douban.com/subject/27192250/,,,33-CATENA", new String[] { "女子的生活", "82" });
			res.put("https://movie.douban.com/subject/30203507/,,,33-CATENA", new String[] { "EERIE~看不见的脸", "85" });
			res.put("https://movie.douban.com/subject/30290917/,,,33-CATENA", new String[] { "我们无法成为野兽", "77" });
			
			res.put("34.2018评分最高的韩剧", new String[] { time, "https://movie.douban.com/annual/2018#34" });
			res.put("https://movie.douban.com/subject/27602137/,,,34-CATENA", new String[] { "我的大叔", "94" });
			res.put("https://movie.douban.com/subject/27068596/,,,34-CATENA", new String[] { "Live", "92" });
			res.put("https://movie.douban.com/subject/27622822/,,,34-CATENA", new String[] { "火星生活", "90" });
			res.put("https://movie.douban.com/subject/27059183/,,,34-CATENA", new String[] { "阳光先生", "89" });
			res.put("https://movie.douban.com/subject/27603684/,,,34-CATENA", new String[] { "加油吧威基基", "86" });
			res.put("https://movie.douban.com/subject/27603700/,,,34-CATENA", new String[] { "阿尔罕布拉宫的回忆", "78" });
			res.put("https://movie.douban.com/subject/27592573/,,,34-CATENA", new String[] { "Life", "82" });
			res.put("https://movie.douban.com/subject/30181455/,,,34-CATENA", new String[] { "金秘书为何那样", "80" });
			res.put("https://movie.douban.com/subject/30269039/,,,34-CATENA", new String[] { "内在美", "78" });
			res.put("https://movie.douban.com/subject/30145638/,,,34-CATENA", new String[] { "客", "79" });
			
			res.put("https://movie.douban.com/subject/27140017/,,,35-CATENA", new String[] { "有工夫绝望的话，还不如吃点好吃的去睡觉呢。" });
			
			res.put("36.2018评分最高的大陆电视综艺", new String[] { time, "https://movie.douban.com/annual/2018#36" });
			res.put("https://movie.douban.com/subject/30353394/,,,36-CATENA", new String[] { "声入人心", "92" });
			res.put("https://movie.douban.com/subject/27617334/,,,36-CATENA", new String[] { "经典咏流传", "87" });
			res.put("https://movie.douban.com/subject/27617683/,,,36-CATENA", new String[] { "声临其境 第一季", "82" });
			res.put("https://movie.douban.com/subject/30201077/,,,36-CATENA", new String[] { "这！就是灌篮", "81" });
			res.put("https://movie.douban.com/subject/27602222/,,,36-CATENA", new String[] { "向往的生活 第二季", "81" });
			res.put("https://movie.douban.com/subject/27194980/,,,36-CATENA", new String[] { "极限挑战 第四季", "76" });
			res.put("https://movie.douban.com/subject/30214439/,,,36-CATENA", new String[] { "我就是演员", "68" });
			res.put("https://movie.douban.com/subject/30201000/,,,36-CATENA", new String[] { "幻乐之城", "70" });
			res.put("https://movie.douban.com/subject/30188120/,,,36-CATENA", new String[] { "中餐厅 第二季", "66" });
			res.put("https://movie.douban.com/subject/27180851/,,,36-CATENA", new String[] { "歌手2018", "66" });
			
			res.put("37.2018评分最高的大陆网络综艺", new String[] { time, "https://movie.douban.com/annual/2018#37" });
			res.put("https://movie.douban.com/subject/30304024/,,,37-CATENA", new String[] { "奇遇人生", "89" });
			res.put("https://movie.douban.com/subject/30337114/,,,37-CATENA", new String[] { "一本好书", "92" });
			res.put("https://movie.douban.com/subject/27180210/,,,37-CATENA", new String[] { "圆桌派 第三季", "91" });
			res.put("https://movie.douban.com/subject/30329046/,,,37-CATENA", new String[] { "明星大侦探 第四季", "87" });
			res.put("https://movie.douban.com/subject/27199901/,,,37-CATENA", new String[] { "这！就是街舞", "85" });
			res.put("https://movie.douban.com/subject/30192003/,,,37-CATENA", new String[] { "这！就是铁甲", "79" });
			res.put("https://movie.douban.com/subject/30253587/,,,37-CATENA", new String[] { "幸福三重奏", "74" });
			res.put("https://movie.douban.com/subject/30228909/,,,37-CATENA", new String[] { "奇葩说 第五季", "74" });
			res.put("https://movie.douban.com/subject/30290642/,,,37-CATENA", new String[] { "心动的信号 第一季", "71" });
			res.put("https://movie.douban.com/subject/30215848/,,,37-CATENA", new String[] { "妻子的浪漫旅行 第一季", "69" });
			
			res.put("38.2018最受关注的韩国综艺", new String[] { time, "https://movie.douban.com/annual/2018#38" });
			res.put("https://movie.douban.com/subject/30179654/,,,38-CATENA", new String[] { "心脏信号2", "78" });
			res.put("https://movie.douban.com/subject/30207995/,,,38-CATENA", new String[] { "街头美食斗士", "93" });
			res.put("https://movie.douban.com/subject/27601066/,,,38-CATENA", new String[] { "孝利家民宿 第二季", "91" });
			res.put("https://movie.douban.com/subject/27030620/,,,38-CATENA", new String[] { "尹食堂 第二季", "93" });
			res.put("https://movie.douban.com/subject/30231957/,,,38-CATENA", new String[] { "新西游记 第五季", "96" });
			res.put("https://movie.douban.com/subject/30255089/,,,38-CATENA", new String[] { "大逃脱", "92" });
			res.put("https://movie.douban.com/subject/27608490/,,,38-CATENA", new String[] { "PRODUCE 48", "64" });
			res.put("https://movie.douban.com/subject/30168025/,,,38-CATENA", new String[] { "林中小屋", "86" });
			res.put("https://movie.douban.com/subject/30364974/,,,38-CATENA", new String[] { "新西游记 第六季", "97" });
			res.put("https://movie.douban.com/subject/27149799/,,,38-CATENA", new String[] { "犯人就是你", "77" });
			
			res.put("https://movie.douban.com/subject/26753904/,,,39-CATENA", new String[] { "只要不找对象，一个人的生活简单得不得了。" });
			
			res.put("40.2018评分最高的动画剧集", new String[] { time, "https://movie.douban.com/annual/2018#40" });
			res.put("https://movie.douban.com/subject/27160633/,,,40-CATENA", new String[] { "我的英雄学院 第3季", "93" });
			res.put("https://movie.douban.com/subject/27149382/,,,40-CATENA", new String[] { "马男波杰克 第五季", "93" });
			res.put("https://movie.douban.com/subject/26946411/,,,40-CATENA", new String[] { "齐木楠雄的灾难 第二季", "93" });
			res.put("https://movie.douban.com/subject/30259908/,,,40-CATENA", new String[] { "请吃红小豆吧", "90" });
			res.put("https://movie.douban.com/subject/28514091/,,,40-CATENA", new String[] { "工作细胞", "90" });
			res.put("https://movie.douban.com/subject/27015848/,,,40-CATENA", new String[] { "魔道祖师", "89" });
			res.put("https://movie.douban.com/subject/27624762/,,,40-CATENA", new String[] { "刺客伍六七", "89" });
			res.put("https://movie.douban.com/subject/27157760/,,,40-CATENA", new String[] { "MEGALO BOX", "88" });
			res.put("https://movie.douban.com/subject/26997470/,,,40-CATENA", new String[] { "恶魔人", "88" });
			res.put("https://movie.douban.com/subject/26805209/,,,40-CATENA", new String[] { "紫罗兰永恒花园", "86" });
			
			res.put("41.2018评分最高的纪录剧集", new String[] { time, "https://movie.douban.com/annual/2018#41" });
			res.put("https://movie.douban.com/subject/27182707/,,,41-CATENA", new String[] { "王朝", "96" });
			res.put("https://movie.douban.com/subject/27620913/,,,41-CATENA", new String[] { "如果国宝会说话 第二季", "96" });
			res.put("https://movie.douban.com/subject/27620616/,,,41-CATENA", new String[] { "大猫", "95" });
			res.put("https://movie.douban.com/subject/27182720/,,,41-CATENA", new String[] { "如果国宝会说话 第一季", "94" });
			res.put("https://movie.douban.com/subject/30156039/,,,41-CATENA", new String[] { "风味人间", "91" });
			res.put("https://movie.douban.com/subject/27186602/,,,41-CATENA", new String[] { "生命时速·紧急救护120", "93" });
			res.put("https://movie.douban.com/subject/30151530/,,,41-CATENA", new String[] { "西南联大", "93" });
			res.put("https://movie.douban.com/subject/26955451/,,,41-CATENA", new String[] { "詹姆斯·卡梅隆的科幻故事", "92" });
			res.put("https://movie.douban.com/subject/30244576/,,,41-CATENA", new String[] { "她说：女性人生瞬间", "92" });
			res.put("https://movie.douban.com/subject/26692442/,,,41-CATENA", new String[] { "文明", "91" });
			
			res.put("https://movie.douban.com/subject/30244576/,,,42-CATENA", new String[] { "如果连出门看星星都做不到，那么教她们追逐星辰还有什么意义？" });
			
			res.put("https://movie.douban.com/subject/27113517/,,,45", new String[] { "世上最可怕不是眼前的刑罚，而是那无爱的未来。" });
			
			res.put("https://movie.douban.com/subject/26842702/,,,49", new String[] { "没有眼泪这个证据，就无法判断那是不是悲伤的情绪了。" });
			
			res.put("51.2018每月最热门电影", new String[] { time, "https://movie.douban.com/annual/2018#51" });
			res.put("https://movie.douban.com/subject/6874741/,,,51", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26861685/,,,51", new String[] { "红海行动", "83" });
			res.put("https://movie.douban.com/subject/26611804/,,,51", new String[] { "三块广告牌", "87" });
			res.put("https://movie.douban.com/subject/4920389/,,,51", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/24773958/,,,51", new String[] { "复仇者联盟3：无限战争", "81" });
			res.put("https://movie.douban.com/subject/26416062/,,,51", new String[] { "侏罗纪世界2", "67" });
			res.put("https://movie.douban.com/subject/26752088/,,,51", new String[] { "我不是药神", "90" });
			res.put("https://movie.douban.com/subject/26985127/,,,51", new String[] { "一出好戏", "71" });
			res.put("https://movie.douban.com/subject/26336252/,,,51", new String[] { "碟中谍6：全面瓦解", "81" });
			res.put("https://movie.douban.com/subject/26425063/,,,51", new String[] { "无双", "80" });
			res.put("https://movie.douban.com/subject/3168101/,,,51", new String[] { "毒液：致命守护者", "72" });
			res.put("https://movie.douban.com/subject/3878007/,,,51", new String[] { "海王", "77" });
			
			res.put("https://movie.douban.com/subject/26752088/,,,52", new String[] { "世界上只有一种病，穷病。" });
			
			res.put("53.2018上映10周年的电影", new String[] { time, "https://movie.douban.com/annual/2018#53" });
			res.put("https://movie.douban.com/subject/2131459/,,,53", new String[] { "机器人总动员", "93" });
			res.put("https://movie.douban.com/subject/1485260/,,,53", new String[] { "本杰明·巴顿奇事", "88" });
			res.put("https://movie.douban.com/subject/2209573/,,,53", new String[] { "贫民窟的百万富翁", "85" });
			res.put("https://movie.douban.com/subject/1851857/,,,53", new String[] { "蝙蝠侠：黑暗骑士", "91" });
			res.put("https://movie.douban.com/subject/2149806/,,,53", new String[] { "入殓师", "88" });
			res.put("https://movie.douban.com/subject/1783457/,,,53", new String[] { "功夫熊猫", "80" });
			res.put("https://movie.douban.com/subject/2268359/,,,53", new String[] { "暮光之城", "73" });
			res.put("https://movie.douban.com/subject/2213597/,,,53", new String[] { "朗读者", "85" });
			res.put("https://movie.douban.com/subject/3313801/,,,53", new String[] { "非诚勿扰", "71" });
			res.put("https://movie.douban.com/subject/1432146/,,,53", new String[] { "钢铁侠", "81" });
			
			res.put("54.2018上映20周年的电影", new String[] { time, "https://movie.douban.com/annual/2018#54" });
			res.put("https://movie.douban.com/subject/1292001/,,,54", new String[] { "海上钢琴师", "92" });
			res.put("https://movie.douban.com/subject/1292064/,,,54", new String[] { "楚门的世界", "92" });
			res.put("https://movie.douban.com/subject/1293350/,,,54", new String[] { "两杆大烟枪", "91" });
			res.put("https://movie.douban.com/subject/1292849/,,,54", new String[] { "拯救大兵瑞恩", "89" });
			res.put("https://movie.douban.com/subject/1292275/,,,54", new String[] { "罗拉快跑", "81" });
			res.put("https://movie.douban.com/subject/1294833/,,,54", new String[] { "花木兰", "77" });
			res.put("https://movie.douban.com/subject/1292212/,,,54", new String[] { "天使之城", "79" });
			res.put("https://movie.douban.com/subject/1292371/,,,54", new String[] { "四月物语", "81" });
			res.put("https://movie.douban.com/subject/1297102/,,,54", new String[] { "天生一对", "83" });
			res.put("https://movie.douban.com/subject/1307014/,,,54", new String[] { "不见不散", "78" });
			
			res.put("55.2018上映30周年的电影", new String[] { time, "https://movie.douban.com/annual/2018#55" });
			res.put("https://movie.douban.com/subject/1291560/,,,55", new String[] { "龙猫", "92" });
			res.put("https://movie.douban.com/subject/1291828/,,,55", new String[] { "天堂电影院", "92" });
			res.put("https://movie.douban.com/subject/1293318/,,,55", new String[] { "萤火虫之墓", "87" });
			res.put("https://movie.douban.com/subject/1291870/,,,55", new String[] { "雨人", "87" });
			res.put("https://movie.douban.com/subject/1306505/,,,55", new String[] { "红高粱", "83" });
			res.put("https://movie.douban.com/subject/1300960/,,,55", new String[] { "碧海蓝天", "87" });
			res.put("https://movie.douban.com/subject/1304624/,,,55", new String[] { "旺角卡门", "77" });
			res.put("https://movie.douban.com/subject/1292697/,,,55", new String[] { "虎胆龙威", "81" });
			res.put("https://movie.douban.com/subject/1291859/,,,55", new String[] { "布拉格之恋", "81" });
			res.put("https://movie.douban.com/subject/1432972/,,,55", new String[] { "妈妈再爱我一次", "83" });
			
			res.put("56.2018上映40周年的电影", new String[] { time, "https://movie.douban.com/annual/2018#56" });
			res.put("https://movie.douban.com/subject/1302100/,,,56", new String[] { "尼罗河上的惨案", "85" });
			res.put("https://movie.douban.com/subject/1296693/,,,56", new String[] { "醉拳", "74" });
			res.put("https://movie.douban.com/subject/1292403/,,,56", new String[] { "猎鹿人", "84" });
			res.put("https://movie.douban.com/subject/1299265/,,,56", new String[] { "我唾弃你的坟墓", "62" });
			res.put("https://movie.douban.com/subject/1300916/,,,56", new String[] { "超人", "76" });
			res.put("https://movie.douban.com/subject/1498658/,,,56", new String[] { "蛇形刁手", "69" });
			res.put("https://movie.douban.com/subject/1297268/,,,56", new String[] { "秋日奏鸣曲", "89" });
			res.put("https://movie.douban.com/subject/1299586/,,,56", new String[] { "月光光心慌慌", "65" });
			res.put("https://movie.douban.com/subject/1293232/,,,56", new String[] { "天堂之日", "79" });
			res.put("https://movie.douban.com/subject/1308456/,,,56", new String[] { "死亡游戏", "77" });
			
			res.put("57.2018上映50周年的电影", new String[] { time, "https://movie.douban.com/annual/2018#57" });
			res.put("https://movie.douban.com/subject/1292226/,,,57", new String[] { "2001太空漫游", "87" });
			res.put("https://movie.douban.com/subject/1293394/,,,57", new String[] { "西部往事", "86" });
			res.put("https://movie.douban.com/subject/1293852/,,,57", new String[] { "罗斯玛丽的婴儿", "80" });
			res.put("https://movie.douban.com/subject/1296697/,,,57", new String[] { "人猿星球", "81" });
			res.put("https://movie.douban.com/subject/1305605/,,,57", new String[] { "黄色潜水艇", "88" });
			res.put("https://movie.douban.com/subject/1295467/,,,57", new String[] { "罗密欧与朱丽叶", "87" });
			res.put("https://movie.douban.com/subject/1297996/,,,57", new String[] { "活死人之夜", "74" });
			res.put("https://movie.douban.com/subject/1307973/,,,57", new String[] { "如果", "81" });
			res.put("https://movie.douban.com/subject/1298197/,,,57", new String[] { "偷吻", "78" });
			res.put("https://movie.douban.com/subject/1293219/,,,57", new String[] { "雾都孤儿", "81" });
			
			res.put("https://movie.douban.com/subject/26990609/,,,58", new String[] { "捍卫新闻出版自由的唯一方法，就是出版。" });
			
			res.put("59.2018开播10周年的剧集", new String[] { time, "https://movie.douban.com/annual/2018#59" });
			res.put("https://movie.douban.com/subject/2373195/,,,59-CATENA", new String[] { "绝命毒师 第一季", "89" });
			res.put("https://movie.douban.com/subject/3060542/,,,59-CATENA", new String[] { "夏目友人帐", "93" });
			res.put("https://movie.douban.com/subject/3011225/,,,59-CATENA", new String[] { "最后的朋友", "84" });
			res.put("https://movie.douban.com/subject/3268241/,,,59-CATENA", new String[] { "流星之绊", "83" });
			res.put("https://movie.douban.com/subject/2373267/,,,59-CATENA", new String[] { "闯关东", "90" });
			res.put("https://movie.douban.com/subject/3254235/,,,59-CATENA", new String[] { "他们生活的世界", "82" });
			res.put("https://movie.douban.com/subject/3077948/,,,59-CATENA", new String[] { "美丽中国", "93" });
			res.put("https://movie.douban.com/subject/3184572/,,,59-CATENA", new String[] { "紧急救命", "83" });
			res.put("https://movie.douban.com/subject/3003093/,,,59-CATENA", new String[] { "料理仙姬", "83" });
			res.put("https://movie.douban.com/subject/3193101/,,,59-CATENA", new String[] { "甜甜私房猫", "90" });
			
			res.put("60.2018开播20周年的剧集", new String[] { time, "https://movie.douban.com/annual/2018#60" });
			res.put("https://movie.douban.com/subject/1786739/,,,60-CATENA", new String[] { "还珠格格", "83" });
			res.put("https://movie.douban.com/subject/1863923/,,,60-CATENA", new String[] { "鹿鼎记", "87" });
			res.put("https://movie.douban.com/subject/1304397/,,,60-CATENA", new String[] { "欲望都市 第一季", "88" });
			res.put("https://movie.douban.com/subject/1465035/,,,60-CATENA", new String[] { "魔卡少女樱", "87" });
			res.put("https://movie.douban.com/subject/2190934/,,,60-CATENA", new String[] { "陀枪师姐", "84" });
			res.put("https://movie.douban.com/subject/1424406/,,,60-CATENA", new String[] { "星际牛仔", "96" });
			res.put("https://movie.douban.com/subject/3904560/,,,60-CATENA", new String[] { "水浒传", "86" });
			res.put("https://movie.douban.com/subject/1464838/,,,60-CATENA", new String[] { "麻辣教师", "87" });
			res.put("https://movie.douban.com/subject/1830581/,,,60-CATENA", new String[] { "妙手仁心", "85" });
			res.put("https://movie.douban.com/subject/2147055/,,,60-CATENA", new String[] { "飞天小女警 第一季", "84" });
			
			res.put("https://movie.douban.com/subject/6390825/,,,61", new String[] { "智者将建立桥梁，而愚者则建立高墙。" });
			
			res.put("62.2019最值得期待的剧集", new String[] { time, "https://movie.douban.com/annual/2018#62" });
			res.put("https://movie.douban.com/subject/27625457/,,,62-CATENA", new String[] { "去他*的世界 第二季", "0" });
			res.put("https://movie.douban.com/subject/26584183/,,,62-CATENA", new String[] { "权力的游戏 第八季", "0" });
			res.put("https://movie.douban.com/subject/27140256/,,,62-CATENA", new String[] { "白夜追凶2", "0" });
			res.put("https://movie.douban.com/subject/27008551/,,,62-CATENA", new String[] { "心灵猎人 第二季", "0" });
			res.put("https://movie.douban.com/subject/26849758/,,,62-CATENA", new String[] { "长安十二时辰", "0" });
			res.put("https://movie.douban.com/subject/25853071/,,,62-CATENA", new String[] { "庆余年", "0" });
			res.put("https://movie.douban.com/subject/26738112/,,,62-CATENA", new String[] { "九州缥缈录", "0" });
			res.put("https://movie.douban.com/subject/27119156/,,,62-CATENA", new String[] { "怪奇物语 第三季", "0" });
			res.put("https://movie.douban.com/subject/26675617/,,,62-CATENA", new String[] { "古董局中局", "69" });
			res.put("https://movie.douban.com/subject/27166039/,,,62-CATENA", new String[] { "瑞克和莫蒂 第四季", "0" });
			
			res.put("63.2019最值得期待的外语电影", new String[] { time, "https://movie.douban.com/annual/2018#63" });
			res.put("https://movie.douban.com/subject/26100958/,,,63", new String[] { "复仇者联盟4：终局之战", "0" });
			res.put("https://movie.douban.com/subject/26213252/,,,63", new String[] { "惊奇队长", "0" });
			res.put("https://movie.douban.com/subject/26667010/,,,63", new String[] { "X战警：黑凤凰", "0" });
			res.put("https://movie.douban.com/subject/1652592/,,,63", new String[] { "阿丽塔：战斗天使", "75" });
			res.put("https://movie.douban.com/subject/26835471/,,,63", new String[] { "大侦探皮卡丘", "0" });
			res.put("https://movie.douban.com/subject/27089612/,,,63", new String[] { "纽约的一个雨天", "0" });
			res.put("https://movie.douban.com/subject/26931786/,,,63", new String[] { "蜘蛛侠：英雄远征", "0" });
			res.put("https://movie.douban.com/subject/26884354/,,,63", new String[] { "狮子王", "0" });
			res.put("https://movie.douban.com/subject/27087724/,,,63", new String[] { "好莱坞往事", "0" });
			res.put("https://movie.douban.com/subject/6981153/,,,63", new String[] { "爱尔兰人", "0" });
			
			res.put("64.2019最值得期待的华语电影", new String[] { time, "https://movie.douban.com/annual/2018#64" });
			res.put("https://movie.douban.com/subject/25986662/,,,64", new String[] { "疯狂的外星人", "64" });
			res.put("https://movie.douban.com/subject/26266893/,,,64", new String[] { "流浪地球", "79" });
			res.put("https://movie.douban.com/subject/26986120/,,,64", new String[] { "摸金校尉之九幽将军", "0" });
			res.put("https://movie.douban.com/subject/30163509/,,,64", new String[] { "飞驰人生", "70" });
			res.put("https://movie.douban.com/subject/26351864/,,,64", new String[] { "风林火山", "0" });
			res.put("https://movie.douban.com/subject/26757090/,,,64", new String[] { "刀背藏身", "0" });
			res.put("https://movie.douban.com/subject/4840388/,,,64", new String[] { "新喜剧之王", "58" });
			res.put("https://movie.douban.com/subject/27135473/,,,64", new String[] { "阳台上", "0" });
			res.put("https://movie.douban.com/subject/26954859/,,,64", new String[] { "兰心大剧院", "0" });
			res.put("https://movie.douban.com/subject/24743117/,,,64", new String[] { "画皮Ⅲ", "0" });
			
			res.put("https://movie.douban.com/subject/26787574/,,,65", new String[] { "善良一点，因为每个人都在与人生苦战。" });
			
			res.put("66.2018你可能错过的好片", new String[] { time, "https://movie.douban.com/annual/2018#66" });
			res.put("https://movie.douban.com/subject/26874505/,,,66", new String[] { "人生果实", "96" });
			res.put("https://movie.douban.com/subject/30163799/,,,66", new String[] { "那天，大海", "93" });
			res.put("https://movie.douban.com/subject/30263943/,,,66", new String[] { "日本之耻", "91" });
			res.put("https://movie.douban.com/subject/30268753/,,,66", new String[] { "天才之击", "91" });
			res.put("https://movie.douban.com/subject/26752088/,,,66", new String[] { "我不是药神", "90" });
			res.put("https://movie.douban.com/subject/30167539/,,,66", new String[] { "珠峰清道夫", "90" });
			res.put("javascript:;,,,66", new String[] { "死魂灵", "90" });
			res.put("https://movie.douban.com/subject/26984189/,,,66", new String[] { "坂本龙一：终曲", "89" });
			res.put("https://movie.douban.com/subject/27615467/,,,66", new String[] { "鲁斯·巴德·金斯伯格", "90" });
			res.put("https://movie.douban.com/subject/30234901/,,,66", new String[] { "尖端医疗的真相", "89" });
			res.put("https://movie.douban.com/subject/27012433/,,,66", new String[] { "阿尔法围棋", "88" });
			res.put("https://movie.douban.com/subject/4920389/,,,66", new String[] { "头号玩家", "87" });
			res.put("https://movie.douban.com/subject/26611804/,,,66", new String[] { "三块广告牌", "87" });
			res.put("https://movie.douban.com/subject/27622447/,,,66", new String[] { "小偷家族", "87" });
			res.put("https://movie.douban.com/subject/27059130/,,,66", new String[] { "大佛普拉斯", "87" });
			res.put("https://movie.douban.com/subject/27072795/,,,66", new String[] { "幸福的拉扎罗", "86" });
			res.put("https://movie.douban.com/subject/26787574/,,,66", new String[] { "奇迹男孩", "86" });
			res.put("https://movie.douban.com/subject/27147739/,,,66", new String[] { "有熊谷守一在的地方", "83" });
			res.put("https://movie.douban.com/subject/27615441/,,,66", new String[] { "网络谜踪", "85" });
			res.put("https://movie.douban.com/subject/25716096/,,,66", new String[] { "狗十三", "82" });
			res.put("https://movie.douban.com/subject/27114240/,,,66", new String[] { "冒牌上尉", "85" });
			res.put("https://movie.douban.com/subject/30234315/,,,66", new String[] { "摄影机不要停", "83" });
			res.put("https://movie.douban.com/subject/26952704/,,,66", new String[] { "巴斯特·斯克鲁格斯的歌谣", "84" });
			res.put("https://movie.douban.com/subject/27608785/,,,66", new String[] { "沉默的教室", "84" });
			res.put("https://movie.douban.com/subject/26861685/,,,66", new String[] { "红海行动", "83" });
			res.put("https://movie.douban.com/subject/26640371/,,,66", new String[] { "犬之岛", "83" });
			res.put("https://movie.douban.com/subject/20438964/,,,66", new String[] { "无敌破坏王2：大闹互联网", "81" });
			res.put("https://movie.douban.com/subject/26654498/,,,66", new String[] { "爱你，西蒙", "83" });
			res.put("https://movie.douban.com/subject/26683421/,,,66", new String[] { "特工", "84" });
			res.put("https://movie.douban.com/subject/26781703/,,,66", new String[] { "上帝之国", "83" });
			res.put("https://movie.douban.com/subject/26346327/,,,66", new String[] { "养家之人", "84" });
			res.put("https://movie.douban.com/subject/26951692/,,,66", new String[] { "阿德尔曼夫妇", "83" });
			res.put("https://movie.douban.com/subject/26336252/,,,66", new String[] { "碟中谍6：全面瓦解", "81" });
			res.put("https://movie.douban.com/subject/26425063/,,,66", new String[] { "无双", "80" });
			res.put("https://movie.douban.com/subject/27110296/,,,66", new String[] { "无名之辈", "81" });
			res.put("https://movie.douban.com/subject/26647117/,,,66", new String[] { "暴裂无声", "82" });
			res.put("https://movie.douban.com/subject/27113517/,,,66", new String[] { "血观音", "83" });
			res.put("https://movie.douban.com/subject/26990609/,,,66", new String[] { "华盛顿邮报", "82" });
			res.put("https://movie.douban.com/subject/27018285/,,,66", new String[] { "现在去见你", "82" });
			res.put("https://movie.douban.com/subject/27042405/,,,66", new String[] { "大坏狐狸的故事", "83" });
			res.put("https://movie.douban.com/subject/26793852/,,,66", new String[] { "信笺故事", "82" });
			res.put("https://movie.douban.com/subject/1950330/,,,66", new String[] { "罗马", "81" });
			res.put("https://movie.douban.com/subject/27098888/,,,66", new String[] { "羞耻", "82" });
			res.put("https://movie.douban.com/subject/26872545/,,,66", new String[] { "24帧", "82" });
			res.put("https://movie.douban.com/subject/24773958/,,,66", new String[] { "复仇者联盟3：无限战争", "81" });
			res.put("https://movie.douban.com/subject/27093707/,,,66", new String[] { "升级", "81" });
			res.put("https://movie.douban.com/subject/26863778/,,,66", new String[] { "铁雨", "82" });
			res.put("https://movie.douban.com/subject/27172891/,,,66", new String[] { "大象席地而坐", "80" });
			res.put("https://movie.douban.com/subject/3036465/,,,66", new String[] { "爱在记忆消逝前", "82" });
			res.put("https://movie.douban.com/subject/27040737/,,,66", new String[] { "祈祷落幕时", "81" });
			res.put("https://movie.douban.com/subject/26359235/,,,66", new String[] { "克里斯托弗·罗宾", "80" });
			res.put("https://movie.douban.com/subject/26731376/,,,66", new String[] { "天上再见", "82" });
			res.put("https://movie.douban.com/subject/3878007/,,,66", new String[] { "海王", "77" });
			res.put("https://movie.douban.com/subject/25849049/,,,66", new String[] { "超人总动员2", "79" });
			res.put("https://movie.douban.com/subject/26784898/,,,66", new String[] { "花牌情缘：结", "79" });
			res.put("https://movie.douban.com/subject/26588314/,,,66", new String[] { "伯德小姐", "79" });
			res.put("https://movie.douban.com/subject/26842702/,,,66", new String[] { "燃烧", "79" });
			res.put("https://movie.douban.com/subject/26725678/,,,66", new String[] { "解除好友2：暗网", "79" });
			res.put("https://movie.douban.com/subject/26965165/,,,66", new String[] { "马斯顿教授与神奇女侠", "79" });
			res.put("https://movie.douban.com/subject/27017288/,,,66", new String[] { "小公女", "79" });
			res.put("https://movie.douban.com/subject/26979007/,,,66", new String[] { "九三年夏天", "79" });
			res.put("https://movie.douban.com/subject/27108740/,,,66", new String[] { "家族之苦3", "79" });
			res.put("https://movie.douban.com/subject/26894602/,,,66", new String[] { "冷战", "78" });
			res.put("https://movie.douban.com/subject/26979199/,,,66", new String[] { "喜欢，轻吻，快跑", "78" });
			res.put("https://movie.douban.com/subject/30162520/,,,66", new String[] { "盛夏", "78" });
			res.put("https://movie.douban.com/subject/26992114/,,,66", new String[] { "孤狼之血", "78" });
			res.put("https://movie.douban.com/subject/26610229/,,,66", new String[] { "方形", "77" });
			res.put("https://movie.douban.com/subject/27615398/,,,66", new String[] { "罪人", "76" });
			res.put("https://movie.douban.com/subject/26369884/,,,66", new String[] { "此房是我造", "74" });
			res.put("https://movie.douban.com/subject/26944582/,,,66", new String[] { "雪怪大冒险", "74" });
			res.put("https://movie.douban.com/subject/6874741/,,,66", new String[] { "无问西东", "75" });
			res.put("https://movie.douban.com/subject/26972258/,,,66", new String[] { "江湖儿女", "76" });
			res.put("https://movie.douban.com/subject/25944886/,,,66", new String[] { "灾难艺术家", "75" });
			res.put("https://movie.douban.com/subject/27102505/,,,66", new String[] { "去年冬天与你分手", "76" });
			res.put("https://movie.douban.com/subject/27621192/,,,66", new String[] { "文集", "76" });
			res.put("https://movie.douban.com/subject/26980827/,,,66", new String[] { "那就是我的世界", "77" });
			res.put("https://movie.douban.com/subject/26870023/,,,66", new String[] { "换季期", "76" });
			res.put("https://movie.douban.com/subject/26588308/,,,66", new String[] { "死侍2：我爱我家", "73" });
			res.put("https://movie.douban.com/subject/26809592/,,,66", new String[] { "魅影缝匠", "75" });
			res.put("https://movie.douban.com/subject/30140571/,,,66", new String[] { "嗝嗝老师", "75" });
			res.put("https://movie.douban.com/subject/30172472/,,,66", new String[] { "好朋友", "75" });
			res.put("https://movie.douban.com/subject/27003543/,,,66", new String[] { "与神同行2：因与缘", "75" });
			res.put("https://movie.douban.com/subject/3168101/,,,66", new String[] { "毒液：致命守护者", "72" });
			res.put("https://movie.douban.com/subject/26636712/,,,66", new String[] { "蚁人2：黄蜂女现身", "73" });
			res.put("https://movie.douban.com/subject/30201003/,,,66", new String[] { "寄宿学校", "73" });
			res.put("https://movie.douban.com/subject/26877492/,,,66", new String[] { "小森林", "73" });
			res.put("https://movie.douban.com/subject/30159390/,,,66", new String[] { "我的冠军男友", "73" });
			res.put("https://movie.douban.com/subject/26656655/,,,66", new String[] { "怪奇秀", "74" });
			res.put("https://movie.douban.com/subject/26929023/,,,66", new String[] { "梦呓雨林", "74" });
			res.put("https://movie.douban.com/subject/26752852/,,,66", new String[] { "水形物语", "72" });
			res.put("https://movie.douban.com/subject/26384741/,,,66", new String[] { "湮灭", "71" });
			res.put("https://movie.douban.com/subject/26649604/,,,66", new String[] { "比得兔", "71" });
			res.put("https://movie.douban.com/subject/26742730/,,,66", new String[] { "浪矢解忧杂货店", "72" });
			res.put("https://movie.douban.com/subject/25846857/,,,66", new String[] { "公牛历险记", "72" });
			res.put("https://movie.douban.com/subject/27050259/,,,66", new String[] { "妈妈咪呀2", "71" });
			res.put("https://movie.douban.com/subject/26961821/,,,66", new String[] { "马柔本宅秘事", "73" });
			res.put("https://movie.douban.com/subject/11524958/,,,66", new String[] { "快乐王子", "72" });
			res.put("https://movie.douban.com/subject/26985127/,,,66", new String[] { "一出好戏", "71" });
			res.put("https://movie.douban.com/subject/26366496/,,,66", new String[] { "邪不压正", "70" });
			res.put("https://movie.douban.com/subject/22265634/,,,66", new String[] { "星球大战8：最后的绝地武士", "71" });
		} else if (id.equals("god1994")) {
			res.put("上帝看电影的1994年", new String[] { time, "javascript:;" });
			res.put("https://movie.douban.com/subject/1297518/,,,god1994", new String[] { "九品芝麻官", "0" });
			res.put("https://movie.douban.com/subject/1291832/,,,god1994", new String[] { "低俗小说", "0" });
			res.put("https://movie.douban.com/subject/1292365/,,,god1994", new String[] { "活着", "0" });
			res.put("https://movie.douban.com/subject/1293167/,,,god1994", new String[] { "生死时速	", "0" });
			res.put("https://movie.douban.com/subject/1301753/,,,god1994", new String[] { "狮子王", "0" });
			res.put("https://movie.douban.com/subject/1292720/,,,god1994", new String[] { "阿甘正传", "0" });
			res.put("https://movie.douban.com/subject/1291999/,,,god1994", new String[] { "重庆森林", "0" });
			res.put("https://movie.douban.com/subject/1297570/,,,god1994", new String[] { "变相怪杰", "0" });
			res.put("https://movie.douban.com/subject/1291818/,,,god1994", new String[] { "饮食男女", "0" });
			res.put("https://movie.douban.com/subject/1291875/,,,god1994", new String[] { "阳光灿烂的日子", "0" });
			res.put("https://movie.douban.com/subject/1292052/,,,god1994", new String[] { "肖申克的救赎", "0" });
			res.put("https://movie.douban.com/subject/1295644/,,,god1994", new String[] { "这个杀手不太冷", "0" });
			res.put("https://movie.douban.com/subject/1292328/,,,god1994", new String[] { "东邪西毒", "0" });
			res.put("https://movie.douban.com/subject/1307739/,,,god1994", new String[] { "国产凌凌漆", "0" });
			res.put("https://movie.douban.com/subject/1295865/,,,god1994", new String[] { "燃情岁月", "0" });
		}
	}
}