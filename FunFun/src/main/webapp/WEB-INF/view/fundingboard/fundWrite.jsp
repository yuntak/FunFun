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

td {
	width: 800px;
}

textarea {
	resize: none;
}
</style>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('context');
	};
</script>

</head>

<body>
	<sform:form method="post" onsubmit="return WriteSuccess(this)" modelAttribute="Funding">
		<div class="writebody">
			<div class="panel panel-info">
				<div class="panel-heading">
					<p>글쓰기</p>
				</div>
			</div>

			<div class="panel-body">
				<table>
					<tr>
						<td><div class="col-xs-9">
								<sform:label for="title" class="col-sm-3" path="title">제목</sform:label>
								<sform:input class=" form-control" id="title"
									placeholder="제목입력란" value="" path="title" />
							</div></td>
					</tr>
					<tr>
						<td><div class="col-xs-9">
								<sform:label for="goal" class="col-sm-3" path="goal">목표금액</sform:label>
								<sform:input class=" form-control" id="goal" placeholder="목표금액"
									value="" path="goal" />
							</div></td>
					</tr>
					<tr>
						<td><div class="col-xs-9">
								<sform:label for="receive" class="col-sm-3" path="receive">보상</sform:label>
								<sform:input class=" form-control" id="receive" placeholder="보상"
									value="" path="receive" />
							</div> <br></td>
					</tr>
					<tr>
						<td><div class="col-xs-9">
								<sform:label for="endDate" class="col-sm-3" path="endDate">끝나는 날짜</sform:label>
								<sform:input class=" form-control" id="endDate"
									placeholder="끝나는 날짜" value="" path="endDate" />
							</div> <br></td>
					</tr>
				</table>
				<br> <br>

				<sform:textarea rows="40" cols="100" placeholder="내용" path="context"
					value="" />

			</div>
			<br> <br> <br>
			<sform:hidden value="${FunFunUser.id }" path="userId" />
			<sform:hidden value="${FunFunUser.nickname }" path="nickName" />
			<div class="panel-footer">
			<sform:button class="btn btn-info">확인
				<%-- <a href="<%=request.getContextPath()%>/FundingBoard/WriteSuccess" class="btn btn-info">확인</a> --%>
				</sform:button>
				<%-- <a href="<%=request.getContextPath()%>/main" class="btn btn-info">확인</a> --%>
				<a href="<%=request.getContextPath()%>/FundingBoard"
					class="btn btn-info">취소</a>
			</div>
		</div>


	</sform:form>
</body>
<script type="text/javascript">
	function fundingWrite(f) {
		console.log("Funding Write");
		var title = document.getElementById("title").value;
		var content = document.getElementById("context").value;
		console.log(title);
		console.log(context);
		if (title == "") {
			alert("제목을 입력하세요.");

			return false;
		}
		if (context == "") {
			alert("내용을 입력하세요.");

			return false;
		}

		f.action = 'WriteStart';
		return true;

	}
</script>
</html>

