package com.ziniu;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.DispatcherServlet;
import com.ziniu.crux.Global;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Spirit;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.service.core.MediaService;
import com.ziniu.service.core.SpiritService;
import com.ziniu.template.HyperCrawler;
import com.ziniu.tool.JsonTool;
import com.ziniu.tool.ServletTool;
@Component
public class StartListener extends DispatcherServlet {
	private static final long serialVersionUID = System.identityHashCode(StartListener.class);
	public void setApplicationContext(ApplicationContext context) {
		try {
			super.setApplicationContext(context);
			SpiritService service = context.getBean(SpiritService.class);
			spirit(service, true);
			spirit(service, false);
			media(context.getBean(MediaService.class));
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
	}
	public void init(ServletConfig config) {
		try {
			super.init(config);
			ServletContext context = config.getServletContext();
			Global.CONTEXT = context.getContextPath() + "/";
			Global.ROOT = context.getInitParameter("ROOT");
			context.setAttribute("SITE", context.getInitParameter("SITE"));
			context.setAttribute("ROOT", Global.ROOT);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
	}
	protected void doDispatch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = ServletTool.getURI(request);
		logger.info("请求地址 = " + uri + ", 请求来源=" + request.getHeader("Referer"));
		if (!this.verify(request, response, uri)) {
			return;
		}
		super.doDispatch(request, response);
	}
	private boolean verify(HttpServletRequest request, HttpServletResponse response, String uri) throws Exception {
		if (Arrays.asList("logon.htm", "login.htm", "logout.htm", "jump.htm").contains(uri)) {
			return true;
		}
		OnlineInfo online = ServletTool.getOnline(request);
		if (online == null) {
			response.sendRedirect(Global.LOGIN);
			return false;
		}
		return true;
	}
	public static void spirit(SpiritService spiritService, boolean loss) throws Exception {
		(loss ? Global.HYPER_SPIRIT_NEGATIVE : Global.HYPER_SPIRIT_POSITIVE).clear();
		Spirit en = new Spirit();
		en.setLoss(loss);
		en.setSqlQueryField(en.setId(null), en.setName(null));
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		List<Spirit> datas = spiritService.list(en);
		if (datas == null || datas.size() < 1) {
			return;
		}
		if (loss) {
			for (Spirit data : datas) {
				Global.HYPER_SPIRIT_NEGATIVE.put(data.getId(), data.getName());
			}
		} else {
			for (Spirit data : datas) {
				Global.HYPER_SPIRIT_POSITIVE.put(data.getId(), data.getName());
			}
		}
	}
	public static void media(MediaService mediaService) throws Exception {
		Global.HYPER_MEDIA_ENGINE.clear();
		Media en = new Media();
		en.setSqlQueryField(en.setId(null), en.setEngine(null), en.setName(null), en.setAddress(null), en.setEncode(null), en.setStart(null), en.setGrads(null), en.setBlend(null), en.setNozzle(null), en.setQueue(null));
		en.setSqlQueryOrder(en.setQueue(null), true);
		en.setSqlLeafSize(Global.LEAF_MAX_SIZE);
		//update core_media SET 
		//engine = ?, 
		//name = ?, 
		//address = ?, 
		//encode = ?, 
		//start = ?, 
		//grads = ?, 
		//blend = ?, 
		//nozzle = ?, 
		//queue = ? 
		//where id = ? 
		List<Media> datas = mediaService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Media data : datas) {
				try {
					HyperCrawler crawler = (HyperCrawler) Class.forName(data.getNozzle()).newInstance();
					Media temp = crawler.info();
					if (!JsonTool.write(data).equals(JsonTool.write(temp))) {
						mediaService.update(temp);
						data = temp;
					}
				} catch (Exception e) {
					continue;
				}
				Global.HYPER_MEDIA_ENGINE.put(data.getId(), data);
			}
		}
	}
}