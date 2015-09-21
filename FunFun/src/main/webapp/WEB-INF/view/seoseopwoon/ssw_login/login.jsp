<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#login_form{
		background: #F0FFE8;
		
	}
	#kkk{
		
	}

</style>
</head>
<body>
	<jsp:include page="/headerfoot"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	 <nav class="navbar" id=kkk >
<div class="container">

  <form class="form-horizontal" name=fregisterform id=fregisterform method=post onsubmit="return login(this);">
  		
  	<div class="panel-body" id=login_form>
  		<div align="center">
  		<%-- <img src="<%=request.getContextPath()%>/img/Jellyfish.jpg"
					style="width: 100px; height: 100px"></div> --%>
					<br>
					<br>
					<br>
					<br>
					<br>
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID:</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" required placeholder="Enter id">
      </div>
    </div>
     
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="pwd" required placeholder="Enter password">
      </div>
    </div>
    
    <br>
    
    <div class="form-group">        
      <label for="log" class="control-label col-sm-2"></label>
      <div class="col-sm-3">    	
        <input type="submit" id="log" class="form-control btn btn-success" value="login"></input>
      </div>
    </div>
    </div>
    </div>
  </form>

</div>
        </nav>
</body>
<script>
function login(f){
	
	f.action = './main';
	return true;
}

</script>

</html>