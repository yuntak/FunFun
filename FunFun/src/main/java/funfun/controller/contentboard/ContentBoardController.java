package funfun.controller.contentboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentBoardController {

	@RequestMapping(value="ContentBoard")
	public String contentBoardMain(Model model){
		
		
		String viewlocation = "/WEB-INF/view/freeboard/freeboard.jsp";
		model.addAttribute("view", viewlocation);
		return null;
	}
	
}
