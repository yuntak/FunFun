package funfun.controller.fundingboard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundingBoardController {

	@RequestMapping(value="/FundingBoard")
	public String fundingBoardMain(Model model){
		String viewlocation = "/WEB-INF/view/fundingboard/fundListBoard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	@RequestMapping("/fundBoard")
	public String fundingboard() {
		return "fundingboard/fundBoard";
	}
}
