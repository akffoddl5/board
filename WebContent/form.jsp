<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="one.jsp" method="post">
<h1>양식을 작성해주세요.</h1>
<table>
<tr>
	<td>이름 :</td><td><input type="text" name="name"></td>
</tr>
<tr>
	<td>컬러:</td><td><input type="text" name="specialColor"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="전송"></td>
</tr>
</table>

</form>

</body>
</html>