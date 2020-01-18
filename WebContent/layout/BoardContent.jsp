<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.java.beans.*" %>
    <%
    
    String bNum = request.getParameter("bNum");
    BoardDTO boardDTO = null;
    if(bNum!=null){
    	DAO dao = DAO.GetInstance();
    	dao.upCountBoard(bNum);
    	boardDTO = dao.getBoard(Integer.parseInt(bNum));
    }
    
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/script.js"></script>
<h1>content</h1>
<hr color="red">
<table>
	<tr>
	<td>글 번호</td><td><%=boardDTO.getbNum() %></td>
	</tr>
	<tr>
	<td>조회수</td><td><%=boardDTO.getbReadCount() %></td>
	</tr>
	<tr>
	<td>작성자</td><td><%=boardDTO.getbWriter() %></td>
	</tr>
	<tr>
	<td>작성일</td><td><%=boardDTO.getbRegDate() %></td>
	</tr>
	<tr>
	<td>글 제목</td><td><%=boardDTO.getbSubject() %></td>
	</tr>
	<tr>
	<td>글 내용</td><td><%=boardDTO.getbContent() %></td>
	</tr>
	<tr>
	<td><input type="button" value="글 수정" onclick="boardUpdate('<%=boardDTO.getbWriter() %>','<%=session.getAttribute("id") %>')" >
	<input type="button" value="글 삭제" onclick="#" >
	<input type="button" value="글 목록" onclick="window.location='BoardList.jsp'" >
	
	</td>
	</tr>
	

</table>


</body>
</html>