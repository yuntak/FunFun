<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	


</style>

</head>
<body>
	<div class="panel-body">
	
	<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-left:15%; width: 800px; height: 400px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" >

      <div class="item active">
        <img src="<%=request.getContextPath()%>/img/funfun.PNG" style="margin-top:10%; margin-left:10%; width: 300px; height: 200px">
        <br>
        <div class="carousel-caption">
          <h3>funfun</h3>
          <p>펀펀하다</p>
        </div>
      </div>

      <div class="item">
        <img src="<%=request.getContextPath()%>/img/Koala.jpg" style="margin-top:10%; margin-left:10%;width: 300px; height: 200px">
        <div class="carousel-caption">
          <h3>코알라</h3>
          <p>알라알라코알라</p>
        </div>
      </div>
    
      <div class="item">
        <img src="<%=request.getContextPath()%>/img/Jellyfish.jpg" style="margin-top:10%; margin-left:10%;width: 300px; height: 200px">
        <div class="carousel-caption">
          <h3>해파리</h3>
          <p>파리파리해파리</p>
        </div>
      </div>

      <div class="item">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="margin-top:10%; margin-left:10%;width: 300px; height: 200px">
        <div class="carousel-caption">
          <h3>태연!!</h3>
          <p>태태태태태연</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	
	<div class="container">
  <h2>신규프로젝트</h2>
              
  <div class="row">
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
   <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
  </div>
  
  <h2>인기프로젝트</h2>
              
  <div class="row">
   <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
  </div>
  
  <h2>성공프로젝트</h2>            
  <div class="row">
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
   <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
    
   <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
      <a href="<%=request.getContextPath()%>/" class="thumbnail">
        <img src="<%=request.getContextPath()%>/img/tae.jpg" style="width:150px;height:150px">
    	 <p>설명글..</p>    
      </a>
    </div>
  </div>
</div>
	</div>
</body>
</html>