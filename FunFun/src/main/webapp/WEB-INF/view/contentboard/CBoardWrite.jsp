<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
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
<sform:form  method="post" onsubmit="return freeBoardWrite(this) " modelAttribute="Fboard" >
   
   <div class="panel panel-info">
   <div class="panel-heading">
   <p>글쓰기</p>
   </div>
   </div>
   
   <div class="panel-body">
   <div class="form-group">
      <sform:label for="title" class="col-sm-1" path="title" >제목</sform:label>
      <div class="col-xs-9">
      <sform:input class=" form-control" id="title"  placeholder="제목입력란" value="" path="title" />
      </div>
   </div>
   <br>
   <br>
   
   <sform:textarea name="mycontent" id="content" rows="40" cols="100" placeholder="내용" path="fcontext" value=""></sform:textarea>
   </div>
   <br>
   <sform:hidden value="11" path="boardCode"/>
   <sform:hidden value="${FunFunUser.id }" path="userId"/>
   <sform:hidden value="${FunFunUser.nickname }" path="nickName"/>
   <div class="panel-footer">
  <div>
   <sform:button class="btn btn-info">확인</sform:button>
   <a href="<%=request.getContextPath() %>/FreeBoard" class="btn btn-info" style="margin-bottom:5mm;">취소</a>
 
<%--    <a href="<%=request.getContextPath()%>/main" class="btn btn-info">확인</a> --%>
  
   </div>
   
   </div>

	<script>CKEDITOR.replace('content',{
	 width:'100%',
     height:'350px',
     'filebrowserUploadUrl':'/ckeditor/upload.jsp?'
     +'realUrl=http://localhost/main'
     +'&realDir=/main'
} );
	</script>
	<br>
	</sform:form> 
	<div class="panel-footer">
	</div>


</body>
<script type="text/javascript">
function freeBoardWrite(f){

	console.log("FreeBoard Write");
	var title=document.getElementById("title").value;
	
	var content = CKEDITOR.instances.content.getData();
	console.log(title);
	console.log(content);
	if(title==""){
		alert("제목을 입력하세요.");
		
		return false;
	}
	if(content==""){
		alert("내용을 입력하세요.");
		
		return false;
	}
	
	//f.action("");
	f.action = 'FreeBoardWrite';
	return true;
}
</script>
<script type="text/javascript">
</script>
</html>