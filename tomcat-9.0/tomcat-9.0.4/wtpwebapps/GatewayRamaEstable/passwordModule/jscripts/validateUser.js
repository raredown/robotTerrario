function userfunction(){

	if(document.validateUserForm.casesensitive.checked==true){
		document.validateUserForm.casesensitive.value="Y";
	}else{
		document.validateUserForm.casesensitive.value="N";
	}
	
	if(document.validateUserForm.updatepwdfirsttime.checked==true){
		document.validateUserForm.updatepwdfirsttime.value="Y";
	}else{
		document.validateUserForm.updatepwdfirsttime.value="N";
	}
	
	return true
}

function validatePass(campo) {
	var tipo = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,10})$/;      
	if ((campo.value.match(tipo)) && (campo.value!='')) {        
		//alert('Password Valido');     
	} else {        
		alert('- Password Incorrecta\n Debe ser entre 6 y 10 caracteres, alfanumerico,\n por lo menos un digito, y no puede contener caracteres especiales.');        
		campo.focus();    
	} 
}

function validations(){

	var y = /^[0-9]+$/;

//validaciones para UserID
	if(document.validateUserForm.userId.value==""){
		alert("Introduzca ID de Usuario");
		document.validateUserForm.userId.focus();
		return false;
	}

//	validations for password
	var pass = document.validateUserForm.password;
	if(document.validateUserForm.password.value == "" || pass.length < 5){
		alert("Introduzca Password correcta");
		document.validateUserForm.password.focus();
		return false;
	}
	
//validaciones para ttlpwd
	if(document.validateUserForm.ttlpwd.value==""){
		alert("Introduzca el tiempo de vida del password");
		document.validateUserForm.ttlpwd.focus();
		return false;
	}

	if(document.validateUserForm.ttlpwd.value!=""){
		/*if(isNaN(document.validateUserForm.ttlpwd.value))*/ 
		if(!(y.test(document.validateUserForm.ttlpwd.value))){
			alert("Tiempo de vida de password tiene que ser número entero");
			document.validateUserForm.ttlpwd.focus();
			return false;
			
		}else if((document.validateUserForm.ttlpwd.value!=-1) && (document.validateUserForm.ttlpwd.value<0)){
			alert("El valor de tiempo de vida de password no puede ser negativo(excepto -1).");
			document.validateUserForm.ttlpwd.focus();
			return false;
		}
	}

//validaciones para timeadvice
	if(document.validateUserForm.timeadvice.value==""){
		alert("Introduzca tiempo de aviso");
		document.validateUserForm.timeadvice.focus();
		return false;
	}

	if(document.validateUserForm.timeadvice.value!=""){
		//if(isNaN(document.validateUserForm.timeadvice.value))
		if(!(y.test(document.validateUserForm.timeadvice.value))){
			alert("Tiempo de aviso tiene que ser un entero");
			document.validateUserForm.timeadvice.focus();
			return false;
		}else if(document.validateUserForm.timeadvice.value<=0){
			alert("Tiempo de aviso tiene que ser mayor que cero.");
			return false;
		}

		if(document.validateUserForm.ttlpwd.value!="" && document.validateUserForm.ttlpwd.value!=-1 ){
			if(eval(24*document.validateUserForm.ttlpwd.value) < eval(document.validateUserForm.timeadvice.value)){
				alert("El valor de tiempo de aviso debe ser menor que el tiempo de vida de password.");
				return false;
			}
		}
	}

//validaciones para norPasswrods
	if(document.validateUserForm.norPasswrods.value==""){
		alert("Introduzca el número de passwords");
		document.validateUserForm.norPasswrods.focus();
		return false;
	}
	if(document.validateUserForm.norPasswrods.value!=""){
//		if(isNaN(document.validateUserForm.norPasswrods.value))
		if(!(y.test(document.validateUserForm.norPasswrods.value))){
			alert("El numero de contraseñas antes de repetir tiene que ser un entero");
			document.validateUserForm.norPasswrods.focus();
			return false;
		}else if((document.validateUserForm.norPasswrods.value<=0)){
			alert("El numero de contraseñas antes de repetir tiene que ser ser mayor que 0");
			return false;
		}		
	}

//validaciones para lfbblockuser
	if(document.validateUserForm.lfbblockuser.value==""){
		alert("Introduzca las validaciones fallidas antes del bloqueo");
		document.validateUserForm.lfbblockuser.focus();
		return false;
	}
	if(document.validateUserForm.lfbblockuser.value!=""){
		//if(isNaN(document.validateUserForm.lfbblockuser.value))
		if(!(y.test(document.validateUserForm.lfbblockuser.value))){
			alert(" El valor de las validaciones fallidas tiene que ser entero");
			document.validateUserForm.lfbblockuser.focus();
			return false;

		}else if((document.validateUserForm.lfbblockuser.value<=0)){
			alert(" El valor de las validaciones fallidas tiene que ser mayor que 0");
			return false;

		}
	}

//Validaciones para elección de operador
	var total = document.validateUserForm.numTotalOp.value;
	for (j=0; j < total; j++){
		if (dameCampo('chooseOpe',j).checked){
			document.validateUserForm.operadores.value+=dameCampo('operador',j).value+"+";
		}
	}

	if (document.validateUserForm.operadores.value == ""){
		alert('Tiene que seleccionar un operador como minimo');
		return false;
	}
	
	//Validaciones para la eleccion de grupo
	var totalGrupos = document.validateUserForm.numTotalGr.value;
	for (k=0;k<totalGrupos;k++){
		if(dameCampo('chooseGrupo',k).checked){
			document.validateUserForm.grupos.value+=dameCampo('grupo',k).value+"+";
		}
	}
	if(document.validateUserForm.grupos.value==""){
		alert('El usuario debe pertenecer a un grupo como mínimo');
		return false;
	}
	
	document.validateUserForm.mode.value="Create";
	return true
	
}

function dameCampo(campo,num){
	if(document.getElementById)
		var campo=document.getElementById(campo+num);
	else
		var campo = document.all[campo+num];
	return campo;
}

function setModeToLoad() {
	document.validateUserForm.mode.value="Load";
}

function Enviar(num){
	var form=document.validateUserForm;
	if (num == 1){
		setModeToLoad();
		form.submit();
	}else if (validations()){
		userfunction();
		form.submit();
	}
}

function Limpiar (){
	f=document.validateUserForm;
	f.reset();
}