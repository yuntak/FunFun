package funfun.controller.fundingboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/FundingBoard/List",method=RequestMethod.GET)
	public String freeBoardList(@RequestParam int page,Model model){
		List<Funding> FundingList=null;
		int allPage=0;
		
		allPage= FundingSvc.countFundingPage();
		FundingList=FundingSvc.selectFundingByPage(page);

		model.addAttribute("allPage", allPage);
		model.addAttribute("FundingBoardList", FundingList);
		String viewlocation = "/WEB-INF/view/fundingboard/fundListBoard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
		
	}
	@RequestMapping(value="/FundingBoard/Write")
	public String freeBoardWrite(Model model){
		Funding funding= new Funding();
		String viewlocation = "/WEB-INF/view/fundingboard/fundAsk.jsp";
		model.addAttribute("Funding", funding);
		model.addAttribute("view", viewlocation);
		
		//
		FBoard fboard=new FBoard();
		model.addAttribute("Fboard", fboard);
		
		//
		return "main/Template";
		
	}
	@RequestMapping("/FundingBoard/view")
	public String fundingboard(@RequestParam int FundingNo,Model model) {
		Funding funding = FundingSvc.selectFunding(FundingNo);
		model.addAttribute("FundingBoard",funding);
		String viewlocation = "/WEB-INF/view/fundingboard/fundBoard.jsp";
		model.addAttribute("view",viewlocation);
		return "main/Template";
	}
}
