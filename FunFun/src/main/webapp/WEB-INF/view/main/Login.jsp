<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		#login_form{
		background: #EEF4FF;
		border: 1px solid #BCBC9A;
		
  		border-radius: 15px;
	}
	/* .profile-img
{
    width: 96px;
    height: 96px;   
    border-radius: 50%;
} */

.form-horizontal
{
    width: 400px;
    margin: 0 auto;
}
#loginbody{
	height: 70%;
}
</style>
</head>

<body>
	
	<div id="loginbody">
	 <nav class="navbar" >
<div class="container-fluid">

  <form class="form-horizontal" name=fregisterform id=fregisterform method=post onsubmit="return login(this);">
  		
  	<div class="panel-body" id=login_form>
  
  		<div align="center">
  		<h1>Login</h1>
   	   <%--  <img src="<%=request.getContextPath()%>/img/Jellyfish.jpg"
					class="profile-img"> --%>
					<br>
					<br>
					<br>
					<br>
					<br>
    <div class="form-group">
      <label class="control-label col-sm-3" for="id">ID:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="id" required placeholder="Enter id" required>
      </div>
    </div>
     
    <div class="form-group">
      <label class="control-label col-sm-3" for="pwd">Password:</label>
      <div class="col-sm-8">          
        <input type="password" class="form-control" id="pwd" required placeholder="Enter password">
      </div>
    </div>
    
    <br>
    
    <div class="form-group">        
      <label for="log" class="control-label col-sm-3"></label>
      <div class="col-sm-8">    	
        <input type="submit" id="log" class="form-control btn btn-success" value="login"></input>
      </div>
    </div>   
    </div>
   
    </div>
     </form>
    </div>
    
     <div class="table-responsive">
     </div>

       </nav>
       </div>

</body>
<script>
function login(f){
	
	f.action = './Login';
	return true;
}

</script>

</html>