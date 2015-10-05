package ssw.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class test_controller {


	@RequestMapping("/freeWrite")
	public String freeWrite() {
		return "seoseopwoon/freeWrite";
	}
	
	
}
