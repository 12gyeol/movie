
function button_event(idx){

if (confirm("정말 삭제하시겠습니까??") == true){    //확인
  location.href="removelist?id="+idx;
}else{   //취소
	retrun;
}
}

