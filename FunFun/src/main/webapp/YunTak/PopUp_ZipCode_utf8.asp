<%@language="vbscript" codepage="65001"%>
<%Response.Charset = "utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<html>
	<head>
		<title> 우편번호 검색 </title>
		<meta content="KR-ADDRESS" name="author">
		<meta content="2013 KR-ADDRESS" name="copyright">
		<meta content="도로명, API, JSon, 팝업, 우편번호, 새주소, 우편번호, 주소, 검색, 주소찾기" name="keywords">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	</head>
	<style type="text/css">
	*{margin:0;padding:0;}
	html,body{width:100%; height:100%; background:#ffffff;}
	html{overflow-y:none;}
	</style>

	<body>
	<% If Request("result")="Y" Then %>
	<script type="text/javascript">
	var zipcode = '<%=Request("Z")%>'.split("-");
	opener.<%=Request("formnm")%>.<%=Request("zipcode1")%>.value=zipcode[0];
	opener.<%=Request("formnm")%>.<%=Request("zipcode2")%>.value=zipcode[1];
	opener.<%=Request("formnm")%>.<%=Request("address1")%>.value='<%=Request("A")%>';
	opener.<%=Request("formnm")%>.<%=Request("address2")%>.focus();
	self.close();
	</script>
	<% Else %>
	<noscript><p>현재 브라우저에서는 자바스크립트가 작동되지않아 일부 컨텐츠가 정상적으로 표시되지 않을수 있습니다.</p></noscript>
	<form id="sendfrm" name="sendfrm" method="post" target="zipfrm" action="http://www.kr-address.co.kr/API/popup_utf8/">
	<input type="hidden" name="keys"      value="test" />																	<!-- API키를 입력해주세요 -->
	<input type="hidden" name="skin"	  value="Dark" />																	<!-- 사이트 특성에 스킨을 지정해주세요 (Red, Dark, White, Blue : 기본 Blue 입니다) 등이 있습니다. -->
	<input type="hidden" name="GuJiBunTF" value="T" />																		<!-- 구지번 검색을 사용하고 싶다면 T로 변경해주세요 -->
	<input type="hidden" name="listtype"  value="all" />																	<!-- all=(도로명,지번), jb=(지번주소만), rd=(도로명주소만) -->
	<input type="hidden" name="domain"    value="<%=Request.ServerVariables("server_name")%>" />							<!-- 사이트도메인(필수) -->
	<input type="hidden" name="SendType"  value="get" />																	<!-- 기본 get, post로 설정가능 -->
	<input type="hidden" name="PopUpNm"   value="SearchZipCode" />															<!-- post방식으로 전달받고 싶다면 팝업 이름을 넣어주세요(Post방식일때는 필수) -->
	<input type="hidden" name="port"      value="" />																		<!-- 사이트포트(선택) 테스트시 사용-->
	<input type="hidden" name="returnurl" value="<%=Request.ServerVariables("url")%>" />									<!-- 사이트도메인(필수) -->
	<input type="hidden" name="formnm"    value="<%=Request("formnm")%>" />													<!-- 폼이름(필수) -->
	<input type="hidden" name="zipcode1"  value="<%=Request("zipcode1")%>" />												<!-- 우편번호 코드1(필수) -->
	<input type="hidden" name="zipcode2"  value="<%=Request("zipcode2")%>" />												<!-- 우편번호 코드2(필수) -->
	<input type="hidden" name="address1"  value="<%=Request("address1")%>" />												<!-- 주소1(필수) -->
	<input type="hidden" name="address2"  value="<%=Request("address2")%>" />												<!-- 주소2(필수) -->
	</form>
	<iframe id="zipfrm" name="zipfrm" width="100%" height="100%" scrolling="no" frameborder="0" marginheight="0" marginwidth="0"></iframe>

	<script type="text/javascript">
	window.onload = function() { document.sendfrm.submit(); }
	</script>
	</body>
	<% End If %>
</html>