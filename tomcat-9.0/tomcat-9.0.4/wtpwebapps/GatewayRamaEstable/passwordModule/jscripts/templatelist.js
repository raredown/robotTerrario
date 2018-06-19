
function templatefunction(){
	var status = false;
	
	if(document.templatelist.templatecheck!=undefined){
		if(document.templatelist.templatecheck.length==undefined){
		   if(document.templatelist.templatecheck.checked==false)
		   status=false;
		   else status=true;
		}else{
	
		for(i=0;i<document.templatelist.templatecheck.length;i++){

			if(document.templatelist.templatecheck[i].checked==true){
				status = true;
			}
		}
		
		}

	}

if(status==false){
	alert("Seleccione una plantilla");
	}
return status;
}

function enviar(){
	var f= document.templatelist;
	if (templatefunction()){
	f.submit();
	}


}

