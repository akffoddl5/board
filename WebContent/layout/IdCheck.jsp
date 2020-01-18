<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.beans.*" %>
<%
String id = request.getParameter("id");
DAO dao = DAO.GetInstance();
boolean check = dao.idCheck(id);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/script.js"></script>
<h1>id check</h1>
<%if(check){ %>
<a href="#" onclick="idCheck2()">사용 가능한 아이디 입니다.</a>
<%} else { %>
<a href="#" onclick="self.close()">이미 존재하는 아이디 입니다.</a>
<%} %>
</body>
</html>