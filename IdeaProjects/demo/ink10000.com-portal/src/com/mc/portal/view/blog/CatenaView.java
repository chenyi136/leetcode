package com.mc.portal.view.blog;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mc.core.crux.Legal;
import com.mc.core.entity.blog.Catena;
import com.mc.core.entity.blog.Movie;
import com.mc.core.entity.blog.Player;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.service.blog.CloudService;
import com.mc.core.service.blog.MovieService;
import com.mc.core.service.blog.PlayerService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.PinyinTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.FigureItem;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.CatenaTool;
@Controller
@RequestMapping("/blog/catena/")
public class CatenaView extends SuperView<Integer, Catena> {
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private CloudService cloudService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private PlayerService playerService;
	@Autowired
	public CatenaView(CatenaService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Catena en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, Integer id) {
		JMapView res = new JMapView();
		try {
			Catena en = new Catena();
			en.setId(id);
			en.setSqlQueryField(en.setType(null), en.setName(null), en.setAddress(null), en.setWidth(null), en.setHeight(null), en.setSorted(null), en.setTotal(null), en.setEnglish(null), en.setZone(null), en.setScreen(null), en.setBrief(null), en.setScore(null), en.setDouban(null), en.setPlay(null), en.setFolder(null), en.setAttach(null), en.setQueue(null), en.setGroom(null), en.setFinish(null));
			if (id == null || id < 1 || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			String[] zone = JsonTool.read(en.getZone(), String[].class);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("type", new String[] { en.getType(), Legal.BLOG_CATENA_TYPE.get(en.getType()) });
			data.put("name", en.getName());
			data.put("address", en.getAddress());
			data.put("width", en.getWidth());
			data.put("height", en.getHeight());
			data.put("sorted", en.getSorted() ? 1 : 0);
			data.put("total", en.getTotal());
			data.put("english", en.getEnglish());
			data.put("zone", !en.doIsEmpty(en.getZone()) && en.getType().equals("WARD") && zone.length == 1 ? zone[0] : null);
			data.put("screen", en.getScreen());
			data.put("brief", en.getBrief());
			data.put("score", en.getScore());
			data.put("douban", en.getDouban());
			data.put("play", en.getPlay() ? 1 : 0);
			data.put("folder", en.getFolder());
			data.put("attach", en.getAttach() != null ? en.getAttach().replace("\"", "&quot;").replace("'", "&apos;") : null);
			data.put("queue", en.getQueue());
			data.put("groom", en.getGroom());
			data.put("finish", en.getFinish() ? 1 : 0);
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Catena en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Catena en) {
		JMapView res = new JMapView();
		try {
			Catena temp = new Catena();
			if (en.getId() == null) {
				temp.setType(en.getType());
				temp.setName(en.getName());
				temp.setTotal(0L);
				temp.setPlay(en.getPlay());
				if (service.save(temp)) {
					super.getCatena(request, null, en.getType().equals("CINE"), null);
					res.setState(OK);
				} else {
					res.setState("创建系列失败");
				}
			} else {
				temp.setId(en.getId());
				temp.setName(en.getName());
				temp.setBrief(en.getBrief().replace(" ", "").replace("\r", ""));
				temp.setFinish(en.getFinish());
				temp.setEdited(new Date());
				if (!en.getType().equals("CINE")) {
					temp.setAddress(en.getAddress());
					temp.setWidth(en.getWidth());
					temp.setHeight(en.getHeight());
					temp.setSorted(en.getSorted());
					temp.setTotal(en.getTotal());
					temp.setEnglish(en.getEnglish());
					if (en.getType().equals("WARD")) {
						if (en.getAddress().indexOf("/" + en.getZone() + "/") == -1) {
							res.setState("上映地区错误");
							return res;
						}
						temp.setZone("[\"" + en.getZone() + "\"]");
					} else if (en.getType().equals("CART")) {
						temp.setStyle("[\"动画\"]");
					} else if (en.getType().equals("TRUE")) {
						temp.setStyle("[\"纪录\"]");
					}
					temp.setScreen(en.getScreen());
					temp.setBrief(en.getBrief());
					temp.setScore(en.getScore());
					temp.setDouban(en.getDouban().startsWith("https://baike.baidu.com/") ? URLDecoder.decode(en.getDouban(), "UTF-8") :en.getDouban());
					temp.setGroom(en.getGroom());
					if (en.getPlay()) {
						temp.setFolder(en.getFolder());
						temp.setAttach(en.getAttach());
						temp.setQueue(en.getQueue());
					}
				}
				if (service.update(temp)) {
					super.getCatena(request, null, en.getType().equals("CINE"), null);
					res.setState(OK);
				} else {
					res.setState("更新系列失败");
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @RequestParam("ids[]") Integer[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null || ids[0] < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Catena en = new Catena();
			en.setId(ids[0]);
			en.setSqlQueryField(en.setType(null), en.setAddress(null));
			en = service.get(en);
			if (en == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			if ("CINE".equals(en.getType())) {
				Movie movie = new Movie();
				movie.setFkCatena(ids[0]);
				if (movieService.count(movie) > 0) {
					res.setState("被索引约束引用而无法删除");
					return res;
				}
			} else {
				Player player = new Player();
				player.setFkCatena(ids[0]);
				if (playerService.count(player) > 0) {
					res.setState("被索引约束引用而无法删除");
					return res;
				}
			}
			
			if (service.delete(ids[0])) {
				cloudService.delete(en.getAddress());
				super.getCatena(request, null, en.getType().equals("CINE"), null);
				res.put("count", 1);
			} else {
				res.put("count", 0);
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Catena en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		PageBody pages = super.list(request, new Catena().setAddress(null), true);
		pages.setLink(0, "blog/catena/list.htm");
		pages.setLink(1, "blog/catena/drop.htm");
		pages.setLink(2, "blog/catena/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/catena_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Catena en = new Catena();
			en.setSqlQueryField(en.setId(null), en.setType(null), en.setName(null), en.setAddress(null), en.setWidth(null), en.setHeight(null), en.setSorted(null), en.setTotal(null), en.setEnglish(null), en.setAlias(null), en.setDirect(null), en.setWriter(null), en.setActor(null), en.setStyle(null), en.setZone(null), en.setScreen(null), en.setScore(null), en.setJudge(null), en.setDouban(null), en.setGroom(null), en.setPlay(null), en.setFolder(null), en.setAttach(null), en.setQueue(null), en.setFinish(null), en.setCreated(null), en.setEdited(null));
			List<Catena> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Catena data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("type", new String[] { data.getType(), Legal.BLOG_CATENA_TYPE.get(data.getType()), this.list(data) });
					map.put("name", data.getName());
					map.put("address", !data.doIsEmpty(data.getAddress()) ? data.getAddress() : "-");
					map.put("width", data.getWidth() != null ? data.getWidth() : "-");
					map.put("height", data.getHeight() != null ? data.getHeight() : "-");
					map.put("sorted", data.getSorted());
					map.put("total", data.getTotal());
					map.put("screen", !data.doIsEmpty(data.getScreen()) ? data.getScreen() : "-");
					map.put("score", data.getScore());
					map.put("judge", data.getJudge() != null ? data.getJudge() : "-");
					map.put("douban", data.getDouban());
					map.put("play", data.getPlay());
					map.put("queue", data.getQueue() != null ? data.getQueue() : "-");
					map.put("finish", data.getFinish());
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
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "fresh", method = RequestMethod.POST)
	public JMapView fresh(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			pages.setSize(LEAF_MAX_SIZE);
			Catena en = new Catena();
			en.setSqlQueryField(en.setId(null), en.setType(null), en.setName(null), en.setTotal(null), en.setEnglish(null), en.setAlias(null), en.setDirect(null), en.setWriter(null), en.setActor(null), en.setStyle(null), en.setZone(null), en.setScreen(null), en.setScore(null), en.setJudge(null), en.setDouban(null), en.setFinish(null));
			List<Catena> datas = super.list(request, en, pages);
			if (datas != null && datas.size() > 0) {
				Map<Integer, Catena> files = new HashMap<Integer, Catena>();
				for (Catena data : datas) {
					if (data.getType().equals("CINE") || !data.getFinish()) {
						if (data.getType().equals("CINE")) {
							Movie movie = new Movie();
							movie.setFkCatena(data.getId());
							movie.setSqlQueryField( Movie.Method.COUNT.getField(movie.setJudge(null)), Movie.Method.MIN.getField(movie.setId(null)), Movie.Method.MIN.getField(movie.setScreen(null)), Movie.Method.MAX.getField(movie.setScore(null)));
							movie.setSqlLeafSize(1L);
							List<Movie> movies = movieService.list(movie);
							if (movies != null && movies.size() > 0) {
								movie = movies.get(0);
								if (movie.getJudge().intValue() != data.getTotal().intValue() || !movie.getId().equals(data.getEnglish()) || !movie.getScreen().equals(data.getScreen()) || movie.getScore().intValue() != data.getScore()) {
									Catena temp = new Catena();
									temp.setId(data.getId());
									temp.setTotal(new Long(movie.getJudge()));
									temp.setEnglish(movie.getId());
									temp.setScreen(movie.getScreen());
									temp.setScore(movie.getScore());
									temp.setPlay(false);
									temp.setFinish(true);
									temp.setEdited(new Date());
									service.update(temp);
								}
							}
						} else {
							Player player = new Player();
							player.setFkCatena(data.getId());
							Long total = playerService.count(player);
							if (data.getTotal() < 1 || data.getTotal().longValue() != total && !data.getType().equals("WARD")) {
								Catena temp = new Catena();
								temp.setId(data.getId());
								temp.setTotal(playerService.count(player));
								service.update(temp);
							}
						}
					}
					if (!data.getType().equals("CINE") && !data.doIsEmpty(data.getDouban()) && data.getDouban().startsWith("https://movie.douban.com/")) {
						files.put(data.getId(), data);
					}
				}
				File root = new File(CACHE + "blog/catena/");
				FileTool.delete(root, true);
				CatenaTool.file(restTemplate, (CatenaService) service, files, CatenaTool.list(restTemplate, files, root));
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint
	@RequestMapping(value = "task", method = RequestMethod.GET)
	public ModelAndView task(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> items = JsonTool.read(new ByteArrayInputStream(Files.readAllBytes(Paths.get(new File(PROJECT + "_/doc/task.txt").toURI()))), Map.class);
		Catena catena = new Catena();
		catena.setSqlQueryField(catena.setDouban(null));
		catena.setSqlQueryIn(true, catena.setDouban(null), true, items.keySet().toArray(new String[] {}));
		catena.setSqlLeafSize(new Long(items.size()));
		List<Catena> catenas = service.list(catena);
		if (catenas != null && catenas.size() > 0) {
			for (Catena data : catenas) {
				items.remove(data.getDouban());
			}
		}
		
		if (items.size() > 0) {
			Movie movie = new Movie();
			movie.setSqlQueryField(movie.setDouban(null));
			movie.setSqlQueryIn(true, movie.setDouban(null), true, items.keySet().toArray(new String[] {}));
			movie.setSqlLeafSize(new Long(items.size()));
			List<Movie> datas = movieService.list(movie);
			for (Movie data : datas) {
				items.remove(data.getDouban());
			}
		}
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/catena_task");
		res.addObject("items", items);
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "task", method = RequestMethod.POST)
	public JMapView task(HttpServletRequest request, @RequestBody Map<String, String> body) {
		JMapView res = new JMapView();
		try {
			JsonTool.write(body, new File(PROJECT + "_/doc/task.txt"));
			JsonTool.write(body, new File("E:/task.txt"));
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "name", method = RequestMethod.POST)
	public void name(HttpServletRequest request, HttpServletResponse response, @RequestBody PageBody pages) throws Exception {
		Catena en = new Catena();
		en.setSqlQueryField(en.setName(null));
		pages.setOrder(en.setName(null).FrameFieldName);
		pages.setQueue(true);
		pages.setSize(LEAF_MAX_SIZE);
		List<Catena> datas = super.list(request, en, pages);
		StringBuffer html = new StringBuffer();
		while (datas != null && datas.size() > 0) {
			for (Catena data : datas) {
				html.append("<br>" + data.getName() + " = " + PinyinTool.getTotalChar(data.getName(), true) + ".zip");
			}
			pages.setNow(pages.getNow() + 1);
			if (pages.getNow() > pages.getTabs()) {
				break;
			}
			datas = super.list(request, en, pages);
		}
		super.out(response, html.length() > 0 ? "以3G分块ZIP压缩，不含文件夹" + html : "暂无数据", null);
	}
	private String list(Catena data) throws Exception {
		StringBuffer res = new StringBuffer();
		if (!data.doIsEmpty(data.getEnglish())) {
			res.append("<br>英文名称：" + data.getEnglish());
		}
		if (!data.doIsEmpty(data.getAlias())) {
			res.append("<br>视频别名：" + (data.getAlias().equals("[]") ? "暂无数据" : data.getAlias().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / ")));
		}
		String temp = "";
		List<FigureItem> items = JsonTool.list(data.getDirect(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>视频导演：" + temp.substring(3));
		}
		temp = "";
		items = JsonTool.list(data.getWriter(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>视频编剧：" + temp.substring(3));
		}
		temp = "";
		items = JsonTool.list(data.getActor(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>视频演员：" + temp.substring(3));
		}
		if (!data.doIsEmpty(data.getStyle())) {
			res.append("<br>视频风格：" + data.getStyle().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
		}
		if (!data.doIsEmpty(data.getZone())) {
			res.append("<br>上映地区：" + data.getZone().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
		}
		if (!data.doIsEmpty(data.getGroom())) {
			res.append("<br>关联词语：" + data.getGroom());
		}
		if (!data.doIsEmpty(data.getFolder())) {
			res.append("<br>播放目录：" + data.getFolder());
		}
		if (!data.doIsEmpty(data.getAttach())) {
			res.append("<br>播放参数：" + data.getAttach());
		}
		res.append("<br>创建时间：" + TimeTool.getTime(data.getCreated(), null));
		res.append("<br>更新时间：" + TimeTool.getTime(data.getEdited(), null));
		return res.substring(4);
	}
}