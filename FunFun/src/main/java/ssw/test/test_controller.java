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
	  @RequestMapping(value = "/community/imageUpload", method = RequestMethod.POST)
	    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	 
	        OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	 
	            String fileName = upload.getOriginalFilename();
	            byte[] bytes = upload.getBytes();
	            String uploadPath = "저장경로/" + fileName;//저장경로
	 
	            out = new FileOutputStream(new File(uploadPath));
	            out.write(bytes);
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = "저장한 URL경로/" + fileName;//url경로
	 
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                    + callback
	                    + ",'"
	                    + fileUrl
	                    + "','이미지를 업로드 하였습니다.'"
	                    + ")</script>");
	            printWriter.flush();
	 
	        }catch(IOException e){
	            e.printStackTrace();
	        } finally {
	            try {
	                if (out != null) {
	                    out.close();
	                }
	                if (printWriter != null) {
	                    printWriter.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	 
	        return;
	    }
	
	
}
