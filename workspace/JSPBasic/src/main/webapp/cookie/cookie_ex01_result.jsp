<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String yes = request.getParameter("yes");
	
	//id와 pw가 동일하면 로그인 성공
	if(id.equals(pw)){
		
		//쿠키 생성!
		Cookie cookie = new Cookie("userId",id);
		cookie.setMaxAge(1800);
		response.addCookie(cookie);
		
		if(yes != null){
			Cookie ck = new Cookie("yes",id);
			ck.setMaxAge(5600);
			response.addCookie(ck);
		}
		response.sendRedirect("cookie_ex01.jsp");
		/*  response.sendRedirect("cookie_ex01_welcome.jsp");*/
	}else{
		response.sendRedirect("cookie_ex01_fail.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>