package funfun.controller.interceptors;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
private static Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException{
		Object usingAuth =null;
		logger.trace("{}",handler.getClass());
		if(handler instanceof HandlerMethod){
			usingAuth	=((HandlerMethod)handler).getMethodAnnotation(LoginCheck.class);
		}
		if(usingAuth!=null){
			//To Do Login Check Processing Code
			HttpSession session=request.getSession();
			Object user= session.getAttribute("FunFunUser");
			if(user==null){
				try{
				String location= request.getContextPath()+"/Login";
				response.sendRedirect(location);
				}catch(IOException e){
					logger.trace("Login Check Interceptor Exception : {}",e);
				}
				return false;	
			}
			else{
				return true;
			}
		}
		else{
			
			return true;
		}
		
		//return super.preHandle(request, response, handler);
	}

	

}
