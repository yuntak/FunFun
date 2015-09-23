package funfun.controller.user;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import funfun.jdbc.dto.Users;
import funfun.jdbc.service.UsersService;



@Controller
public class MainController {
	@Autowired
	UsersService UserSvc;
	
	
	
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
	//회원가입
	//mb_id, mb_pass, mb_num, mb_nick,
	//주소{sample4_postcode(우편번호),sample4_roadAddress(도로명주소)}
	//sample4_jibunAddress(지번주소),mb_adress2(상세주소)
	//mb_mailling
	@RequestMapping("/SignUpTry")
	public String SingUpTry(//
			@RequestParam String mb_id,
			@RequestParam String mb_pass,
			@RequestParam String mb_num,
			@RequestParam String mb_nick,
			@RequestParam String sample4_postcode,
			@RequestParam String sample4_roadAddress,
			@RequestParam String sample4_jibunAddress,
			@RequestParam String mb_adress2,
			@RequestParam String mb_mailling,
			Model model
 ){
		Users user=new Users();
		user.setId(mb_id);//id 설정
		user.setPass(mb_pass);//pass 설정
		user.setCellphone(mb_num);//연락처 설정
		user.setNickname(mb_nick);//닉네임 설정
		user.setMail_no(sample4_postcode);//우편번호 설정
		//도로명 주소 설정-추가?
		//지번 주소 설정-추가?
	    user.setAddress(mb_adress2);//상세 주소 설정
		user.setEmail(mb_mailling);//이메일 설정
		user.setRoll("BASIC");//권한 설정
		int result= -1;
		//UserSvc.insert(user);
		if(result==1){
			model.addAttribute("FunFunSignUpId", mb_id);
			
		}
		return null;//회원가입 완료 Page로 이동
		
	}
	//로그아웃
	@RequestMapping("/Logout")
	public String Logout(HttpSession session){
		session.invalidate();
		return "main/Template";
	}
	
	
	
	//로그인을 처리 AJax
	@RequestMapping(value="/login_ajax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public@ResponseBody String loginAjax(@RequestParam String id,@RequestParam String pass,HttpSession session){
		Users User=UserSvc.loginUsers(id, pass);
		
		if(User!=null){
			session.setAttribute("FunFunUser", User);
			return "true";
		}
		else{
			return "false";
		}
		
		
		//id와 pass로 select
	}
	
	//ID 중복 체크 AJax
	@RequestMapping(value="/Id_dupl_ajax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public@ResponseBody String IdDuplAjax(@RequestParam String mb_id){
		String result=UserSvc.checkId(mb_id);
		if(result.equals("0")){
			return "true";
		}
		else{
		return "false";
		}
	}
	//닉네임 중복 체크 AJax
	@RequestMapping(value="/Nick_dupl_ajax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public@ResponseBody String NickDuplAjax(@RequestParam String mb_nick){
		String result=UserSvc.checkNickname(mb_nick);
		if(result.equals("0")){
			return "true";
		}
		else{
		return "false";
		}
	}
	
	//E-Mail 중복 체크 AJax
	@RequestMapping(value="/EMail_dupl_ajax",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public@ResponseBody String EMailDuplAjax(@RequestParam String mb_mailling){
		String result=UserSvc.checkEmail(mb_mailling);
		if(result.equals("0")){
			return "true";
		}
		else{
		return "false";
		}
	}
	

}
