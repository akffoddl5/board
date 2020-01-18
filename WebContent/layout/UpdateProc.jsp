<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.java.beans.*" %>
     <%
    request.setCharacterEncoding("utf-8");
    String bNum = request.getParameter("bNum");
    String id = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String ip = request.getRemoteAddr();
    
    DAO dao = DAO.GetInstance();
    dao.updateBoard(bNum,subject,content);
    response.sendRedirect("BoardList.jsp");
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