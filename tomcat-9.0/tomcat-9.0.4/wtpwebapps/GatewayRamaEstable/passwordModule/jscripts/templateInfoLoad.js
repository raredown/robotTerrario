function validations(){
	var y = /^[0-9]+$/;
     //validations for templateName
     if(document.templateForm.templateName.value==""){
         alert("Introduzca el nombre")
         document.templateForm.templateName.focus()
	     return false;
     }

    //validations for ttlPassword
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
          }
	 }
   //validations for timeAdvice
	
	if(document.templateForm.timeAdvice.value!=""){
	        //if(isNaN(document.templateForm.timeAdvice.value))
			 if(!(y.test(document.templateForm.timeAdvice.value))){
			        alert("El tiempo de antelación de aviso, debe ser un número entero.")
			        document.templateForm.timeAdvice.focus()
			        return false;
	        }else if(document.templateForm.timeAdvice.value<=0){
			        alert("El tiempo de antelación de aviso, debe ser mayor a cero.");
			        return false;
                   }
 /*
  * Modificada validación del tiempo de aviso de caducidad del password y el tiempo de vida 
  * del password en días
  */
			 if(document.templateForm.ttlPassword.value!="" && document.templateForm.ttlPassword.value!=-1 ){
 		        if(eval(document.templateForm.ttlPassword.value*24)<= eval(document.templateForm.timeAdvice.value)){
  				        alert("El tiempo de antelación de aviso debe ser menor a el tiempo de vida del password.");
   				        return false;
		        }
      }
}	
	

//validations for norPasswrods
if(document.templateForm.norPasswrods.value==""){
          alert("Introduzca el número de passwords")
          document.templateForm.norPasswrods.focus()
       	  return false;
}
if(document.templateForm.norPasswrods.value!=""){
	//if(isNaN(document.templateForm.norPasswrods.value))
	 if(!(y.test(document.templateForm.norPasswrods.value))){
          alert("El número de passwords tiene que ser entero")
          document.templateForm.norPasswrods.focus()
	      return false;
     }
}

//validations for lfbblockuser
if(document.templateForm.lfbBlockUser.value==""){
         alert("Enter Login failed before block user")
         document.templateForm.lfbBlockUser.focus()
	     return false;
}
if(document.templateForm.lfbBlockUser.value!=""){
	//if(isNaN(document.templateForm.lfbBlockUser.value))
	if(!(y.test(document.templateForm.lfbBlockUser.value))){
         alert("Introduzca el numero de intentos permitidos antes del bloqueo de usuario")
         document.templateForm.lfbBlockUser.focus()
	     return false;
     }
}
 document.templateForm.mode.value="Create";
 



return true
}
function setModeToLoad(){
document.templateForm.mode.value="Load";

}


function Enviar(num){
	var form=document.templateForm;
	
	if (num == 1){
		setModeToLoad();
		form.submit();
	}else if (validations()){
	
		form.submit();
		
	}
}

function Limpiar (){
	var f=document.templateForm;
	f.reset();
}

