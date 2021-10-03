<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
			int pageNumber = 1; //기본은 1 페이지를 할당
			// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
			// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
			if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			
			ArrayList<Bbs> fileList = new BbsDAO().getList(pageNumber);
			
			for (Bbs bbs : fileList) {
				out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
					java.net.URLEncoder.encode(bbs.getFileRealName(), "UTF-8") + "\">" +
						bbs.getFileName() + "(다운로드 횟수: " + bbs.getDownloadCount() + ")</a><br>");
			}
		}
	%>
</body>
</html>