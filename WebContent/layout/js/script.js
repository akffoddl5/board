/**
 * 
 */

function idCheck(id){
	if(id == ""){
		alert("아이디를 입력해주세요");
		document.joinForm.id.focus();
	}else{
		url="IdCheck.jsp?id="+id;
		window.open(url,"post","width=300,height=150");
	}
}

function idCheck2(){
	window.opener.document.joinForm.hidden1.value="y";
	self.close();
}

function idCheck3(){
	if(document.joinForm.hidden1.value=="y"){
		document.joinForm.submit();
	}else{
		alert("아이디 중복체크가 필요합니다.")
	}
}

function modifyCheck(){
	alert('modifyCheck');
	var pw1 = document.modifyForm.pw.value;
	var pw2 = document.modifyForm.Repw.value;
	if(pw1!=pw2){
		alert('비밀번호를 확인하여 주십시오.');
	}else{
		document.modifyForm.submit();
	}
}

function zipCheck(){
	url = "ZipCheck.jsp?push=y";
	window.open(url,"post","width=800, height=350");
}

function zipSearch(search){
	if(search==""){
		alert("검색할 지역을 입력해주세요")
		document.zipSearchForm.searchText.focus();
	}else{
		document.zipSearchForm.submit();
	}
}

function comeBackWithZip(zipcode, address){

	window.opener.document.joinForm.address1.value=address;
	window.opener.document.joinForm.zipcode.value=zipcode;
	window.opener.document.joinForm.address2.focus();
	self.close();
	
}

function boardUpdate(writer,id){
	if(writer==id){
		window.location="BoardUpdate.jsp";
	}else{
		alert("당신의 글이 아닙니다. 함.부.로 하지마십시오");
	}
}

function ddos(){
	alert('ddos 시작');
	url = "http://192.168.0.174:8080/myWeb/boardone/content.jsp?num=49&pageNum=1";
	for(i=0; i<10;i++){
		
		window.open(url,"post","width=200,height=200");
		window.open(url,"post","width=200,height=200");
	}
}



function red(){
	alert('red2');
}