<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int  cnt = Integer.parseInt(request.getParameter("cnt"));
	cnt = cnt%4;
	
	if(cnt==0){
		out.println("<img src='images/six1.jpeg'  width='65' height='62' >");
	}else if(cnt==1){
		out.println("<img src='images/six2.jpg'  width='65' height='62' >");
	}else if(cnt==2){
		out.println("<img src='images/six3.jpg'  width='65' height='62' >");
	}else if(cnt==3){
		out.println("<img src='images/6.jpeg'  width='65' height='62' > ");
	}

%>
