package com.mc.portal.view.file;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.mc.core.crux.Legal;
import com.mc.core.entity.file.Region;
import com.mc.core.service.file.RegionService;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/file/region/")
public class RegionView extends SuperView<Integer, Region> {
	@Autowired
	public RegionView(RegionService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Region en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Region en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Region en) {
		return null;
	}
	public Object list(HttpServletRequest request, PageBody pages, Region en) throws Exception {
		en.setSqlQueryTerm(true, en.setLevel(null), Region.Operation.GreaterThan, 0);
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Region().setId(null), true);
		pages.setLink(0, "file/region/list.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "file/region_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Region en = new Region();
			en.setSqlQueryField(en.setId(null), en.setName(null), en.setAlias(null), en.setLevel(null), en.setRoute(null), en.setCode(null), en.setPost(null), en.setLongitude(null), en.setLatitude(null));
			List<Region> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Region data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("name", data.getName() + (!data.getName().equals(data.getAlias()) ? "（" + data.getAlias()+ "）" : ""));
					map.put("level", Legal.FILE_REGION_LEVEL.get(data.getLevel()));
					map.put("route", data.getRoute());
					map.put("code", data.getCode());
					map.put("post", data.getPost());
					map.put("longitude", data.getLongitude());
					map.put("latitude", data.getLatitude());
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
	@DailyPoint(refer = true)
	@RequestMapping(value = "down", method = RequestMethod.GET)
	public void down(HttpServletRequest request, HttpServletResponse response, String[] ids) throws Exception {
		Region en = new Region();
		List<String> fields = new ArrayList<String>(Arrays.asList(ids));
		boolean level = fields.contains(en.setLevel(null).FrameFieldName);
		if (!level) {
			fields.add(en.setLevel(null).FrameFieldName);
			ids = fields.toArray(new String[] {});
		}
		en.setLevel(1);
		en.setSqlQueryField(ids);
		en.setSqlLeafSize(50L);
		List<Region> datas = service.list(en);
		if (datas != null && datas.size() > 0) {
			List<RegionItem> cache = new ArrayList<RegionItem>();
			for (Region data : datas) {
				RegionItem root = new RegionItem();
				root.id = data.getId();
				root.name = data.getName();
				root.alias = data.getAlias();
				if (level) {
					root.level = data.getLevel();
				}
				root.route = data.getRoute();
				root.code = data.getCode();
				root.post = data.getPost();
				root.longitude = data.getLongitude();
				root.latitude = data.getLatitude();
				this.next(root, ids, level);
				cache.add(root);
			}
			ServletTool.getDown(request, response, JsonTool.write(cache).getBytes(), null, "行政区域.json");
		}
	}
	private void next(RegionItem root, String[] fields, boolean level) throws Exception {
		Region en = new Region();
		en.setParent(root.id);
		en.setSqlQueryField(fields);
		en.setSqlLeafSize(500L);
		List<Region> datas = service.list(en);
		if (datas != null && datas.size() > 0) {
			for (Region data : datas) {
				RegionItem item = new RegionItem();
				item.id = data.getId();
				item.name = data.getName();
				item.alias = data.getAlias();
				if (level) {
					item.level = data.getLevel();
				}
				item.route = data.getRoute();
				item.code = data.getCode();
				item.post = data.getPost();
				item.longitude = data.getLongitude();
				item.latitude = data.getLatitude();
				if (data.getLevel() < 3) {
					this.next(item, fields, level);
				}
				root.setItem(item);
			}
		}
	}
	public class RegionItem {
		public Integer id;
		public String name;
		public String alias;
		public Integer level;
		public String route;
		public String code;
		public String post;
		public BigDecimal longitude;
		public BigDecimal latitude;
		public List<RegionItem> items;
		public void setItem(RegionItem item) {
			if (items == null) {
				items = new ArrayList<RegionItem>();
			}
			items.add(item);
		}
	}
}