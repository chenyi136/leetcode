package com.mc.portal.view;
import java.io.File;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableHyperlink;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import com.mc.core.crux.Legal;
import com.mc.core.entity.SuperEntity;
import com.mc.core.entity.auth.Account;
import com.mc.core.entity.auth.Power;
import com.mc.core.entity.auto.Module;
import com.mc.core.entity.auto.Table;
import com.mc.core.entity.site.Daily;
import com.mc.core.service.SuperService;
import com.mc.core.service.auth.AccountService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.service.auto.ModuleService;
import com.mc.core.tool.CookieTool;
import com.mc.core.tool.CryptoTool;
import com.mc.core.tool.FileTool;
import com.mc.core.tool.JsonTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
import com.mc.portal.pojo.WorkConfig;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/share/")
public class ShareView extends Global implements ApplicationContextAware {
	private ApplicationContext context;
	@Autowired
	private AccountService accountService;
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "doc", method = RequestMethod.GET)
	public ModelAndView doc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("doc/index");
	}
	/**
	 * @param request 请求对象
	 * @param response 相应对象
	 * @param entry 实体类名
	 * @param query 导出动作
	 * @param rows 主键列表
	 * @param order 排序字段
	 * @param early 定制查询
	 * @param name 表格名称
	 * @param href 导出地址
	 * @param code 是否保护
	 * @param width 列的宽度
	 * @param clazz 列的属性
	 * @param frame 列的字段
	 * @param title 列的名称
	 * @param custom 列的处理，0-附加标题、1-字典数据、2-{key}跳转链接、3-外键引用、4-boolean（布尔处理）
	 * */
	@DailyPoint
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "excel", method = RequestMethod.POST)
	public void excel(HttpServletRequest request, HttpServletResponse response, String entry, Integer query, String rows, String order, String early, String name, String href, boolean code, String[] width, String[] clazz, String[] frame, String[] title, String[] custom) throws Exception {
		if (entry == null || entry.equals("")
			|| !Arrays.asList(0, 1, 2).contains(query)
			|| order == null || order.equals("")
			|| name == null || name.equals("")
			|| href == null || href.equals("")
			|| width == null || clazz == null || frame == null || title == null || custom == null
			|| width.length != frame.length || width.length != clazz.length || width.length != title.length || width.length != custom.length) {
			super.out(response, "请求参数非法", null);
			return;
		}
		String[] ids = null;
		if ((rows == null || rows.equals("") || (ids = rows.split(",")) == null || ids.length < 1) && query == 0) {
			super.out(response, "请选择导出到表格的行", null);
			return;
		}
		
		response.reset();
		response.setHeader("Content-disposition", "attachment;filename=" + (ServletTool.getAgent(request)[1].equals("firefox") ? new String(name.getBytes("UTF-8"), "ISO8859-1") : URLEncoder.encode(name, "UTF-8")) + ".xls");
		response.setContentType("application/msexcel");
		WritableWorkbook book = Workbook.createWorkbook(response.getOutputStream());
		WritableSheet sheet = book.createSheet(name, 0);
		sheet.getSettings().setProtected(code);
		sheet.getSettings().setPassword(CRYPTO_SECRET_WORD);
		WritableCellFormat format0 = new WritableCellFormat();
		format0.setFont(new WritableFont(WritableFont.createFont("宋体"), 10, WritableFont.BOLD, false));
		format0.setAlignment(Alignment.LEFT);
		int[] index = new int[] { 0, 0 };
		
		Map<String, String> keys = Collections.synchronizedMap(new LinkedHashMap<String, String>());
		List<String> field = new ArrayList<String>();
		for (int i = 0; i < width.length; i++) {
			Integer size;
			if (width[i] == null || width[i].equals("")
				|| (size = Integer.parseInt(width[i])) == null || size < 1
				|| clazz[i] == null || clazz[i].equals("")
				|| frame[i] == null || frame[i].equals("")
				|| title[i] == null || title[i].equals("")) {
				continue;
			}
			String temp = "".equals(custom[i]) ? null : custom[i];
			sheet.setColumnView(index[1], 10 * size);
			sheet.addCell(new Label(index[1]++, index[0], title[i] + (temp != null && temp.startsWith("0-") ? "(" + temp.substring(2) + ")" : ""), format0));
			keys.put(clazz[i], temp);
			field.add(frame[i]);
		}
		if (keys.size() < 1) {
			sheet.addCell(new Label(0, index[0], "请选择导出到表格的列", format0));
			book.write();
			book.close();
			return;
		}
		index[0]++;
		
		SuperEntity en = (SuperEntity) Class.forName(entry).newInstance();
		if (!this.excel(request, en, entry, early)) {
			sheet.mergeCells(0, index[0], keys.size(), index[0]);
			sheet.addCell(new Label(0, index[0], "非法操作", format0));
			book.write();
			book.close();
			return;
		}
		
		SuperService<?, SuperEntity> service = (SuperService<?, SuperEntity>) context.getBean(Class.forName(entry.replace(".entity.", ".service.") + "Service"));
		if (query == 0) {
			en.setSqlQueryIn(true, JDBC_PRIMARY_FIELD, true, ids);
		} else if (query == 1) {
			if (ids != null) {
				en.setSqlQueryIn(true, JDBC_PRIMARY_FIELD, false, ids);
			}
		}
		en.setSqlQueryField(field.toArray(new String[] {}));
		en.setSqlQueryOrder(order, true);
		en.setSqlLeafTotal(service.count(en));
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		if (en.getSqlLeafTotal() < 1L) {
			sheet.mergeCells(0, index[0], keys.size(), index[0]);
			sheet.addCell(new Label(0, index[0], "暂无数据", format0));
			book.write();
			book.close();
			return;
		}
		
		WritableCellFormat format1 = new WritableCellFormat();
		format1.setVerticalAlignment(VerticalAlignment.CENTRE);
		format1.setWrap(true);
		for (long i = 1; i <= en.getSqlLeafTabs(); i++) {
			en.setSqlLeafNow(i);
			List<SuperEntity> temp = service.list(en);
			if (temp != null && temp.size() > 0) {
				List<Map> datas = JsonTool.list(JsonTool.write(temp), Map.class);
				for (Map<String, Object> data : datas) {
					index[1] = 0;
					for (Entry<String, String> key : keys.entrySet()) {
						String more = key.getValue();
						Object value = data.get(key.getKey());
						if (more != null && value != null && !value.toString().equals("")) {
							if (more.startsWith("1-")) {
								value = Legal.get(more.substring(2), Object.class, Object.class).get(value);
							} else if (more.startsWith("2-")) {
								sheet.addHyperlink(new WritableHyperlink(index[1]++, index[0], new URL(more.substring(2).replace("{key}", value.toString()))));
								continue;
							} else if (more.startsWith("3-")) {
								value = this.excel(more.substring(2), value);
							} else if (more.startsWith("4-")) {
								value = Boolean.parseBoolean(value.toString()) ? "是" : "否";
							}
						}
						sheet.addCell(new Label(index[1]++, index[0], value != null ? value.toString() : "", format1));
					}
					index[0]++;
				}
			}
		}
		
		index[0] = index[0] + 1;
		WritableCellFormat format2 = new WritableCellFormat();
		format2.setAlignment(Alignment.RIGHT);
		sheet.addCell(new Label(0, index[0], "导出地址：", format2));
		sheet.mergeCells(1, index[0], keys.size() - 1, index[0]);
		sheet.addHyperlink(new WritableHyperlink(1, index[0], new URL(href)));
		book.write();
		book.close();
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "help", method = RequestMethod.GET)
	public ModelAndView help(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView(VIEW_PATH_PREFIX + "_/share/help");
	}
	@DailyPoint(refer = true)
	@RequestMapping(value = "icon", method = RequestMethod.GET)
	public ModelAndView icon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<String> icon = new ArrayList<String>();
		Power en = new Power();
		en.setSqlQueryField(en.setIcon(null));
		en.setSqlQueryTerm(true, en.setIcon(null), Power.Operation.NotEqualTo, "am-icon-circle-o");
		en.setSqlQueryGroup(en.setIcon(null));
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		List<Power> datas = context.getBean(PowerService.class).list(en);
		if (datas != null && datas.size() > 0) {
			for (Power data : datas) {
				icon.add(data.getIcon().replace("am-icon-", ""));
			}
		}
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "_/share/icon");
		res.addObject("icon", icon);
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "track", method = RequestMethod.POST)
	public JMapView track(HttpServletRequest request, HttpServletResponse response, String url) {
		JMapView res = new JMapView();
		try{
			if (url == null || url.equals("")) {
				CookieTool.drop(request, response, KEY_LOCAL_ADDRESS);
			} else {
				url = url.replace(ROOT, "");
				int index = url.indexOf("&" + KEY_JUMP_MESSAGE);
				if (index == -1) {
					index = url.indexOf("?" + KEY_JUMP_MESSAGE);
				}
				if (index != -1) {
					url = url.substring(0, index);
				}
				if (!url.equals("")) {
					CookieTool.set(response, KEY_LOCAL_ADDRESS, url, LOCAL_MAX_TIME);
				}
			}
			res.setState(OK);
		}catch(Exception e){
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public JMapView upload(HttpServletRequest request, HttpServletResponse response) {
		JMapView res = new JMapView();
		try {
			if (!new CommonsMultipartResolver(request.getSession().getServletContext()).isMultipart(request)) {
				res.setState("上传表单非法");
				return res;
			}
			
			String root = ServletTool.getPath(request, null, "/data/");
			MultipartHttpServletRequest handler = (MultipartHttpServletRequest) request;
			Iterator<String> it = handler.getFileNames();
			List<Map<String, String>> datas = new ArrayList<Map<String, String>>();
			while (it.hasNext()) {
				List<MultipartFile> docs = handler.getFiles(it.next());
				for (MultipartFile doc : docs) {
					datas.add(upload(root, doc));
				}
			}
			res.setDatas(datas);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@ResponseBody
	@RequestMapping(value = "user", method = RequestMethod.POST)
	public JMapView user(HttpServletRequest request, String name) {
		JMapView res = new JMapView();
		try {
			Account en = new Account();
			if (name != null && !name.equals("")) {
				en.setSqlQueryTerm(false, en.setUsername(null), Account.Operation.Like, "%" + name.replace("%", "\\%").replace("_", "\\_").replace("?", "\\?") + "%");
				en.setSqlQueryTerm(false, en.setName(null), Account.Operation.Like, "%" + name.replace("%", "\\%").replace("_", "\\_").replace("?", "\\?") + "%");
			}
			en.setSqlQueryField(en.setId(null), en.setUsername(null), en.setName(null));
			en.setSqlQueryOrder(en.setCreated(null), false);
			en.setSqlLeafSize(10L);
			List<Account> datas = accountService.list(en);
			if (datas != null && datas.size() > 0) {
				for (Account data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("username", data.getUsername());
					map.put("name", !data.doIsEmpty(data.getName()) ? data.getName() : "-");
					res.setDatas(map);
				}
				res.setState(OK);
			} else {
				res.setState("暂无数据");
			}
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private boolean excel(HttpServletRequest request, SuperEntity en, String clazz, String early) throws Exception {
		if (clazz.equals(Daily.class.getName())) {
			OnlineInfo online = ServletTool.getOnline(request);
			if (online == null) {
				return false;
			}
			en.setSqlQueryTerm(true, new Daily().setFkAccount(null), SuperEntity.Operation.EqualTo, online.id);
		} else if (clazz.equals(Table.class.getName())) {
			WorkConfig config = ServletTool.getAttribute(request, Global.KEY_SESSION_CONFIG, WorkConfig.class);
			if (config == null) {
				return false;
			}
			en.setSqlQueryTerm(true, new Table().setFkWork(null), SuperEntity.Operation.EqualTo, config.id);
		}
		return true;
	}
	private String excel(String key, Object value) {
		if (value == null || value.toString().equals("")) {
			return "";
		}
		if (key.equals(Module.class.getName())) {
			Module en = context.getBean(ModuleService.class).load(Integer.valueOf(value.toString()));
			if (en != null) {
				return en.getName();
			}
		}
		return "";
	}
	public static Map<String, String> upload(String root, MultipartFile doc) {
		Map<String, String> res = new HashMap<String, String>();
		try {
			if (doc == null || doc.isEmpty() || doc.getSize() < 1) {
				res.put(STATE, "文件对象为空");
				return res;
			}
			
			String name = doc.getOriginalFilename();
			res.put("name", name);
			res.put("size", String.valueOf(doc.getSize()));
			if (doc.getSize() > FILE_MAX_SIZE) {
				res.put(STATE, "文件体积过大");
				return res;
			}
			
			String ext = FileTool.suffix(name)[1];
			File source = new File(root, System.currentTimeMillis() + ext);
			((CommonsMultipartFile) doc).transferTo(source);
			
			CryptoTool.MD5.Result result = CryptoTool.MD5.encode(source, true);
			File target = new File(root, result.MD5.substring(0, 2) + "/" + result.MD5 + ext);
			if (!target.exists() || !target.isFile()) {
				File parent = target.getParentFile();
				if (!parent.exists() || !parent.isDirectory()) {
					if (!parent.mkdirs()) {
						throw new Exception("创建存储目录失败");
					}
				}
				source.renameTo(target);
			} else {
				source.delete();
			}
			
			res.put("id", upload(result.MD5, ext, name, result.Entry));
			res.put(STATE, OK);
		} catch (Exception e) {
			res.put(STATE, e.getMessage() != null ? e.getMessage() : "未知错误");
			e.printStackTrace();
		}
		return res;
	}
	public static String upload(String id, String ext, String name, byte[] data) throws Exception {
		//TODO 存储数据库
		return id + ext;
	}
}