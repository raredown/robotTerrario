function emailvalidation(){
	
     if(document.editdetailsForm.EMAIL.value!=""){
	           var x=document.editdetailsForm.EMAIL.value;
	           var y= /^([a-zA-Z0-9\-\.\_])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!(y.test(x)))
        { 
          alert("Introducir un correo valido")
          return false;
        } 
        document.editdetailsForm.mode.value="Update";
        document.editdetailsForm.submit();
      }
     return true;
}

// validar que el campo no est� vac�o, que s�lo contiene d�gitos (0-9) y que la longitud es 10.
function validarDigitos( campo ) {
	
	patron = /^\d{0,15}$/;	// Expresi�n regular que define de 0 hasta 15 d�gitos (en JS tambi�n puede meter + de 10)
	
	if(!patron.test(campo.value)){	
		alert("El " + campo.name + " contiene alg\u00fan car\u00e1cter no num\u00e9rico");
		campo.select();
		campo.focus();
		return false;
	}else{return true;}	
}

function enviar(){
	var f=document.editdetailsForm;
	//if (emailvalidation){
	//	f.submit();
	//}
	if(validarDigitos(document.editdetailsForm.FAX)){
		if(validarDigitos(document.editdetailsForm.TELEFONO)){
			emailvalidation();
		}
	}
} 
