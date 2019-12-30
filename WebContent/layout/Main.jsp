<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지의 전체구조</title>
<link rel="stylesheet" type="text/css" href="css/default2.css?after">
</head>
<body>
<div id="wrap">
	<!-- 헤더파일 들어가는 곳 -->
	<header>
		<div id="login">
			<a href="Login.jsp">Login</a> | <a href="Join.jsp">Join</a>
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
			<li><a href="#">Login</a>
			<li><a href="#">Join Us</a>
			<li><a href="#">Board</a>
			<li><a href="#">Ajax Board</a>
		</ul>

	</nav>
	<!-- 실제 내용 콘텐츠가 들어가는 곳 -->
	<article id="contents">
		<h1>Board</h1>
		<table id="board">
			<tr>
				<th class="tno">NO.</th>
				<th class="twriter">Writer</th>
				<th class="ttitle">Title</th>
				<th class="tread">Read</th>
				<th class="tdate">Date</th>
			</tr>
			<tr>
				<td>&nbsp</td>
				<td>&nbsp</td>
				<td class="left">&nbsp</td>
				<td>&nbsp</td>
				<td>&nbsp</td>
			</tr>
		</table>
	</article>
	
	<div class="clear"></div>

	<!-- 푸터가 들어가는 곳 -->
	<footer>
		<hr>
		<div id="copy">
			All contents copyright 2015 Tommy. Lee. all rights reserved<br>
			Contact mail : stdio@hanmail.net Tel : 010-9531-0114
		</div>
		<div id="social">
			<img src="images/facebook.gif" width="33" height="33" alt="Facdebook">
			<img src="images/twitter.gif" width="33" height="34" alt="Twitter">
		</div>
	</footer>
</div>
</body>
</html>