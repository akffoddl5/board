<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.java.beans.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    String id =request.getParameter("id");
    String pw =request.getParameter("pass");
    DAO dao = DAO.GetInstance();
    int check = dao.loginService(id, pw);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(check==0) { %>
 <script>
 	alert("아이디가 존재 하지 않습니다.");
 	history.go(-1);
 </script>
<%}else if(check==-1) { %>
 <script>
 	alert("비밀번호가 틀렸습니다.");
 	history.go(-1);
 </script>
<%}else if(check==1){ %>
<%
session.setAttribute("id",id);
response.sendRedirect("Main.jsp");
%>
<%} %>

</body>
</html>