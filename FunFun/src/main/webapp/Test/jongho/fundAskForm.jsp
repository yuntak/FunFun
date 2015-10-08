<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script>
function user(f) {

	f.action = '/main';
	return true;
}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h4 align="center">
				<strong>프로젝트 신청양식</strong>
			</h4>
		</div>
	</div>

	<div class="panel-body" align="" style="">

		<p style="font-size: 150%;">Q.무엇을 만들려고 하나요?</p>
		<textarea rows="5" cols="100"></textarea>
		<p style="color: green">(너무 짧지도 길지도 않게 적당한 분량으로 본인의 프로젝트에 대해 자유롭게
			기술해 주세요)</p>

		<p style="font-size: 150%;">Q.만드는데 장애가 되는 요소가 있나요? 있다면 무엇인가요?</p>
		<textarea rows="5" cols="100"></textarea>
		<p style="color: green">(사람들의 참여가 이것을 극복하는데에 어떻게 도움이 될 수 있을까요?)</p>

		<p style="font-size: 150%;">Q.밀어주시는 분들을 위해 어떤 선물을 생각하고 계신가요?</p>
		<textarea rows="5" cols="100"></textarea>
		<p style="color: green">(사람들은 딱 이번 기회를 통해서만 얻을 수 있는 한정된 선물, 또는
			적극적으로 상호작용할 수 있는 경험을 좋아합니다.)</p>


		<div class="form-group">

			<p style="font-size: 150%;">Q.어느정도의 자금이 필요하까요?</p>
			<input style="width: 200px;" class="form-control" type="number" />
		</div>



		<p style="font-size: 150%;">Q.어느 분야로 볼수있을까요?</p>


		<select class="form-control" style="width: 200px;"><option>카테고리선택</option>

			<option value="">만화</option>
			<option value="">사진</option>
			<option value="">소설</option>
			<option value="">기타1</option>
			<option value="">기타2</option></select>


		<p style="color: green">(카테고리선택)</p>

		<p style="font-size: 150%;">Q.운영진에게 남길 연락처를 남겨주세요</p>
		<input class="form-control" style="width: 300px;" type="text">
	</div>

	<div class="panel-footer">
		<button class="btn btn-success">가 입</button>
		<a href=""><button class="btn btn-danger" >취소</button></a>
	</div>

	<br>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>