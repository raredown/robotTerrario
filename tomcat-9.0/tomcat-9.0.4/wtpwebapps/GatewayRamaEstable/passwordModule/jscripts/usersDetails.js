function emailvalidation(){

	if(document.userDetailsForm.EMAIL.value=="")
	  {
	  alert("Introducir el correo")
		  return false;
	  }
	if(document.userDetailsForm.EMAIL.value!=""){
	var x=document.userDetailsForm.EMAIL.value;
	var y= /^([a-zA-Z0-9\-\.\_])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(!(y.test(x)))
		{
		alert("Introducir un correo valido")
		document.userDetailsForm.EMAIL.value="";
		return false;
		}
	}
	return true
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

function Enviar(){
	var f = document.userDetailsForm;
	
	if(validarDigitos(document.userDetailsForm.FAX)){
		if(validarDigitos(document.userDetailsForm.TELEFONO)){
			if (emailvalidation()){
				f.submit();
			}
		}			
	}

}
