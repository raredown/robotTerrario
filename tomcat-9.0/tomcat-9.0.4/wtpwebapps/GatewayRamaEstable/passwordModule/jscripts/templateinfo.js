function modefun(){
		document.templateForm.action="templatelist.do";
		document.templateForm.submit();
}
	
function templatefunction(){

    if(document.templateForm.caseSensitive.checked==true){
	       document.templateForm.caseSensitive.value="Y";
	       document.templateForm.cs.value="Y";
        //return false
    }
return true
}

function validations(){

	templatefunction();
	var y = /^[0-9]+$/;

//validaciones para ttlPassword
  if(document.templateForm.ttlPassword.value==""){
		alert("Introduzca el tiempo de vida del password.")
		document.templateForm.ttlPassword.focus()
		return false;
   }
  if(document.templateForm.ttlPassword.value!=""){
		//if(isNaN(document.templateForm.ttlPassword.value))
		if(!(y.test(document.templateForm.ttlPassword.value))){
			alert("El tiempo de vida del password tiene que ser número entero.")
			document.templateForm.ttlPassword.focus()
			return false;
		}else if((document.templateForm.ttlPassword.value!=-1) && (document.templateForm.ttlPassword.value<0)){
      		    alert("El valor de tiempo de vida del password no puede ser negativo(excepto -1).");
      		    return false;
  		       }
   }
   // validaciones para el tiempo anterior a la advertencia....
   if(document.templateForm.timeAdvice.value!=""){
	  // if(isNaN(document.templateForm.timeAdvice.value))
	  if(!(y.test(document.templateForm.timeAdvice.value))){
			    alert("El tiempo de antelación de aviso, debe ser un número entero.")
			    document.templateForm.timeAdvice.focus()
			    return false;
	    }else if(document.templateForm.timeAdvice.value<=0){
		        	alert("El tiempo de antelación de aviso, debe ser mayor a cero.");
			        return false;
               }
       if(document.templateForm.ttlPassword.value!="" && document.templateForm.ttlPassword.value!=-1 ){
 		   if(eval(24*document.templateForm.ttlPassword.value)<= eval(document.templateForm.timeAdvice.value)){
  			         alert("El tiempo de antelación de aviso debe ser menor a el tiempo de vida del password.");
   				     return false;
		   }
       }
    }
   
  //validaciones para norPasswrods
  if(document.templateForm.norPasswrods.value==""){
	 	 alert("Introduzca el número de passwords")
		 document.templateForm.norPasswrods.focus();
		 return false;
   }
   if(document.templateForm.norPasswrods.value!=""){
		//if(isNaN(document.templateForm.norPasswrods.value))
		if(!(y.test(document.templateForm.norPasswrods.value))){
			alert("El número de passwords tiene que ser entero")
			document.templateForm.norPasswrods.focus()
			return false;
		} else if((document.templateForm.norPasswrods.value<=0)){
    		     alert("El número de passwords tiene que ser mayor que cero");
    		     return false;
  		       }
    }
		
//validaciones para lfbblockuser
   if(document.templateForm.lfbBlockUser.value==""){
		alert("Introduzca el numero de intentos permitidos antes del bloqueo de usuario")
		document.templateForm.lfbBlockUser.focus()
		return false;	
    } 
   if(document.templateForm.lfbBlockUser.value!=""){
		//if(isNaN(document.templateForm.lfbBlockUser.value))
		if(!(y.test(document.templateForm.lfbBlockUser.value))){
				alert("El valor de los intentos antes del bloqueo tiene que ser entero")
				document.templateForm.lfbBlockUser.focus()
				return false;
		}else if((document.templateForm.lfbBlockUser.value<=0)){
    			alert("El valor de los intentos antes del bloqueo tiene que ser mayor que cero");
    			return false;
  		}
    }
		document.templateForm.mode.value="Update";
		document.templateForm.submit();
		return true
}
	
function Enviar(num){
	var form=document.templateForm;

	if (num == 1){
		modefun();
		form.submit();
	}else if (validations()){
		form.submit();
	}
}

function Limpiar (){
	var f=document.templateForm;
	f.reset();
}
