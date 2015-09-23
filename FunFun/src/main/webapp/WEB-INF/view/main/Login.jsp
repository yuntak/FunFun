<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#login_form {
	background: #EEF4FF;
	border: 1px solid #BCBC9A;
	border-radius: 15px;
}

.form-horizontal {
	max-width: 400px;
	margin: 0 auto;
}

#loginbody {
	margin-bottom: 23%;
	height: 70%
}
</style>
</head>

<body>


	<div id="loginbody">
		<nav class="navbar">
			<div class="container-fluid">

				<input type="hidden" value="none" id="logCheckVal">
				<div class="loginbody">
					<br> <br> <br> <br> <br>
					<nav class="navbar">
						<div class="container loginForm">

							<form class="form-horizontal" name=fregisterform id=fregisterform
								method=post>

								<div class="panel-body" id=login_form>

									<div align="center">
										<h1>Login</h1>

										<br> <br> <br> <br> <br>
										<div class="form-group">
											<label class="control-label col-sm-3" for="id">ID:</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="id" required
													placeholder="Enter id" required>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-sm-3" for="pwd">Password:</label>
											<div class="col-sm-8">
												<input type="password" class="form-control" id="pass"
													required placeholder="Enter password">
											</div>
										</div>

										
										<div class="form-group" id="msg_box" style="display: none">
											<label for="log" class="control-label col-sm-3"></label>
											<div class="col-sm-8">
												<div id="wrap"
											>
													<span id="result"
														style="font-size: 15px; font-weight: bold; color:#FF3030;"></span>
												</div>
											</div>
										</div>
										<br>
										<div class="form-group">
											<label for="log" class="control-label col-sm-3"></label>
											<div class="col-sm-8">
												<input type="submit" id="log"
													class="form-control btn btn-success" value="login"></input>
											</div>
										</div>
									</div>

								</div>
							</form>
						</div>

						<div class="table-responsive"></div>
					</nav>
				</div>
			</div>
		</nav>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/test.js"></script>

</body>
<script>
	/* 	function loginCheck(f) {
	 if(logCheck=="true"){
	 console.log(logCheck);
	 alert("1");
	 f.action='./main';
	 return true;
	
	 }
	 else{
	 console.log(logCheck);
	 alert("1");
	 return false;
	 }
	 } */
</script>

</html>