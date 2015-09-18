<?
header('Content-Type: text/html; charset=UTF-8');
$result = $_POST[result];
$Z = $_POST[Z];
$formnm = $_POST[formnm];
$zipcode1 = $_POST[zipcode1];
$zipcode2 = $_POST[zipcode2];
$address1 = $_POST[address1];
$address2 = $_POST[address2];
$A = $_POST[A];

if (!$result) $result = $_GET[result];
if (!$Z) $Z = $_GET[Z];
if (!$formnm) $formnm = $_GET[formnm];
if (!$zipcode1) $zipcode1 = $_GET[zipcode1];
if (!$zipcode2) $zipcode2 = $_GET[zipcode2];
if (!$address1) $address1 = $_GET[address1];
if (!$address2) $address2 = $_GET[address2];
if (!$A) $A = $_GET[A];

$address1 = iconv("EUC-KR", "UTF-8", $address1);
$address2 = iconv("EUC-KR", "UTF-8", $address2);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<? If ($result == "Y") { ?>
		<script type="text/javascript">
		var zipcode = '<?=$Z?>'.split("-");
		opener.<?=$formnm?>.<?=$zipcode1?>.value=zipcode[0];
		opener.<?=$formnm?>.<?=$zipcode2?>.value=zipcode[1];
		opener.<?=$formnm?>.<?=$address1?>.value='<?=$A?>';
		opener.<?=$formnm?>.<?=$address2?>.focus();
		self.close();
		</script>
	<? } else { ?>
	<noscript><p>현재 브라우저에서는 자바스크립트가 작동되지않아 일부 컨텐츠가 정상적으로 표시되지 않을수 있습니다.</p></noscript>
	<form id="sendfrm" name="sendfrm" method="post" target="zipfrm" action="http://www.kr-address.co.kr/API/popup_utf8/">
	<input type="hidden" name="keys"      value="test" />												<!-- API키를 입력해주세요 -->
	<input type="hidden" name="skin"	  value="Dark" />												<!-- 사이트 특성에 스킨을 지정해주세요 (Red, Dark, White, Blue : 기본 Blue 입니다) 등이 있습니다. -->
	<input type="hidden" name="GuJiBunTF" value="T" />													<!-- 구지번 검색을 사용하고 싶다면 T로 변경해주세요 -->
	<input type="hidden" name="listtype"  value="all" />												<!-- all=(도로명,지번), jb=(지번주소만), rd=(도로명주소만) -->
	<input type="hidden" name="domain"    value="<?=$_SERVER['SERVER_NAME']?>" />						<!-- 사이트도메인(필수) -->
	<input type="hidden" name="SendType"  value="get" />												<!-- 기본 get, post로 설정가능 -->
	<input type="hidden" name="PopUpNm"   value="SearchZipCode" />										<!-- post방식으로 전달받고 싶다면 팝업 이름을 넣어주세요(Post방식일때는 필수) -->
	<input type="hidden" name="port"      value="" />													<!-- 사이트포트(선택) 테스트시 사용-->
	<input type="hidden" name="returnurl" value="<?=$_SERVER['PHP_SELF']?>" />							<!-- 사이트도메인(필수) -->
	<input type="hidden" name="formnm"    value="<?=$formnm?>" />										<!-- 폼이름(필수) -->
	<input type="hidden" name="zipcode1"  value="<?=$zipcode1?>" />										<!-- 우편번호 코드1(필수) -->
	<input type="hidden" name="zipcode2"  value="<?=$zipcode2?>" />										<!-- 우편번호 코드2(필수) -->
	<input type="hidden" name="address1"  value="<?=$address1?>" />										<!-- 주소1(필수) -->
	<input type="hidden" name="address2"  value="<?=$address2?>" />										<!-- 주소2(필수) -->
	</form>
	<iframe id="zipfrm" name="zipfrm" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" style="width:500px;height:600px;overflow:hidden"></iframe>

	<script type="text/javascript">
	window.onload = function() { document.sendfrm.submit(); }
	</script>
	</body>
	<? } ?>
</html>