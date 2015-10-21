<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style>
.panel-body {
	height: 560px;
}

textarea {
	resize: none;
}
</style>

</head>

<body>
	<sform:form method="post" action="return freeBoardWrite(this)">

		<div class="writebody">
			<div class="panel panel-info">
				<div class="panel-heading">
					<p>글쓰기</p>
				</div>
			</div>

			<div class="panel-body">
				<div class="form-group">
					<sform:label for="goal" class="col-sm-1" path="">목표금액</sform:label>
					<div class="col-xs-9">
						<sform:input type="text" class=" form-control" id="goal" required
							placeholder="목표금액" path=""></sform:input>
					</div>
				</div><br>
				<div class="form-group">
					<sform:label for="endDate" class="col-sm-1" path="">끝나는 날짜</sform:label>
					<div class="col-xs-9">
						<sform:input type="text" class=" form-control" id="endDate"
							required placeholder="끝나는 날짜" path=""></sform:input>
					</div>
				</div><br>
				<div class="form-group">
					<sform:label for="receive" class="col-sm-1" path="">보상</sform:label>
					<div class="col-xs-9">
						<sform:input type="text" class=" form-control" id="receive"
							required placeholder="보상" path=""></sform:input>
					</div>
				</div>
				<br> <br>
				<sform:textarea name="" id="content" rows="40" cols="100"
					placeholder="내용" path=""></sform:textarea>
			</div>
			<br>

			<div class="panel-footer">
				<sform:button class="btn btn-info">확인</sform:button>
				<%-- 	<a href="<%=request.getContextPath()%>/main" class="btn btn-info">확인</a> --%>
				<a href="/main" class="btn btn-info">취소</a>
			</div>

		</div>

		<script>
			CKEDITOR.replace('content', {
				width : '100%',
				height : '350px',
				'filebrowserUploadUrl' : '/ckeditor/upload.jsp?'
						+ 'realUrl=http://localhost/FunFun/FreeBoard/Write'
						+ '&realDir=c:\\temp\\upload\\'

			});
		</script>
	</sform:form>
</body>
<script type="text/javascript">
	function freeBoardWrite(f) {
		console.log("FreeBoard Write");
		var title = document.getElementById("title");
		var content = document.getElementById("editor");
		console.log(title);
		console.log(content);

	}
</script>
</html>