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
<!DOCTYPE html >
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
   margin-bottom: 15%;
   
}
textarea {
   resize: none;
}
</style>
</head>
<body>
	<c:choose>
	<c:when test="${empty FunFunUser }">
   <div class="panel-body" align="center">

      <div id="toppanel" class="" 
         style="width: 900px; height:40px; background-color: #F3F3ED" >
         <ul class="nav nav-justified">
            <li>
               <div align="left" class="panel-body" style="width: 200px">${FBoard.nickName }</div>
            </li>
            <li>
               <div align="center" class="panel-body" style="width: 200px">${FBoard.fdate }</div>
            </li>
            <li>
               <div align="right" class="panel-body" style="width: 200px">${FBoard.fview }</div>
            </li>
         </ul>
      </div>


      <div style="width: 900px;">
         <div class="" align="center" style="color: #8A0000; font-size: 40px;">${FBoard.title }</div>
      </div>


      <div align="left" class="panel-body" style="width: 900px; overflow: auto;">
         ${FBoard.fcontext }
        
      </div>
      
      
      <div class=" panel-default" style="width: 900px; overflow: auto;">
         <div class="panel-heading"><strong>코멘트</strong></div>
     
         
            <table id="comment" class="table">
                  <c:forEach  items="${FBoard.replys }" var="reply">
               
               
               <thead>
                  <tr>
                     <th class="ttr" style="font-size:11pt;color:#454581;border-width: ;  border-top: ; border-bottom: none !important;/* border-bottom:thick solid white */">${reply.nickname }</th>
                  </tr>
               </thead>
               
               <tbody>
                  <tr>
                     <td style="font-size:9pt; border-top: none !important;border-width: 0; border-bottom: none !important;">${reply.context }</td>
                  </tr>
                  </c:forEach>
               </tbody>
               
               
            </table>
         <div style="width: 900px; border: 2px solid #F3F3ED"></div>
		</div>
         
      </div>
	 </c:when>
	 
		<c:otherwise>
	  <div class="panel-body" align="center">

      <div id="toppanel" class="" 
         style="width: 900px; height:40px; background-color: #F3F3ED" >
         <ul class="nav nav-justified">
            <li>
               <div align="left" class="panel-body" style="width: 200px">${FBoard.nickName }</div>
            </li>
            <li>
               <div align="center" class="panel-body" style="width: 200px">${FBoard.fdate }</div>
            </li>
            <li>
               <div align="right" class="panel-body" style="width: 200px">${FBoard.fview }</div>
            </li>
         </ul>
      </div>


      <div style="width: 900px;">
         <div class="" align="center" style="color: #8A0000; font-size: 40px;">${FBoard.title }</div>
      </div>


      <div align="left" class="panel-body" style="width: 900px; overflow: auto;">
         ${FBoard.fcontext }
        
      </div>
      
       <%-- <c:if test="${FunFunUser==fdto.getuserId()}">   
      	
      </c:if> --%>
      <div style="width: 900px;" align="right">
      	<input value="글수정" class="btn btn-info" onclick="modi();" style="width: 70px;"/>
        <input value="글삭제" class="btn btn-info" onclick="del();" style="width: 70px;"/>
        
      </div>
        
         
      <div class=" panel-default" style="width: 900px; overflow: auto;">
         <div class="panel-heading"><strong>코멘트</strong></div>
     
         
            <table id="comment" class="table">
                  <c:forEach  items="${FBoard.replys }" var="reply">
               
               
               <thead>
                  <tr>
                     <th class="ttr" style="font-size:11pt;color:#454581;border-width: ;  border-top: ; border-bottom: none !important;/* border-bottom:thick solid white */">${reply.nickname }</th>
                  </tr>
               </thead>
               
               <tbody>
                  <tr>
                     <td style="font-size:9pt; border-top: none !important;border-width: 0; border-bottom: none !important;">${reply.context }</td>
                  </tr>
                  </c:forEach>
               </tbody>
               
               
            </table>
         

         
      </div>
      
       
      
    
    
	  	
      <div class="" style="width: 900px; height: 110px; background-color:#EFEFE7">
         <div class="row">
         <c:if test="${FunFunUser!=null}">
         	
            <div class="col-lg-2 col-sm-2 col-xs-2 col-md-2" style="margin-top: 10mm;">
               <label for="user">${FunFunUser.nickname }</label>
            </div>
            <div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
               <textarea id="FBreplyContent" rows="4" cols="85" id="user" style="border: 1px solid #BFBFFF; margin-top:2mm; resize: none; height: 96px;" placeholder="내용" ></textarea>
            </div>
            <div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
               <button id="FBreplyInsert" style="margin-top:3mm; margin-right:1mm; border: 1px solid #BFBFFF;background-color:#FBFBF9; font-size:15pt; width: 90px; height: 90px;">등록</button>
            </div>
            </c:if>

         </div>
      </div>

   </div>
</c:otherwise>
</c:choose>
</body>
<script type="text/javascript">
$(function(){
   console.log("Jquery Start!");
   $("#FBreplyInsert").on("click",function(){
      var replyContent=document.getElementById("FBreplyContent").value;
      console.log(replyContent);
      var user_id ="${FunFunUser.id}";
      var nickname="${FunFunUser.nickname}";
      var Board_code="${FBoard.boardCode}";
      var Board_no="${FBoard.boardNo}";
      var url="<%=request.getContextPath() %>/FreeBoard/ReplyWrite";
      var reply={ id:user_id,
               nickname:nickname,
               code:Board_code,
               no:Board_no,
               content:replyContent};//
      if(replyContent==""){
         alert("댓글 내용을 입력하세요.");
         return false;
      }
      $.ajax({
         type:"post",
         url:url,
         dataType:"json",
         data:{id:user_id,
            nickname:nickname,
            code:Board_code,
            no:Board_no,
            content:replyContent},
         success:function(response){
            console.log(response);
            /* for(var i=0;i<response.size;i++){
               
            } */
            Comment(response);
         },
         error:function(request,status,error){
            console.log("ajax fail");
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   });
});
</script>
<script type="text/javascript">
function Comment(list){
   console.log("Comment Function");
   var commentTable= document.getElementById("comment");
   var comments="";
   console.log(list.length);
   for(var i=0;i<list.length;i++){
      /*comments+="<tr><th class='ttr'><strong>"
      +list[i].nickname+"</strong></th></tr><tr><td> "
	  +list[i].context+"</td></tr>";*/
	  
	  comments+="<tr><th class=\"ttr\" style=\"font-size:11pt;color:#454581;border-width: ;  border-top: ; border-bottom: none !important;\">" + list[i].nickname + "</th></tr>";
	  comments+="<tr>";
      comments+="<td style=\"font-size:9pt; border-top: none !important;border-width: 0; border-bottom: none !important;\">" +list[i].context+ "</td></tr>";
      
      
      //list[i].nickanme
      //list[i].context
      console.log(list[i]);
      
      
   } /* $.each(list, function(index, obj){
      console.log(obj);
   }) */
   
   $("#comment").html(comments);
}

	
function modi(){
	window.location.assign("<%=request.getContextPath()%>/main");
}
function del(){
	window.location.assign("<%=request.getContextPath()%>/main");
}
</script>
</html>