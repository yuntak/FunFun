<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/rsc/se/js/HuskyEZCreator.js" ></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "<%=request.getContextPath() %>/rsc/se/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
</script>
</head>
<body>
	<textarea name="ir1" id="ir1" rows="10" cols="100">sdfsdf</textarea>
</body>
</html>