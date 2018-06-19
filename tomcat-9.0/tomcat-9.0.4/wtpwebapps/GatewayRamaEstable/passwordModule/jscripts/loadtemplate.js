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
	     alert("Select the template");
	   }
      return status;
}

function cargar(){

	if (templatefunction()){

document.templatelist.submit();
	
	}
}
