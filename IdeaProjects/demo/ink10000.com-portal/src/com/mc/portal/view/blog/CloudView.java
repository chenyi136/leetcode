package com.mc.portal.view.blog;
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
import com.mc.core.entity.blog.Cloud;
import com.mc.core.service.blog.CloudService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/blog/cloud/")
public class CloudView extends SuperView<String, Cloud> {
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	public CloudView(CloudService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Cloud en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.POST)
	public JMapView load(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			Cloud en = new Cloud();
			en.setId(id);
			en.setSqlQueryField(en.setEmail(null), en.setLink(null), en.setTitle(null), en.setJump(null), en.setLength(null), en.setForbid(null));
			if (id == null || id.equals("") || (en = service.get(en)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("email", en.getEmail());
			data.put("link", !en.getLink().startsWith("-") ? en.getLink() : null);
			data.put("title", en.getTitle());
			data.put("jump", en.getJump());
			data.put("length", en.getLength());
			data.put("forbid", en.getForbid() ? 1 : 0);
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Cloud en) throws Exception {
		return null;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Cloud en) {
		JMapView res = new JMapView();
		try {
			if (en.getLink().indexOf("pan.baidu.com") == -1 && en.getLink().indexOf("javascript:") == -1) {
				res.setState("分享链接地址格式非法");
				return res;
			}
			Cloud temp = new Cloud();
			temp.setLink(en.getLink());
			temp.setSqlQueryTerm(true, temp.setId(null), Cloud.Operation.NotEqualTo, en.getId());
			if (service.count(temp) > 0) {
				res.setState("该云盘分享已存在");
				return res;
			}
			en.setId(en.getId().replace("\\", "/"));
			if (!en.getId().startsWith("/")) {
				res.setState("主键必须以/开头");
				return res;
			}
			
			if (en.getEmail().equals("FORBID")) {
				en.setCode("");
				en.setLink("javascript:void(" + System.currentTimeMillis() + ");");
			}
			if (en.getCode().equals("-")) {
				en.doFieldValue(en.setCode(null).ClazzFieldName, null);
			}
			temp = new Cloud();
			temp.setId(en.getId());
			res.setState(service.count(temp) < 1 ? (service.save(en) ? OK : "创建云盘分享失败") : (service.update(en) ? OK : "更新云盘分享失败"));
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Cloud en, @RequestParam("ids[]") String[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Cloud en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Cloud().setId(null), false);
		pages.setLink(0, "blog/cloud/list.htm");
		pages.setLink(1, "blog/cloud/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/cloud_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Cloud en = new Cloud();
			en.setSqlQueryField(en.setId(null), en.setEmail(null), en.setLink(null), en.setCode(null), en.setTitle(null), en.setJump(null), en.setLength(null), en.setForbid(null), en.setCreated(null));
			List<Cloud> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				boolean power = ServletTool.getOnline(request).power.indexOf("blog/sexy/drop.htm") != -1;
				for (Cloud data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("email", data.getEmail());
					map.put("link", data.getLink());
					map.put("code", !data.doIsEmpty(data.getCode()) ? (power ? data.getCode() : "*") : "-");
					map.put("title", !data.doIsEmpty(data.getTitle()) ? data.getTitle() : "-");
					map.put("jump", data.getJump());
					map.put("length", new String[] { data.getLength() + "B", FileTool.volume(data.getLength()) });
					map.put("forbid", data.getForbid());
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
	@RequestMapping(value = "verify", method = RequestMethod.POST)
	public JMapView verify(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			pages.setSize(LEAF_MAX_SIZE);
			Cloud en = new Cloud();
			en.setForbid(false);
			en.setSqlQueryField(en.setId(null), en.setEmail(null), en.setLink(null));
			List<Cloud> datas = super.list(request, en, pages);
			int count = 0;
			if (datas.size() > 0) {
				for (Cloud data : datas) {
					if (!data.getEmail().equals("FORBID")) {
						String body = new String(restTemplate.getForObject(data.getLink(), byte[].class), "UTF-8");
						if (body.indexOf("给您加密分享了文件") == -1) {
							Cloud temp = new Cloud();
							temp.setId(data.getId());
							temp.setForbid(true);
							if (service.update(temp)) {
								count++;
							}
						}
						Thread.sleep(System.currentTimeMillis() % 2000 + 1000);
					}
				}
			}
			res.setState(count > 0 ? OK : "云盘检测成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}