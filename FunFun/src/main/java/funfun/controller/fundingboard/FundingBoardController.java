package funfun.controller.fundingboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Funding;
import funfun.jdbc.service.FundingService;

@Controller
public class FundingBoardController {
	
	@Autowired
	FundingService FundingSvc;

	@RequestMapping(value="/FundingBoard")
	public String fundingBoardMain(Model model){
		List<Funding> FundingList=FundingSvc.selectFundingByPage(1);
		model.addAttribute("FundingBoardList", FundingList);
		int allPage= FundingSvc.countFundingPage();
		model.addAttribute("allPage", allPage);
		String viewlocation = "/WEB-INF/view/fundingboard/fundListBoard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	@RequestMapping("/fundBoard")
	public String fundingboard() {
		return "fundingboard/fundBoard";
	}
}
