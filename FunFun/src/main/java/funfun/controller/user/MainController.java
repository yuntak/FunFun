package funfun.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("/SignUp")
	public String SignUpForm(){
		return "SignUp/usersForm";
	}

	@RequestMapping("/Login")
	public String LoginForm(Model model){
		String viewlocation="/WEB-INF/view/main/Login.jsp";
		model.addAttribute("view",viewlocation);
		return "main/Template";
	}
	
	@RequestMapping("/LoginTry")
	public String LoginTry(){
		
		return "main/Template";
	}
	@RequestMapping(value="/login_ajax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public boolean loginAjax(@RequestParam String id,@RequestParam String pass){
		if(id.equals("qwer")&&pass.equals("qwer")){
			return true;
		}
		return false;
	}

}
