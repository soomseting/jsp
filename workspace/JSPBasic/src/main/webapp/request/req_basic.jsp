<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String uri = request.getRequestURI(); 
 	StringBuffer url = request.getRequestURL();
 	String conPath = request.getContextPath(); //컨택스트패스 - 프로젝트구분단위
 	String address = request.getRemoteAddr();//원격접속 주소
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	uri:<%=uri %><%-- port번호 뺀 경로값 --%>
	url:<%=url %><%-- 전체주소 --%>
	컨택스트패스:<%=conPath %><%-- 프로젝트를 식별하게 될 이름 --%>
	상대방의접속주소:<%=address %><%-- 전체주소 --%>

</body>
</html>