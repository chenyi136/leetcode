package com.mc.portal.view.blog;
import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.blog.Catena;
import com.mc.core.entity.blog.Player;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.CatenaService;
import com.mc.core.service.blog.MovieService;
import com.mc.core.service.blog.PlayerService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
@Controller
@RequestMapping("/blog/player/")
public class PlayerView extends SuperView<String, Player> {
	@Autowired
	private CatenaService catenaService;
	@Autowired
	private EntryService entryService;
	@Autowired
	public PlayerView(PlayerService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Player en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Player en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Player en) {
		return null;
	}
	@DailyPoint(service = MovieService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Player en, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length < 1 || ids[0] == null || ids[0].equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			
			int count = 0;
			for (String id : ids) {
				if (service.delete(id)) {
					entryService.delete(id);
					count++;
				}
			}
			res.put("count", count);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Player en) throws Exception {
		if (pages.getCustom() != null && pages.getCustom().size() > 0) {
			for (PageBody.PageBodyValue data : pages.getCustom()) {
				if (data.name.equals(en.setFkCatena(null).FrameFieldName)) {
					List<Integer> keys = new ArrayList<Integer>();
					Map<String, String> map = super.getCatena(request, catenaService, false, null);
					for (Map.Entry<String, String> temp : map.entrySet()) {
						if (temp.getValue().indexOf(data.value) != -1) {
							keys.add(Integer.parseInt(temp.getKey()));
						}
					}
					en.setSqlQueryIn(true, en.setFkCatena(null), true, keys.size() > 0 ? keys.toArray(new Integer[] {}) : new Integer[] { -1 });
				} else if (data.name.equals("play")) {
					List<Integer> keys = new ArrayList<Integer>();
					Catena catena = new Catena();
					catena.setPlay(data.value.equals("1"));
					catena.setSqlQueryField(catena.setId(null));
					catena.setSqlLeafSize(LEAF_MAX_SIZE);
					List<Catena> datas = catenaService.list(catena);
					if (datas != null && datas.size() > 0) {
						for (Catena temp : datas) {
							keys.add(temp.getId());
						}
					}
					en.setSqlQueryIn(true, en.setFkCatena(null), true, keys.size() > 0 ? keys.toArray(new Integer[] {}) : new Integer[] { -1 });
				} else if (data.name.equals("type")) {
					List<Integer> keys = new ArrayList<Integer>();
					Catena catena = new Catena();
					catena.setType(data.value);
					catena.setSqlQueryField(catena.setId(null));
					catena.setSqlLeafSize(LEAF_MAX_SIZE);
					List<Catena> datas = catenaService.list(catena);
					if (datas != null && datas.size() > 0) {
						for (Catena temp : datas) {
							keys.add(temp.getId());
						}
					}
					en.setSqlQueryIn(true, en.setFkCatena(null), true, keys.size() > 0 ? keys.toArray(new Integer[] {}) : new Integer[] { -1 });
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Player().setName(null), false);
		pages.setLink(0, "blog/player/list.htm");
		pages.setLink(1, "blog/player/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/player_list");
		res.addObject("catena", super.getCatena(request, catenaService, false, null));
		res.addObject("label", super.getCatena(request, catenaService, false, false));
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Player en = new Player();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setTrack(null), en.setRate(null), en.setAttach(null), en.setEdited(null), en.setFkCatena(null));
			List<Player> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				List<String> ids = new ArrayList<String>();
				for (Player data : datas) {
					ids.add(data.getId());
				}
				Map<String, String[]> entrys = super.getEntry(entryService, ids);
				Map<String, String> catena = super.getCatena(request, catenaService, false, null);
				for (Player data : datas) {
					String[] entry = entrys.get(data.getId());
					if (entry == null) {
						continue;
					}
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName());
					map.put("track", data.getTrack());
					map.put("rate", data.getRate());
					map.put("attach", this.attach(data.getAttach()));
					map.put("edited", TimeTool.getTime(data.getEdited(), null));
					map.put("fkCatena", new String[] { data.getFkCatena().toString(), catena.get(data.getFkCatena().toString()) });
					map.put("entry", entry);
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
	@RequestMapping(value = "attach", method = RequestMethod.POST)
	public JMapView attach(HttpServletRequest request, String id, String name, Integer width, Integer height, String screen, Integer score, String douban) {
		JMapView res = new JMapView();
		try {
			Entry entry = new Entry();
			entry.setId(id);
			entry.setSqlQueryField(entry.setAddress(null), entry.setName(null));
			if (id == null || id.equals("") || (entry = entryService.get(entry)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			if (width != null && width > 0 && height != null && height > 0) {
				data.put("width", width);
				data.put("height", height);
			}
			if (screen != null && !screen.equals("") && score != null && score > -1 && douban != null && douban.startsWith("https://movie.douban.com/")) {
				data.put("screen", screen);
				data.put("score", score);
				data.put("douban", douban);
			}
			Player en = new Player();
			en.setId(id);
			en.setName(name);
			if (data.size() > 0) {
				en.setAttach(JsonTool.write(data));
			} else {
				en.setSqlUpdateNull(en.setAttach(null));
			}
			if (service.update(en)) {
				if (!entry.getName().equals(name)) {
					entry.setId(id);
					entry.setAddress(entry.getAddress().replace(entry.getName(), name));
					entry.setName(name);
					entryService.update(entry);
				}
				res.setState(OK);
			} else {
				res.setState("更新参数失败");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "lead", method = RequestMethod.POST)
	public JMapView lead(HttpServletRequest request, Integer fkCatena, String tray, String path) {
		JMapView res = new JMapView();
		try {
			File[] files;
			if (fkCatena == null || fkCatena < 1 || tray == null || tray.equals("") || (files = super.getFile(path)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			int count = 0;
			for (File file : files) {
				logger.info("\n[导入短视文件]" + file.getAbsolutePath());
				Entry entry = super.getEntry(file, tray, true);
				Player player = new Player();
				player.setId(entry.getId());
				if (service.count(player) > 0) {
					continue;
				}
				
				long time = 0;
				try {
					MultimediaInfo info = new Encoder().getInfo(file);
					time = info.getDuration();
				} catch (Exception e) {
					throw new Exception(file.getName());
				}
				
				entryService.save(entry);
				player.setName(file.getName());
				player.setTrack(super.getTrack(time));
				player.setRate(new Long(entry.getLength() / time).intValue());
				player.setEdited(entry.getCreated());
				player.setFkCatena(fkCatena);
				if (service.save(player)) {
					count++;
				}
			}
			res.setState(count > 0 ? OK : "导入短视成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	private String[] attach(String data) throws Exception {
		if (data == null || data.equals("")) {
			return new String[] { "{}", "-" };
		}
		StringBuffer res = new StringBuffer();
		Map<String, Object> temp = JsonTool.read(data, Map.class);
		if (temp.containsKey("width")) {
			res.append("<br>分辨宽高：" + temp.get("width") + "×" + temp.get("height") + "px");
		}
		if (temp.containsKey("douban")) {
			res.append("<br>上映日期：" + temp.get("screen"));
			res.append("<br>豆瓣评分：<a href=\"" + temp.get("douban") + "\" target=\"_blank\">" + temp.get("score") + "分</a>");
		}
		return new String[] { data.replace("\"", "'"), res.substring(4) };
	}
}