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
import com.mc.core.entity.blog.Sheet;
import com.mc.core.service.blog.SheetService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/sheet/")
public class SheetView extends SuperView<String, Sheet> {
	@Autowired
	public SheetView(SheetService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Sheet en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Sheet en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Sheet en) {
		return null;
	}
	@DailyPoint
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Sheet en, @RequestParam("ids[]") String[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Sheet en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Sheet().setId(null), false);
		pages.setLink(0, "blog/sheet/list.htm");
		pages.setLink(1, "blog/sheet/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/sheet_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Sheet en = new Sheet();
			en.setSqlQueryField(en.setId(null), en.setLength(null), en.setTotal(null));
			List<Sheet> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Sheet data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("length", new String[] { data.getLength() + "B", FileTool.volume(data.getLength(), "-") });
					map.put("total", data.getTotal());
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
			File[] files = super.getFile(path, "ckxx", "hqsb");
			if (files == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			String prefix = path.indexOf("ckxx") != -1 ? "ckxx" : "hqsb";
			Map<String, Sheet> datas = new HashMap<String, Sheet>();
			for (File file : files) {
				String key = prefix + file.getName().substring(0,8);
				Sheet value = datas.get(key);
				if(value == null){
					value = new Sheet();
					value.setId(key);
					value.setLength(0L);
					value.setTotal(0L);
					datas.put(key, value);
				}
				value.setTotal(value.getTotal() + 1);
				value.setLength(value.getLength() + file.length());
			}
			
			for (Map.Entry<String, Sheet> temp : datas.entrySet()) {
				Sheet data = temp.getValue();
				if (data.getTotal() != 8 && data.getTotal() != 16) {
					res.setState("报纸刊数非法");
				}
				String[][] title = new String[data.getTotal().intValue()][];
				for (int i = 0; i < title.length; i++) {
					title[i] = new String[] { "", "", "" };
				}
				data.setTitle(JsonTool.write(title));
			}
			
			Sheet en = new Sheet();
			en.setSqlQueryIn(true, en.setId(null), true, datas.keySet().toArray(new String[] {}));
			if (service.count(en) > 0) {
				res.setState("报纸数据重复");
				return res;
			}
			
			int count = service.batch(new ArrayList<Sheet>(datas.values()));
			if (count > 0) {
				for (File file : files) {
					file.renameTo(new File(path, file.getName().substring(6)));
				}
				res.setState(OK);
			} else {
				res.setState("导入报纸成功");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}