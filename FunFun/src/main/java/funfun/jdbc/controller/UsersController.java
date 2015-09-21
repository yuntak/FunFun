package funfun.jdbc.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import funfun.jdbc.dto.Users;

@Controller
@SessionAttributes({"Users"})
public class UsersController {
   private static Logger logger = LoggerFactory.getLogger(UsersController.class);
  /* @InitBinder
   public void bindData(WebDataBinder binder) {
      logger.trace("bindData 호출됨");
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd (E)");
      binder.registerCustomEditor(Date.class, "birthDate", 
            new CustomDateEditor(format, true));
      DecimalFormat df = new DecimalFormat("$##,###");
      binder.registerCustomEditor(Long.class, "salary",
            new CustomNumberEditor(Long.class, df, true));
   }*/
   
   @InitBinder
   public void checkEssentialField(WebDataBinder binder){
      binder.setRequiredFields("id","pass","email","nickname");
   }
   
   @ModelAttribute
   public Users setDefaultUserInfo(Model model){
	   Users info = new Users();
	   info.setId("hong123");
	   info.setPass("1234");
	   info.setNickname("hong");
	   info.setEmail("honggil@naver.com");
	   logger.trace("info"+info);
	   return info;
   }

   @RequestMapping(value = "/user", method = RequestMethod.POST)
   public String confirmUserData(Model model, Users userInfo) {
      logger.trace("userInfo : {}", userInfo);
      return "confirmuserInfo";
   }
   
   @RequestMapping(value = "/user_error", method = RequestMethod.POST)
   public String errorHandling(Model model, Users userInfo, BindingResult result,RedirectAttributes redir, HttpSession session) {
      if(result.hasErrors()){
         return "userform_error";
      }  
      //redir.addFlashAttribute(userInfo);
      //session.setAttribute("userInfo", userInfo);
      return "redirect:confirmuserInfo";//새로운 request 생성
   }
   @RequestMapping(value = "/confirmuserInfo", method = RequestMethod.GET)
   public String showUserInfo(Model model) {
      return "confirmuserInfo";
   }
   @RequestMapping(value="/user", method=RequestMethod.GET)
   public String getUserForm(Model model) {
      return "userform";
   }

   @RequestMapping(value = "/user_select", method = RequestMethod.GET)
   public String getUserFormSelect(Model model) {
      return "userform_select";
   }

   @RequestMapping(value = "/userformat", method = RequestMethod.GET)
   public String getUserFormFormat(Model model) {
      return "userformat";
   }

   @RequestMapping(value = "/user_error", method = RequestMethod.GET)
   public String getUserFormError(Model model) {
      return "userform_error";
   }
}