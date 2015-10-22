<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
	.panel-body{
		margin-bottom: 5%;
	}
#name:visited {
   color: #B4FF6A;
   font-size: 10pt;
   text-decoration: none;
}

#name:active {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: none;
}

#name:hover {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: underline;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"></a></li>
					<li><a href="#">만화</a></li>
					<li><a href="#">소설</a></li>
					<li><a href="#">영화</a></li>
					<li><a href="#">연극</a></li>
					<li><a href="#">드라마</a></li>
					<li><a href="#">게임</a></li>
				</ul>
			</div>

			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
				style=" margin-left: 10%; border-top: 1px solid blue; width: 950px; height: 300px;">
			<div style="width: 900px; height: 100px; border-bottom:1px solid skyblue; background-color: #EFEFE7">
					<table style="margin-left: 2%;">
					<tr>
						<th style="font-size:20pt; width: 90px;">${CBoard_sub.subtitle }/</th>
						<th style="font-size:13pt; color:#00007D">${CBoard.userId }</th>
					</tr>
					</table>
				</div>	


	</div>
	</div>
	
	<div style="width: 750px; border-top:1px solid black; border-bottom:1px solid black;
	 margin-left: 33%; margin-top:-250px; overflow: hidden;">
	${CBoard_sub.context }
		 
		
	</div>
	<br>
	<form action="" class="form-inline">
		<div align="left" style="width: 900px; margin-left: 27%;">
			<select class="form-control" style="width: 100px;" id="num">

				<option>회차</option>
				<option value="">1회</option>
			</select>
		 <input type="submit" value="이동" class="btn btn-default">
		</div>
		
		</form>

		<div style="width: 900px; margin-left: 28%;" align="center">
			<button type="button" class="btn-lg btn-info" style="width: 80px;">목록</button>
		</div>
	
	<hr>
     
      </div>
	
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>