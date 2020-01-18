<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.java.beans.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberDTO" class="com.java.beans.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="memberDTO"/>
    <%
   	System.out.println(memberDTO.getAddress1());
    System.out.println(memberDTO.getEmail());
    System.out.println(memberDTO.getAddress2());
	
    DAO dao = DAO.GetInstance();
    boolean join = dao.joinService(memberDTO);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% if(join){ %>

<%response.sendRedirect("Login.jsp"); %>

<%}else { %>
<script>
alert("회원가입 실패");
</script>
<a href="Login.jsp">로그인하러 가기</a><br>
<a href="Join.jsp">다시 회원가입 하기</a>
<%} %>
</body>
</html>