<%@page import="funfun.jdbc.dto.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.panel-body {
	margin-bottom: 10%;
}

textarea {
	resize: none;
}
</style>
</head>
<body>

	<div class="panel-body" align="center">
		<div id="toppanel"
			style="width: 1200px; height: 90px;; background-color: #EFEFE7">



			<div id="toppanel" class="panel panel-default"
				style="width: 1200x; background-color: #F3F3ED">
				<table class="table table-bordered">

					<tr>
						<td align="center" colspan="2" style="width: 950px">제목</td>
						<td align="center" style="width: 200px">작성자</td>
					</tr>
					<tr style="height: 30px; background-color: white">
						<td align="center" colspan="2" rowspan="6" style="font-size: 25px;">${FBoard.title }</td>
						<td align="center" style="width: 200px">${FBoard.nickName }</td>
					</tr>
					<tr>
					<td align="center" style="width: 200px">날짜</td>
					</tr>
					<tr style="height: 30px; background-color: white">
					<td align="center" style="width: 200px">${FBoard.fdate }</td>
					</tr>
					<tr>
					<td align="center" style="width: 200px">조회수</td>
					</tr>
					<tr style="height: 30px; background-color: white">
					<td align="center" style="width: 200px">${FBoard.fview }</td>
					</tr>

				</table>
			</div>
			<div id="toppanel" class="panel panel-default"
				style="width: 1200x; background-color: #F3F3ED">
				<table class="table">
					<tr>
						<td align="center" colspan="3">내용</td>
					</tr>
					<tr style="height: 30px; background-color: white">
						<td colspan="3">${FBoard.fcontext }</td>
					</tr>
					<tr>
						<td align="center" colspan="3"><strong>코멘트</strong></td>
					</tr>
					<tr style="background-color: white;">
						<td colspan="3">
							<table class="table" id="comment" style="width: 1150px">
								<c:forEach items="${FBoard.replys }" var="reply">
									<thead>
										<tr class="success" style="color: blue;">
											<th><strong>${reply.nickname }</strong></th>
										</tr>
									</thead>
									<thead>
										<tr>
											<th class="ttr"><strong>${reply.context }</strong></th>
										</tr>
									</thead>
								</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>


				</table>
			</div>

			<div class="panel panel-danger" style="width: 1200px;">
				<div class="row">
					<c:if test="${FunFunUser!=null }">
						<div class="col-lg-2 col-sm-2 col-xs-2 col-md-2" align="center">
							<table>
								<tr>
									<td></td>

									<td>${FunFunUser.nickname }</td>
								</tr>
							</table>
						</div>
						<div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
							<textarea id="FBreplyContent" rows="4" cols="120" id="user"
								placeholder="내용"></textarea>
						</div>
						<div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
							<button id="FBreplyInsert">
								<img src="<%=request.getContextPath()%>/img/ok.PNG"
									style="width: 90px; height: 90px">
							</button>
						</div>
					</c:if>

				</div>
			</div>

		</div>

	</div>
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
		var url="<%=request.getContextPath()%>	/FreeBoard/ReplyWrite";
							var reply = {
								id : user_id,
								nickname : nickname,
								code : Board_code,
								no : Board_no,
								content : replyContent
							};//
							if (replyContent == "") {
								alert("댓글 내용을 입력하세요.");
								return false;
							}
							$.ajax({
								type : "post",
								url : url,
								dataType : "json",
								data : {
									id : user_id,
									nickname : nickname,
									code : Board_code,
									no : Board_no,
									content : replyContent
								},
								success : function(response) {
									console.log(response);
									/* for(var i=0;i<response.size;i++){
										
									} */
									Comment(response);
								},
								error : function(request, status, error) {
									console.log("ajax fail");
									alert("code:" + request.status + "\n"
											+ "message:" + request.responseText
											+ "\n" + "error:" + error);
								}
							});
						});
	});
</script>
<script type="text/javascript">
	function Comment(list) {
		console.log("Comment Function");
		var commentTable = document.getElementById("comment");
		var comments = "";
		console.log(list.length);
		for (var i = 0; i < list.length; i++) {
			comments += "<tr><th class='ttr'><strong>" + list[i].nickname
					+ "</strong></th></tr><tr><td>" + list[i].context
					+ "</td></tr>";
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