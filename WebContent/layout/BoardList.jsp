<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.java.beans.*" %>
<%@ page import = "java.util.*" %>
<%	
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int pageSize = 5;
	int blockSize = 3;
	int currentPage = Integer.parseInt(pageNum);
	int startBoard = (currentPage-1)*pageSize+1;   // 첫글
	int endBoard = (currentPage)*pageSize;    //    막글
	int blockNum = (currentPage-1)/blockSize +1;   // 몇번째 블럭인지
	
	int startBlock = (blockNum-1)*blockSize +1;   // 첫 블럭
	int endBlock = blockNum*blockSize;  // 막 블럭
	



	DAO dao = DAO.GetInstance();
	int boardCnt = dao.getBoardCount();   // 게시글 총수
	
	int blockTotal = (boardCnt-1)/pageSize +1 ;   // 블럭 총수
	int blockPageTotal = (blockTotal -1)/blockSize+1; // 블럭페이지 수
	ArrayList<BoardDTO> list = null;
	if(boardCnt!=0){
		list = dao.getAllBoard(startBoard,endBoard);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 게시판 </title>
</head>
<body>
<script type="text/javascript" src="js/script.js"></script>
	<table align= "center" width="700" bgcolor="#898989">
		<tr>
			<td align="center">글 수 : <%=boardCnt %> 개</td>
			<td class="tmp1" align="right" bgcolor="#898989"><a href = "BoardWrite.jsp" align ="right"  >글쓰기</a> &nbsp;<a href = "Main.jsp" align ="right"  >메인페이지</a></td>
		</tr>
	</table>
<% if(boardCnt==0){ %>
글이 존재하지 않습니다.
<%} else { %>
블럭넘은 <%= blockNum %> 블럭 총 수는 <%= blockTotal %> 게시물 총 수는 <%= boardCnt %>
블럭페이지 토탈은 <%= blockPageTotal %>
	<h1><%=currentPage %> <%=startBoard %> <%=endBoard %> <%=startBlock %> <%=endBlock %> 페이지</h1>

	<table border= "1" align = "center" width="700">
		<tr height="30" bgcolor="#898989">
			<td>번   호</td>
			<td>제   목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
	<%for(BoardDTO dto : list){ %>
		<tr height="30" bgcolor="#898989">
			<td><%=dto.getrNum() %></td>
			<td><a href="BoardContent.jsp?bNum=<%=dto.getbNum()%>"><%=dto.getbSubject() %></a></td>
			<td><%=dto.getbWriter() %></td>
			<td><%=dto.getbRegDate() %></td>
			<td><%=dto.getbReadCount() %></td>
			<td><%=dto.getbIp() %></td>
		</tr>

	<%} %>
	
		<tr height="30" bgcolor = "#898989">
		
		
		
		 <td colspan = "6" align ="center">
		 
		 <% if(blockNum!=1) { %>
			<a href="BoardList.jsp?pageNum=<%=blockNum*blockSize -2*blockSize +1%>">[이전]</a>
		
		<%} %>
		 
		 
		 <%for(int i=startBlock;i<endBlock+1;i++) { %>
		 <% if (i>blockTotal) break; %>
		 <a href ="BoardList.jsp?pageNum=<%=i %>">[<%=i %>]</a> 
		 <%} %>
		 
		 <% if(blockNum<blockPageTotal) { %>
			<a href="BoardList.jsp?pageNum=<%=blockNum*blockSize+1 %>">[다음]</a>
		
		<%} %>
		 
		 </td>
		 
		</tr>
	</table>

	

<%} %>

</body>
</html>