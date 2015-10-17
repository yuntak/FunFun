package funfun.controller.contentboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.CBoard_sub;
import funfun.jdbc.service.CBoardService;
import funfun.jdbc.service.CBoard_subService;

@Controller
public class ContentBoardController {
	
	@Autowired
	CBoardService ContentBoardSvc;
	@Autowired
	CBoard_subService ContentsubBoardSvc;
	
	@RequestMapping(value="/ContentBoard")
	public String contentBoardMain(Model model){
		List<CBoard> CBoardList = ContentBoardSvc.selectCBoardByPage(CBoard.CONTENTBOARD_CODE, 1);
		model.addAttribute("CBoardList",CBoardList);
		for(int i=0;i<CBoardList.size();i++){
		CBoard cboard = CBoardList.get(i);
		List<CBoard_sub> CsBoardList = ContentsubBoardSvc.selectCBoardSub(cboard.getCno());
		model.addAttribute("CsBoardList"+i,CsBoardList);
		}
		int allPage = ContentBoardSvc.selectCountAllPage();
		model.addAttribute("allPage",allPage);
		String viewlocation = "/WEB-INF/view/contentboard/CBoardList.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	
}
