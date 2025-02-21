<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	/* String yes = ""; */
	Cookie[] arr = request.getCookies();
 	String rememCk = "";
	if(arr != null){
		/* for(int i = 0; i< arr.length;i++){
			if(arr[i].getName().equals("yes")){
				yes = arr[i].getValue();
				break;
			}
		} */
		for(Cookie c : arr){
			if(c.getName().equals("rememCk")){
				rememCk = c.getValue();	
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--  
	로그인에 성공하며 "아이디기록용" 쿠키를 하나 생성
	
	이 페이지에 진입할 때, "아이디기록용" 쿠키가 있다면, input태그에 쿠키값을 미리 찍어주면 됩니다.
	-->



	<form action="cookie_ex01_result.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" value="<%=rememCk %>">
		<input type="password" name="pw" placeholder="비밀번호">
		<input type="submit" value="쿠키로그인">
		<input type="checkbox" name="idCheck">아이디기억하기
	</form>
</body>
</html>