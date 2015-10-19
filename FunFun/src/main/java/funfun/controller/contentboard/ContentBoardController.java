package funfun.controller.contentboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.jdbc.dto.CBoard;
import funfun.jdbc.service.CBoardService;
import funfun.jdbc.service.CBoard_subService;

@Controller
public class ContentBoardController {
	private static Logger logger = LoggerFactory.getLogger(ContentBoardController.class);
	@Autowired
	CBoardService ContentBoardSvc;
	@Autowired
	CBoard_subService ContentSubBoardSvc;

	@RequestMapping(value="/ContentBoard")
	public String contentBoardMain(Model model){
		List<CBoard> CBoardList = ContentBoardSvc.selectCBoardByPage(CBoard.CONTENTBOARD_CODE, 1);
		model.addAttribute("CBoardList",CBoardList);
		int CsBoardCount=0;
		for(int i=0;i<CBoardList.size();i++){
			CBoard cboard = CBoardList.get(i);
			CsBoardCount = ContentSubBoardSvc.selectCountCno(cboard.getCno());
			model.addAttribute("CsBoardCount"+i,CsBoardCount);
			logger.trace("Test : {}"+i,CsBoardCount);
		}
		
		int allPage = ContentBoardSvc.selectCountAllPage();
		model.addAttribute("allPage",allPage);
		String viewlocation = "/WEB-INF/view/contentboard/CBoardList.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	
	
	@RequestMapping(value="/ContentBoard/MainView")
	public String contentBoardMainView(@RequestParam int Cno,Model model){
		CBoard cboard = ContentBoardSvc.selectFullCBoard(Cno);
		model.addAttribute("CBoard", cboard);
		
		String viewlocation = "/WEB-INF/view/contentboard/CBoardContents.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	
}
