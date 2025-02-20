<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 request.setCharacterEncoding("UTF-8");

 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 String birth = request.getParameter("birth");
 
 String[] inter = request.getParameterValues("inter");
 String[] major = request.getParameterValues("major");
 
 String cty = request.getParameter("cty");
 String txt_area = request.getParameter("txt_area");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=id %><br>
<%=pw %><br>
<%=birth %><br>
<%=Arrays.toString(inter) %><br>
<%=Arrays.toString(major)%><br>

<%=cty %><br>
<%=txt_area %><br>
</body>
</html>