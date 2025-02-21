<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 국어, 수학점수의 평균을 구합니다.
	평균이 60점 이상이면 success페이지로 이동해서
	
	"name 님의 평균 xx점 합격입니다" 출력합니다.
	
	평균이 60미만이면 fail페이지로 이동해서
	"name 님의 평균 xx점 불합격입니다" 출력합니다.
	
	조건 - 세션을 사용하지 않음
	*/
	request.setCharacterEncoding("UTF-8");
	String korean = request.getParameter("korean");
	String math = request.getParameter("math");
	String name = request.getParameter("name");
	
	int n1 = Integer.parseInt(korean);
	int n2 = Integer.parseInt(math);
	double avg = (n1+n2)/2.0;
	
	//다음페이지에서 name, avg값이 필요함
	
	request.setAttribute("name", name);
	request.setAttribute("avg", avg);
	if(avg >= 60){
		request.getRequestDispatcher("quiz01_success.jsp").forward(request,response);
	}else{
		request.getRequestDispatcher("quiz01_fail.jsp").forward(request,response);	
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