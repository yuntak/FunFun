<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form name="fregister" method="POST" onsubmit="return reg(this)"
		class="form-horizontal">
		<!-- <div class="bs-example tooltip-demo">
			<div class="bs-example-tooltips">

				<div class="form-horizontal">
					<div class="form-group">
						<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
						<div class="col-lg-10" id="provision">
							<textarea class="form-control" rows="8" style="resize: none"
								readonly="readonly">약관동의</textarea>
							<div class="checkbox">
								<label> <input type="checkbox" id="agree1" name="agree1">
									동의합니다.
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
						<div class="col-lg-10" id="memberInfo">
							<textarea class="form-control" rows="8" style="resize: none"
								readonly="readonly">개인정보의 항목 및 수집방법</textarea>
							<div class="checkbox">
								<label> <input type="checkbox" id="agree2" name="agree2">
									동의합니다.
								</label>
							</div>

							
					<div class="panel-footer">


						<button class="btn btn-success">동의합니다.</button>
						<a href="main" class="btn btn-default">동의하지 않습니다.</a>
					</div>

						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="panel panel-info">
    <div class="panel-heading"><h4><strong>약관동의</strong></h4>
    </div>

<div class="panel-body">
						<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
						
						<div class="col-lg-10" id="provision">
							<textarea class="form-control" rows="8" style="resize: none" readonly="readonly">
약관동의
               </textarea>
							<div class="checkbox">
								<label> <input type="checkbox" id="agree1" name="agree1">
									동의합니다.
								</label>
							</div>
						</div>
					</div>
		<div class="panel-body">			
					<div class="form-group">
						<label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
						<div class="col-lg-10" id="memberInfo">
							<textarea class="form-control" rows="8" style="resize: none"
								readonly="readonly">
개인정보의 항목 및 수집방법
               </textarea>
							<div class="checkbox">
								<label> <input type="checkbox" id="agree2" name="agree2">
									동의합니다.
								</label>
							</div>
							</div>
                            </div>   
							</div>
                         
                        <div class="panel-footer">
            <button class="btn btn-success">동의합니다 </button>
    		 <a href="main" class="btn btn-default">동의하지 않습니다.</a>
     </div>
    </div>
	</form>
</body>
<script type="text/javascript">
	function reg(f) {
		console.log("reg call");
		var agr1 = document.getElementsByName("agree1");
		console.log(agr1[0]);
		if (!agr1[0].checked) {
			alert("회원가입약관에 동의 하지 않았습니다");
			return false;
		}
		var agr2 = document.getElementsByName("agree2");
		console.log(agr2[0]);
		if (!agr2[0].checked) {
			alert("개인정보취급방침에 동의 하지 않았습니다");
			return false;
		}

		alert("회원가입으로 이동");

		f.action = 'SignUp';
		return true;
	}
</script>
</html>