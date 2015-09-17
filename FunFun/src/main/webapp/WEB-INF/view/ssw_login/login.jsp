<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.account-wall
{
    margin-top: 150px;
    padding: 500px 500px 500px 500px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3); 
    width: 70px;
    height: 70px; 
 
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
	 <nav class="navbar navbar-primary">
<div class="container">
  <form class="form-horizontal" role="form" name=fregisterform id=fregisterform method=post onsubmit="return login(this);">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="id" required placeholder="Enter id">
      </div>
    </div>
     
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd" required placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-6 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox"><small>ID기억</small></label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Login</button>
      </div>
    </div>
  </form>

</div>
        </nav>
</body>
<script>
function login(f){
	
	f.action = './abc';
	return true;
}

</script>

</html>