package com.mc.portal.view;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mc.core.entity.auth.Enjoy;
import com.mc.core.entity.auth.Power;
import com.mc.core.service.auth.EnjoyService;
import com.mc.core.service.auth.PowerService;
import com.mc.core.view.JMapView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
import com.mc.portal.tool.ServletTool;
@Controller
@RequestMapping("/enjoy/")
public class EnjoyView extends Global {
	@Autowired
	private EnjoyService enjoyService;
	@Autowired
	private PowerService powerService;
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public JMapView save(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			Power power = new Power();
			power.setId(id);
			if (id == null || id.equals("") || powerService.count(power) < 1) {
				res.setState("请求参数非法");
				return res;
			}
			
			Enjoy en = new Enjoy();
			en.setFkAccount(ServletTool.getOnline(request).id);
			if (enjoyService.count(en) >= 15) {
				res.setState("你收藏太多了");
				return res;
			}
			en.setFkPower(id);
			if (enjoyService.count(en) > 0) {
				res.setState("你已收藏本页了");
				return res;
			}
			
			res.setState(enjoyService.save(en) ? "收藏本页成功" : "收藏本页失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
	@DailyPoint(impact = true)
	@ResponseBody
	@RequestMapping(value = "drop", method = RequestMethod.POST)
	public JMapView drop(HttpServletRequest request, String id) {
		JMapView res = new JMapView();
		try {
			if (id == null || id.equals("")) {
				res.setState("请求参数非法");
				return res;
			}
			
			Enjoy en = new Enjoy();
			en.setFkPower(id);
			en.setFkAccount(ServletTool.getOnline(request).id);
			res.setState(enjoyService.trash(en) > 0 ? OK : "删除失败");
		} catch (Exception e) {
			res.setState(e);
		}
		return res;
	}
}