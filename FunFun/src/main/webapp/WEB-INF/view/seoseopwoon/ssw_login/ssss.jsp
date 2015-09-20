<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar navbar-default navbar-bskr" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<div class="brand">
					<a href="/"><img src="/layouts/bskr_purity/_var/logo.png"
						width="140" height="35" alt="" id="logokhan"></a>
				</div>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">


					<li class="dropdown"><a href="./?c=info"
						class="dropdown-toggle" data-toggle="dropdown">소개</a>
						<ul class="dropdown-menu">
							<li><a href="./?c=info/about" target="">부트스트랩커는?</a></li>
							<li><a href="./?c=info/kimsq" target="">for 킴스큐 1.2</a></li>

						</ul></li>
					<li class="dropdown"><a href="./?c=lib"
						class="dropdown-toggle" data-toggle="dropdown">라이브러리</a>
						<ul class="dropdown-menu">
							<li><a href="./?c=lib/bootstrap" target="">부트스트랩</a></li>
							<li><a href="./?c=lib/jquery" target="">jQuery</a></li>
							<li><a href="./?c=lib/html5" target="">HTML5/CSS3</a></li>

						</ul></li>
					<li class="dropdown"><a href="./?c=forum"
						class="dropdown-toggle" data-toggle="dropdown">사용자 포럼</a>
						<ul class="dropdown-menu">
							<li><a href="./?c=forum/qna" target="">묻고 답하기</a></li>
							<li><a href="./?c=forum/free" target="">자유게시판</a></li>

						</ul></li>
					<li class="dropdown"><a href="./?c=support"
						class="dropdown-toggle" data-toggle="dropdown">기술지원</a>
						<ul class="dropdown-menu">
							<li><a href="./?c=support/notice" target="">공지사항</a></li>
							<li><a href="./?c=support/faq" target="">FAQ</a></li>
							<li><a href="./?c=support/req" target="">개발의뢰</a></li>

						</ul></li>


				</ul>


				<form action="/" method="get" class="navbar-form navbar-right"
					role="form">
					<input type="hidden" name="r" value="home" /> <input type="hidden"
						name="mod" value="search" />
					<div class="form-group">
						<input type="text" name="keyword"
							class="form-control bskr-font input-sm bskr-search"
							placeholder="통합검색">
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>