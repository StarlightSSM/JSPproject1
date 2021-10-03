<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1; //기본은 1 페이지를 할당
		// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
		// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
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
				<li class="nav-item"><a class="nav-link" href="post_list.jsp">게시판</a></li>
				<li class="nav-item active"><a class="nav-link" href="about_me.jsp">자기소개</a></li>
			</ul>
		</div>
		</div>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<%
				// 로그인 하지 않았을 때 보여지는 화면
				if(userID == null){
			%>
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
			<%
				// 로그인이 되어 있는 상태에서 보여주는 화면
				}else{
			%>
			<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" style="background:white"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리</a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp" style="background:white">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
		</div>
	</nav>
	<!-- 네비게이션 영역 끝 -->
	<!-- 자기소개 영역 시작 -->
	<section>
    <div class="container mt-4">
        <div class="row">
            <div class="col-lg-8">
                <h1>안녕하세요. 신수민입니다.</h1>
                <br/>
                <p class="lead">
                    음악과 컴퓨터와 게임 및 프로그래밍을 좋아합니다.<br/>
                    낮동안 프로그래밍을 하고, 이후에는 동영상을 보거나 운동을 하거나 책을 보며 여유를 가집니다.
                </p>

                <ul>
                    <li>STUDY EXPERIENCE</li>
                    	<ul>
                        	<li>C progarmming - C언어 입문 및 응용 (2019.03 ~)</li>
                        	<li>Python - 파이썬 및 파이썬을 이용한 게임 만들기 (2020.04 ~)</li>
                    	</ul>
                    <li>SCHOOL STATUS</li>
                    	<ul>
                        	<li>오마초등학교 졸업 (2013.02)</li>
                        	<li>오마중학교 졸업 (2016.02)</li>
                        	<li>일산대화고등학교 졸업 (2019.02)</li>
                        	<li>현재 인하공업전문대학 컴퓨터정보과 재학중</li>
                    	</ul>
                    <li>ADDRESS</li>
                    	<ul>
                        	<li>서울특별시 종로구 통일로 18길 9</li>
                    	</ul>
                </ul>
            </div>
            <div class="col-lg-4">
                <img class="img-fluid" src="images/StarlightSSM.jpg" height="380px" width="270px">
            </div>
        </div>
    </div>
</section>
<!-- 자기소개 영역 끝 부분 -->
<br>
<!-- Portfolio 초반 부분 -->
<section class="bg-light margin-for-footer">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>PORTFOLIO</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="card" data-toggle="modal" data-target="#masterpiece1">
                    <img class="card-img-top" src="images/masterpiece1.png" height="380px" width="300px">
                    <div class="card-body">
                        <h5 class="card-title">타블렛으로 처음 그려본 작품, 내가 직접 만든 캐릭터</h5>
                        <p>타블렛을 노트북에 연결해서 메디방 페인트라는 프로그램을 통해 그려보았습니다.
                           소녀의 발밑 부분에 그려진 점들은 모레가 햇빛에 의해 반짝이는 모습을 표현하고자 하였습니다.</p>
                    </div>
                </div>
                </div>

                <div class="col-lg-4">
                    <div class="card" data-toggle="modal" data-target="#masterpiece2">
                        <img class="card-img-top" src="images/masterpiece2.png" height="380px" width="300px">
                        <div class="card-body">
                            <h5 class="card-title">이 캐릭터를 보면 떠오르는 애니메이션 명작</h5>
                            <p>모작이지만 선만 본따서 따라한 다음 나머지 효과들은 직접 넣어서 만든 작품입니다.
                               이 작품을 보시면 '4월은 너의 거짓말'이라는 애니메이션 명작을 떠올리게 될 것입니다.</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card" data-toggle="modal" data-target="#masterpiece3">
                        <img class="card-img-top" src="images/masterpiece3.jpg" height="380px" width="300px">
                        <div class="card-body">
                            <h5 class="card-title">총을 들고 있는 소녀</h5>
                            <p>한 소녀가 총을 바닥에 세워서 받쳐놓고 무릎을 끓고 있습니다.
                                이 소녀의 상황에 대해 생각해 보는 것도 좋을 듯합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<!-- Portfolio 영역 끝 부분 -->
<!-- Modal Portfolio 자세한 설명 영역 시작-->
<div class="modal fade" id="masterpiece1" tabindex="-1" role="dialog" aria-labelledby="1ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="1ModalLabel">타블렛으로 처음 그려본 작품, 내가 직접 만든 캐릭터</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-7">
                        <img class="img-fluid" src="images/masterpiece1.png" height="430px" width="350px">
                    </div>
                    <div class="col-lg-5">
                        <p>타블렛을 노트북에 연결해서 메디방 페인트라는 프로그램을 통해 그려보았습니다.
                           소녀의 발밑 부분에 그려진 점들은 모레가 햇빛에 의해 반짝이는 모습을 표현하고자 하였습니다.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="masterpiece2" tabindex="-1" role="dialog" aria-labelledby="2ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="2ModalLabel">이 캐릭터를 보면 떠오르는 애니메이션 명작</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-7">
                        <img class="img-fluid" src="images/masterpiece2.png" height="430px" width="350px">
                    </div>
                    <div class="col-lg-5">
                        <p>모작이지만 선만 본따서 따라한 다음 나머지 효과들은 직접 넣어서 만든 작품입니다.
                               이 작품을 보시면 '4월은 너의 거짓말'이라는 애니메이션 명작을 떠올리게 될 것입니다.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="masterpiece3" tabindex="-1" role="dialog" aria-labelledby="3ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="3ModalLabel">총을 들고 무릎끓고 있는 소녀</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-7">
                        <img class="img-fluid" src="images/masterpiece3.jpg" height="430px" width="350px">
                    </div>
                    <div class="col-lg-5">
                        <p>한 소녀가 총을 바닥에 세워서 받쳐놓고 무릎을 끓고 있습니다.
                                이 소녀의 상황에 대해 생각해 보는 것도 좋을 듯합니다.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Portfolio 자세한 설명 영역 끝 부분-->
	<br>
	<!-- Footer-->
	<nav class="navbar navbar-default"> <!-- 네비게이션 -->
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
</html>l>