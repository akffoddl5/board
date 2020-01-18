<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.java.beans.*"  %>
    <%@ page import = "java.util.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
    <%
    DAO dao = DAO.GetInstance();
   	ArrayList<BoardDTO> list = dao.getAllBoard(1, 5);
   	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지의 전체구조</title>
<link rel="stylesheet" type="text/css" href="css/default2.css?after">
<script src="../js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	var cntValue = 0 ;
 $("#ajaxx").click(function(){
	cntValue= cntValue+1;
	 $.ajax({
			type:"POST",
			url:"ajaxResponse.jsp",
			data : {cnt : cntValue},
			success: function(data){
				$("#logo").html(data);
			}
		});
 })
});

</script>
</head>
<body>
<script type="text/javascript" src="js/script.js"></script>
<div id="wrap">
	<!-- 헤더파일 들어가는 곳 -->
	<header>
		<div id="login">
		<%if(session.getAttribute("id")==null) { %>
			<a href="Login.jsp">Login</a> | <a href="Join.jsp">Join</a>
		<%} else{ %>
			<%=session.getAttribute("id") %>님 환영합니다. <a href="Modify.jsp">정보수정</a> | <a href="Delete.jsp">회원탈퇴</a> | <a href="Logout.jsp">로그아웃</a>
		<%} %>
		</div>
		<div class="clear"></div>
		
		
			<div id="logo">
				<img alt="Javaline Web" src="images/6.jpeg" width="65" height="62">
			</div>
			<nav id="top_menu">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Who is 용석?</a></li>
					<li><a href="#">Member</a></li>
					<li><a href="#">Board</a></li>
					<li><a href="#">Ajax Board</a></li>
				</ul>
				<nav></nav>

				<!-- 위의 메인 메뉴 들어가는 곳 -->
			</nav>
	</header>
	<!-- 그림파일 들어가는 곳 없어도 되지만 한번 넣어보자 -->
	<div id="sub_img">
	<video autoplay loop muted>
		<source src="./images/fashionShow.mp4" type="video/mp4" >
	</video>
	
	</div>
	<!-- 왼쪽의 서브메뉴가 들어가는 곳 -->
	
	<nav id="sub_menu">
		<ul>
			<li><a href="#" onclick="ddos()">Login</a></li>
			<li><a href="#">Join Us</a></li>
			<li><a href="BoardList.jsp">Board</a></li>
			<li><a href="#" id="ajaxx">Ajax Board</a></li>
		</ul>

	</nav>
	<div>
	<!-- 실제 내용 콘텐츠가 들어가는 곳 -->
	<article id="contents">
		<h1>최근 글</h1>
		<table id="board">
			<tr>
				<th class="tno">NO.</th>
				<th class="twriter">Writer</th>
				<th class="ttitle">Title</th>
				<th class="tread">Read</th>
				<th class="tdate">Date</th>
			</tr>
			<% for(BoardDTO bdto : list){  %>
			<tr>
				<td><%=bdto.getrNum() %> th</td>
				<td><%=bdto.getbWriter() %></td>
				<td class="left"><%=bdto.getbContent() %></td>
				<td><%=bdto.getbReadCount() %></td>
				<td><%=bdto.getbRegDate() %></td>
			</tr>
			<%} %>
			
			
		</table>
	</article>
	</div>
	<div class="clear"></div>

	<!-- 푸터가 들어가는 곳 -->
	<footer>
		<hr>
		<div id="copy">
			All contents copyright 2019 YongSeok Kim. all rights reserved<br>
			Contact mail : akffoddl5@naver.com Tel : 010-8798-1376
		</div>
		<div id="social">
			<img src="images/facebook.gif" width="33" height="33" alt="Facdebook">
			<img src="images/twitter.gif" width="33" height="34" alt="Twitter">
		</div>
	</footer>
</div>
</body>
</html>