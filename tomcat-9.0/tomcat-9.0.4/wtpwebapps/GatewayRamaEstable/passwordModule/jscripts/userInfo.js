
function funcall() {
	document.editUserDetailsForm.mode.value = "EditUserDetails";
	document.editUserDetailsForm.action = "userDetails.do";
	document.editUserDetailsForm.submit();
}
function cancelfunction() {
	document.editUserDetailsForm.action = document.editUserDetailsForm.cancelvar.value;
	document.editUserDetailsForm.submit();
	return false;
}
function loadfunction() {
	document.editUserDetailsForm.mode.value = "LoadforUpdate";
	document.editUserDetailsForm.submit();
}
function validations() {
	var y = /^[0-9]+$/;
	var tipo = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,10})$/; 
	
	//validaciones para UserID
	if (document.editUserDetailsForm.userId.value == "") {
		alert("Introduzca el ID de usuario.");
		document.editUserDetailsForm.userId.focus();
		return false;
	}

	//validaciones para password
	if (document.editUserDetailsForm.password.value == "") {
		alert("Introduzca el password.");
		document.editUserDetailsForm.password.focus();
		return false;
	}
	
	//validaciones para ttlpwd
	if (document.editUserDetailsForm.ttlpwd.value == "") {
		alert("Introduzca el tiempo de vida del password.");
		document.editUserDetailsForm.ttlpwd.focus();
		return false;
	}
	if (document.editUserDetailsForm.ttlpwd.value != "") {
		if (document.editUserDetailsForm.ttlpwd.value != -1) {
			if (!(y.test(document.editUserDetailsForm.ttlpwd.value))) {
				alert("El tiempo de vida de password tiene que ser un n\xfamero entero.");
				document.editUserDetailsForm.ttlpwd.focus();
				return false;
			} else {
				if (document.editUserDetailsForm.ttlpwd.value == 0) {
					alert("El valor de tiempo de vida de password no puede ser negativo(excepto -1)");
					return false;
				}
			}
		}
	}

	//validaciones para timeadvice	
	if (document.editUserDetailsForm.timeadvice.value != "") {
	//if(isNaN(document.editUserDetailsForm.timeadvice.value))
		if (!(y.test(document.editUserDetailsForm.timeadvice.value))) {
			alert("El tiempo de antelaci\xf3n de aviso debe ser un n\xfamero entero.");
			document.editUserDetailsForm.timeadvice.focus();
			return false;
		} else {
			if (document.editUserDetailsForm.timeadvice.value <= 0) {
				alert("El tiempo de antelaci\xf3n de aviso debe ser mayor que cero.");
				document.editUserDetailsForm.timeadvice.focus();
				return false;
			}
		}
		if (document.editUserDetailsForm.ttlpwd.value != "" && document.editUserDetailsForm.ttlpwd.value != -1) {
			if (eval(24 * document.editUserDetailsForm.ttlpwd.value) <= eval(document.editUserDetailsForm.timeadvice.value)) {
				alert("El tiempo de antelaci\xf3n de aviso debe ser menor que el tiempo de vida del password.");
				document.editUserDetailsForm.timeadvice.focus();
				return false;
			}
		}
	}

	//validaciones para norPasswrods
	if (document.editUserDetailsForm.norPasswrods.value == "") {
		alert("Introduzca el n\xfamero de passwords");
		document.editUserDetailsForm.norPasswrods.focus();
		return false;
	}
	if (document.editUserDetailsForm.norPasswrods.value != "") {
	//if(isNaN(document.editUserDetailsForm.norPasswrods.value))
		if (!(y.test(document.editUserDetailsForm.norPasswrods.value))) {
			alert("El n\xfamero de passwords tiene que ser un numero entero");
			document.editUserDetailsForm.norPasswrods.focus();
			return false;
		} else {
			if ((document.editUserDetailsForm.norPasswrods.value <= 0)) {
				alert("El n\xfamero de passwords tiene que ser mayor que cero");
				document.editUserDetailsForm.norPasswrods.focus();
				return false;
			}
		}
	}

	//validations for lfbblockuser
	if (document.editUserDetailsForm.lfbblockuser.value == "") {
		alert("Introduzca el numero de intentos permitidos antes del bloqueo de usuario");
		document.editUserDetailsForm.lfbblockuser.focus();
		return false;
	}
	if (document.editUserDetailsForm.lfbblockuser.value != "") {
	//if(isNaN(document.editUserDetailsForm.lfbblockuser.value))
		if (!(y.test(document.editUserDetailsForm.lfbblockuser.value))) {
			alert("El valor de los intentos antes del bloqueo tiene que ser entero");
			document.editUserDetailsForm.lfbblockuser.focus();
			return false;
		}
		if (document.editUserDetailsForm.lfbblockuser.value <= 0) {
			alert("El valor de los intentos antes del bloqueo tiene que ser mayor que cero");
			document.editUserDetailsForm.lfbblockuser.focus();
			return false;
		}
	}
	if (document.editUserDetailsForm.casesensitive.checked == true) {
		document.editUserDetailsForm.casesensitive.value = "Y";
	} else {
		document.editUserDetailsForm.casesensitive.value = "N";
	}
	
	// Validaciones para el cambio de contrasenya .
	if(document.editUserDetailsForm.passReset.checked == true){
		if ((document.editUserDetailsForm.newPassword.value.match(tipo)) && (document.editUserDetailsForm.newPassword.value!='')) {        
		} else {        
			alert('- Password Incorrecta\n Debe ser entre 6 y 10 caracteres, alfanumerico,\n por lo menos un digito, y no puede contener caracteres especiales.');        
			document.editUserDetailsForm.newPassword.focus();
			return false;
		} 
		if(document.editUserDetailsForm.newPassword.value != document.editUserDetailsForm.confirmNewPassword.value){
			alert('La confirmacion del nuevo password \n no coincide con el password introducido');
			document.editUserDetailsForm.confirmNewPassword.focus();
			return false;
		}
	}
	
	// Le asignamos un valor para el cambio de contrasenya .
	if (document.editUserDetailsForm.passReset.checked == true) {
		document.editUserDetailsForm.passReset.value = "Y";
	} else {
		document.editUserDetailsForm.passReset.value = "N";
	}

		//Validaciones para elección de operador
	document.editUserDetailsForm.operadores.value = "";
	var total = document.editUserDetailsForm.numTotalOp.value;
	for (j = 0; j < total; j++) {
		if (dameCampoUser("chooseOpe", j).checked) {
			document.editUserDetailsForm.operadores.value += dameCampoUser("operador", j).value + "+";
		}
	}
	if (document.editUserDetailsForm.operadores.value == "") {
		alert("Tiene que seleccionar un operador como minimo");
		return false;
	}
    //Validaciones para la eleccion de grupo
    document.editUserDetailsForm.grupos.value = "";
	var totalGrupos = document.editUserDetailsForm.numTotalGr.value;
	for (k = 0; k < totalGrupos; k++) {
		if (dameCampo("chooseGrupo", k) != null && dameCampo("chooseGrupo", k).checked) {
			document.editUserDetailsForm.grupos.value += dameCampo("grupo", k).value + "+";
		}
	}
	if (document.editUserDetailsForm.grupos.value=="") {
		alert("El usuario debe pertenecer a un grupo como m\xednimo");
		return false;
	}
	document.editUserDetailsForm.mode.value = "Update";
	document.editUserDetailsForm.submit();
	return true;
}

function modefun() {
	document.editUserDetailsForm.mode.value = "EditUnblock";
	document.editUserDetailsForm.editunblock.value = "EditUnblock";
	document.editUserDetailsForm.submit();
}

function dameCampoUser(campo, num) {
	if (document.getElementById) {
		var campo = document.getElementById(campo + num);
	} else {
		var campo = document.all[campo + num];
	}
	return campo;
}

