package com.mc.portal.view.blog;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
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
import com.mc.core.entity.blog.Music;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.MusicService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/music/")
public class MusicView extends SuperView<String, Music> {
	@Autowired
	private EntryService entryService;
	@Autowired
	public MusicView(MusicService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Music en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Music en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Music en) {
		return null;
	}
	@DailyPoint(service = MusicService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Music en, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
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
	public Object list(HttpServletRequest request, PageBody pages, Music en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Music().setName(null), true);
		pages.setLink(0, "blog/music/list.htm");
		pages.setLink(1, "blog/music/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/music_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Music en = new Music();
			en.setSqlQueryField(en.setId(null), en.setInline(null), en.setName(null), en.setTrack(null), en.setEdited(null));
			List<Music> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				List<String> ids = new ArrayList<String>();
				for (Music data : datas) {
					ids.add(data.getId());
				}
				Map<String, String[]> entrys = super.getEntry(entryService, ids);
				for (Music data : datas) {
					String[] entry = entrys.get(data.getId());
					if (entry == null) {
						continue;
					}
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("inline", data.getInline());
					map.put("name", data.getName());
					map.put("track", data.getTrack());
					map.put("edited", TimeTool.getTime(data.getEdited(), null));
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
	@RequestMapping(value = "lead", method = RequestMethod.POST)
	public JMapView lead(HttpServletRequest request, String path) {
		JMapView res = new JMapView();
		try {
			File[] files = super.getFile(path, "国内歌曲", "国外歌曲");
			if (files == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			boolean inline = path.indexOf("国内歌曲") != -1;
			int count = 0;
			for (File file : files) {
				logger.info("[导入音乐文件]" + file.getAbsolutePath());
				if (!file.isFile() || !file.getName().endsWith(".mp3")) {
					continue;
				}
				
				Entry entry = super.getEntry(file, "D:", true);
				Music music = new Music();
				music.setId(entry.getId());
				if (service.count(music) > 0) {
					continue;
				}
				
				String track = "";
				try {
					MultimediaInfo info = new Encoder().getInfo(file);
					track = super.getTrack(info.getDuration());
				} catch (Exception e) {
					throw new Exception(file.getName());
				}
				
				entryService.save(entry);
				music.setInline(inline);
				music.setName(file.getName().replace(".mp3", ""));
				music.setTrack(track);
				music.setEdited(entry.getCreated());
				if (service.save(music)) {
					count++;
				}
			}
			res.setState(count > 0 ? OK : "导入音乐成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}