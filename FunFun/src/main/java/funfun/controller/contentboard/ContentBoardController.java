package funfun.controller.contentboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.jdbc.dto.CBoard;
import funfun.jdbc.dto.CBoard_sub;
import funfun.jdbc.dto.FBoard;
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
	
	@RequestMapping(value="/ContentBoard/List",method=RequestMethod.GET)
	public String contentBoardList(@RequestParam String name,@RequestParam String keyword, @RequestParam int page,Model model){
		List<CBoard> CBoardList=null;
		int allPage=0;
		String code="22";
		logger.trace(""+name+" : " +keyword+" : " +page+" qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
		if(name.equals("subject")){
			allPage=ContentBoardSvc.selectCBoardByTitleAllPage(keyword, code);
			CBoardList=ContentBoardSvc.selectCBoardBySelectTitlePage(keyword, code, page);
		}else{
			allPage= ContentBoardSvc.selectCountAllPage();
			CBoardList=ContentBoardSvc.selectCBoardByPage(CBoard.CONTENTBOARD_CODE,page);
		}
		model.addAttribute("allPage", allPage);
		model.addAttribute("CBoardList", CBoardList);
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
	
	@RequestMapping(value="/ContentBoard/View")
	public String contentBoardView(@RequestParam int no,@RequestParam int Cno,Model model){
		
		List<CBoard_sub> sublist =null;
		CBoard cboard = ContentBoardSvc.selectFullCBoard(Cno);
		if(cboard!=null){
			sublist=cboard.getCboard_sub();
		}
		CBoard_sub cboard_sub = ContentSubBoardSvc.selectCBoardBycno(no, Cno);
		model.addAttribute("CBoard_sub", cboard_sub);
		model.addAttribute("sublist", sublist);
		logger.trace( "컨텐츠 보드 서브리스트 입니다{}",sublist);
		String viewlocation = "/WEB-INF/view/contentboard/fintionContent.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	
}
