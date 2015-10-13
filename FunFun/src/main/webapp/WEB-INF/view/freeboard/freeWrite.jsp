<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src ="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style>
	.panel-body{
		height:560px;
	}
	
 textarea { resize: none; }
</style>

</head>

<body>
	<div class="writebody">
	<div class="panel panel-info">
	<div class="panel-heading">
	<p>글쓰기</p>
	</div>
	</div>
	
	<div class="panel-body">
	<div class="form-group">
		<label for="title" class="col-sm-1" >제목</label>
		<div class="col-xs-9">
		<input type="text" class=" form-control" id="title" required placeholder="제목입력란">
		</div>
	</div>
	<br>
	<br>
	<textarea name="" id="editor" rows="40" cols="100">내용</textarea>
	</div>
	<br>
	
	<div class="panel-footer">
	<a href="<%=request.getContextPath()%>/main" class="btn btn-info">확인</a>
	<a href="/main" class="btn btn-info">취소</a>
	</div>
	
	</div>

<script>CKEDITOR.replace('editor',{
	 width:'100%',
     height:'350px',
     filebrowserImageUploadUrl: '/community/imageUpload' 
    
} );


</script>


</body>
</html>