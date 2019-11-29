package com.mc.portal.view.blog;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.lingala.zip4j.core.ZipFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.blog.Sexy;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.blog.SexyService;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/blog/sexy/")
public class SexyView extends SuperView<String, Sexy> {
	@Autowired
	private EntryService entryService;
	@Autowired
	public SexyView(SexyService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Sexy en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Sexy en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Sexy en) {
		return null;
	}
	@DailyPoint
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Sexy en, @RequestParam("ids[]") String[] ids) {
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
	public Object list(HttpServletRequest request, PageBody pages, Sexy en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Sexy().setName(null), true);
		pages.setLink(0, "blog/sexy/list.htm");
		pages.setLink(1, "blog/sexy/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/sexy_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Sexy en = new Sexy();
			en.setSqlQueryField(en.setId(null), en.setAddress(null), en.setName(null), en.setLength(null), en.setWidth(null), en.setHeight(null), en.setCode(null));
			List<Sexy> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				boolean power = ServletTool.getOnline(request).power.indexOf("blog/sexy/drop.htm") != -1;
				for (Sexy data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("address", data.getAddress());
					map.put("name", data.getName());
					map.put("length", new String[] { data.getLength() + "B", FileTool.volume(data.getLength(), "-") });
					map.put("width", data.getWidth());
					map.put("height", data.getHeight());
					map.put("code", power ? data.getCode() : "*");
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
			File[] files = super.getFile(path);
			if (files == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			File target = new File(path, "OK");
			if (!target.exists() || !target.isDirectory()) {
				if (!target.mkdirs()) {
					res.setState("创建目录失败");
					return res;
				}
			}
			
			Map<String, Entry> entrys = new ConcurrentHashMap<String, Entry>();
			Map<String, Sexy> sexys = new ConcurrentHashMap<String, Sexy>();
			for (File file : files) {
				String id = FileTool.suffix(file.getName())[0];
				if (id.equals("") || !id.matches("[0-9a-z_]*") || !file.isFile()) {
					logger.info(id + " = 文件名称非法");
					continue;
				}
				
				if (file.getName().endsWith(".zip")) {
					Entry value = new Entry();
					value.setId(id);
					value.setTray("G:");
					value.setAddress("/视频库/开放/" + id.substring(0, 1) + "-" + id.substring(1, 2) + "/" + file.getName());
					value.setName(file.getName());
					value.setLength(FileTool.length(null, file));
					value.setCreated(new Date(file.lastModified() - file.lastModified() % 1000));
					entrys.put(id, value);
				} else {
					Sexy value = new Sexy();
					value.setId(id);
					value.setAddress("/视频库/开放/" + id.charAt(0) +"-" + id.charAt(1) +"/");
					value.setName(file.getName());
					value.setLength(FileTool.length(null, file));
					sexys.put(id, value);
				}
			}
			
			File root = new File(CACHE + "blog/sexy/");
			for (Map.Entry<String, Entry> en: entrys.entrySet()) {
				Entry entry = en.getValue();
				Sexy sexy = sexys.get(entry.getId());
				if (sexy == null) {
					entrys.remove(entry.getId());
				} else {
					try {
						String code = this.code(sexy.getId(), sexy.getLength());
						ZipFile zip = new ZipFile(new File(path, entry.getName()));
						zip.setPassword(code);
						if (zip.getFileHeader(sexy.getName()) == null) {
							entrys.remove(sexy.getId());
							sexys.remove(sexy.getId());
							continue;
						}
						zip.extractFile(entry.getId() + ".jpg", root.getAbsolutePath());
						File file = new File(root, entry.getId() + ".jpg");
						BufferedImage image = ImageIO.read(file);
						sexy.setWidth(image.getWidth());
						sexy.setHeight(image.getHeight());
						sexy.setCode(code);
					} catch (Exception e) {
						entrys.remove(entry.getId());
						sexys.remove(entry.getId());
						e.printStackTrace();
					}
				}
			}
			FileTool.delete(root, true);
			
			for (Map.Entry<String, Sexy> en: sexys.entrySet()) {
				Sexy sexy = en.getValue();
				Entry entry = entrys.get(sexy.getId());
				if (entry == null) {
					sexys.remove(sexy.getId());
				}
			}
			if (sexys.size() > 0) {
				for (Map.Entry<String, Entry> en: entrys.entrySet()) {
					Entry entry = en.getValue();
					Sexy sexy = sexys.get(entry.getId());
					if (sexy == null) {
						logger.info(entry.getId() + " = 没有开放视频");
						continue;
					}
					
					Entry temp1 = new Entry();
					temp1.setId(entry.getId());
					if (entryService.count(temp1) < 1 && !entryService.save(entry)) {
						continue;
					}
					
					Sexy temp2 = new Sexy();
					temp2.setId(entry.getId());
					if (service.count(temp2) < 1 && service.save(sexy)) {
						new File(path, entry.getName()).renameTo(new File(target, entry.getName()));
						new File(path, sexy.getName()).delete();
					}
				}
				res.setState(OK);
			} else {
				res.setState("导入文件成功");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "code", method = RequestMethod.POST)
	public void code(HttpServletRequest request, HttpServletResponse response, String path) throws Exception {
		File[] files = super.getFile(path);
		if (files == null) {
			super.out(response, "请求参数非法", null);
			return;
		}
		
		StringBuffer data = new StringBuffer();
		for (File file : files) {
			if (!file.isFile()) {
				continue;
			}
			String id = FileTool.suffix(file.getName())[0];
			if (id.equals("") || !id.matches("[0-9a-z_]*")) {
				continue;
			}
			Sexy en = new Sexy();
			en.setId(id);
			if (service.count(en) > 0) {
				data.append("<br>" + file.getName() + " = 已导入");
			} else {
				data.append("<br>" + file.getName() + " = " + this.code(id, FileTool.length(null, file)));
			}
		}
		super.out(response, data.length() > 0 ? data.substring(4) : "文件命名非法", null);
	}
	private String code(String id, long length) {
		int index = (int) (length % 16);
		StringBuffer res = new StringBuffer();
		res.append(id.charAt(0));
		res.append(CryptoTool.DES.encode(id).substring(index, index + 8));
		res.append(Math.abs(id.hashCode() % 10));
		return res.toString();
	}
}