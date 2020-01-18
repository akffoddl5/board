<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.java.beans.*" %>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("utf-8");
String getY = request.getParameter("push");
String getSearchText = request.getParameter("searchText");
boolean hePush=false ;
boolean heSearch = false;
if(getY!=null){
	hePush= true;
}

if(getSearchText!=null){
	heSearch=true;
}
ArrayList<ZipDTO> list=null;
if(heSearch){
	DAO dao = DAO.GetInstance();
	list = dao.getZipcode(getSearchText);
}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편 번호 검색</title>
</head>
<body>
<script type="text/javascript" src="js/script.js"></script>

<form action="ZipCheck.jsp" method="post" name="zipSearchForm">
	<table>
	<tr>
		<td><input type="text" name="searchText" size="20" placeholder="동,지역 검색"></td>
		<td><input type="button" value="검색" onClick="zipSearch(document.zipSearchForm.searchText.value)" ></td>
	</tr>
	
	</table>
</form>

<%if(heSearch) {
	for(int i=0;i<list.size();i++) {
		String seq = list.get(i).getSeq();
		String zipcode = list.get(i).getZipcode();
		String sido = list.get(i).getSido();
		String gugun = list.get(i).getGugun();
		String dong =list.get(i).getDong();
		String ri = list.get(i).getRi();
		String bunji = list.get(i).getBunji();
		if(sido==null) sido="";
		if(gugun==null) gugun="";
		if(dong==null) dong="";
		if(ri==null) ri="";
		if(bunji==null) bunji="";
		String address = sido+gugun+dong+ri+bunji;
%>
	<a href="javascript:comeBackWithZip('<%=zipcode%>','<%=address%>')"  ><%=zipcode %> &nbsp; <%=address %></a> <br>


	<%} %>
<%} %>

</body>
</html>