<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="twitter:url" content="http://www.himpfen.com/bootstrap-jumbotron-background-cover-image/" />
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
/* 	.btn-group-vertical{
		width:200px;
		height:100px;
	} */
	.panel-body{
		height:730px;
	}
	#all{
		font-size: 30px;
		color: black;
	}
	.jumbo{
		border:2px ridge gray;
		background-color:;
		height: 500px;
		width: 200px;
		text-align: center;
		
	}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	
	<div class="container-fluid">
	
  <div class="panel-body">
  
  <div class="btn-group-vertical">
  
  <div class="jumbo">
    <a id="all" href="freePublish.jsp" type="button" class=""><img src="<%=request.getContextPath()%>/rsc/img/jakfoom.jpg"
					style="width: 100px; height: 100px"></a>
    <hr>
    <a href="freePublish.jsp?novel" type="button" class="">소설</a>
    <hr>
    <a href="freePublish.jsp?cartoon" type="button" class="">만화</a>
    <hr>
    <a href="freePublish.jsp?aaa" type="button" class="">aaa</a>
    <hr>
    <a href="freePublish.jsp?bbb" type="button" class="">bbb</a>
    <hr>
    <a href="freePublish.jsp?ccc" type="button" class="">ccc</a>
  	<hr>
  </div>
 
  <br>
  </div>
  
  <div align="right">
  <div class="panel panel-default" style="width: 700px;  position:absolute; left:300px; top:200px;">
  	 <div class="panel" style="height: 100px; 
  	 text-align: left; border: solid 1px; margin: auto;">게시물</div>
  
  </div>
  </div>
  
    <div align="right">
  	<div class="panel panel-default" style="width: 700px;" >
  	 <div class="panel" style="height: 100px; 
  	 text-align: left; border: solid 1px;" >게시물</div>
  
  </div>
  </div>
  
  </div>
  
</div>

	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>