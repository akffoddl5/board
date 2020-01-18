<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#b1").click(function(){
		$("#div1").text("button1 clicked");
	});
	
	$("#b2").click(function(){
		var sendData = {color1 : "red" ,  color2 : "yellow" , color3 : "green"};
		$.ajax({
			type : "post" , url : "JQueryResponse.jsp" , data : {} ,
			success : function(data){
				$(div2).text(data);
			}
		})
		
	});
	
	
	
});

</script>
<title>Insert title here</title>
</head>
<body>
<h1>jquery page</h1>
<hr color = "red">
<div id="div1">
<button id="b1" >button1</button>
</div>
<div id="div2">
<button id="b2">button2</button>
</div>



</body>
</html>