<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.java.beans.*"%>

<%
	String bNum = request.getParameter("bNum");
	BoardDTO boardDTO = null;
	if (bNum != null) {
		DAO dao = DAO.GetInstance();
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
	<h1>글 수정</h1>
	<form method="post" action="UpdateProc.jsp">
		<table>

			<tr>
			
				<td><input type="hidden" name="bNum" value=<%=bNum %>></td>
				<td><input type="hidden" name="writer"
					value=<%=session.getAttribute("id")%>></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value=<%=boardDTO.getbSubject() %>></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" value=<%=boardDTO.getbContent()%>></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="글 수정"> <input type="reset" value="다시작성"> <input
					type="button" value="글 목록"
					onclick="window.location='BoardList.jsp'"></td>
			</tr>

		</table>


	</form>
</body>
</html>