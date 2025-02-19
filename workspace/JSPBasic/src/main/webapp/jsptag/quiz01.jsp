<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% List<String> list = Arrays.asList("a","b","c","d"); %>

	<h3>구구단 3단을 out.println으로 출력 세로 출력</h3>
	<%
	for(int i = 1; i<10; i++){
		out.println("3 x "+ i + " = " + i*3); 
	%>
	<br>
	<% } %>
	
	<h3>구구단 2~9단 까지 표현식을 이용해서 세로 출력</h3>
	<% for(int i = 2; i<10; i++){ %>
	<% 	for(int j = 1; j<10; j++){ %>
	<% 		out.println(i + " x " + j + " = " + i*j);%>
		<%-- <%=i %> x <%= j %> = <%=i*j %> --%>
	<br>
	<% }}%>
	
	<h3>select태그에 list의 값을 option태그 반복문으로 생성</h3>
	<select>
	<%for(int i = 0; i <list.size(); i++){ %>
		<option><%= list.get(i) %>
		</option>
	<%} %>
	
	</select>
	<h3>tr을 반복으로 10회 출력</h3>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
		<% for(int i = 0; i<10; i++){ %>
		<tr>
			<td>1</td>
			<!--<td><%--<%=i %>--%></td>-->
			<td>홍길동</td>
			<td>서울시</td>
		</tr>
		
		<% } %>
	</table>
	
	
		
</body>
</html>