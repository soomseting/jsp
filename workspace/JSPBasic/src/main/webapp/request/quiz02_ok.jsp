<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String tl = request.getParameter("tl");
	String wt = request.getParameter("wt");
	Double cm = null;
	Double kg = null;
	Double bmi = null;
	if(wt != null && !wt.isEmpty()){
		try{
			/*Integer.parseInt(wt);*/
			kg = Double.parseDouble(wt);
			cm = Double.parseDouble(tl);
		}catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		bmi = kg/((cm/100)*(cm/100));
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %><br>
<%=tl %><br>
<%=wt %><br>
<%=bmi %>
<%if(bmi >= 25){ %>
	<p>과체중</p>
<%}else if(bmi <=18){ %>
	<p>저체중</p>
<%}else{ %>
	<p>정상</p>
<%} %>
</body>
</html>