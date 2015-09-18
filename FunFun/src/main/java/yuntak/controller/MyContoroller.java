package yuntak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyContoroller {

	//회원 가입
	@RequestMapping(value="/main")
	public String Main(Model model){
		model.
		return "main/main";
	}
	@RequestMapping(value="/SignUpAgree")
	public String SignUp(Model model) {
		String viewLocation="SignUp/agreement";
		model.addAttribute("viewLocation", viewLocation);
		return "main/main";
	}
}
