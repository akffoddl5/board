<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/joinCss.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<script>


</script>
 <script type="text/javascript" src="/myWeb3/layout/js/script.js"></script>
<form method="post" action="JoinProc.jsp" name ="joinForm">
<input type="hidden" name="hidden1" value="">
	<table border="1" >
		
		<tr>
			<td colspan="2" align="center"> 회원 가입 </td>
		</tr>
		<tr>
			<td align ="center">아이디 : </td>
			<td><input type="text" name="id"> &nbsp; <input type="button" value="중복확인" onClick="idCheck(document.joinForm.id.value)"></td>
		</tr>
		<tr>
			<td align ="center">패스워드 : </td>
			<td><input type="password" name="pw"> </td>
		</tr>
		<tr>
			<td align ="center">패스워드 확인 : </td>
			<td><input type="password" name="Repw"> </td>
		</tr>
		<tr>
			<td align ="center">이름 : </td>
			<td><input type="text" name="name"> </td>
		</tr>
		<tr>
			<td align ="center">전화번호 : </td>
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
			<td align ="center">이메일 : </td>
			<td><input type="text" name="email"> </td>
		</tr>
		<tr>
			<td align="center"> 우편번호 :</td>
			<td> <input type="text" name="zipcode" >
			<input type="button" onClick="zipCheck()" value="찾기">
			</td>
		</tr>
		<tr>
			<td align="center"> 주소 : </td>
			<td><input type="text" name="address1" size="50" ></td>
		</tr>
		<tr>
			<td align="center"> 상세주소 : </td>
			<td><input type="text" name="address2" size="30"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="회원가입" onclick="idCheck3()">
			&nbsp;&nbsp;
			<input type="reset" value="다시입력">
			</td>
		</tr>
	
	
	</table>


</form>


</body>
</html>