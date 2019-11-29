package com.mc.portal.view.blog;
import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.blog.Code;
import com.mc.core.service.blog.CodeService;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/code/")
public class CodeView extends SuperView<Integer, Code> {
	@Autowired
	public CodeView(CodeService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Code en) throws Exception {
		en.setSqlQueryField(en.setType(null), en.setName(null), en.setEntry(null));
		return super.load(request, en.getId(), en, "blog/code_load");
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	@DailyPoint(impact = true)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Code en) throws Exception {
		if (en.getId() == null) {
			en.setEntry(en.getName().endsWith(".java") ? "//暂未完善" : "<!-- 暂未完善 -->");
			return super.jump(request, "blog/code/list.htm", service.save(en) ? "创建代码成功" : "创建代码失败");
		} else {
			en.setEntry(CryptoTool.DES.decode(en.getEntry()));
			en.setEdited(new Date());
			return super.jump(request, "blog/code/list.htm", service.update(en) ? "更新代码成功" : "更新代码失败");
		}
	}
	public JMapView save(HttpServletRequest request, Code en) {
		return null;
	}
	@DailyPoint(service = CodeService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Code en, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Code en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Code().setCreated(null), false);
		pages.setLink(0, "blog/code/list.htm");
		pages.setLink(1, "blog/code/drop.htm");
		pages.setLink(2, "blog/code/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/code_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Code en = new Code();
			en.setSqlQueryField(en.setId(null), en.setType(null), en.setName(null), en.setCreated(null), en.setEdited(null));
			List<Code> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Code data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("type", data.getType());
					map.put("name", data.getName());
					map.put("created", new String[] { TimeTool.getTime(data.getCreated(), null), TimeTool.getTime(data.getEdited(), null) });
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
	@RequestMapping(value = "read", method = RequestMethod.POST)
	public JMapView read(HttpServletRequest request, Integer id, boolean flag) {
		JMapView res = new JMapView();
		try {
			if (id == null || id < 1 || OUTPUT == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Code en = new Code();
			en.setId(id);
			en.setSqlQueryField(en.setName(null), en.setEntry(null));
			en = service.get(en);
			if (en == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			File file = new File(OUTPUT, "com/demo/" + en.getName());
			if (flag) {
				List<String> lines = FileTool.read(null, file);
				if (lines != null) {
					StringBuffer entry = new StringBuffer();
					for (String line : lines) {
						entry.append("\n" + line);
					}
					entry.deleteCharAt(0);
					res.put("entry", CryptoTool.DES.encode(entry.toString()));
					res.put("code", entry.toString().replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"));
					res.setState(OK);
					return res;
				}
			} else {
				if (!file.exists() || !file.isFile()) {
					FileTool.write(en.getEntry().getBytes(), file);
				}
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}