package com.ziniu.view;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ziniu.entity.auth.Account;
import com.ziniu.entity.core.Media;
import com.ziniu.entity.core.Summary;
import com.ziniu.pojo.OnlineInfo;
import com.ziniu.pojo.SummaryLine;
import com.ziniu.service.auth.AccountService;
import com.ziniu.service.core.SummaryService;
import com.ziniu.tool.JsonTool;
import com.ziniu.tool.ServletTool;
@Controller
@RequestMapping("/media/")
public class MediaView extends SuperView {
	@Autowired
	private AccountService accountService;
	@Autowired
	private SummaryService summaryService;
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OnlineInfo online = ServletTool.getOnline(request);
		Account account = accountService.load(online.id);
		if (account == null) {
			response.sendRedirect(LOGIN);
			return null;
		}
		
		if (account.getGrab() == null) {
			return this.index();
		}
		
		ModelAndView res = new ModelAndView("jsp/media");
		Map<String, String[]> table_engine_total = new LinkedHashMap<String, String[]>();
		for (Map.Entry<String, String> temp : HYPER_MEDIA_TYPE.entrySet()) {
			table_engine_total.put(temp.getKey(), new String[] { temp.getValue(), null });
		}
		Summary en = new Summary();
		en.setSqlQueryField(en.setTotal(null), en.setEngine(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "engine+%-total+000");
		en.setSqlQueryIn(true, en.setEngine(null), true, table_engine_total.keySet().toArray(new String[] {}));
		en.setSqlLeafSize(new Long(table_engine_total.size()));
		List<Summary> datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				String[] value = table_engine_total.get(data.getEngine());
				if (value != null) {
					value[1] = data.getTotal().toString();
				}
			}
		}
		
		Map<String, String[]> table_engine_total2 = new LinkedHashMap<String, String[]>();
		String query = null;
		for (Map.Entry<String, String[]> temp : table_engine_total.entrySet()) {
			if (temp.getValue()[1] != null) {
				table_engine_total2.put(temp.getKey(), temp.getValue());
				if (query == null) {
					query = temp.getKey();
				}
			}
		}
		if (table_engine_total2.size() < 1) {
			return this.index();
		}
		res.addObject("table_engine_total", table_engine_total2);
		
		SummaryLine line_engine_day = new SummaryLine();
		line_engine_day.xAxis = super.grab(account.getGrab());
		line_engine_day.series = new LinkedHashMap<String, SummaryLine.Item>();
		for (Map.Entry<String, String[]> temp : table_engine_total.entrySet()) {
			String field = "engine+" + temp.getKey() + "-day+00";
			en = new Summary();
			en.setEngine(temp.getKey());
			en.setFkAccount(online.id);
			en.setSqlQueryField(en.setField(null), en.setTotal(null));
			en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, field + "_");
			en.setSqlLeafSize(7L);
			datas = summaryService.list(en);
			if (datas != null && datas.size() > 0) {
				SummaryLine.Item value = new SummaryLine.Item(temp.getValue()[0], 7);
				for (Summary data : datas) {
					value.data[Integer.parseInt(data.getField().replace(field, ""))] = data.getTotal();
				}
				line_engine_day.series.put(temp.getValue()[0], value);
			}
		}
		res.addObject("line_engine_day", line_engine_day);
		
		Map<Integer, String[]> total = new LinkedHashMap<Integer, String[]>();
		String[] value = new String[13];
		value[0] = "全部";
		total.put(0, value);
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "engine+" + query + "-time+___");
		en.setSqlLeafSize(7L);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			String field = "engine+" + query + "-time+";
			for (Summary data : datas) {
				if (data.getField().equals(field + "001")) {
					value[1] = data.getTotal().toString();
				} else if (data.getField().equals(field + "007")) {
					value[2] = data.getTotal().toString();
				} else if (data.getField().equals(field + "015")) {
					value[3] = data.getTotal().toString();
				} else if (data.getField().equals(field + "030")) {
					value[4] = data.getTotal().toString();
				} else if (data.getField().equals(field + "090")) {
					value[5] = data.getTotal().toString();
				} else if (data.getField().equals(field + "180")) {
					value[6] = data.getTotal().toString();
				} else if (data.getField().equals(field + "360")) {
					value[7] = data.getTotal().toString();
				}
			}
		}
		en = new Summary();
		en.setField("engine+" + query + "-total+000");
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setTotal(null), en.setExtra(null));
		en.setSqlLeafSize(1L);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			en = datas.get(0);
			Long[] temp = JsonTool.read(en.getExtra(), Long[].class);
			for (int i = 0; i < 4; i++) {
				value[8 + i] = temp[i].toString();
			}
			value[12] = en.getTotal().toString();
		}
		
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setField(null), en.setTotal(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-time+___");
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (media == null) {
					continue;
				}
				value = total.get(media.getId());
				if (value == null) {
					value = new String[13];
					value[0] = media.getName();
					total.put(data.getFkMedia(), value);
				}
				
				String field = "media+" + data.getFkMedia() + "-time+";
				if (data.getField().equals(field + "001")) {
					value[1] = data.getTotal().toString();
				} else if (data.getField().equals(field + "007")) {
					value[2] = data.getTotal().toString();
				} else if (data.getField().equals(field + "015")) {
					value[3] = data.getTotal().toString();
				} else if (data.getField().equals(field + "030")) {
					value[4] = data.getTotal().toString();
				} else if (data.getField().equals(field + "090")) {
					value[5] = data.getTotal().toString();
				} else if (data.getField().equals(field + "180")) {
					value[6] = data.getTotal().toString();
				} else if (data.getField().equals(field + "360")) {
					value[7] = data.getTotal().toString();
				}
			}
		}
		en = new Summary();
		en.setEngine(query);
		en.setFkAccount(online.id);
		en.setSqlQueryField(en.setTotal(null), en.setExtra(null), en.setFkMedia(null));
		en.setSqlQueryTerm(true, en.setField(null), Summary.Operation.Like, "media+%-total+000");
		en.setSqlLeafSize(LEAF_MAX_SIZE);
		datas = summaryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Summary data : datas) {
				Media media = HYPER_MEDIA_ENGINE.get(data.getFkMedia());
				if (media == null) {
					continue;
				}
				value = total.get(media.getId());
				if (value == null) {
					value = new String[13];
					value[0] = media.getName();
					total.put(data.getFkMedia(), value);
				}
				
				Long[] temp = JsonTool.read(data.getExtra(), Long[].class);
				for (int i = 0; i < 4; i++) {
					value[8 + i] = temp[i].toString();
				}
				value[12] = data.getTotal().toString();
			}
		}
		List<String[]> table_media_total = new ArrayList<String[]>(total.values());
		Collections.sort(table_media_total, new Comparator<String[]>() {
			public int compare(String[] o1, String[] o2) {
				if (o1[0].equals("全部") || o2.equals("全部")) {
					return -1;
				}
				long num1 = Long.parseLong(o1[12]);
				long num2 = Long.parseLong(o2[12]);
				if (num1 > num2) {
					return -1;
				} else if (num1 < num2) {
					return 1;
				}
				return 0;
			}
		});
		res.addObject("table_media_total", table_media_total);
		return res;
	}
	private ModelAndView index() {
		ModelAndView res = new ModelAndView("jsp/media");
		res.addObject("table_engine_total", new HashMap<String, String[]>());
		SummaryLine line_engine_day = new SummaryLine();
		line_engine_day.xAxis = super.grab(new Date());
		line_engine_day.series = new HashMap<String, SummaryLine.Item>();
		res.addObject("line_engine_day", line_engine_day);
		res.addObject("table_media_total", new ArrayList<String[]>());
		return res;
	}
}