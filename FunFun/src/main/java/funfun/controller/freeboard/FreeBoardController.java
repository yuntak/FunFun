package funfun.controller.freeboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.service.FBoardService;

@Controller
public class FreeBoardController {

	private static Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	FBoardService FreeBoardSvc;
	
	@RequestMapping(value="/FreeBoard")
	public String freeBoardMain(Model model){
		List<FBoard> FBoardList=FreeBoardSvc.selectFBoardByPage(FBoard.FREEBOARD_CODE, 1);
		model.addAttribute("FBoardList", FBoardList);
		int allPage= FreeBoardSvc.selectCountAllPage();
		logger.trace("{}",allPage);
		model.addAttribute("allPage", allPage);
		String viewlocation = "/WEB-INF/view/freeboard/freeboard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	@RequestMapping(value="/FreeBoard/List",method=RequestMethod.GET)
	public String freeBoardList(@RequestParam int page,Model model){
		List<FBoard> FBoardList=FreeBoardSvc.selectFBoardByPage(FBoard.FREEBOARD_CODE,page);
		int allPage= FreeBoardSvc.selectCountAllPage();
		logger.trace("{}",allPage);
		model.addAttribute("allPage", allPage);
		model.addAttribute("FBoardList", FBoardList);
		String viewlocation = "/WEB-INF/view/freeboard/freeboard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
		
	}
	@RequestMapping(value="/FreeBoard/Write")
	public String freeBoardWrite(Model model){
		String viewlocation = "/WEB-INF/view/freeboard/freeWrite.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
		
	}
	
	
}
