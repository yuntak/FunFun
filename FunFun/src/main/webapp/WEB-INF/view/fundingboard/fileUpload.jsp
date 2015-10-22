<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%

	request.setCharacterEncoding("EUC-KR");
	String saveFolder = "C:\\FunFun\\editorFiles2\\images";
	String encType = "EUC-KR";
	int maxSize = 5*1024*1024;//5MB
	try{
		MultipartRequest multi = 
				new MultipartRequest(request, saveFolder, 
					maxSize, encType,
					new DefaultFileRenamePolicy());
		Enumeration<String> params = multi.getParameterNames();

		
	}catch(Exception e){
		e.printStackTrace();
	}
%>