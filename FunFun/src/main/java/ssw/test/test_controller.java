package ssw.test;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.service.FBoardService;

@Controller
public class test_controller {
	
	@Autowired
	FBoardService Fservice;

	@RequestMapping("/freeWrite")
	public String freeWrite() {
		return "freeboard/freeWrite";
	}
	
	@RequestMapping("/freeContents")
	public String freeContents() {
		return "freeboard/freeContents";
	}
	
	@RequestMapping("/freeboard/list")
	public String freeboardlist(@RequestParam int page_no, @RequestParam String code,Model model){
		List<FBoard> FboardList=Fservice.selectFBoardByPage(code, page_no);
		model.addAttribute("fboardlist", FboardList);
		
		return "freeboard/freeboard";
	}
	
}
