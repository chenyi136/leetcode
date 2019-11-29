package com.ziniu.view;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/account/")
public class AccountView extends SuperView {
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView res = new ModelAndView("jsp/profile");
		return res;
	}
}