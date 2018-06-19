function templatefunction(){
       if(document.templateForm.caseSensitive.checked==true){
	       document.templateForm.caseSensitive.value="Y";
           //return false
       }

  return true
}

function validations(){

	var y = /^[0-9]+$/;
    //validations for templateName
    if(document.templateForm.templateName.value==""){
		alert("Introduzca un nombre para la plantilla");
		document.templateForm.templateName.focus();
		return false;
    }
    //validations for ttlPassword
    if(document.templateForm.ttlPassword.value==""){
		alert("Introduzca el tiempo de vida para la plantilla");
		document.templateForm.ttlPassword.focus();
		return false;
    }
   if(document.templateForm.ttlPassword.value!=""){
		//if(isNaN(document.templateForm.ttlPassword.value))
		if(!(y.test(document.templateForm.ttlPassword.value))){
			 alert("Tiempo de vida de password tiene que ser número entero");
			 document.templateForm.ttlPassword.focus();
			 return false;
		}else if((document.templateForm.ttlPassword.value!=-1) && (document.templateForm.ttlPassword.value<0)){
         		alert("El valor de tiempo de vida de password no puede ser negativo(excepto -1).");
        		return false;
  		}
    }
   //validations for timeAdvice
   if(document.templateForm.timeAdvice.value!=""){
	   //if(isNaN(document.templateForm.timeAdvice.value))
	   if(!(y.test(document.templateForm.timeAdvice.value))){
			alert("Tiempo de aviso tiene que ser un entero");
			document.templateForm.timeAdvice.focus();
			return false;
	   }else if(document.templateForm.timeAdvice.value<=0){
			alert("Tiempo de aviso tiene que ser mayor que cero.");
			return false;
             }
    if(document.templateForm.ttlPassword.value!="" && document.templateForm.ttlPassword.value!=-1 ){
 		 if(eval(24*document.templateForm.ttlPassword.value) <= eval(document.templateForm.timeAdvice.value)){
  				alert("El valor de tiempo de aviso debe ser menor que el tiempo de vida del password.");
   				 return false;
	    	}
     }
   }else{
	   alert("Tiempo de aviso tiene que ser mayor a cero");
	   document.templateForm.timeAdvice.focus();
	   return false;
   }
	
	
   //validations for norPasswrods
   if(document.templateForm.norPasswrods.value==""){
		alert("Introduzca el numero de passwords");
		document.templateForm.norPasswrods.focus();
		return false;
    }
   if(document.templateForm.norPasswrods.value!=""){
		//if(isNaN(document.templateForm.norPasswrods.value))
			if(!(y.test(document.templateForm.norPasswrods.value))){
			alert("El número de passwords tiene que ser entero");
			document.templateForm.norPasswrods.focus();
			return false;
		}else if((document.templateForm.norPasswrods.value<=0)){
    		alert("El número de passwords tiene que ser mayor que cero");
    		return false;
  		} 
    }

   //validations for lfbblockuser
   if(document.templateForm.lfbBlockUser.value==""){
    	alert("Introduzca las validaciones fallidas antes del bloqueo");
		document.templateForm.lfbBlockUser.focus();
		return false;
    }
   if(document.templateForm.lfbBlockUser.value!=""){
		//if(isNaN(document.templateForm.lfbBlockUser.value))
		if(!(y.test(document.templateForm.lfbBlockUser.value))){
			alert("El valor de las validaciones tiene que ser entero");
			document.templateForm.lfbBlockUser.focus();
			return false;
		}else if((document.templateForm.lfbBlockUser.value<=0)){
    		alert(" El valor de las validaciones tiene que ser mayor que 0");
    		return false;
  		}
    }
	
   document.templateForm.mode.value="Create";
   return true
}

function setModeToLoad(){
    document.templateForm.mode.value="Load";

}

function enviar(num){
	var form=document.templateForm;
	
	if (num == 1){
		setModeToLoad();
		form.submit();
	}else if (validations()){
		templatefunction();
		form.submit();
		
	}
}

function limpiar (){
	f=document.templateForm;
	f.reset();
}

