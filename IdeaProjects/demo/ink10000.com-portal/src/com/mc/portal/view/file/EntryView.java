package com.mc.portal.view.file;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.file.Entry;
import com.mc.core.service.file.EntryService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/file/entry/")
public class EntryView extends SuperView<String, Entry> {
	@Autowired
	public EntryView(EntryService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Entry en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Entry en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Entry en) {
		return null;
	}
	public Object list(HttpServletRequest request, PageBody pages, Entry en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Entry().setAddress(null), true);
		pages.setLink(0, "file/entry/list.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "file/entry_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Entry en = new Entry();
			en.setSqlQueryField(en.setId(null), en.setTray(null), en.setName(null), en.setAddress(null), en.setLength(null), en.setCreated(null));
			List<Entry> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Entry data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("tray", data.getTray());
					map.put("address", data.getAddress());
					map.put("name", data.getName());
					map.put("length", new String[] { data.getLength() + "B", FileTool.volume(data.getLength(), "-") });
					map.put("created", TimeTool.getTime(data.getCreated(), null));
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
	@RequestMapping(value = "collect", method = RequestMethod.POST)
	public JMapView collect(HttpServletRequest request, HttpServletResponse response, @RequestBody String[][] keys) {
		JMapView res = new JMapView();
		try {
			if (keys[0].length > 1) {
				long[] total = new long[] { service.count(new Entry()), 0, 0 };
				String[][] datas = new String[keys.length][];
				for (int i = 0; i < keys.length; i++) {
					datas[i] = new String[4];
					datas[i][0] = keys[i][1] != null ? BLOG_DISK_TRAY.get(keys[i][1]) : "A:";
					datas[i][1] = keys[i][0];
					Entry en = new Entry();
					en.setTray(keys[i][1] != null ? keys[i][1] : "A:");
					en.setSqlQueryTerm(true, en.setAddress(null), Entry.Operation.Like, datas[i][1] + "%");
					long count = service.count(en);
					total[1] += count;
					datas[i][2] = String.valueOf(count);
					if (datas[i][0].equals("A:")) {
						total[2] += count;
						datas[i][3] = String.valueOf(count);
					} else {
						List<String> files = new ArrayList<String>();
						FileTool.list(new File(datas[i][0] + datas[i][1]), datas[i][0] + datas[i][1], files);
						total[2] += files.size();
						datas[i][3] = String.valueOf(files.size());
					}
				}
				res.put("total", total);
				res.put("datas", datas);
			} else {
				keys[0][0] = keys[0][0].replace("\\", "/");
				List<String> files = new ArrayList<String>();
				FileTool.list(new File(keys[0][0]), keys[0][0], files);
				res.put("total", files.size());
			}
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value = "verify", method = RequestMethod.POST)
	public void verify(HttpServletRequest request, HttpServletResponse response, String prefix) throws Exception {
		if (prefix == null || prefix.equals("")) {
			super.out(response, "请求参数非法", null);
			return;
		}
		
		Entry en = new Entry();
		en.setSqlQueryField(en.setId(null), en.setTray(null), en.setAddress(null), en.setName(null), en.setLength(null), en.setCreated(null));
		en.setSqlQueryTerm(true, en.setTray(null), Entry.Operation.NotEqualTo, "A:");
		en.setSqlQueryTerm(true, en.setAddress(null), Entry.Operation.Like, prefix.replace("%", "\\%").replace("_", "\\_").replace("?", "\\?") + "%");
		en.setSqlQueryOrder(en.setAddress(null), true);
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		StringBuffer html = new StringBuffer();
		html.append("文件总共有" + en.getSqlLeafTotal() + "个");
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<Entry> datas = service.list(en);
			if (datas != null && datas.size() > 0) {
				for (Entry data : datas) {
					if (!data.getAddress().endsWith("/" + data.getName())) {
						html.append("<br>" + data.getAddress() + " = 对象有问题");
						continue;
					}
					
					File file = new File(BLOG_DISK_TRAY.get(data.getTray()) + data.getAddress());
					if (!file.exists() || !file.isFile() || !file.canRead()) {
						html.append("<br>" + file.getAbsolutePath() + " = 文件不存在");
						continue;
					}
					Entry entry = com.mc.portal.view.blog.SuperView.getEntry(file, data.getTray(), false);
					Entry temp = new Entry();
					if (data.getLength().intValue() != entry.getLength().intValue()) {
						String id = CryptoTool.MD5.encode(file, false).MD5;
						if (!data.getId().equals(id)) {
							html.append("<br>" + file.getAbsolutePath() + " = 文件被替换");
							continue;
						}
						temp.setLength(entry.getLength());
					}
					
					if (!data.getName().equals(entry.getName())) {
						temp.setName(file.getName());
					}
					if (!TimeTool.getTime(data.getCreated(), null).equals(TimeTool.getTime(entry.getCreated(), null))) {
						temp.setCreated(entry.getCreated());
					}
					if (!JsonTool.write(temp).equals("{}")) {
						temp.setId(data.getId());
						service.update(temp);
						html.append("<br>" + file.getAbsolutePath() + " = 实体更新了");
					}
				}
			}
		}
		super.out(response, html.toString(), null);
	}
}