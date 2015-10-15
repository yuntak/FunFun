package ssw.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import funfun.jdbc.dto.FBoard;
import funfun.jdbc.dto.Funding;
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
	 
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(@RequestParam MultipartFile uploadFile,
						 @RequestParam String comment) throws IOException{
		File file = new File("c:/Temp/upload/"+uploadFile.getOriginalFilename());
		
		Model model = null;
		model.addAttribute("uploaded",uploadFile.getOriginalFilename());
		uploadFile.transferTo(file);
		
		return "upload/uploadResult";
	
	}
	
	
}
