
function userfunction(){
	var status = false;
	if(document.userlist.usercheck!=undefined){
		if(document.userlist.usercheck.length==undefined){
		   if(document.userlist.usercheck.checked==false)
		   status=false;
		   else status=true;
		}else{
		for(i=0;i<document.userlist.usercheck.length;i++){

			if(document.userlist.usercheck[i].checked==true){
				status = true;
			}
		}
		
		}

	}

if(status==false){
	alert("Select the Template");
	}
return status;
}



