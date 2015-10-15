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
   <div class="panel-body" align="center">




      <div id="toppanel" class="panel panel-default" 
         style="width: 900px; background-color: #F3F3ED" >
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


      <div class="panel panel-default" style="width: 900px;">
         <div class="panel-body" align="center" style="color: #8A0000; font-size: 40px;">${FBoard.title }</div>
      </div>


      <div align="left" class="panel-body" style="width: 900px; overflow: auto;">
         ${FBoard.fcontext }
        
      </div>
		
      <div class="panel panel-default" style="width: 900px;">
         <div class="panel-heading">코멘트</div>

		 <div class="">
         <div class="panel-body">

            <table id="comment" class="table">
                  <c:forEach  items="${FBoard.replys }" var="reply">
                    <thead>
                  <tr>
                     <th class="ttr"><strong>${reply.nickname }</strong></th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>${reply.context }</td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
			</div>

         </div>
      </div>


      <div class="panel panel-danger" style="width: 900px;">
         <div class="row">
         <c:if test="${FunFunUser!=null }">
            <div class="col-lg-1 col-sm-1 col-xs-1 col-md-1" align="center">
               <label for="user">${FunFunUser.nickname }</label>
            </div>
            <div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
               <textarea id="FBreplyContent" rows="4" cols="80" id="user" placeholder="내용" ></textarea>
            </div>
            <div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
               <button id="FBreplyInsert"><img src="<%=request.getContextPath()%>/img/ok.PNG"
                  style="width: 90px; height: 90px"></button>
            </div>
            </c:if>

         </div>
      </div>

   </div>
<p id="hello">댓글</p>


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
		comments+="<tr><th class='ttr'><strong>"
		+list[i].nickname+"</strong></th></tr><tr><td>"
		+list[i].context+"</td></tr>";
       //list[i].nickanme
		//list[i].context
		console.log(list[i]);
		
		
	} /* $.each(list, function(index, obj){
		console.log(obj);
	}) */
	
	$("#comment").html(comments);
}
</script>
</html>