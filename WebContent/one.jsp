<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    


<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
================================================================
<jsp:useBean id="myColor" class="com.java.myweb.Color"></jsp:useBean>
<jsp:setProperty property="*" name="myColor"/>
<%
String id = request.getParameter("id");
%>

<%if(id!=null){ %>

<%} %>

specialColor : <jsp:getProperty property="specialColor" name="myColor"/>
myColor : <jsp:getProperty property="myColor" name="myColor"/>
mySubColor : <jsp:getProperty property="mySubColor1" name="myColor"/>
methodPrint : <%=myColor.printFavoriteColor() %>   &&&& <%=myColor.printSpecialColor() %>
================================================================
<%
String inputSpecial = request.getParameter("specialColor");
String inputName = request.getParameter("name");
%>

<%=inputSpecial %> <br>
<%=inputName %>

</body>
</html>