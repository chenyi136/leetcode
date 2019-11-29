package com.mc.portal.view.blog;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import it.sauronsoftware.jave.VideoSize;
import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
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
import com.mc.core.entity.blog.Catena;
import com.mc.core.entity.blog.Cloud;
import com.mc.core.entity.blog.Movie;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.service.blog.CloudService;
import com.mc.core.service.blog.MovieService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.PinyinTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.FigureItem;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.MovieTool;
@Controller
@RequestMapping("/blog/movie/")
public class MovieView extends SuperView<String, Movie> {
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private CatenaService catenaService;
	@Autowired
	private CloudService cloudService;
	@Autowired
	private EntryService entryService;
	@Autowired
	public MovieView(MovieService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Movie en) throws Exception {
		en.setSqlQueryField(en.setName(null), en.setEnglish(null), en.setAlias(null), en.setDirect(null), en.setWriter(null), en.setActor(null), en.setStyle(null), en.setZone(null), en.setScreen(null), en.setBrief(null), en.setImdb(null), en.setDouban(null), en.setScore(null), en.setJudge(null), en.setMaoyan(null), en.setAddress(null), en.setWidth(null), en.setHeight(null), en.setTrack(null), en.setRate(null), en.setTrash(null), en.setFkCatena(null));
		ModelAndView res = super.load(request, en.getId(), en, "blog/movie_load");
		if (((Movie) res.getModel().get("pages")).getId() == null) {
			response.sendRedirect(ROOT + "blog/movie/list.htm");
			return null;
		}
		res.addObject("catena", super.getCatena(request, catenaService, true, null));
		return res;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Movie en) throws Exception {
		if (en.getAddress() == null || en.getAddress().equals("/视频库/电影/1921/")) {
			en.setAddress("/视频库/电影/" + en.getScreen().substring(0, 4) + "/");
		}
		Cloud cloud = new Cloud();
		cloud.setId(en.getAddress());
		if (cloudService.count(cloud) < 1) {
			return super.jump(request, "blog/movie/list.htm", "文件路径非法");
		}
		if (en.getDouban().startsWith("https://baike.baidu.com/")) {
			en.setDouban(URLDecoder.decode(en.getDouban(), "UTF-8"));
		}
		en.setBrief(en.getBrief().replace(" ", "").replace("\r", ""));
		if (en.getFkCatena() != -1) {
			Catena temp = new Catena();
			temp.setId(en.getFkCatena());
			temp.setFinish(false);
			catenaService.update(temp);
		} else {
			en.doFieldValue(en.setFkCatena(null).ClazzFieldName, null);
			en.setSqlUpdateNull(en.setFkCatena(null));
		}
		en.setEdited(new Date());
		return super.jump(request, "blog/movie/list.htm", service.update(en) ? "更新电影成功" : "更新电影失败");
	}
	public JMapView save(HttpServletRequest request, Movie en) {
		return null;
	}
	@DailyPoint(service = MovieService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Movie en, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null || ids[0].equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			
			if (service.delete(ids[0])) {
				entryService.delete(ids[0]);
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
	public Object list(HttpServletRequest request, PageBody pages, Movie en) throws Exception {
		if (pages.getCustom() != null && pages.getCustom().size() > 0) {
			for (PageBody.PageBodyValue data : pages.getCustom()) {
				if (data.name.equals(en.setScreen(null).FrameFieldName)) {
					en.setSqlQueryTerm(true, en.setScreen(null), Movie.Operation.Like, data.value + "%");
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Movie().setScreen(null), false);
		pages.setLink(0, "blog/movie/list.htm");
		pages.setLink(1, "blog/movie/drop.htm");
		pages.setLink(2, "blog/movie/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/movie_list");
		res.addObject("catena", super.getCatena(request, catenaService, true, null));
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Movie en = new Movie();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setEnglish(null), en.setAlias(null), en.setDirect(null), en.setWriter(null), en.setActor(null), en.setStyle(null), en.setZone(null), en.setScreen(null), en.setImdb(null), en.setDouban(null), en.setScore(null), en.setJudge(null), en.setMaoyan(null), en.setAddress(null), en.setWidth(null), en.setHeight(null), en.setTrack(null), en.setRate(null), en.setAccess(null), en.setTrash(null), en.setEdited(null), en.setFkCatena(null));
			List<Movie> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				List<String> ids = new ArrayList<String>();
				for (Movie data : datas) {
					ids.add(data.getId());
				}
				Map<String, String[]> entrys = super.getEntry(entryService, ids);
				Map<String, String> catena = super.getCatena(request, catenaService, true, null);
				for (Movie data : datas) {
					String[] entry = entrys.get(data.getId());
					if (entry == null) {
						continue;
					}
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", new String[] { data.getName(), this.list(catena, data, entry[2]) });
					map.put("style", data.getStyle().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
					map.put("screen", data.getScreen());
					map.put("length", entry);
					map.put("width", data.getWidth());
					map.put("height", data.getHeight());
					map.put("track", data.getTrack() + "分钟");
					map.put("rate", data.getRate() + "比特/毫秒");
					map.put("judge", data.getJudge());
					map.put("score", new String[] { data.getScore() > 0 ? data.getScore() + "分" : "?", data.getImdb(), data.getDouban(), data.getMaoyan() });
					map.put("trash", data.getTrash());
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
			Movie en = new Movie();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setEnglish(null), en.setAlias(null), en.setDirect(null), en.setWriter(null), en.setActor(null), en.setStyle(null), en.setZone(null), en.setScreen(null), en.setImdb(null), en.setDouban(null), en.setScore(null), en.setJudge(null));
			List<Movie> datas = super.list(request, en, pages);
			if (datas != null && datas.size() > 0) {
				Map<String, Movie> files = new HashMap<String, Movie>();
				for (Movie data : datas) {
					if (!data.getDouban().startsWith("https://movie.douban.com/")) {
						continue;
					}
					files.put(data.getId(), data);
				}
				
				File root = new File(CACHE + "blog/movie/");
				FileTool.delete(root, true);
				res.setState(MovieTool.file(restTemplate, (MovieService) service, files, MovieTool.list(restTemplate, (MovieService) service, files, root)).replace("\n", "<br>"));
				return res;
			}
			res.setState("同步电影成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "lead", method = RequestMethod.POST)
	public JMapView lead(HttpServletRequest request, String path) {
		JMapView res = new JMapView();
		try {
			List<File> files = new ArrayList<File>();
			FileTool.list(new File(path), null, files);
			if (files.size() < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			int count = 0;
			for (File file : files) {
				logger.info("[导入电影文件]" + file.getAbsolutePath());
				if (!file.isFile()) {
					continue;
				}
				
				String year = file.getParentFile().getName();
				Entry entry = super.getEntry(file, "G:", true);
				entry.setAddress("/视频库/电影/" + year + "/" + file.getName());
				Movie movie = new Movie();
				movie.setId(entry.getId());
				if (service.count(movie) > 0) {
					continue;
				}
				
				Entry source = new Entry();
				source.setId(entry.getId());
				source.setSqlQueryField(source.setAddress(null), source.setName(null), source.setLength(null), source.setCreated(null));
				source = entryService.get(source);
				if (source != null) {
					Entry temp = new Entry();
					if (!entry.getAddress().equals(source.getAddress())) {
						temp.setAddress(entry.getAddress());
					}
					if (!entry.getName().equals(source.getName())) {
						temp.setName(entry.getName());
					}
					if (entry.getLength().longValue() != source.getLength()) {
						temp.setLength(entry.getLength());
					}
					if (!TimeTool.getTime(entry.getCreated(), null).equals(TimeTool.getTime(source.getCreated(), null))) {
						temp.setCreated(entry.getCreated());
					}
					if (!"{}".equals(JsonTool.write(temp))) {
						temp.setId(entry.getId());
						entryService.update(temp);
					}
				} else {
					entryService.save(entry);
				}
				
				MultimediaInfo info = new Encoder().getInfo(file);
				VideoSize video = info.getVideo().getSize();
				movie.setName(FileTool.suffix(file.getName())[0]);
				movie.setEnglish("-");
				movie.setAlias("[]");
				movie.setDirect("[]");
				movie.setWriter("[]");
				movie.setActor("[]");
				movie.setStyle("[]");
				movie.setZone("[]");
				movie.setScreen("-");
				movie.setBrief("-");
				movie.setImdb("-");
				movie.setDouban("-");
				movie.setScore(0);
				movie.setMaoyan("javascript:;");
				movie.setAddress("/视频库/电影/" + year + "/");
				movie.setWidth(video.getWidth());
				movie.setHeight(video.getHeight());
				movie.setTrack(new Long(info.getDuration() / (60 * 1000L)).intValue());
				movie.setRate(new Long(entry.getLength() / info.getDuration()).intValue());
				movie.setTrash(true);
				if (service.save(movie)) {
					count++;
				}
			}
			res.setState(count > 0 ? OK : "导入电影成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "name", method = RequestMethod.POST)
	public void name(HttpServletRequest request, HttpServletResponse response, @RequestBody PageBody pages) throws Exception {
		Entry entry = new Entry();
		entry.setSqlQueryField(entry.setId(null), entry.setAddress(null));
		entry.setSqlQueryTerm(true, entry.setAddress(null), Entry.Operation.Like, "/视频库/电影/%");
		entry.setSqlLeafTotal(entryService.count(entry));
		entry.setSqlLeafSize(LEAF_MAX_SIZE);
		Map<String, String> cache = new HashMap<String, String>();
		for (long i = 1; i <= entry.getSqlLeafTabs(); i++) {
			entry.setSqlLeafNow(i);
			List<Entry> entrys = entryService.list(entry);
			if (entrys != null && entrys.size() > 0) {
				for (Entry temp : entrys) {
					cache.put(temp.getId(), temp.getAddress());
				}
			}
		}
		
		Movie en = new Movie();
		en.setSqlQueryField(en.setId(null), en.setName(null), en.setScreen(null));
		pages.setOrder(en.setScreen(null).FrameFieldName);
		pages.setQueue(true);
		pages.setSize(LEAF_MAX_SIZE);
		List<Movie> datas = super.list(request, en, pages);
		StringBuffer html = new StringBuffer();
		while (datas != null && datas.size() > 0) {
			for (Movie data : datas) {
				String value = cache.get(data.getId());
				if (value == null || value.indexOf(data.getScreen().substring(0, 4)) == -1) {
					html.append("<br><b style=\"color:#F00;\">" + data.getName() + " 目录与年份不一致");
					continue;
				}
				html.append("<br>" + data.getName() + " = (" + data.getScreen().replace("-", "") + ")" + PinyinTool.getTotalChar(data.getName(), true) + ".zip");
			}
			pages.setNow(pages.getNow() + 1);
			if (pages.getNow() > pages.getTabs()) {
				break;
			}
			datas = super.list(request, en, pages);
		}
		super.out(response, html.length() > 0 ? html.substring(4) : "暂无数据", null);
	}
	private String list(Map<String, String> catena, Movie data, String created) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("英文名称：" + data.getEnglish());
		if (!data.getAlias().equals("[]")) {
			res.append("<br>电影别名：" + data.getAlias().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
		}
		String temp = data.getFkCatena() != null ? catena.get(data.getFkCatena().toString()) : null;
		if (temp != null) {
			res.append("<br>所属系列：" + temp);
		}
		temp = "";
		List<FigureItem> items = JsonTool.list(data.getDirect(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>电影导演：" + temp.substring(3));
		}
		temp = "";
		items = JsonTool.list(data.getWriter(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>电影编剧：" + temp.substring(3));
		}
		temp = "";
		items = JsonTool.list(data.getActor(), FigureItem.class);
		for (FigureItem item : items) {
			temp += " / " + item.name;
		}
		if (!temp.equals("")) {
			res.append("<br>电影演员：" + temp.substring(3));
		}
		if (!data.getZone().equals("[]")) {
			res.append("<br>上映地区：" + data.getZone().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
		}
		res.append("<br>文件路径：" + data.getAddress());
		res.append("<br>访问总数：" + data.getAccess());
		res.append("<br>创建时间：" + created);
		res.append("<br>更新时间：" + TimeTool.getTime(data.getEdited(), null));
		return res.toString();
	}
}