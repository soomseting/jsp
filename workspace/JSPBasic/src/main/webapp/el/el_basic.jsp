<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL태그는 표현식을 대체함</h3>
		
	${1+2}<br>
	${'hello wolrd'}<br>
	${1 >= 2}<br>
	${1 == 2 }<br>
	${1 == 1 ? '같음' : '다름' }<br>
	${1 < 2 || 1 > 2 }<br>
	${1 < 2 && 1 > 2 }<br>
	${'홍길동' == '홍길동'}<br>
	${'홍길동' eq '홍길동'}<br>
	${true or false}<br>
	${true and false}<br>
	${!true}<br>
	${not true}<br>
	${5 gt 3}<br>
	${5 lt 3}<br>
</body>
</html>