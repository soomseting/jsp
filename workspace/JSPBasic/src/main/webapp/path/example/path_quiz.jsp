<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- request폴더 req_get_ex01페이지로 상대경로 -->
	<a href="../../request/req_get_ex01.jsp">request 상대경로</a><br>
	
	
	<!-- img태그로 html/img 폴더 안에 있는 이미지를 상대경로 -->
	<img alt="#" src="../../html/img/whale.png">img 상대경로<br>
	<!-- img태그로 html/img 폴더 안에 있는 이미지를 절대경로 -->
	<img alt="#" src="/JSPBasic/html/img/whale.png">img 절대경로<br>

	<!-- a링크를 통해서 MyServlet페이지로 이동 상대경로 -->
	<a href="../../melon">MyServlet 상대경로</a><br>
	<!-- a링크를 통해서 MyServlet페이지로 이동 절대경로 -->
	<a href="/JSPBasic/melon">MyServlet절대경로</a>
	
	
</body>
</html>