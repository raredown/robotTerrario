function funcall(){
	  document.editUserDetailsForm.mode.value="EditUserDetails";
	   document.editUserDetailsForm.action="userDetails.do";
	  document.editUserDetailsForm.submit();
}
	
function cancelfunction(){
        document.editUserDetailsForm.action="userquerylist.do";
}

function loadfunction(){
       document.editUserDetailsForm.mode.value="LoadforUpdate";

}


function validations(){
	var y = /^[0-9]+$/;
//validations for UserID
if(document.editUserDetailsForm.userId.value==""){
           alert("Introduzca el id de usuario");
           document.editUserDetailsForm.userId.focus();
	       return false;
}

//validations for password
if(document.editUserDetailsForm.password.value==""){
          alert("Introduzca el password");
          document.editUserDetailsForm.password.focus();
	      return false;
}

//validations for ttlpwd
if(document.editUserDetailsForm.ttlpwd.value==""){
         alert("Introduzca el tiempo de vida del password");
         document.editUserDetailsForm.ttlpwd.focus();
	     return false;
}
if(document.editUserDetailsForm.ttlpwd.value!=""){
	if(!(y.test(document.editUserDetailsForm.ttlpwd.value))){
         alert("El tiempo de vida del password tiene que ser un entero");
         document.editUserDetailsForm.ttlpwd.focus();
	     return false;
}else if((document.editUserDetailsForm.ttlpwd.value!=-1) && (document.editUserDetailsForm.ttlpwd.value<0)){
      		alert("El tiempo de vida del password no puede ser un numero negativo (except -1).");
      		return false;
  		}
}

//validations for timeadvice
	
if(document.editUserDetailsForm.timeadvice.value!=""){
	if(!(y.test(document.editUserDetailsForm.timeadvice.value))){
			alert("El tiempo de advertencia tiene que ser un entero");
			document.editUserDetailsForm.timeadvice.focus();
			return false;
	}else if(document.editUserDetailsForm.timeadvice.value<=0){
			alert("El tiempo de advertencia tiene que ser mayor que cero.");
			return false;
	 }
 if(document.editUserDetailsForm.ttlpwd.value!="" && document.editUserDetailsForm.ttlpwd.value!=-1 ){
 		 if(document.editUserDetailsForm.ttlpwd.value<document.editUserDetailsForm.timeadvice.value){
  				 alert("El tiempo de vida del password no puede ser menor que el tiempo de advertencia");
   				 return false;
		}
     }
}

//validations for norPasswrods
	if(document.editUserDetailsForm.norPasswrods.value==""){
		alert("Introduzca el numero de passwords");
		document.editUserDetailsForm.norPasswrods.focus();
		return false;
}
	if(document.editUserDetailsForm.norPasswrods.value!=""){
			if(!(y.test(document.editUserDetailsForm.norPasswrods.value))){
				alert(" El numero de passwords tiene que ser un entero");
				document.editUserDetailsForm.norPasswrods.focus();
				return false;
}
	}

	//validations for lfbblockuser
	if(document.editUserDetailsForm.lfbblockuser.value==""){
		alert("Introduzca el numero de intentos fallidos antes del bloqueo de usuario");
		document.editUserDetailsForm.lfbblockuser.focus();
	return false;
}
	if(document.editUserDetailsForm.lfbblockuser.value!=""){
		if(!(y.test(document.editUserDetailsForm.lfbblockuser.value))){
			alert("El numero de intentos fallidos antes del bloqueo de usuario debe de ser un entero");
			document.editUserDetailsForm.lfbblockuser.focus();
	return false;
}
	}

     document.editUserDetailsForm.mode.value="Update";
	 document.editUserDetailsForm.submit();

    return true
   }
function modefun(){
document.editUserDetailsForm.mode.value="EditUnblock";
document.editUserDetailsForm.editunblock.value="EditUnblock";
document.editUserDetailsForm.submit();
}	
	