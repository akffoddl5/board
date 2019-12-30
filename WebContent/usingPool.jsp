<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.java.myweb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//ConnectionPool pool = ConnectionPool.getlnstance();
//Connection conn = pool.getConnection();

//pool.releaseConnection(conn);

Connection conn = null;
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)(init.lookup("java:comp/env/jdbc/myRed"));
	conn= ds.getConnection();
}catch(Exception e){
	e.printStackTrace();
}

String sql = "select * from poolTable";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>

<% while(rs.next()){  %>
	<%=rs.getString("con1") %><br>
	<%=rs.getString("con2") %><br>
	<%=rs.getString("con3") %><br>
	
	
	
<%} %>



</body>
</html>