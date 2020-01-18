<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.java.beans.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String ip = request.getRemoteAddr();
    
    DAO dao = DAO.GetInstance();
    boolean check = dao.insertBoard(id, subject, content,ip);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% if(check) { %>
<script>
alert("성공적으로 등록되었습니다.");

</script>
<%response.sendRedirect("BoardList.jsp"); %>
<%} else { %>
<script>
alert("등록에 실패하였습니다.");
</script>

<%} %>


</body>
</html>