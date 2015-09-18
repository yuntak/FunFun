<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<html>
	<head>
		<title> 우편번호 검색 </title>
		<meta content="KR-ADDRESS" name="author">
		<meta content="2013 KR-ADDRESS" name="copyright">
		<meta content="도로명, API, JSon, 팝업, 우편번호, 새주소, 우편번호, 주소, 검색, 주소찾기" name="keywords">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	</head>
	<style type="text/css">
	*{margin:0;padding:0;}
	html,body{width:100%; height:100%; background:#ffffff;}
	html{overflow-y:none;}
	</style>

	<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String result = (String)request.getParameter("result");
	if(result == null || "null".equals(result)){  result = "N";	}
	if("Y".equals(result)) { 
		String address = new String(request.getParameter("A").getBytes("iso-8859-1"), "UTF-8");
		String zipcode[] = request.getParameter("Z").split("-");
	%>
		<script type="text/javascript">
		opener.<%=request.getParameter("formnm")%>.<%=request.getParameter("zipcode1")%>.value="<%=zipcode[0]%>";
		opener.<%=request.getParameter("formnm")%>.<%=request.getParameter("zipcode2")%>.value="<%=zipcode[1]%>";
		opener.<%=request.getParameter("formnm")%>.<%=request.getParameter("address1")%>.value="<%=address%>";
		opener.<%=request.getParameter("formnm")%>.<%=request.getParameter("address2")%>.focus();
		self.close();
		</script>
	<% } else { %>
	<noscript><p>íì¬ ë¸ë¼ì°ì ììë ìë°ì¤í¬ë¦½í¸ê° ìëëì§ìì ì¼ë¶ ì»¨íì¸ ê° ì ìì ì¼ë¡ íìëì§ ììì ììµëë¤.</p></noscript>
	<form id="sendfrm" name="sendfrm" method="post" target="zipfrm" action="http://www.kr-address.co.kr/API/popup_utf8/">
	<input type="hidden" name="keys"      value="test" />																				<!-- APIí¤ë¥¼ ìë ¥í´ì£¼ì¸ì -->
	<input type="hidden" name="skin"	  value="red" />																				<!-- ì¬ì´í¸ í¹ì±ì ì¤í¨ì ì§ì í´ì£¼ì¸ì (Red, Dark, White, Blue : ê¸°ë³¸ Blue ìëë¤) ë±ì´ ììµëë¤. -->
	<input type="hidden" name="GuJiBunTF" value="T" />																					<!-- êµ¬ì§ë² ê²ìì ì¬ì©íê³  ì¶ë¤ë©´ Të¡ ë³ê²½í´ì£¼ì¸ì -->
	<input type="hidden" name="listtype"  value="all" />																				<!-- all=(ëë¡ëª,ì§ë²), jb=(ì§ë²ì£¼ìë§), rd=(ëë¡ëªì£¼ìë§) -->
	<input type="hidden" name="domain"    value="<%=request.getServerName()%>" />														<!-- ì¬ì´í¸ëë©ì¸(íì) -->
	<input type="hidden" name="SendType"  value="get" />																				<!-- ê¸°ë³¸ get, postë¡ ì¤ì ê°ë¥ -->
	<input type="hidden" name="PopUpNm"   value="SearchZipCode" />																		<!-- postë°©ìì¼ë¡ ì ë¬ë°ê³  ì¶ë¤ë©´ íì ì´ë¦ì ë£ì´ì£¼ì¸ì(Postë°©ìì¼ëë íì) -->
	<input type="hidden" name="port"      value="" />																					<!-- ì¬ì´í¸í¬í¸(ì í) íì¤í¸ì ì¬ì©-->
	<input type="hidden" name="returnurl" value="<%=request.getRequestURI()%>" />														<!-- ì¬ì´í¸ëë©ì¸(íì) <%=request.getRequestURI()%>-->
	<input type="hidden" name="formnm"    value="<%=request.getParameter("formnm")%>" />												<!-- í¼ì´ë¦(íì) -->
	<input type="hidden" name="zipcode1"  value="<%=request.getParameter("zipcode1")%>" />												<!-- ì°í¸ë²í¸ ì½ë1(íì) -->
	<input type="hidden" name="zipcode2"  value="<%=request.getParameter("zipcode2")%>" />												<!-- ì°í¸ë²í¸ ì½ë2(íì) -->
	<input type="hidden" name="address1"  value="<%=request.getParameter("address1")%>" />												<!-- ì£¼ì1(íì) -->
	<input type="hidden" name="address2"  value="<%=request.getParameter("address2")%>" />												<!-- ì£¼ì2(íì) -->
	</form>
	<iframe id="zipfrm" name="zipfrm" width="100%" height="100%" scrolling="no" frameborder="0" marginheight="0" marginwidth="0"></iframe>

	<script type="text/javascript">
	window.onload = function() { document.sendfrm.submit(); }
	</script>
	</body>
	<% } %>
</html>