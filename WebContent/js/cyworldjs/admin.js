

function adche(i) {
//	if (document.ucheck.uch1.checked){
		if(i == 1){

				document.getElementById('checf').action = 'adminChange.jsp';
		} else if(i == 2){

			ret = confirm( "消去しますか？" );
			if (ret == true){
				alert("消去しました。");
				return true;
			} else {
				return false;
			}
		}
//	  } else {
//		  alert("チェックされていません。")
//		  return false;
//	}
}

function adhange(){
	ret = confirm("変更しますか？")
	if(ret == true){
		alert("変更しました。")
	} else {
		return false;
	}
}