package com.mc.portal.view.blog;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.crux.Legal;
import com.mc.core.entity.blog.Article;
import com.mc.core.service.blog.ArticleService;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import com.mc.portal.tool.ArticleTool;
@Controller
@RequestMapping("/blog/article/")
public class ArticleView extends SuperView<String, Article> {
	@Autowired
	public ArticleView(ArticleService service) {
		super(service);
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Article en) throws Exception {
		en.setSqlQueryField(en.setType(null), en.setTitle(null), en.setContent(null), en.setScreen(null), en.setSource(null), en.setPart(null), en.setCreated(null));
		return super.load(request, en.getId(), en, "blog/article_load");
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint(impact = true, param = "content")
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Article en) throws Exception {
		Map<String, String[]> image = new HashMap<String, String[]>();
		if (!en.doIsEmpty(en.getSource())) {
			en.setSource(en.getSource().replace("https://www.sohu.com/", "http://www.sohu.com/").replace("http://mp.weixin.qq.com/", "https://mp.weixin.qq.com/"));
		}
		if (en.getId() == null) {
			Map<String, String> part = new HashMap<String, String>();
			en.setId(UUID.randomUUID().toString().replace("-", ""));
			en.setTitle(en.getTitle().trim());
			en.setContent(ArticleTool.verify(en, image, part));
			en.setEntry("{}");
			en.setSuffix("-");
			if (image.size() > 0) {
				en.setImage(JsonTool.write(image));
				en.setSize(image.size());
			} else {
				en.setImage("{}");
				en.setSize(0);
				if (en.getFinish() == null) {
					en.setFinish(true);
				}
				en.setUpload(true);
			}
			en.setPart(JsonTool.write(part));
			return super.jump(request, "blog/article/list.htm", service.save(en) ? "创建文章成功" : "创建文章失败");
		} else {
			boolean focus = "true".equals(request.getParameter("focus"));
			Article article = new Article();
			if (focus) {
				article.setFinish(false);
			} else {
				article.setId(en.getId());
				article.setSqlQueryField(article.setFinish(null));
				article = service.get(article);
				if (article == null) {
					return super.jump(request, "blog/article/list.htm", "请求参数非法");
				}
			}
			
			if (!article.getFinish()) {
				article = new Article();
				article.setId(en.getId());
				article.setSqlQueryField(article.setEntry(null), article.setSize(null), article.setPart(null));
				article = service.get(article);
				if (article == null) {
					return super.jump(request, "blog/article/list.htm", "请求参数非法");
				}
				
				Map<String, String> part = JsonTool.read(article.getPart(), Map.class);
				en.setContent(ArticleTool.verify(en, image, part));
				en.setPart(JsonTool.write(part));
				Map<String, String> entry = JsonTool.read(article.getEntry(), Map.class);
				List<String> drop = new ArrayList<String>();
				for (Map.Entry<String, String> file : entry.entrySet()) {
					String key = file.getKey();
					String[] value = image.get(key);
					if (value == null) {
						drop.add(key);
					} else {
						value[1] = OK;
					}
				}
				if (drop.size() > 0) {
					for (String key : drop) {
						entry.remove(key);
					}
					en.setEntry(JsonTool.write(entry));
					en.setUpload(false);
				}
				for (Map.Entry<String, String[]> file : image.entrySet()) {
					if (!file.getValue()[1].equals(OK)) {
						en.setImage(JsonTool.write(image));
						en.setFinish(false);
						en.setUpload(false);
						break;
					}
				}
				if (image.size() != article.getSize()) {
					en.setSize(image.size());
					en.setUpload(false);
				}
			}
			en.setEdited(new Date());
			return super.jump(request, "blog/article/list.htm", service.update(en) ? "更新文章成功" : "更新文章失败");
		}
	}
	public JMapView save(HttpServletRequest request, Article en) {
		return null;
	}
	@DailyPoint
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Article en, @RequestParam("ids[]") String[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Article en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Article().setCreated(null), false);
		pages.setLink(0, "blog/article/list.htm");
		pages.setLink(1, "blog/article/drop.htm");
		pages.setLink(2, "blog/article/load.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/article_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Article en = new Article();
			en.setSqlQueryField(en.setId(null), en.setType(null), en.setTitle(null), en.setBulk(null), en.setScreen(null), en.setSource(null), en.setSize(null), en.setLength(null), en.setGood(null), en.setFinish(null), en.setUpload(null), en.setCreated(null), en.setEdited(null));
			List<Article> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Article data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("type", Legal.BLOG_ARTICLE_TYPE.get(data.getType()));
					map.put("title", data.getTitle());
					map.put("bulk", new String[] { data.getBulk() + "B", FileTool.volume(new Long(data.getBulk()), "-") });
					map.put("screen", data.getScreen());
					map.put("source", data.getSource());
					map.put("size", data.getSize());
					map.put("length", new String[] { data.getLength() + "B", FileTool.volume(new Long(data.getLength()), "-") });
					map.put("good", data.getGood());
					map.put("finish", data.getFinish());
					map.put("upload", data.getUpload());
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
	@DailyPoint(refer = true)
	@RequestMapping(value = "image", method = RequestMethod.GET)
	public ModelAndView image(HttpServletRequest request, String id) throws Exception {
		Article en = new Article();
		en.setId(id);
		en.setSqlQueryField(en.setTitle(null), en.setImage(null));
		if (id == null || id.equals("") || (en = service.get(en)) == null) {
			return super.jump(request, "blog/article/list.htm", "请求参数非法");
		}
		
		en.setId(id);
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/article_image");
		res.addObject("pages", en);
		return res;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint
	@RequestMapping(value = "image", method = RequestMethod.POST)
	public ModelAndView image(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Article en = new Article();
		en.setId(id);
		en.setSqlQueryField(en.setImage(null), en.setEntry(null), en.setSuffix(null));
		if (id == null || id.equals("") || (en = service.get(en)) == null) {
			return super.jump(request, "blog/article/list.htm", "请求参数非法");
		}
		
		Map<String, List<String>> image = JsonTool.read(en.getImage(), Map.class);
		Map<String, String> entry = JsonTool.read(en.getEntry(), Map.class);
		String suffix = en.getSuffix();
		MultipartHttpServletRequest handler = (MultipartHttpServletRequest) request;
		String[] keys = request.getParameterValues("key");
		if (keys != null && keys.length > 0) {
			for (String key : keys) {
				List<String> value = image.get(key);
				MultipartFile doc;
				if (value == null || (doc = handler.getFile(key)) == null || doc.getSize() < 1) {
					continue;
				}
				String temp = FileTool.suffix(doc.getOriginalFilename())[1].replace("jpeg", "jpg");
				if (suffix.equals("-")) {
					suffix = temp;
				}
				if (!temp.equals(suffix)) {
					continue;
				}
				value.set(1, OK);
				entry.put(key, Base64.encodeBase64String(doc.getBytes()));
			}
		}
		
		boolean finish = true;
		for (Map.Entry<String, List<String>> data : image.entrySet()) {
			if (!data.getValue().get(1).equals(OK)) {
				finish = false;
				break;
			}
		}
		en = new Article();
		en.setId(id);
		en.setImage(JsonTool.write(image));
		en.setEntry(JsonTool.write(entry));
		en.setSuffix(suffix);
		en.setFinish(finish);
		return super.jump(request, "blog/article/list.htm", service.update(en) ? "上传图片成功" : "上传图片失败");
	}
}