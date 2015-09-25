<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<style type="text/css">
	p{
		font-size: 30px;
		
	}

</style>
</head>

<body>
<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>

<div class="container">

  <br>
  <p align="center">자유게시판</p>
  <br>
  <br>                     
  		<div class="form-inline" align="right">
			<input type="text" class="form-control" placeholder="검색">
			<a href=""><span class="badge btn-success">검색</span></a>
		</div>	
		<br>
				                 
  <table class="table">
    <thead>
      <tr class="success">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회</th>    
      </tr>
    </thead>
    <tbody>
    
    <!--   <tr>
        <td>1</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
      <tr>
        <td>2</td>
        <td>Debbie</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
      <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr>
          <tr>
        <td>3</td>
        <td>John</td>
        <td>Anna</td>
        <td>Anna</td>
        <td>Anna</td>
      </tr> -->
    </tbody>
  </table>
  
  <ul class="pagination">
   
    <li class="previous"><a href="#"></a></li>
   
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
  
   
    <li class="next"><a href="#"></a></li>
  </ul>
  
</div>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>	

</body>
</html>