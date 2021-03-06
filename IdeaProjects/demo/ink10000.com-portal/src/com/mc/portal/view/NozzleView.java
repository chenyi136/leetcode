package com.mc.portal.view;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.mc.portal.aop.DailyPoint;
import com.mc.portal.crux.Global;
@Controller
@RequestMapping("/nozzle/")
public class NozzleView extends Global {
	@DailyPoint(refer = true)
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView nozzle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//TODO
		return new ModelAndView(VIEW_PATH_PREFIX + "_/share/nozzle");
	}
}