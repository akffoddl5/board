<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/loginCss.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="JoinProc.jsp" name ="joinForm">
	<table border="1" >
		<tr>
			<td align ="right">아이디 : </td>
			<td><input type="text" name="id"> &nbsp; <input type="button" value="중복확인" onClick="#"></td>
		</tr>
		<tr>
			<td align ="right">패스워드 : </td>
			<td><input type="password" name="pw"> </td>
		</tr>
		<tr>
			<td align ="right">패스워드 확인 : </td>
			<td><input type="password" name="Repw"> </td>
		</tr>
		<tr>
			<td align ="right">이름 : </td>
			<td><input type="text" name="name"> </td>
		</tr>
		<tr>
			<td align ="right">전화번호 : </td>
			<td>
			<select name = "phone1">
				<option value="02">02</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> -
			<input type="text" name="phone2" size="5"> -
			<input type="text" name="phone3" size="5">
			</td>
		</tr>
		<tr>
			<td align ="right">이메일 : </td>
			<td><input type="text" name="email"> </td>
		</tr>
		
		
	
	
	
	
	</table>


</form>


</body>
</html>