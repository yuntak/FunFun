package funfun.controller.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

import funfun.jdbc.dto.Users;
import funfun.jdbc.service.UsersService;

@Controller
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
	public String SignUpForm() {
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
	@RequestMapping("/SignUpResult")
	public void SingUpTry (//
			@RequestParam String mb_id, @RequestParam String mb_pass, @RequestParam String mb_num,
			@RequestParam String mb_nick, @RequestParam String sample4_postcode,
			@RequestParam String sample4_roadAddress, @RequestParam String sample4_jibunAddress,
			@RequestParam String mb_adress2, @RequestParam String mb_mailing, 
			HttpSession session,RequestContext ctxt,HttpServletRequest request,HttpServletResponse response)
	throws Exception{
		Users user = new Users();
		user.setId(mb_id);// id 설정
		user.setPass(mb_pass);// pass 설정
		user.setCellphone(mb_num);// 연락처 설정
		user.setNickname(mb_nick);// 닉네임 설정
		user.setMail_no(sample4_postcode);// 우편번호 설정
		user.setRoad_addr(sample4_roadAddress);// 도로 주소
		user.setLoca_addr(sample4_jibunAddress);
		user.setAddress(mb_adress2);// 상세 주소 설정
		user.setEmail(mb_mailing);// 이메일 설정
		user.setRoll("BASIC");// 권한 설정
		int result = -1;
		result = UserSvc.insert(user);
		if (result == 1) {
			session.setAttribute("FunFunSignUpId", mb_id);
		}
		String path=request.getContextPath()+"/Result";
		response.sendRedirect(path);
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
	public void Logout(HttpSession session,HttpServletResponse response) throws Exception{
		session.invalidate();
		String path ="./main";
		response.sendRedirect(path);
		
	}

	// 로그인을 처리 AJax
	@RequestMapping(value = "/login_ajax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String loginAjax(@RequestParam String id, @RequestParam String pass, HttpSession session) {
		Users user=UserSvc.mylogin(id, pass);
		 if(user!=null){
		
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
	public @ResponseBody String IdDuplAjax(@RequestParam String mb_id) {
		String result=UserSvc.checkId(mb_id);
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
	public @ResponseBody String NickDuplAjax(@RequestParam String mb_nick) {
		 String result=UserSvc.checkNickname(mb_nick);
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
	public @ResponseBody String EMailDuplAjax(@RequestParam String mb_email) {
		 String result=UserSvc.checkEmail(mb_email);
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

		// Users User=UserSvc.loginUsers(id, pass);

		/*
		 * if(Users!=null){ return "true; }
		 */
		if (id.equals("qwer") && pass.equals("qwer")) {
			return "true";
		} else {
			return "false";
		}

	}
	@RequestMapping(value="/myinfo")
	public String infoBefore(HttpServletRequest request){
		Object info=null;
		info =request.getAttribute("info");
		if(info==null){
		return null;
		}
		return null;
	}
/*	@RequestMapping(value="/myinfo/infoEdit")
	public String infoEdit(){ 
		
		return null;
	}
	@RequestMapping(value="/myinfo/infoEdit")
	public String infoEdit(){ 
		
		return null;
	}
	@RequestMapping(value="/myinfo/infoEdit")
	public String infoEdit(){ 
		
		return null;
	}*/

}
