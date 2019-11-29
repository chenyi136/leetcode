package com.mc.portal.view;
import java.awt.AlphaComposite;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Power;
import com.mc.core.entity.auto.Bound;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Genre;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Project;
import com.mc.core.entity.auto.Table;
import com.mc.core.entity.auto.Work;
import com.mc.core.entity.site.Donate;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.GroupService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.service.auto.BoundService;
import com.mc.core.service.auto.FieldService;
import com.mc.core.service.auto.GenreService;
import com.mc.core.service.auto.InwardService;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.service.auto.ProjectService;
import com.mc.core.service.auto.TableService;
import com.mc.core.service.auto.WorkService;
import com.mc.core.service.site.DonateService;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.StartListener;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.tool.ServletTool;
import com.mc.portal.tool.html.First;
@Controller
@RequestMapping("/global/")
public class GlobalView extends Global implements ApplicationContextAware {
	private ApplicationContext context;
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private AccountService accountService;
	@Autowired
	private DonateService donateService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private PowerService powerService;
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}
	@RequestMapping(value = "captcha", method = RequestMethod.GET)
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String item = request.getParameter("item");
		String size = request.getParameter("size");
		String blur = request.getParameter("blur");
		int[] param = new int[] { 4, 28, 5, ONLINE_CAPTCHA_WORD.length(), 5 };
		if (item != null && !item.equals("")) {
			param[0] = Integer.parseInt(item);
			param[0] = param[0] < 1 ? 4 : (param[0] > 16 ? 16 : param[0]);
		}
		if (size != null && !size.equals("")) {
			param[1] = Integer.parseInt(size);
			param[1] = param[1] < 18 ? 28 : (param[1] > 48 ? 48 : param[1]);
		}
		if (blur != null && !blur.equals("")) {
			param[2] = Integer.parseInt(blur);
			param[2] = param[2] < 1 ? 5 : (param[2] > 10 ? 10 : param[2]);
		}
		
		Random task = new Random(System.currentTimeMillis());
		String data = "";
		for (int i = 0; i < param[0]; i++) {
			data += ONLINE_CAPTCHA_WORD.charAt(task.nextInt(param[3]));
		}
		
		BufferedImage img = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d1 = img.createGraphics();
		Font font = new Font("Arial", Font.BOLD, param[1]);
		Rectangle2D r2d = font.getStringBounds(data, g2d1.getFontRenderContext());
		img = new BufferedImage((int) (2 * param[4] + r2d.getWidth()), (int) (2 * param[4] + r2d.getHeight()), BufferedImage.TYPE_INT_RGB);
		g2d1 = (Graphics2D) img.getGraphics();
		g2d1.setFont(font);
		g2d1.setColor(Color.WHITE);
		g2d1.fillRect(0, 0, img.getWidth(), img.getHeight());
		g2d1.setTransform(AffineTransform.getRotateInstance(0));
		g2d1.setColor(new Color(64, 64, 64));
		g2d1.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.9f));
		g2d1.drawString(data, param[4] / 1, img.getHeight() - param[1] * param[4] / 15);
		g2d1.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.1f));
		g2d1.drawString(data, param[4] / 2, img.getHeight() - param[1] * param[4] / 14);
		g2d1.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f));
		g2d1.drawString(data, (int) (param[4] / 0.8), img.getHeight() - param[1] * param[4] / 18);
		g2d1.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.2f));
		g2d1.drawString(data, (int) (param[4] / 1.9), img.getHeight() - param[1] * param[4] / 17);
		
		BufferedImage pic = new BufferedImage(img.getWidth(), img.getHeight(), img.getType());
		Graphics2D g2d2 = (Graphics2D) pic.getGraphics();
		g2d2.drawImage(img, 0, 0, null);
		double seed = task.nextDouble() * 3 + 5;
		for (int i = 0; i < img.getWidth(); i++) {
			for (int j = 0; j < img.getHeight(); j++) {
				int x = (int) (i + param[2] * Math.cos(j / seed) / 2);
				int y = (int) (j + param[2] * Math.sin(i / (seed + 1)) / 2);
				img.setRGB(i, j, pic.getRGB(Math.abs(x % img.getWidth()), Math.abs(y % img.getHeight())));
			}
		}
		
		g2d1.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1.0f));
		g2d1.setTransform(AffineTransform.getRotateInstance(task.nextDouble() * 0.3 - 0.15));
		g2d1.setColor(new Color(128, 128, 128, 128));
		for (int i = -100; i < img.getWidth() + 100; i = i + task.nextInt(9) + 6) {
			g2d1.setStroke(new BasicStroke(1, BasicStroke.CAP_SQUARE, BasicStroke.CAP_SQUARE, 10.0f, new float[] { task.nextInt(10) + 2, task.nextInt(4) + 2 }, 0));
			g2d1.drawLine(i, -100, i, img.getHeight() + 100);
		}
		g2d1.setColor(new Color(188, 188, 128, 64));
		for (int i = -100; i < img.getHeight() + 100; i = i + task.nextInt(8) + 7) {
			g2d1.setStroke(new BasicStroke(1, BasicStroke.CAP_SQUARE, BasicStroke.CAP_SQUARE, 10.0f, new float[] { task.nextInt(10) + 2, task.nextInt(3) + 2 }, 0));
			g2d1.drawLine(-100, i, img.getWidth() + 100, i);
		}
		g2d1.dispose();
		
		ServletTool.setAttribute(request, KEY_SESSION_CAPTCHA, data);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/png");
		ImageIO.write(img, "png", response.getOutputStream());
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "donate", method = RequestMethod.POST)
	public JMapView donate(HttpServletRequest request, Double money, String contact) {
		JMapView res = new JMapView();
		try {
			if (money == null || money < 0.01 || contact == null || contact.equals("")) {
				res.setState(NO);
				return res;
			}
			
			Donate en = new Donate();
			en.setMoney(money);
			en.setOccur("-");
			en.setNick("-");
			en.setContact(contact);
			res.setState(donateService.save(en) ? "谢谢你的赞助" : NO);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@RequestMapping(value = "error")
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response, String code) {
		try {
			String referer = request.getHeader("Referer");
			if (referer != null) {
				if (referer.indexOf("movie/index.htm") != -1) {
					request.getRequestDispatcher("/_/my/i/movie.jpg").forward(request, response);
					return null;
				} else if (referer.indexOf("sexy/") != -1) {
					request.getRequestDispatcher("/_/my/i/sexy.jpg").forward(request, response);
					return null;
				}
			}
		} catch (Exception e) {
			return null;
		}
		int key = 0;
		String title;
		String state;
		try {
			if (code != null && !code.equals("")) {
				key = Integer.parseInt(code.toString());
			}
		} catch (Exception e) {
			key = 404;
		}
		switch (key) {
			case 400:
				title = "Syntactically Incorrect";
				state = "很抱歉！你拼写的URL的参数错误";
				break;
			case 403:
				title = "Access Barred";
				state = "很抱歉！你没有访问该资源的权限";
				break;
			case 404:
				title = "Page Not Found";
				state = "很抱歉！没有找到你访问的资源，可能是你拼写的URL错误或该资源已被移除";
				break;
			case 405:
				title = "Request Method Not Supported";
				state = "很抱歉！你请求的方式参数（Method）不支持";
				break;
			case 415:
				title = "Unsupported Media Type";
				state = "很抱歉！你请求中提交的实体并不是服务器中所支持的格式，因此请求被拒绝";
				break;
			case 500:
				title = "Internal Error";
				state = "很抱歉！你访问的服务器内部发生了未知的异常";
				break;
			default:
				title = "Unknown Error";
				state = "很抱歉！发生了未知尚未解决的异常";
				break;
		}
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "_/share/error");
		res.addObject("code", key);
		res.addObject("title", title);
		res.addObject("state", state);
		return res;
	}
	@RequestMapping(value = "part", method = RequestMethod.GET)
	public void part(HttpServletRequest request, HttpServletResponse response, String id, String code) throws Exception {
		if (Arrays.asList("copy", "head", "menu").contains(code)) {
			if (id == null || id.equals("")) {
				response.sendError(403);
				return;
			}
			File file = new File(CACHE + "share/" + id + "-" + code + ".html");
			if (file.exists() && file.isFile() && file.canRead()) {
				request.getRequestDispatcher("/data/cache/share/" + id + "-" + code + ".html").forward(request, response);
			} else {
				Account account = new Account();
				if (code.equals("head")) {
					account.setSqlQueryField(account.setUsername(null), account.setName(null), account.setPermit(null), account.setForbid(null), account.setFkGroup(null));
				} else if (code.equals("menu")) {
					account.setSqlQueryField(account.setPermit(null), account.setForbid(null), account.setFkGroup(null));
				} else if (code.equals("copy")) {
					account.setSqlQueryField(account.setConfig(null), account.setPermit(null), account.setForbid(null), account.setFkGroup(null));
				}
				account.setId(id);
				account = accountService.get(account);
				if (account == null) {
					response.sendError(404);
					return;
				}
				account.setId(id);
				String data = null;
				if (code.equals("head")) {
					data = head(request, id, !account.doIsEmpty(account.getName()) ? account.getName() : account.getUsername(), StartListener.power(powerService, groupService, account));
				} else if (code.equals("menu")) {
					data = menu(id, StartListener.power(StartListener.power(powerService, groupService, account), id, null));
				} else if (code.equals("copy")) {
					data = copy(request, account, StartListener.power(powerService, groupService, account));
				}
				super.out(response, data, null);
			}
			return;
		} else if (Arrays.asList("modal", "popup", "user").contains(code)) {
			File file = new File(CACHE + "share/" + code + ".html");
			if (file.exists() && file.canRead()) {
				request.getRequestDispatcher("/data/cache/share/" + code + ".html").forward(request, response);
			} else {
				String data = restTemplate.getForObject(ROOT + "jsp/_/" + code + ".jsp", String.class);
				FileTool.write(data.getBytes(), file);
				super.out(response, data, null);
			}
			return;
		}
		response.sendError(404);
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "template", method = RequestMethod.GET)
	public TemplateConfig.Metadata template(HttpServletRequest request, HttpServletResponse response,
		@RequestParam(value = KEY_JUMP_TOKEN, required = true) String session,
		@RequestParam(value = "KEY_JUMP_TABLES", required = false) Integer[] ids,
		@RequestParam(value = "KEY_JUMP_PROJECT", required = false) Integer id) throws Exception {
		int config = -1;
		Work work = new Work();
		try {
			String[] temp;
			if (session == null || (temp = session.split("\\.")).length != 2) {
				response.sendError(403);
				return null;
			}
			
			config = Integer.parseInt(temp[0]);
			work.setId(config);
			work.setSqlQueryField(work.setConfig(null), work.setKeyt(null));
			work = context.getBean(WorkService.class).get(work);
			if (work == null || CryptoTool.AES.decode(temp[1], work.getKeyt()) == null) {
				response.sendError(403);
				return null;
			}
		} catch (Exception e) {
			response.sendError(403);
			return null;
		}
		
		TableService tableService = context.getBean(TableService.class);
		List<Integer> keys = new ArrayList<Integer>();
		if (ids != null && ids.length > 0) {
			Table table = new Table();
			table.setFkWork(config);
			table.setSqlQueryField(table.setId(null));
			table.setSqlQueryIn(true, table.setId(null), true, ids);
			table.setSqlLeafSize(new Long(ids.length));
			List<Table> datas = tableService.list(table);
			if (datas != null && datas.size() > 0) {
				for (Table data : datas) {
					if (!keys.contains(data.getId())) {
						keys.add(data.getId());
					}
				}
			}
		}
		
		if (id != null && id > 0) {
			Project project = new Project();
			project.setId(id);
			project.setSqlQueryField(project.setEntry(null), project.setFkWork(null));
			project = context.getBean(ProjectService.class).get(project);
			if (project != null && project.getFkWork() == config) {
				Integer[] entrys = JsonTool.read(project.getEntry(), Integer[].class);
				if (entrys != null && entrys.length > 0) {
					for (Integer entry : entrys) {
						if (!keys.contains(entry)) {
							keys.add(entry);
						}
					}
				}
			}
		}
		
		if (keys.size() < 1) {
			response.sendError(403);
			return null;
		}
		
		TemplateConfig.Metadata res = new TemplateConfig.Metadata();
		res.CONFIG = JsonTool.read(work.getConfig(), TemplateConfig.Context.class);
		res.MODULE = com.mc.portal.view.auto.SuperView.getModule(context.getBean(ModuleService.class), id, new Module().setClazz(null));
		List<Genre> datas = com.mc.portal.view.auto.SuperView.getGenre(context.getBean(GenreService.class), config);
		for (Genre data : datas) {
			res.GENRE.put(data.getName(), new String[] { data.getClazz(), data.getMapper(), data.getFrame(), data.getFixed().toString(), data.getLength().toString() });
		}
		res.INWARD = com.mc.portal.view.auto.SuperView.getInward(context.getBean(InwardService.class), id, false);
		
		for (Integer key : keys) {
			Table table = new Table();
			table.setId(key);
			table.setSqlQueryField(table.setName(null), table.setClazz(null), table.setFrame(null), table.setGrow(null), table.setCode(null));
			table = tableService.get(table);
			if (table == null) {
				continue;
			}
			
			Field field = new Field();
			field.setFkTable(key);
			field.setFkWork(config);
			field.setSqlQueryField(field.setId(null), field.setName(null), field.setClazz(null), field.setFrame(null), field.setType(null), field.setRely(null), field.setEmpty(null), field.setLength(null), field.setTacit(null), field.setNote(null), field.setMajor(null), field.setFkInward(null));
			field.setSqlQueryOrder(field.setQueue(null), true);
			field.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Field> fields = context.getBean(FieldService.class).list(field);
			if (fields == null || fields.size() < 1) {
				continue;
			}
			
			table.setId(key);
			res.TABLE.add(table);
			res.FIELD.put(key, fields);
			Bound bound = new Bound();
			bound.setFkTableHost(key);
			bound.setFkWork(config);
			bound.setSqlQueryField(bound.setType(null), bound.setFieldHost(null), bound.setFieldObey(null), bound.setFkTableObey(null));
			bound.setSqlLeafSize(LEAF_MAX_SIZE);
			List<Bound> bounds = context.getBean(BoundService.class).list(bound);
			if (bounds != null && bounds.size() > 0) {
				res.BOUND.put(key, bounds);
			}
		}
		return res;
	}
	@DailyPoint(refer = true)
	@ResponseBody
	@RequestMapping(value = "inward", method = RequestMethod.GET)
	public void inward(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = KEY_JUMP_TOKEN, required = true) String session) throws Exception {
		int config = -1;
		Work work = new Work();
		try {
			String[] temp;
			if (session == null || (temp = session.split("\\.")).length != 2) {
				response.sendError(403);
				return;
			}
			
			config = Integer.parseInt(temp[0]);
			work.setId(config);
			work.setSqlQueryField(work.setConfig(null), work.setKeyt(null));
			work = context.getBean(WorkService.class).get(work);
			if (work == null || CryptoTool.AES.decode(temp[1], work.getKeyt()) == null) {
				response.sendError(403);
				return;
			}
		} catch (Exception e) {
			response.sendError(403);
			return;
		}
		ServletTool.getDown(request, response, com.mc.portal.view.auto.SuperView.getInward(com.mc.portal.view.auto.SuperView.getInward(context.getBean(InwardService.class), config, true)).getBytes(), null, "Legal.java");
	}
	public static String head(HttpServletRequest request, String id, String title, Map<String, Power> powers) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("<header class=\"am-topbar am-topbar-inverse\" id=\"j_head\">");
		res.append("<div id=\"j_alert\"></div>");
		res.append("<div class=\"am-topbar-brand\">");
		res.append("<strong><a href=\"" + ROOT + "admin/index.htm\">" + request.getServletContext().getAttribute("SITE") + "</a></strong>");
		res.append("<small> v1.0</small>");
		res.append("</div>");
		String[][] keys = new String[][] {
			{ "portal_notify_index" },//收件箱
			{ "portal_event_index" },//待办事项
			{ "portal_share_help" },//帮助文档
			{ "portal_admin_profile", "portal_admin_param", "portal_apply_index", "portal_daily_index", "portal_feedback_index", "portal_config_index", "portal_nozzle_index", "portal_share_doc", "portal_share_icon", "portal_logout" }//个人资料,我的设置,我的应用,我的日志,意见反馈,开发参数,接口文档,前端开发,系统图标,退出系统
		};
		res.append("<div class=\"am-topbar-collapse\">");
		res.append("<ul class=\"am-topbar-nav am-topbar-right am-nav am-nav-pills\">");
		for (int i = 0; i < 3; i++) {
			Power power = powers.get(keys[i][0]);
			if (power != null) {
				res.append("<li><a href=\"" + power.getRoute() + "\" class=\"" + power.getIcon() + "\"> " + power.getName() + (i == 0 ? " <b class=\"am-badge am-badge-warning\" id=\"j_notify\">0</b>" : "") + "</a></li>");
			}
		}
		StringBuffer next = new StringBuffer();
		for (String key : keys[3]) {
			Power power = powers.get(key);
			if (power != null) {
				next.append("<li><a href=\"" + power.getRoute() + "\" class=\"" + power.getIcon() + "\"> " + power.getName() + "</a></li>");
			}
		}
		if (next.length() < 1) {
			res.append("<li><a><i class=\"" + First.icon("user") + "\"></i> " + title + "</a></li>");
		} else {
			res.append("<li class=\"am-dropdown\" data-am-dropdown>");
			res.append("<a class=\"am-dropdown-toggle\" data-am-dropdown-toggle><i class=\"" + First.icon("user") + "\"></i> " + title + " <i class=\"" + First.icon("caret-down") + "\"></i></a>");
			res.append("<ul class=\"am-dropdown-content\">");
			res.append(next);
			res.append("</ul>");
			res.append("</li>");
		}
		res.append("<li><a class=\"" + First.icon("arrows-alt") + "\" id=\"j_screen\"></a></li>");
		res.append("</ul>");
		res.append("</div>");
		res.append("</header>");
		FileTool.write(res.toString(), new File(CACHE + "share/" + id + "-head.html"), "UTF-8");
		return res.toString();
	}
	public static String menu(String id, Map<String, PowerItem> items) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("<div id=\"j_menu\">");
		res.append("<ul class=\"am-list\">");
		res.append("<li><form action=\"search/index.htm\" id=\"j_deep\"><input type=\"text\" placeholder=\"快速搜索内容\" name=\"key\"></form></li>");
		for (PowerItem item : items.values()) {
			List<PowerItem> next = item.next;
			if (next == null || next.size() < 1) {
				res.append("<li><a href=\"" + item.url + "\"><i class=\"" + item.icon + "\"> " + item.name + "</i></a></li>");
			} else {
				res.append("<li>");
				res.append("<a href=\"" + item.url + "\" data-am-collapse=\"{target:'#k_" + item.id + "'}\">");
				res.append("<i class=\"" + item.icon + "\"> " + item.name + "</i>");
				res.append("<i class=\"am-margin-right " + First.icon("angle-right") + " am-fr\"></i>");
				res.append("</a>");
				res.append("<ul class=\"am-list am-collapse\" id=\"k_" + item.id + "\">");
				for (PowerItem temp : next) {
					res.append("<li><a href=\"" + temp.url + "\" class=\"" + temp.icon + "\"> " + temp.name + "</a></li>");
				}
				res.append("</ul>");
				res.append("</li>");
			}
		}
		res.append("</ul>");
		res.append("</div>");
		FileTool.write(res.toString(), new File(CACHE + "share/" + id + "-menu.html"), "UTF-8");
		return res.toString();
	}
	public static String copy(HttpServletRequest request, Account account, Map<String, Power> powers) throws Exception {
		OnlineInfo.Config config = JsonTool.read(account.getConfig(), OnlineInfo.Config.class);
		StringBuffer res = new StringBuffer();
		res.append("<footer>");
		res.append("<hr class=\"am-margin-vertical-xs\">");
		if (config.SHOW_BOTTOM_FEEDBACK) {
			res.append("<div class=\"am-input-group\">");
			res.append("<input type=\"text\" class=\"am-form-field\" maxlength=\"2000\" placeholder=\"请描述你遇到的问题或分享你的想法\" onkeydown=\"javascript:if(event.keyCode==13){JFeedback(this);}\">");
			res.append("<b class=\"am-input-group-btn\"><a class=\"am-btn am-btn-default " + First.icon("send-o") + "\" onclick=\"JFeedback($(this).closest('.am-input-group').find('input'));\"></a></b>");
			res.append("</div>");
		}
		res.append("<p class=\"am-margin-0 am-padding-left-xs\">© 2018 <a href=\"" + CLOUD + "about.htm\">" + request.getServletContext().getAttribute("SITE") + "</a>, Co.ltd.</p>");
		res.append("</footer>");
		if (powers.containsKey("portal_event_index")) {
			res.append("<div style=\"bottom:" + (powers.containsKey("portal_global_donate") ? 68 : 36) + "px;\" class=\"am-gotop am-gotop-fixed j_left\" onclick=\"JEvent('save')\"><i class=\"am-gotop-icon " + First.icon("plus") + "\"></i></div>");
		}
		if (powers.containsKey("portal_global_donate")) {
			res.append("<div style=\"bottom:36px;\" class=\"am-gotop am-gotop-fixed j_left\" onclick=\"JDonate(true)\"><i class=\"am-gotop-icon " + First.icon("dollar") + "\"></i></div>");
		}
		res.append("<div style=\"bottom:4px;\" class=\"am-gotop am-gotop-fixed j_left\" id=\"j_left\"><i class=\"am-gotop-icon " + First.icon("list") + "\"></i></div>");
		res.append("<div class=\"am-gotop am-gotop-fixed\" id=\"j_top\"><i class=\"am-gotop-icon " + First.icon("long-arrow-up") + "\"></i></div>");
		res.append("<script type=\"text/javascript\">");
		res.append("window.KEEY_LOCAL_ADDRESS=" + config.KEEY_LOCAL_ADDRESS + ";");
		res.append("window.KEY_JUMP_PAGING=\"" + KEY_JUMP_PAGING + "\";");
		res.append("window.JDBC_PRIMARY_FIELD=\"" + JDBC_PRIMARY_FIELD + "\";");
		res.append("window.LEAF_DEF_SIZE=" + config.LEAF_DEF_SIZE + ";");
		res.append("window.LEAF_MAX_SIZE=" + Math.min(LEAF_MAX_SIZE, config.LEAF_MAX_SIZE) + ";");
		res.append("window.LEAF_MOVE_SIZE=" + Math.min(Math.min(LEAF_MAX_SIZE, config.LEAF_MAX_SIZE), config.LEAF_MOVE_SIZE) + ";");
		res.append("window.SHOW_JUMP_PAGING=" + config.SHOW_JUMP_PAGING + ";");
		res.append("window.WEB_CONFIG_CLOUD=\"" + CLOUD + "\";");
		res.append("window.WEB_CONFIG_ROOT=\"" + ROOT + "\";");
		res.append("</script>");
		res.append("<script type=\"text/javascript\" src=\"_/js/jquery.min-2.2.3.js\"></script>");
		res.append("<script type=\"text/javascript\" src=\"_/js/amazeui.min-2.6.2.js\"></script>");
		res.append("<script type=\"text/javascript\" src=\"_/js/plugin/jedate/jedate.min-3.4.0.js\"></script>");
		res.append("<script type=\"text/javascript\" src=\"_/my/jshare.js\"></script>");
		FileTool.write(res.toString(), new File(CACHE + "share/" + account.getId() + "-copy.html"), "UTF-8");
		return res.toString();
	}
}