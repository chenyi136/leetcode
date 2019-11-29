package com.mc.portal.view.file;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.mc.core.entity.blog.Ticket;
import com.mc.core.entity.file.Lottery;
import com.mc.core.service.blog.TicketService;
import com.mc.core.service.file.LotteryService;
import com.mc.core.tool.FileTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/file/lottery/")
public class LotteryView extends SuperView<String, Lottery> {
	@Autowired
	private TicketService ticketService;
	@Autowired
	public LotteryView(LotteryService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Lottery en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, String id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Lottery en) throws Exception {
		return null;
	}
	public JMapView save(HttpServletRequest request, Lottery en) {
		return null;
	}
	@DailyPoint(service = LotteryService.class)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, @DailyPoint.Primary @RequestParam("ids[]") String[] ids) {
		JMapView res = new JMapView();
		try {
			if (ids == null || ids.length != 1 || ids[0] == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			Ticket en = new Ticket();
			en.setFkLottery(ids[0]);
			if (ticketService.count(en) > 0) {
				res.setState("被索引约束引用而无法删除");
				return res;
			}
			res.put("count", service.delete(ids[0]) ? 1 : 0);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	public Object list(HttpServletRequest request, PageBody pages, Lottery en) throws Exception {
		if (pages.getCustom() != null && pages.getCustom().size() > 0) {
			for (PageBody.PageBodyValue data : pages.getCustom()) {
				if (data.name.equals("year")) {
					en.setSqlQueryTerm(true, en.setId(null), Lottery.Operation.Like, "___" + data.value + "%");
				}
			}
		}
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PageBody pages = super.list(request, new Lottery().setId(null), false);
		pages.setLink(0, "file/lottery/list.htm");
		pages.setLink(1, "file/lottery/drop.htm");
		
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "file/lottery_list");
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Lottery en = new Lottery();
			en.setSqlQueryField(en.setId(null), en.setDigit1(null), en.setDigit2(null), en.setDigit3(null), en.setDigit4(null), en.setDigit5(null), en.setDigit6(null), en.setDigit7(null), en.setOdd1(null), en.setOdd2(null), en.setArea1(null), en.setArea2(null), en.setArea3(null), en.setOver1(null), en.setOver2(null), en.setOver3(null), en.setTotal1(null), en.setTotal2(null), en.setAvg1(null), en.setAvg2(null), en.setDiff1(null), en.setDiff2(null));
			List<Lottery> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Lottery data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("digit", "<u>" + (data.getDigit1() > 9 ? data.getDigit1() : "0" + data.getDigit1()) + "</u> <u>" + (data.getDigit2() > 9 ? data.getDigit2() : "0" + data.getDigit2()) + "</u> <u>" + (data.getDigit3() > 9 ? data.getDigit3() : "0" + data.getDigit3()) + "</u> <u>" + (data.getDigit4() > 9 ? data.getDigit4() : "0" + data.getDigit4()) + "</u> <u>" + (data.getDigit5() > 9 ? data.getDigit5() : "0" + data.getDigit5()) + "</u>" + (data.getId().startsWith("ssq") ? " <u>" + (data.getDigit6() > 9 ? data.getDigit6() : "0" + data.getDigit6()) + "</u>" : " <i>" + (data.getDigit6() > 9 ? data.getDigit6() : "0" + data.getDigit6()) + "</i>") + " <i>" + (data.getDigit7() > 9 ? data.getDigit7() : "0" + data.getDigit7()) + "</i>");
					map.put("odd", "<u>" + data.getOdd1() + "</u> " + data.getOdd2());
					map.put("area", "<u>" + data.getArea1() + " " + data.getArea2() + " " + data.getArea3() + "</u>");
					map.put("over", "<u>" + data.getOver1() + " " + data.getOver2() + " " + data.getOver3() + "</u>");
					map.put("total", "<u>" + data.getTotal1() + "</u> " + data.getTotal2());
					map.put("avg", "<u>" + data.getAvg1() + "</u> " + data.getAvg2());
					map.put("diff", "<u>" + data.getDiff1() + "</u> " + data.getDiff2());
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
	public JMapView verify(HttpServletRequest request, String year) {
		JMapView res = new JMapView();
		try {
			if (year == null || year.equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			
			StringBuffer state = new StringBuffer();
			Lottery en = new Lottery();
			en.setSqlQueryField(Lottery.Method.MAX.getField(en.setId(null)));
			en.setSqlQueryTerm(true, en.setId(null), Lottery.Operation.Like, "ssq" + year + "%");
			en.setSqlLeafSize(1L);
			List<Lottery> datas = service.list(en);
			if (datas != null && datas.size() > 0 && datas.get(0) != null) {
				Long total = Long.parseLong(datas.get(0).getId().substring(7), 10);
				Map<String, Boolean> map = new LinkedHashMap<String, Boolean>();
				for (long i = 1; i <= total; i++) {
					if (i < 10) {
						map.put("ssq" + year + "00" + i, true);
					} else if (i < 100) {
						map.put("ssq" + year + "0" + i, true);
					} else {
						map.put("ssq" + year + i, true);
					}
				}
				
				en.setSqlQueryField(en.setId(null));
				en.setSqlLeafSize(total);
				datas = service.list(en);
				if (datas != null && datas.size() > 0) {
					for (Lottery data : datas) {
						map.put(data.getId(), false);
					}
				}
				
				for (Map.Entry<String, Boolean> temp : map.entrySet()) {
					if (temp.getValue()) {
						state.append("、" + temp.getKey());
					}
				}
			}
			
			en = new Lottery();
			en.setSqlQueryField(Lottery.Method.MAX.getField(en.setId(null)));
			en.setSqlQueryTerm(true, en.setId(null), Lottery.Operation.Like, "dlt" + year + "%");
			en.setSqlLeafSize(1L);
			datas = service.list(en);
			if (datas != null && datas.size() > 0 && datas.get(0) != null) {
				Long total = Long.parseLong(datas.get(0).getId().substring(7), 10);
				Map<String, Boolean> map = new LinkedHashMap<String, Boolean>();
				for (long i = 1; i <= total; i++) {
					if (i < 10) {
						map.put("dlt" + year + "00" + i, true);
					} else if (i < 100) {
						map.put("dlt" + year + "0" + i, true);
					} else {
						map.put("dlt" + year + i, true);
					}
				}
				
				en.setSqlQueryField(en.setId(null));
				en.setSqlLeafSize(total);
				datas = service.list(en);
				if (datas != null && datas.size() > 0) {
					for (Lottery data : datas) {
						map.put(data.getId(), false);
					}
				}
				
				for (Map.Entry<String, Boolean> temp : map.entrySet()) {
					if (temp.getValue()) {
						state.append("、" + temp.getKey());
					}
				}
			}
			res.setState(state.length() > 0 ? "缺省期号：" + state.substring(1) : "检测彩票成功");
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
			List<String> lines;
			if (path == null || path.equals("") || (lines = FileTool.read(null, new File(path))) == null) {
				res.setState("请求参数非法");
				return res;
			}
			
			boolean type;
			if (path.indexOf("ssq") != -1) {
				type = true;
			} else if (path.indexOf("dlt") != -1) {
				type = false;
			} else {
				res.setState("请求参数非法");
				return res;
			}
			
			String prefix = type ? "ssq20" : "dlt20";
			Map<String, Lottery> datas = new HashMap<String, Lottery>();
			for (String line : lines) {
				String[] temp = line.split("：");
				Lottery data = new Lottery();
				data.setId(prefix + temp[0]);
				data.setDigit1(Integer.parseInt(temp[1].substring(0, 2), 10));
				data.setDigit2(Integer.parseInt(temp[1].substring(2, 4), 10));
				data.setDigit3(Integer.parseInt(temp[1].substring(4, 6), 10));
				data.setDigit4(Integer.parseInt(temp[1].substring(6, 8), 10));
				data.setDigit5(Integer.parseInt(temp[1].substring(8, 10), 10));
				data.setDigit6(Integer.parseInt(temp[1].substring(10, 12), 10));
				data.setDigit7(Integer.parseInt(temp[1].substring(12, 14), 10));
				this.lead(type, data);
				datas.put(data.getId(), data);
			}
			
			Lottery en = new Lottery();
			en.setSqlQueryIn(true, en.setId(null), true, datas.keySet().toArray(new String[] {}));
			if (service.count(en) > 0) {
				res.setState("彩票数据重复");
				return res;
			}
			res.setState(service.batch(new ArrayList<Lottery>(datas.values())) > 0 ? OK : "导入彩票成功");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	private void lead(boolean type, Lottery data) throws Exception {
		int[] digits = type ? new int[] { data.getDigit1(), data.getDigit2(), data.getDigit3(), data.getDigit4(), data.getDigit5(), data.getDigit6() } : new int[] { data.getDigit1(), data.getDigit2(), data.getDigit3(), data.getDigit4(), data.getDigit5() };
		if (!type && data.getDigit6().intValue() == data.getDigit7()) {
			throw new Exception("原始数据错误");
		}
		for (int i = 0; i < digits.length - 1; i++) {
			for (int j = i + 1; j < digits.length; j++) {
				if (digits[i] == digits[j]) {
					throw new Exception("原始数据错误");
				}
				if (digits[i] > digits[j]) {
					int temp = digits[i];
					digits[i] = digits[j];
					digits[j] = temp;
				}
			}
		}
		
		int[] area = new int[3];
		int[] over = new int[3];
		int total = 0;
		int odd = 0;
		for (int digit : digits) {
			if (digit <= 11) {
				area[0] += 1;
			} else if (digit >= 12 && digit <= 22) {
				area[1] += 1;
			} else if (digit >= 23) {
				area[2] += 1;
			}
			over[digit % 3] += 1;
			total += digit;
			if (digit % 2 == 1) {
				odd++;
			}
		}
		
		int[] entry = new int[] { data.getDigit1(), data.getDigit2(), data.getDigit3(), data.getDigit4(), data.getDigit5(), data.getDigit6(), data.getDigit7() };
		if (type) {
			data.setDigit1(digits[0]);
			data.setDigit2(digits[1]);
			data.setDigit3(digits[2]);
			data.setDigit4(digits[3]);
			data.setDigit5(digits[4]);
			data.setDigit6(digits[5]);
			data.setOdd1(odd);
			data.setOdd2(odd + (data.getDigit7() % 2 == 1 ? 1 : 0));
			data.setArea1(area[0]);
			data.setArea2(area[1]);
			data.setArea3(area[2]);
			data.setOver1(over[0]);
			data.setOver2(over[1]);
			data.setOver3(over[2]);
			data.setTotal1(total);
			data.setTotal2(total + data.getDigit7());
			data.setAvg1(data.getTotal1() / 6.0);
			data.setAvg2(data.getTotal2() / 7.0);
			data.setDiff1(this.lead(data.getAvg1(), digits));
			data.setDiff2(this.lead(data.getAvg2(), entry));
		} else {
			data.setDigit1(digits[0]);
			data.setDigit2(digits[1]);
			data.setDigit3(digits[2]);
			data.setDigit4(digits[3]);
			data.setDigit5(digits[4]);
			if (data.getDigit6() > data.getDigit7()) {
				int temp = data.getDigit6();
				data.setDigit6(data.getDigit7());
				data.setDigit7(temp);
			}
			data.setOdd1(odd);
			data.setOdd2(odd + (data.getDigit6() % 2 == 1 ? 1 : 0) + (data.getDigit7() % 2 == 1 ? 1 : 0));
			data.setArea1(area[0]);
			data.setArea2(area[1]);
			data.setArea3(area[2]);
			data.setOver1(over[0]);
			data.setOver2(over[1]);
			data.setOver3(over[2]);
			data.setTotal1(total);
			data.setTotal2(total + data.getDigit6() + data.getDigit7());
			data.setAvg1(data.getTotal1() / 5.0);
			data.setAvg2(data.getTotal2() / 7.0);
			data.setDiff1(this.lead(data.getAvg1(), digits));
			data.setDiff2(this.lead(data.getAvg2(), entry));
		}
	}
	private double lead(double avg, int[] digits) {
		double total = 0;
		for (int digit : digits) {
			total += Math.pow(avg - digit, 2);
		}
		return ((int) Math.sqrt(total * 10000 / digits.length)) / 100.0;
	}
}