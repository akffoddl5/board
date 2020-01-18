<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   	String color1 = request.getParameter("color1");
    String color2 = request.getParameter("color2");
    String color3 = request.getParameter("color3");
    out.println("color 1은 "+color1 +" 이고 color 2 는 "+ color2 + "이다 마지막으로는 " + color3 +"이므니다.");
    
    %>
