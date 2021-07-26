
function createFrom(obj){
	if(obj.id.value ==""){
		alert("아이디를 반드시 입력하세요.");
		obj.id.focus();
		return false;
	}
	let pw = obj.password.value;
 	 let num = pw.search(/[0-9]/g);
 	 let eng = pw.search(/[a-z]/ig);
     let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw.length < 8 || pw.length > 20){
	  alert("비밀번호 8자리 ~ 20자리 이내로 입력해주세요.");
 	 return false;
 	 
	 }else if(pw.search(/\s/) != -1){
 		 alert("비밀번호는 공백 없이 입력해주세요.");
 	 return false;
 	 
 	}else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
 		 alert("비밀번호 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
  	return false;
  	}
	
	if(obj.passwordCheck.value ==""){
		alert("비밀번호 확인란에 입력해주세요.");
		obj.passwordCheck.focus();
		return false;
	}
	
	if(obj.password.value != obj.passwordCheck.value){
		alert("입력하신 비밀번호가 같지 않습니다.");
		obj.passwordCheck.focus();
		return false;
	}
	
	if(obj.name.value ==""){
		alert("이름을 반드시 입력하세요.");
		obj.name.focus();
		return false;
	}
	
	if(obj.email.value ==""){
		alert("이메일을 입력하세요.");
		obj.email.focus();
		return false;
	}

	var check = false;
	for(var i=0;i<obj.mailing.length;i++){
		if(obj.mailing[i].checked==true) check=true;
	}

	check = false;
	var str="";
	for(var i=0; i<obj.interest.length; i++){
		if(obj.interest[i].checked==true){
			str+=obj.interest[i].value + ",";
		}	
	}	
}
function idCheck(obj, root){
	alert(obj.id.value);
	
	let id = obj.id.value;
	
	if(obj.id.value ==""){
		alert("아이디를 반드시 입력하세요.");
		obj.id.focus();
		return false;
	}else if(id.search(/\s/) != -1){
		alert("아이디에 공백 없이 입력해주세요.");
		return false;
		}else{
		let url = root + "/user/idCheck?id=" + obj.id.value;
		window.open(url, "", "width=400, height=200");
	}
}
	
	