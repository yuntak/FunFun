package funfun.controller.freeboard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ch.qos.logback.classic.spi.LoggerRemoteView;
import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Reply;
import funfun.jdbc.dto.Users;
import funfun.jdbc.service.FBoardService;
import funfun.jdbc.service.ReplyService;
import funfun.jdbc.service.UsersService;

@Controller
public class FreeBoardController {

	private static Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	FBoardService FreeBoardSvc;
	@Autowired
	UsersService UsersSvc;
	@Autowired
	ReplyService ReplySvc;
	
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
		String code="11";
		logger.trace(""+name+" : " +keyword+" : " +page+" qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
		if(name.equals("subject")){
			allPage=FreeBoardSvc.selectFBoardByTitleAllPage(keyword, code);
			FBoardList=FreeBoardSvc.selectTitleFBoardByPage(keyword, code, page);
		}
		else if(name.equals("content")){
			allPage=FreeBoardSvc.selectFBoardByContextAllPage(keyword, code);
			FBoardList=FreeBoardSvc.selectFBoardBySelectContextPage(keyword, code, page);
		}
		else if(name.equals("nickname")){
			allPage=FreeBoardSvc.selectFBoardByNicknameAllPage(keyword, code);
			FBoardList=FreeBoardSvc.selectNicknameFBoardByPage(keyword, code, page);
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
	public String freeBoardWriteDataInsert(Model model,FBoard Fboard){
		logger.trace("FreeBoard insert try");
		logger.trace("Insert FreeBoard :{}",Fboard);
		FreeBoardSvc.insertFBoard(Fboard);
		model.addAttribute("Fboard",Fboard);
		return "redirect:";
		
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
	
	@RequestMapping(value="FreeBoard/ReplyWrite",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public @ResponseBody String freeBoardReplyWrite(@RequestParam Map<String, String> reply){
		logger.trace("FreeBoard Reply Insert >> Reply: {}",reply);
		logger.trace(reply.get("no"));
		int boardNo=Integer.parseInt(reply.get("no"));
		logger.trace(""+boardNo);
		Reply ReplyByFreeBoard = new Reply(0, // replyNo
								reply.get("content"), // content
								null, // date
								Integer.parseInt(reply.get("no")),// boardNo
								reply.get("code"),// boardCode
								reply.get("id"),// User Id
								reply.get("nickname"));// User NickName
		ReplySvc.insertReply(ReplyByFreeBoard);
		List<Reply> Rlist=null;
		Rlist=ReplySvc.selectBoardReply(Integer.parseInt(reply.get("no")), reply.get("code"));
		logger.trace(Rlist.toString());
		logger.trace("Ajax ReplyWrite Select Reply List :{}",Rlist);
		String ResponseReplyList;
		Gson gson = new Gson();
		ResponseReplyList = gson.toJson(Rlist);
		return ResponseReplyList;
	}
	
	
}
