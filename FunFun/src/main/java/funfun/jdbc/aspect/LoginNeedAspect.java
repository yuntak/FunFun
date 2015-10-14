package funfun.jdbc.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Component
@Aspect
@Controller
public class LoginNeedAspect {
	
	
	public String loginNeed(HttpSession session ){
		Object user=null; 
		user=session.getAttribute("FunFunUser");
		if(user!=null){
			return null;
		}
		else{
			return "rediect:Login";
		}
	}

}
