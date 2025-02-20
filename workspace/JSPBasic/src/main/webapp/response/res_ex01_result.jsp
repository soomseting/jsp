<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//데이터를 받는 페이지, 자바코드만 필요함 == servlet으로 변경가능
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	int a = Integer.parseInt(age);
	
	//response = 응답할 때 씀.
	//sendRedirect = 페이지 이동할 때 씀.
	if(a >= 20){
		//주류구매 페이지로 이동
		response.sendRedirect("res_ex01_success.jsp");//<- 페이지 이동한다는 뜻
	}else{
		//실패 페이지로 이동
		response.sendRedirect("res_ex01_fail.jsp");
	}	
%>