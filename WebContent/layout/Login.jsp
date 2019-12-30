<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/loginCss.css?after" type="text/css" rel="stylesheet">
</head>
<body>
	<h1>로그인</h1>
	<hr color="red">
	<form method="post" action="Main.jsp">
	
		<table border="1" width="300">
			<tr>
				<td colspan="2" align="center">회원 로그인</td>
			</tr>
			<tr>
				<td align="right" width="100">아이디 :</td>
				<td width="200">&nbsp;&nbsp; <input type="text" name="id" size="20"></td>
			</tr>
			<tr>
				<td align="right" width="100">비밀번호 :</td>
				<td width="200">&nbsp;&nbsp; <input type="password" name="pass"  size="20">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" width="200"><input type="submit" value="로그인" />&nbsp;&nbsp;
					<input type="button" value="회원가입"
					onClick="javascript :window.location='Join.jsp'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>