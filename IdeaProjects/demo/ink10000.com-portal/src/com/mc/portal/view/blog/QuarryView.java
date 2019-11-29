package com.mc.portal.view.blog;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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
import com.mc.core.entity.blog.Quarry;
import com.mc.core.service.blog.QuarryService;
import com.mc.core.tool.JsonTool;
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
import jxl.Sheet;
import jxl.Workbook;
@Controller
@RequestMapping("/blog/quarry/")
public class QuarryView extends SuperView<String, Quarry> {
	public static final Map<String, String> FIELD;
	static {
		Quarry en = new Quarry();
		FIELD = new LinkedHashMap<String,String>();
		FIELD.put(en.setId(null).ClazzFieldName, "主键");
		FIELD.put(en.setFwsj(null).ClazzFieldName, "访问时间");
		FIELD.put(en.setLydq(null).ClazzFieldName, "来源地区(地域)");
		FIELD.put(en.setLyfs(null).ClazzFieldName, "来源方式(来源)");
		FIELD.put(en.setRkym(null).ClazzFieldName, "入口页面");
		FIELD.put(en.setSscy(null).ClazzFieldName, "搜索词语(搜索词)");
		FIELD.put(en.setFwdz(null).ClazzFieldName, "访问地址(访问IP)");
		FIELD.put(en.setFwbs(null).ClazzFieldName, "访问标识(访客标识码)");
		FIELD.put(en.setFwsc(null).ClazzFieldName, "访问时长");
		FIELD.put(en.setFwys(null).ClazzFieldName, "访问页数");
		FIELD.put(en.setZhtl(null).ClazzFieldName, "最后停留(最后停留在)");
		FIELD.put(en.setScfw(null).ClazzFieldName, "上次访问(上一次访问时间)");
		FIELD.put(en.setFwlx(null).ClazzFieldName, "访问类型");
		FIELD.put(en.setFwpc(null).ClazzFieldName, "访问频次");
		FIELD.put(en.setCzxt(null).ClazzFieldName, "操作系统");
		FIELD.put(en.setWlgs(null).ClazzFieldName, "网络供商(网络服务商)");
		FIELD.put(en.setLlqm(null).ClazzFieldName, "浏览器名(浏览器)");
		FIELD.put(en.setYyhj(null).ClazzFieldName, "语言环境");
		FIELD.put(en.setPmcc(null).ClazzFieldName, "屏幕尺寸(屏幕分辨率)");
		FIELD.put(en.setPmys(null).ClazzFieldName, "屏幕颜色");
		FIELD.put(en.setHdbb(null).ClazzFieldName, "幻灯版本(Flash版本)");
		FIELD.put(en.setHczc(null).ClazzFieldName, "缓存支持(是否支持Cookie)");
		FIELD.put(en.setBczc(null).ClazzFieldName, "编程支持(是否支持JAVA)");
		FIELD.put(en.setDksj(null).ClazzFieldName, "打开时间");
		FIELD.put(en.setTlsc(null).ClazzFieldName, "停留时长");
		FIELD.put(en.setYmdz(null).ClazzFieldName, "页面地址");
	}
	@Autowired
	public QuarryView(QuarryService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Quarry en) throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	@DailyPoint
	@ResponseBody
	@RequestMapping(value="load",method=RequestMethod.POST)
	public JMapView load(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			Quarry en;
			if (id == null || id.equals("") || (en = service.load(id)) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Map<String,String> map = JsonTool.read(JsonTool.write(en), Map.class);
			List<String[]> data = new ArrayList<String[]>();
			for (Map.Entry<String, String> title : FIELD.entrySet()) {
				String value = map.get(title.getKey());
				data.add(new String[] { title.getValue(), !en.doIsEmpty(value) ? value : "" });
			}
			res.put("data", data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Quarry en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Quarry en) {
		return null;
	}
	@DailyPoint(service = QuarryService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Quarry en, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Quarry en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Quarry().setDksj(null), false);
		pages.setLink(0, "blog/quarry/list.htm");
		pages.setLink(1, "blog/quarry/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/quarry_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Quarry en = new Quarry();
			en.setSqlQueryField(en.setId(null), en.setFwsj(null), en.setLydq(null), en.setRkym(null), en.setFwdz(null), en.setFwsc(null), en.setFwys(null), en.setDksj(null), en.setTlsc(null), en.setYmdz(null));
			List<Quarry> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Quarry data : datas){
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("fwsj", !data.doIsEmpty(data.getFwsj()) ? data.getFwsj() : "-");
					map.put("lydq", !data.doIsEmpty(data.getLydq()) ? data.getLydq() : "-");
					map.put("rkym", data.getRkym());
					map.put("fwdz", !data.doIsEmpty(data.getFwdz()) ? data.getFwdz() : "-");
					map.put("fwsc", !data.doIsEmpty(data.getFwsc()) ? data.getFwsc() : "-");
					map.put("fwys", !data.doIsEmpty(data.getFwys()) ? data.getFwys() : "-");
					map.put("dksj", !data.doIsEmpty(data.getDksj()) ? data.getDksj() : "-");
					map.put("tlsc", !data.doIsEmpty(data.getDksj()) ? data.getTlsc() : "-");
					map.put("ymdz", data.getYmdz());
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
	@RequestMapping(value="lead",method=RequestMethod.POST)
	public JMapView lead(HttpServletRequest request, HttpServletResponse response, String path) {
		JMapView res = new JMapView();
		try {
			File file = new File(path);
			if (!file.exists() || !file.isFile() || !file.canRead()){
				res.setState("请求参数非法");
				return res;
			}
			
			String[] keys = FIELD.keySet().toArray(new String[] {});
			Workbook book = Workbook.getWorkbook(file);
			Sheet sheet = book.getSheet(0);
			int[] total = new int[] { sheet.getRows(), 0 };
			StringBuffer message = new StringBuffer();
			List<Quarry> datas = new ArrayList<Quarry>();
			for (int j = 1; j < total[0]; j++) {
				Map<String, String> map = new HashMap<String, String>();
				for (int i = 0; i < keys.length; i++) {
					String value = sheet.getCell(i, j).getContents();
					if (value == null || value.equals("")) {
						if (i == 0) {
							break;
						}
						continue;
					} else {
						map.put(keys[i], i != 0 ? value : UUID.randomUUID().toString().replace("-", ""));
					}
				}
				
				if (map.size() > 0) {
					Quarry data = JsonTool.read(JsonTool.write(map), Quarry.class);
					String[] temp = this.time(data.getFwsj(), data.getScfw(), data.getDksj());
					if (temp[2] == null) {
						message.append("<br>第" + j + "行时间格式错误");
						continue;
					}
					data.doFieldValue(data.setFwsj(null).ClazzFieldName, temp[0]);
					data.doFieldValue(data.setScfw(null).ClazzFieldName, temp[1]);
					data.setDksj(temp[2]);
					temp = this.verify(data.getLyfs(), data.getRkym(), data.getZhtl(), data.getYmdz());
					if (temp[3] == null) {
						message.append("<br>第" + j + "行网址格式错误");
						continue;
					}
					
					data.doFieldValue(data.setLyfs(null).ClazzFieldName, temp[0]);
					data.doFieldValue(data.setRkym(null).ClazzFieldName, temp[1]);
					data.doFieldValue(data.setZhtl(null).ClazzFieldName, temp[2]);
					data.setYmdz(temp[3]);
					data.doFieldValue(data.setSscy(null).ClazzFieldName, data.getSscy() == null || data.getSscy().equals("--") ? null : data.getSscy());
					datas.add(data);
				}
				
				if (datas.size() % 100 == 0){
					total[1] += service.batch(datas);
					datas = new ArrayList<Quarry>();
				}
			}
			total[1] += service.batch(datas);
			book.close();
			res.setState("导入了" + total[1] + "条记录！" + (message.length() > 0 ? "<br>" + message.toString() : ""));
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private boolean time(String data) {
		if (data == null || data.equals("")) {
			return false;
		}
		char[] temp = data.toCharArray();
		for (char tmp : temp) {
			if (tmp >= 0x4E00 && tmp <= 0x9FBB) {
				return true;
			}
		}
		return false;
	}
	private String[] time(String... datas) throws Exception {
		String[] res = new String[datas.length];
		for (int i = 0; i < res.length; i++) {
			String data = datas[i];
			if (data != null && data.indexOf("/") != -1 && !this.time(data)){
				res[i] = TimeTool.getTime(TimeTool.getTime(data, "M/d/yy H:mm"), "yyyy-MM-dd HH:mm");
			}
		}
		return res;
	}
	private String[] verify(String... datas) {
		String[] res = new String[datas.length];
		for (int i = 0; i < res.length; i++) {
			String data = datas[i];
			if (data == null || data.equals("直接访问") || data.indexOf("//localhost") != -1 || data.indexOf("//127.0.0.1") != -1 || data.indexOf("//192.168.") != -1 || data.indexOf("//zhannei.baidu.com") != -1) {
				continue;
			}
			data = data.replace("//ink10000.com", "//www.ink10000.com");
			res[i] = data.equals("http://www.ink10000.com") ? "http://www.ink10000.com/" : data;
		}
		return res;
	}
}