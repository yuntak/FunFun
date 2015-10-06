package funfun.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import funfun.jdbc.dto.Users;
import funfun.jdbc.service.UsersService;

@Controller
@SessionAttributes({"Users"})
public class MainController {
	private static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	UsersService UserSvc;

	
	@RequestMapping(value = "/main")
	public String Tepmlate() {

		return "main/Template";
	}

	@RequestMapping("/agreement")
	public String SignUpAgree() {
		return "SignUp/agreement";
	}

	@RequestMapping("/SignUp")
	public String SignUpForm(Model model) {
		Users user =new Users();
		model.addAttribute("user", user);
		
		return "SignUp/usersForm";
	}

	@RequestMapping("/Login")
	public String LoginForm(Model model) {
		String viewlocation = "/WEB-INF/view/main/Login.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}

	// 회원가입
	// mb_id, mb_pass, mb_num, mb_nick,
	// 주소{sample4_postcode(우편번호),sample4_roadAddress(도로명주소)}
	// sample4_jibunAddress(지번주소),mb_adress2(상세주소)
	// mb_mailling
	@RequestMapping(value="/SignUpResult",method=RequestMethod.POST)
	public String SingUpTry (//
			Users user,
			HttpSession session)
	throws Exception{
		int result = -1;
		logger.trace("SignUp Try User: {}",user);
		result = UserSvc.insert(user);
		logger.trace("SignUp Result : {}",result==1?"Sucess":"Fail");
		if (result == 1) {
			session.setAttribute("FunFunSignUpId", user.getId());
		}
		return "redirect:Result";
		//return "SignUp/SignUpResult";// 회원가입 완료 Page로 이동

	}
	@RequestMapping("/Result")
	public String Result(HttpServletRequest request){
		HttpSession session=request.getSession();
		String mb_id=(String)session.getAttribute("FunFunSignUpId");
	    logger.trace(session+" : "+mb_id);
		return "SignUp/SignUpResult";
		
	}

	// 로그아웃
	@RequestMapping("/Logout")
	public String Logout(HttpSession session,HttpServletResponse response) throws Exception{
		session.invalidate();
		//String path ="./main";
		//response.sendRedirect(path);
		
		return "redirect:main";
	}

	// 로그인을 처리 AJax
	@RequestMapping(value = "/login_ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String loginAjax(@RequestParam String id, @RequestParam String pass, HttpSession session) {
		Users user=UserSvc.mylogin(id, pass);
		 if(user!=null){
		logger.trace("Login Sucess: {}",user);
		//Users user= new Users();
		//user.setNickname("hoseo");
		//user.setId("qwer");
		//if (id.equals("qwer") && pass.equals("qwer")) {
			session.setAttribute("FunFunUser", user);
			return "true";
		} else {
			return "false";
		}

		// id와 pass로 select
	}

	// ID 중복 체크 AJax
	@RequestMapping(value = "/Id_dupl_ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String IdDuplAjax(@RequestParam String id) {
		//logger.trace(id);
		String result=UserSvc.checkId(id);
		
		// Test
		/*String result;
		if (mb_id.equalsIgnoreCase("qwer")) {
			result = "1";
		} else {
			result = "0";
		}*/
		// Test
		if (result.equals("0")) {
			return "true";
		} else {
			return "false";
		}
	}

	// 닉네임 중복 체크 AJax
	@RequestMapping(value = "/Nick_dupl_ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String NickDuplAjax(@RequestParam String nickname) {
		 String result=UserSvc.checkNickname(nickname);
		// Test
		//String result;
		/*if (mb_nick.equalsIgnoreCase("qwer")) {
			result = "1";
		} else {
			result = "0";
		}*/
		// Test
		if (result.equals("0")) {
			return "true";
		} else {
			return "false";
		}
	}

	// E-Mail 중복 체크 AJax
	@RequestMapping(value = "/EMail_dupl_ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String EMailDuplAjax(@RequestParam String email) {
		 String result=UserSvc.checkEmail(email);
		/*String result;
		System.out.println(mb_email);
		if (mb_email.equals("qwer@naver.com")) {
			result = "1";
		} else {
			result = "0";
		}*/
		if (result.equals("0")) {
			return "true";
		} else {
			return "false";
		}
	}

	// IdPassCheck
	@RequestMapping(value = "/IdPassCheck", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String IdPassCheck(@RequestParam String id, @RequestParam String pass) {
		logger.trace("Check ID : {}, PSSS : {}",id,pass);
		
		if (UserSvc.mylogin(id, pass)!=null) {
			return "true";
		} else {
			return "false";
		}
	}
	@RequestMapping(value="/myinfo")
	public String infoBefore(HttpServletRequest request){
		 return "";
	}
	//로그인 필요
	@RequestMapping(value="/myinfo/info",method=RequestMethod.GET)
	public String infoEdit(Model model){
		Users user=new Users();
		String viewlocation = "/WEB-INF/view/UserEdit/UserEditView.jsp";
		model.addAttribute("view", viewlocation);
		model.addAttribute("userEdit", user);
		return "main/Template";
	}
	@RequestMapping(value="/myinfo/info",method=RequestMethod.POST)
	public String infoEditForm(Users userEdit,Model model){ 
		if(UserSvc.mylogin(userEdit.getId(), userEdit.getPass())==null){
			return "redirect:../myinfo/info";
		}else{
		String viewlocation = "/WEB-INF/view/UserEdit/InfoEditForm.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
		}
	}
	
	//로그인 필요
	@RequestMapping(value="/myinfo/pass")
	public String passEdit(){ 
		return "UserEdit/PassEditView";
	}
	//로그인 필요
	@RequestMapping(value="/myinfo/delete")
	public String deleteEdit(){ 
		
		return "UserEdit/DeleteUserView";
	}
	@RequestMapping(value="/session/invalate")
	public String  sessionDelete(HttpSession session){
		session.invalidate();
		return "redirect:../main";
	}

}
