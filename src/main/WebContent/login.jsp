<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- 네비게이션 -->
	<div class="container">
		<div class="navbar-header"> 	<!-- 네비게이션 상단 부분 -->
		<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
		<a class="navbar-brand" href="main.jsp" style="color:black"><img src="images/logo_2.PNG" style="width:110px"></a>
			<br><br><br><br>
			<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed" style="background:grey"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
				<span class="icon-bar" style="color:white"></span>
				<span class="icon-bar" style="color:white"></span>
				<span class="icon-bar" style="color:white"></span>
			</button>
			</div>
			<br>
			<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
			<div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-0 mb-lg-0 align-center">
				<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
				<li class="nav-item active"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="about_me.jsp">자기소개</a></li>
			</ul>
		</div>
		</div>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" style="background:white"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기</a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="login.jsp" style="background:white">로그인</a></li>
						<li><a href="join.jsp" style="background:white">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
		</div>
	</nav>
	<!-- 네비게이션 영역 끝 -->
	<!-- 로그인 양식 -->
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-4"></div>
		<div class="col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>	
	</div>
	<!-- Footer-->
	<nav class="navbar navbar-default fixed-bottom"> <!-- 네비게이션 -->
		<div class="navbar-footer">
        <footer class="bg-dark py-4 mt-auto fixed-bottom" style="padding-bottom:20px">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Sumin Shin 2021</div></div>
                    <div class="col-auto">
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" style="color:white" href="#" data-toggle="modal" data-target="#contactModal">Contact Website Builder</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</nav>
<!-- Modal -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contactModalLabel"><i class="bi bi-phone-fill"></i>Contact Website Builder</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        Url:
                        <a role="button" class="btn btn-outline-dark btn-block btn-sm" style="border:1px solid black" href="https://www.instagram.com/soom0211/">&nbsp&nbsp Instagram</a>
                        <br>
                        Email: <a role="button" class="btn btn-outline-dark btn-block btn-sm" style="border:1px solid black">suminshin211@gmail.com</a>
                    </div>
                    <br>
                    <div class="col-md-6">
                        Phone:
                        <a role="button" class="btn btn-outline-dark btn-block btn-sm" style="border:1px solid black">010 - 2334 - 2649</a>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>