
function validations() {
	var y = /^[0-9]+$/;
//validations for UserID
	if (document.validateUserForm.userId.value == "") {
		alert("Introduzca ID de Usuario");
		document.validateUserForm.userId.focus();
		return false;
	}




//validations for password
	if (document.validateUserForm.password.value == "") {
		alert("Introduzca Password");
		document.validateUserForm.password.focus();
		return false;
	}

	//validations for ttlpwd
	if (document.validateUserForm.ttlpwd.value == "") {
		alert("Introduzca el tiempo de vida del password");
		document.validateUserForm.ttlpwd.focus();
		return false;
	}
	if (document.validateUserForm.ttlpwd.value != "") {
		//if(isNaN(document.validateUserForm.ttlpwd.value))
		if (!(y.test(document.validateUserForm.ttlpwd.value))) {
			alert("Tiempo de vida de password tiene que ser número entero");
			document.validateUserForm.ttlpwd.focus();
			return false;
		} else {
			if ((document.validateUserForm.ttlpwd.value != -1) && (document.validateUserForm.ttlpwd.value < 0)) {
				alert("El valor de tiempo de vida de password no puede ser negativo(excepto -1).");
				return false;
			}
		}
	}
	//validations for timeadvice
	if (document.validateUserForm.timeadvice.value == "") {
		alert("Introduzca tiempo de aviso");
		document.validateUserForm.timeadvice.focus();
		return false;
	}
	if (document.validateUserForm.timeadvice.value != "") {
		//if(isNaN(document.validateUserForm.timeadvice.value))
		if (!(y.test(document.validateUserForm.timeadvice.value))) {
			alert("Tiempo de aviso tiene que ser un entero");
			document.validateUserForm.timeadvice.focus();
			return false;
		} else {
			if (document.validateUserForm.timeadvice.value <= 0) {
				alert("Tiempo de aviso tiene que ser mayor que cero.");
				return false;
			}
		}
		if (document.validateUserForm.ttlpwd.value != "" && document.validateUserForm.ttlpwd.value != -1) {
			if (eval(24*document.validateUserForm.ttlpwd.value) <= eval(document.validateUserForm.timeadvice.value)) {
				alert("El valor de tiempo de aviso debe ser menor que el tiempo de vida de password.");
				return false;
			}
		}
	}

	//validations for norPasswrods
	if (document.validateUserForm.norPasswrods.value == "") {
		alert("Introduzca el número de passwords");
		document.validateUserForm.norPasswrods.focus();
		return false;
	}
	if (document.validateUserForm.norPasswrods.value != "") {
		//if(isNaN(document.validateUserForm.norPasswrods.value))
		if (!(y.test(document.validateUserForm.norPasswrods.value))) {
			alert("El numero de contraseñas antes de repetir tiene que ser un entero");
			document.validateUserForm.norPasswrods.focus();
			return false;
		}
	}

	//validations for lfbblockuser
	if (document.validateUserForm.lfbblockuser.value == "") {
		alert("Introduzca las validaciones fallidas antes del bloqueo");
		document.validateUserForm.lfbblockuser.focus();
		return false;
	}
	if (document.validateUserForm.lfbblockuser.value != "") {
		//if(isNaN(document.validateUserForm.lfbblockuser.value))
		if (!(y.test(document.validateUserForm.lfbblockuser.value))) {
			alert("El valor de las validaciones fallidas tiene que ser entero");
			document.validateUserForm.lfbblockuser.focus();
			return false;
		}
	}

		//Validaciones para elección de operador
	var total = document.validateUserForm.numTotalOp.value;
	for (j = 0; j < total; j++) {
		if (dameCampo("chooseOpe", j).checked) {
			document.validateUserForm.operadores.value += dameCampo("operador", j).value + "+";
		}
	}
	if (document.validateUserForm.operadores.value == "") {
		alert("Tiene que seleccionar un operador como minimo");
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
	
	document.validateUserForm.mode.value = "Create";
	return true;
}
function setModeToLoad() {
	document.validateUserForm.mode.value = "Load";
	document.validateUserForm.submit();
}
function Enviar(num) {
	var form = document.validateUserForm;
	if (num == 1) {
		setModeToLoad();
		form.submit();
	} else {
		if (validations()) {
			newfun();
			form.submit();
		}
	}
}
function Limpiar() {
	var f = document.validateUserForm;
	f.reset();
}
function dameCampo(campo, num) {
	if (document.getElementById) {
		var campo = document.getElementById(campo + num);
	} else {
		var campo = document.all[campo + num];
	}
	return campo;
}

