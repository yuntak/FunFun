<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
.category {
	width: 200px;
	float: left;
}

.freeWriteBoard-List {
	top: 180px;
	left: 250px;
}
.panel-body{
	margin-bottom: 23%;
}
<style>#name:link {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: none;
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



			<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

				<h2 align="center">자유 연재 게시판</h2>


				<table class="table table-bordered">
			<%
			   ArrayList<String> list = new ArrayList<String>();
				list.add(0,"power");
				list.add(1,"over");
				list.add(2,"whelming");
               for (int i = 0; i < list.size(); i++) {
                  
            %>
            
					<tbody>
						<tr>
							
							<td align="center" style="overflow:hidden;" rowspan="3"><a href="<%=request.getContextPath()%>/FreeBoard/=<%=list.get(0).toString()%>'" >
                  			<%=list.get(0).toString()%>"><img
								 src="<%=request.getContextPath()%>/img/redBalloon.png"
								class="img-thumbnail" alt="Cinque Terre" width="100"
								height="150"></a></td>
							
								
							<td>태그(카테고리) <%=list.get(0).toString()%></td>
							
							<td id="name" style="width: 450px; cursor: pointer;" 
							onclick="location.href='<%=request.getContextPath()%>/ '" >
							<strong>제목<%=list.get(0).toString()%> </strong></td>
							
							<td style="width: 100px">작성자 <%=list.get(1).toString()%></td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">즐겨찾기 <%=list.get(2).toString()%></button></td>
						</tr>


						<tr>
							<td colspan="2" rowspan="2">작품소개 <%=list.get(0).toString()%></td>
							<td>
							
							<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10" align="right">
							
								<div class="btn-group">
								<div class="row">
								
									<button type="button" class="btn btn-xs">회차</button>
									<button type="button" class="btn btn-xs dropdown-toggle"
										data-toggle="dropdown">
										<span class="caret"></span>
									</button>
									
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">1회</a></li>
										<li><a href="#">2회</a></li>
										<li><a href="#">3회</a></li>
										<li><a href="#">4회</a></li>
										<li><a href="#">5회</a></li>
										<li><a href="#">6회</a></li>
										<li><a href="#">7회</a></li>
										<li><a href="#">8회</a></li>
										<li><a href="#">9회</a></li>
										<li><a href="#">10회</a></li>
									</ul>
								</div>
								</div>
								</div>
							</td>
							<td><button style="width: 80px" type="button"
									class="btn btn-xs">보기 <%=list.get(0).toString()%></button></td>
						</tr>

						<tr>
							<td>조회 <%=list.get(0).toString()%></td>
							<td>추천 <%=list.get(0).toString()%></td>
						</tr>
		<%
               }
		%>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>