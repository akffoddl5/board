<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script>



function getXMLRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e1){return null;}
		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
	
}


function ajaxExe(){
	var param = document.ajaxForm.id.value;
	httpRequest = getXMLRequest();
	httpRequest.onreadystatechange = sayToServer;
	httpRequest.open("GET","simpleAjaxApp2.jsp?id="+param,true);
	httpRequest.send(null);
}


function sayToServer(){
	

	
	if(httpRequest.onreadystatechange == 4){
		alert("4이긴 해");
		if(httpRequest.status == 200){
			alert("서버 응답 : " + httpRequest.responseText);
		}else{
			alert("서버 에러");
		}
	}else{
		alert("4가 아님 사발");
	}
	
}

</script>
</head>
<body>


<form name="ajaxForm">

<input type="text" name ="id" >
<input type="button" value="전송" onclick="ajaxExe()">
</form>

</body>
</html>