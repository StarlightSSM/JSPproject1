<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
<script type="text/javascript">
	var images = new Array(100);
	for (i = 0; i < 100; i++) {
		images[i] = "https://picsum.photos/seed/random/940/200";
		document.getElementById("images");
	}
</script>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
				<li class="nav-item active"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="about_me.jsp">자기소개</a></li>
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
						aria-expanded="false">회원관리<span class="caret"></span></a>
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
	<!-- Header 영역 시작-->
	<header class="bg-dark py-5">
    	<div class="container px-5">
        	<div class="row gx-5 align-items-center justify-content-center">
            	<div class="col-lg-10 col-xl-7">
                	<div class="my-5 text-center text-xl-start">
                    	<h1 class="display-5 fw-bolder text-white mb-2">제 웹사이트에 오신걸 환영해요!!</h1>
                    	<br>	
                    	<p class="lead fw-normal text-white-50 mb-4">포스트나 댓글을 보고 싶으시다면 스크롤을 내려 더 자세한 내용을 확인하세요.</p>
                    	<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                        	<a class="btn btn-primary btn-lg px-4 me-sm-3 align-center" href="#features">시작하기</a>
                        	<a class="btn btn-outline-light btn-lg px-4 align-center" href="#!">자세히 알아보기</a>
                    	</div>
                	</div>
            	</div>
            	<br>
            	<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://i.gifer.com/7FbM.gif" alt="..."/></div>
        	</div>
    	</div>
	</header>
<!-- Header 영역 끝 -->
<!-- Features section -->
<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to figure out this Website.</h2></div>
            <div class="col-lg-8">
                <div class="row gx-5 row-cols-1 row-cols-md-2">
                    <div class="col mb-5 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                                class="bi bi-collection"></i></div>
                        <h2 class="h3">블로그 포스트</h2>
                        <p class="mb-0">이 포스트들은 미리보기 카드를 가지고 있습니다. 그리고 이 미리보기 카드는 위에 고정된 미리보기 사진과, 포스트 내용을 가지고 있습니다.
                                        그리고 우리는 미리보기 카드를 통해 포스트를 업데이트한 작성자의 정보(이름), 업데이트 날짜 그리고 태그를 알 수 있습니다.</p>
                    </div>
                    <div class="col mb-5 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                                class="bi bi-building"></i></div>
                        <h2 class="h3">이 사이트의 목적 또는 목표</h2>
                        <p class="mb-0">HTML5 canvas를 기반으로 한 모션그래픽을 만들고,
                            만들어 놓은 모션그래픽을 PORTFOLIO에 넣고 나의 웹사이트에 올리는 것이다.
                            또, 다른사람들과 이 정보를 공유하는 것이다.</p>
                    </div>
                    <div class="col mb-5 mb-md-0 h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                                class="bi bi-toggles2"></i></div>
                        <h2 class="h3">이 웹사이트를 이용하는 방법</h2>
                        <p class="mb-0">만약에 포스트를 새로이 작성하거나 댓글을 작성하고 싶다면,
                            내비게이션 바에 있는 회원가입이나 로그인을 거친 다음 이용해주십시오.</p>
                    </div>
                    <div class="col h-100">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                                class="bi bi-toggles2"></i></div>
                        <h2 class="h3">Website Builder status</h2>
                        <p class="mb-0">이름 : Sumin Shin</p>
                        <p class="mb-0">전화번호 : 010 - 2334 - 2649</p>
                        <p class="mb-0">자세히 : <a href="about_me.jsp">개발자의 현황을 살펴보세요.</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Features 영역 끝 -->
<br>
<!-- Testimonial 영역 시작 -->
<div class="jumbotron">
<div class="py-5 bg-light">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-15 col-xl-7">
                <div class="text-center">
                <h2 class="h2">&lt;오늘의 명언&gt;</h2>
                    <div class="fs-4 mb-4 fst-italic"><h2 class="h3">Don't worry about failures,
                        worry about the chances you miss when you don't even try.</h2>
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..."/>
                        <div class="fw-bold">
                            Jack Canfield
                            <span class="fw-bold text-primary mx-1">/</span>
                            an American author, motivational speaker
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Testimonial 명언 영억 끝 -->
<!-- Blog post 영역 시작 -->
<div class="py-5">
<div class="jumbotron">
    <div class="container" style="align:center">
    <div class="card-header" style="align:center">
    	<h1 class="fw-bolder"></h1>
    	<div class="card border-0 shadow rounded-3 overflow-hidden">
    		<div class="card-body">
			<div class="row">
				<div class="col-lg-15">
				<div class="p-4 p-md-5">
					<script>
						var images = new Array(100);
						images[i] = "https://picsum.photos/seed/random/1050/200";
						document.getElementById("images");
						document.write('<img src="' + images[i] + '" border=0>');
					</script>
                		<div class="h2 fw-bolder"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
                        <div id="post-area">
                    <div>&nbsp;&nbsp;&nbsp;&nbsp;<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
                    </div>
                    <br>
                    <br>
                    <div class="card-footer text-muted">
                    	Posted on <%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시 " + bbs.getBbsDate().substring(14, 16) + "분 " %> by
                    	<a href="#"><%= bbs.getUserID() %></a></div>
                    <br>
                    <br>
                    <a href="fileDownload.jsp">파일 다운로드 페이지</a>
                    <br>
                    <br>
                    <a href="post_list.jsp" class="btn btn-primary">목록</a>
                    <%
						if (userID != null && userID.equals(bbs.getUserID())) {
					%>
						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
					<%
						}
					%>
                    <!-- 글쓰기 버튼 생성 -->
					<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
                        </div>
                        <br>
                    	<br>
					</div>
				</div>
			</div>
		</div>
	</div>
   </div>
  </div>
</div>
	<!-- 게시판 메인 페이지 영역 끝 -->
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
                        <a class="link-light small" href="#" data-toggle="modal" data-target="#contactModal" style="color:white">Contact Website Builder</a>
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