package funfun.controller.freeboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Users;
import funfun.jdbc.service.FBoardService;
import funfun.jdbc.service.UsersService;

@Controller
public class FreeBoardController {

	private static Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	FBoardService FreeBoardSvc;
	@Autowired
	UsersService UsersSvc;
	
	@RequestMapping(value="/FreeBoard")
	public String freeBoardMain(Model model){
		List<FBoard> FBoardList=FreeBoardSvc.selectFBoardByPage(FBoard.FREEBOARD_CODE, 1);
		model.addAttribute("FBoardList", FBoardList);
		int allPage= FreeBoardSvc.selectCountAllPage();
		model.addAttribute("allPage", allPage);
		String viewlocation = "/WEB-INF/view/freeboard/freeboard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	@RequestMapping(value="/FreeBoard/List",method=RequestMethod.GET)
	public String freeBoardList(@RequestParam String name,@RequestParam String keyword, @RequestParam int page,Model model){
		List<FBoard> FBoardList=null;
		int allPage=0;
		if(name.equals("subject")){
			
		}
		else if(name.equals("content")){
			
		}
		else if(name.equals("nickname")){
			
		}
		else{
			allPage= FreeBoardSvc.selectCountAllPage();
			FBoardList=		FreeBoardSvc.selectFBoardByPage(FBoard.FREEBOARD_CODE,page);
		}
		model.addAttribute("allPage", allPage);
		model.addAttribute("FBoardList", FBoardList);
		String viewlocation = "/WEB-INF/view/freeboard/freeboard.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
		
	}
	@RequestMapping(value="/FreeBoard/Write")
	public String freeBoardWrite(Model model){
		FBoard fboard= new FBoard();
		String viewlocation = "/WEB-INF/view/freeboard/freeWrite.jsp";
		model.addAttribute("Fboard", fboard);
		model.addAttribute("view", viewlocation);
		return "main/Template";
		
	}
	@RequestMapping(value="/FreeBoard/FreeBoardWrite",method=RequestMethod.POST)
	public String freeBoardWriteDataInsert(FBoard Fboard){
		logger.trace("FreeBoard insert try");
		logger.trace("Insert FreeBoard :{}",Fboard);
		
		return "redirect:FreeBoard";
		
	}
	
	@RequestMapping(value="FreeBoard/View")
	public String freeBoardView(@RequestParam int BoardNo,Model model){
		FBoard FBoardcontent = FreeBoardSvc.selectFullFBoard(BoardNo);
		String user = UsersSvc.getNickname(FBoardcontent.getUserId());
		FBoardcontent.setNickName(user);
		model.addAttribute("FBoard",FBoardcontent);
		
		String viewlocation = "/WEB-INF/view/freeboard/freeContents.jsp";
		model.addAttribute("view", viewlocation);
		return "main/Template";
	}
	
	@RequestMapping(value="FreeBoard/ReplyWrite")
	public String freeBoardReplyWrite(){
		return null;
	}
	
	
}
