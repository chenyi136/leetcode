package com.mc.portal.view.blog;
import java.util.Arrays;
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
import com.mc.core.tool.TimeTool;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.pojo.PageBody;
@Controller
@RequestMapping("/blog/ticket/")
public class TicketView extends SuperView<Integer, Ticket> {
	@Autowired
	private LotteryService lotteryService;
	@Autowired
	public TicketView(TicketService service) {
		super(service);
	}
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response, Ticket en) throws Exception {
		return null;
	}
	public JMapView load(HttpServletRequest request, Integer id) {
		return null;
	}
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response, Ticket en) throws Exception {
		return null;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, Ticket en) {
		JMapView res = new JMapView();
		try {
			Lottery lottery = new Lottery();
			lottery.setId(en.getFkLottery());
			lottery.setSqlQueryField(lottery.setDigit1(null), lottery.setDigit2(null), lottery.setDigit3(null), lottery.setDigit4(null), lottery.setDigit5(null), lottery.setDigit6(null), lottery.setDigit7(null));
			lottery = lotteryService.get(lottery);
			if (lottery == null) {
				res.setState("无法找到开奖数据");
				return res;
			}
			
			this.reckon(en.getFkLottery().startsWith("ssq"), lottery, en);
			res.setState(service.save(en) ? OK : "创建彩票失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(service = TicketService.class)
	@Override
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, Ticket en, @DailyPoint.Primary @RequestParam("ids[]") Integer[] ids) {
		return super.drop(request, en, ids);
	}
	public Object list(HttpServletRequest request, PageBody pages, Ticket en) throws Exception {
		return null;
	}
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> lotterys = new LinkedHashMap<String, String>();
		Lottery en = new Lottery();
		en.setSqlQueryField(en.setId(null));
		en.setSqlLeafSize(10L);
		en.setSqlQueryOrder(en.setId(null), false);
		en.setSqlQueryTerm(true, en.setId(null), Lottery.Operation.Like, "ssq%");
		List<Lottery> datas = lotteryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Lottery data : datas) {
				lotterys.put(data.getId(), "双色球第" + data.getId().substring(3) + "期");
			}
		}
		en = new Lottery();
		en.setSqlQueryField(en.setId(null));
		en.setSqlLeafSize(10L);
		en.setSqlQueryOrder(en.setId(null), false);
		en.setSqlQueryTerm(true, en.setId(null), Lottery.Operation.Like, "dlt%");
		datas = lotteryService.list(en);
		if (datas != null && datas.size() > 0) {
			for (Lottery data : datas) {
				lotterys.put(data.getId(), "大乐透第" + data.getId().substring(3) + "期");
			}
		}
		
		PageBody pages = super.list(request, new Ticket().setFkLottery(null), false);
		pages.setLink(0, "blog/ticket/list.htm");
		pages.setLink(1, "blog/ticket/drop.htm");
		ModelAndView res = new ModelAndView(VIEW_PATH_PREFIX + "blog/ticket_list");
		res.addObject("lotterys", lotterys);
		res.addObject("pages", pages);
		return res;
	}
	@DailyPoint(refer = true, forbid = true)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public JMapView list(HttpServletRequest request, @RequestBody PageBody pages) {
		JMapView res = new JMapView();
		try {
			Ticket en = new Ticket();
			en.setSqlQueryField(en.setId(null), en.setDigit1(null), en.setDigit2(null), en.setDigit3(null), en.setDigit4(null), en.setDigit5(null), en.setDigit6(null), en.setDigit7(null), en.setGuess1(null), en.setGuess2(null), en.setGuess3(null), en.setGuess4(null), en.setGuess5(null), en.setGuess6(null), en.setGuess7(null), en.setPrice(null), en.setPrize(null), en.setFkLottery(null), en.setCreated(null));
			List<Ticket> datas = super.list(request, en, pages);
			if (datas.size() > 0) {
				for (Ticket data : datas) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", data.getId());
					map.put("digit1", "<u>" + data.getDigit1() + "</u>");
					map.put("digit2", "<u>" + data.getDigit2() + "</u>");
					map.put("digit3", "<u>" + data.getDigit3() + "</u>");
					map.put("digit4", "<u>" + data.getDigit4() + "</u>");
					map.put("digit5", "<u>" + data.getDigit5() + "</u>");
					map.put("digit6", data.getFkLottery().startsWith("ssq") ? "<u>" + data.getDigit6() + "</u>" : "<i>" + data.getDigit6() + "</i>");
					map.put("digit7", "<i>" + data.getDigit7() + "</i>");
					map.put("guess1", data.getGuess1());
					map.put("guess2", data.getGuess2());
					map.put("guess3", data.getGuess3());
					map.put("guess4", data.getGuess4());
					map.put("guess5", data.getGuess5());
					map.put("guess6", data.getGuess6());
					map.put("guess7", data.getGuess7());
					map.put("price", data.getPrice());
					map.put("prize", data.getPrize());
					map.put("fk_lottery", data.getFkLottery());
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
	@RequestMapping(value = "lottery", method = RequestMethod.POST)
	public JMapView lottery(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			Lottery en = new Lottery();
			en.setId(id);
			en.setSqlQueryField(en.setDigit1(null), en.setDigit2(null), en.setDigit3(null), en.setDigit4(null), en.setDigit5(null), en.setDigit6(null), en.setDigit7(null));
			en = lotteryService.get(en);
			if (en == null) {
				res.setState("无法找到开奖数据");
				return res;
			}
			
			String[] data = new String[7];
			data[0] = "<u>" + en.getDigit1() + "</u>";
			data[1] = "<u>" + en.getDigit2() + "</u>";
			data[2] = "<u>" + en.getDigit3() + "</u>";
			data[3] = "<u>" + en.getDigit4() + "</u>";
			data[4] = "<u>" + en.getDigit5() + "</u>";
			data[5] = id.startsWith("ssq") ? "<u>" + en.getDigit6() + "</u>" : "<i>" + en.getDigit6() + "</i>";
			data[6] = "<i>" + en.getDigit7() + "</i>";
			res.setData(data);
			res.setState(OK);
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint
	@RequestMapping(value="collect",method=RequestMethod.POST)
	public void collect(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StringBuffer data = new StringBuffer();
		Lottery lottery = new Lottery();
		lottery.setSqlQueryField(lottery.setId(null));
		lottery.setSqlQueryTerm(true, lottery.setId(null), Lottery.Operation.Like, "ssq%");
		lottery.setSqlQueryOrder(lottery.setId(null), false);
		lottery.setSqlLeafSize(1L);
		data.append("双色球最新期号：" + lotteryService.list(lottery).get(0).getId().substring(3));
		
		lottery = new Lottery();
		lottery.setSqlQueryField(lottery.setId(null));
		lottery.setSqlQueryTerm(true, lottery.setId(null), Lottery.Operation.Like, "dlt%");
		lottery.setSqlQueryOrder(lottery.setId(null), false);
		lottery.setSqlLeafSize(1L);
		data.append("<br>大乐透最新期号：" + lotteryService.list(lottery).get(0).getId().substring(3));
		
		Ticket ticket = new Ticket();
		ticket.setSqlQueryField(ticket.setCreated(null));
		ticket.setSqlQueryOrder(ticket.setCreated(null), true);
		ticket.setSqlLeafSize(1L);
		data.append("<br>首购彩票日期：" + TimeTool.getTime(service.list(ticket).get(0).getCreated(), "yyyy年MM月dd日"));
		data.append("<br>购买彩票注数：" + service.count(new Ticket()) + "注");
		
		ticket = new Ticket();
		ticket.setSqlQueryField(Ticket.Method.SUM.getField(ticket.setPrice(null)));
		ticket.setSqlLeafSize(1L);
		data.append("<br>购买彩票费用：" + service.list(ticket).get(0).getPrice() + "元");
		
		ticket = new Ticket();
		ticket.setSqlQueryTerm(true, ticket.setPrize(null), Ticket.Operation.GreaterThan, 0);
		data.append("<br>彩票中奖注数：" + service.count(ticket) + "注");
		
		ticket = new Ticket();
		ticket.setSqlQueryField(Ticket.Method.SUM.getField(ticket.setPrize(null)));
		ticket.setSqlQueryTerm(true, ticket.setPrize(null), Ticket.Operation.GreaterThan, 0);
		ticket.setSqlLeafSize(1L);
		data.append("<br>彩票中奖金额：" + service.list(ticket).get(0).getPrize() + "元");
		super.out(response, data.toString(), null);
	}
	private void reckon(boolean type, Lottery lottery, Ticket ticket) throws Exception {
		int[] digits = type ? new int[] { ticket.getDigit1(), ticket.getDigit2(), ticket.getDigit3(), ticket.getDigit4(), ticket.getDigit5(), ticket.getDigit6() } : new int[] { ticket.getDigit1(), ticket.getDigit2(), ticket.getDigit3(), ticket.getDigit4(), ticket.getDigit5() };
		if (!type && ticket.getDigit6().intValue() == ticket.getDigit7()) {
			throw new Exception("彩票数据错误");
		}
		for (int i = 0; i < digits.length - 1; i++) {
			for (int j = i + 1; j < digits.length; j++) {
				if (digits[i] == digits[j]) {
					throw new Exception("彩票数据错误");
				}
				if (digits[i] > digits[j]) {
					int temp = digits[i];
					digits[i] = digits[j];
					digits[j] = temp;
				}
			}
		}
		List<Integer> rs;
		List<Integer> bs;
		if (type) {
			rs = Arrays.asList(lottery.getDigit1(), lottery.getDigit2(), lottery.getDigit3(), lottery.getDigit4(), lottery.getDigit5(), lottery.getDigit6());
			bs = Arrays.asList(lottery.getDigit7());
			ticket.setDigit1(digits[0]);
			ticket.setDigit2(digits[1]);
			ticket.setDigit3(digits[2]);
			ticket.setDigit4(digits[3]);
			ticket.setDigit5(digits[4]);
			ticket.setDigit6(digits[5]);
		} else {
			rs = Arrays.asList(lottery.getDigit1(), lottery.getDigit2(), lottery.getDigit3(), lottery.getDigit4(), lottery.getDigit5());
			bs = Arrays.asList(lottery.getDigit6(), lottery.getDigit7());
			ticket.setDigit1(digits[0]);
			ticket.setDigit2(digits[1]);
			ticket.setDigit3(digits[2]);
			ticket.setDigit4(digits[3]);
			ticket.setDigit5(digits[4]);
			if (ticket.getDigit6() > ticket.getDigit7()) {
				int temp = ticket.getDigit6();
				ticket.setDigit6(ticket.getDigit7());
				ticket.setDigit7(temp);
			}
		}
		
		int[] count = new int[] { 0, 0 };
		if (rs.contains(ticket.getDigit1())) {
			ticket.setGuess1(true);
			count[0]++;
		} else {
			ticket.setGuess1(false);
		}
		if (rs.contains(ticket.getDigit2())) {
			ticket.setGuess2(true);
			count[0]++;
		} else {
			ticket.setGuess2(false);
		}
		if (rs.contains(ticket.getDigit3())) {
			ticket.setGuess3(true);
			count[0]++;
		} else {
			ticket.setGuess3(false);
		}
		if (rs.contains(ticket.getDigit4())) {
			ticket.setGuess4(true);
			count[0]++;
		} else {
			ticket.setGuess4(false);
		}
		if (rs.contains(ticket.getDigit5())) {
			ticket.setGuess5(true);
			count[0]++;
		} else {
			ticket.setGuess5(false);
		}
		if (type) {
			if (rs.contains(ticket.getDigit6())) {
				ticket.setGuess6(true);
				count[0]++;
			} else {
				ticket.setGuess6(false);
			}
		} else {
			if (bs.contains(ticket.getDigit6())) {
				ticket.setGuess6(true);
				count[1]++;
			} else {
				ticket.setGuess6(false);
			}
		}
		if (bs.contains(ticket.getDigit7())) {
			ticket.setGuess7(true);
			count[1]++;
		} else {
			ticket.setGuess7(false);
		}
		Integer prize = (type ? BLOG_LOTTERY_SSQ : BLOG_LOTTERY_DLT).get(count[0] + "+" + count[1]);
		ticket.setPrize(prize == null ? 0 : prize);
	}
}