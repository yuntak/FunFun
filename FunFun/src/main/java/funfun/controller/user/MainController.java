package funfun.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value="/main")
	public  String Tepmlate(){
		
		return "main/Template";
	}
	@RequestMapping("/agreement")
	public String SignUpAgree(){		
		return "SignUp/agreement";
	}
	@RequestMapping("SignUp")
	public String SignUpForm(){
		return "SignUp/usersForm";
	}
}
