<%@page import="funfun.jdbc.dto.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

/*  .top {
   border-top: solid; color: #DEDEE9;
   border-bottom: solid; color: #DEDEE9;;
   background-color:#F5F5F9;
   height: 40px;
   width: 900px;
   position: absolute;
   right: 530px;
}  */

/* .up{

   border-color: black;
   border: 1px solid;
   display: inline-block; width:90px; height: 90px;
   text-align: center; 
   font-size: 27px;
} */
.panel-body{
	margin-bottom: 10%;
	
}
</style>
</head>
<body>

   <div class="panel-body" align="center">




      <div id="toppanel"
         style="width: 900px; height:40px;;  background-color: #EFEFE7" >
         <ul class="nav nav-justified">
            <li>
               <div align="left"  style="width: 200px">${FBoard.nickName }</div>
            </li>
            <li>
               <div align="center" style="font-size:20pt; ; width: 200px">${FBoard.fdate }</div>
            </li>
            <li>
               <div align="right"  style="width: 200px">${FBoard.fview }</div>
            </li>
         </ul>
      </div>


      <div style="width: 900px;">
         <div class="panel-body" align="center" style="color: #8A0000; font-size: 40px;">${FBoard.title }</div>
      </div>


      <div align="left" class="panel-body" style="width: 900px; overflow: auto;">
         ${FBoard.fcontext }
        
      </div>
		
      <div class=" panel-default" style=" width: 900px; overflow: auto;">
         <div class="panel-heading"><strong>코멘트</strong></div>

			<div>
            <table class="table">
             
                  <c:forEach  items="${FBoard.replys }" var="reply">
                <thead>
                  
                  <tr class="success" style="color: blue;">
                     <th><strong>${reply.userId }</strong></th>

                  </tr>
               </thead>
               
               <tbody>

                  <tr class="success" style="height: 50px;">
                     <td>${reply.context }</td>

                  </tr>
                  
                  </c:forEach>
				 
               </tbody>
            </table>
            </div>
		

        
      </div>

      <div class=" " style="width: 900px; height: 100px; background-color:#EFEFE7">
      	 
         <div class="row">
         <c:if test="${FunFunUser!=null }">
            <div class="col-lg-2 col-sm-2 col-xs-2 col-md-2" style="margin-top: 9mm;">
               <label for="user">${FunFunUser.nickname }</label>
            </div>
            <div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
               <textarea rows="4" cols="85" id="user" style="margin-top:2mm; resize: none; height: 86px;">내용</textarea>
            </div>
            <div class="col-lg-3 col-sm-3 col-xs-3 col-md-3"  align="right">
               <a href="#"><img  src="<%=request.getContextPath()%>/img/ok.PNG"
                  style="width: 90px; height: 90px; margin-top:2mm"> </a>
            </div>
            </c:if>

         </div>
      </div>

   </div>



</body>
</html>