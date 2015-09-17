package day1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Fcontroller {
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String getAgreement(Model model) {
		return "/ssw_join/agreement";
	}

	@RequestMapping(value = "/headerfoot", method = RequestMethod.GET)
	public String getheaderfile(Model model) {
		return "headerfoot";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model) {
		return "/ssw_login/login";
	}
	
	@RequestMapping(value = "/userform1", method = RequestMethod.POST)
	public String getUserForm(Model model) {
		return "/ssw_join/userform";
	}
	
	@RequestMapping(value = "/fundboard", method = RequestMethod.GET)
	public String getfundboard(Model model) {
		return "fundboard";
	}
	@RequestMapping(value = "/freeboard", method = RequestMethod.GET)
	public String getfreeboard(Model model) {
		return "freeboard";
	}
	
	@RequestMapping(value = "/main")
	public String confirmUserData(Model model) {
		System.out.println("main call");
		return "/main/main";
	}
	
	@RequestMapping(value = "/abc", method = RequestMethod.POST)
	public String getLoginMain(Model model) {
		return "/main/main";
	}
}
