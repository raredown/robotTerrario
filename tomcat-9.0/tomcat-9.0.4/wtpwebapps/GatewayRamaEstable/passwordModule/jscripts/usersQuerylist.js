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
	alert("Select the user");
	}
	if(status==true){
	document.userlist.mode.value="Edit";
	document.userlist.submit();
	}
return status;
}

function viewcall(){
	
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
	alert("Select the user");
	return false;
}
if(status==true){
	  document.userlist.action="viewDetails.do";
	  document.userlist.submit();
     }
   
	}
function deletecall(){
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
	alert("Select the user");
	return false;
}
if(status==true){
      document.userlist.mode.value="Delete";
	  document.userlist.action="deleteDetails.do";
	  document.userlist.submit();
	
}
	}
	
