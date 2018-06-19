
function LinksPrincipal(num) {
    f = document.Generico;
    
    switch (num) {
      case 1:
        f.action = "usuariosjsp";
        f.enlace_user.value="1";
         break;
      case 2:
        f.action = "buscusuariosjsp";
        f.enlace_user.value="2";
        break;
      case 3:
        f.action = "buscaperfiljsp";
        f.enlace_perm.value = "1";
        break;
      case 4:
        f.action = "crearpefiljsp";
        f.enlace_perm.value = "2";
        break;
         }
    f.submit();
}


function dameFormulario(num) {
     //document.forms[num].submit();
    if (document.getElementById) {
        var formulario = document.getElementById("form" + num);
    } else {
        var formulario = document.all["form" + num];
    }
    return formulario;
}
function dameCampo(campo, num) {
     //document.forms[num].submit();
    if (document.getElementById) {
        var campo = document.getElementById(campo + num);
    } else {
        var campo = document.all[campo + num];
    }
    return campo;
}

//M?todo que comprueba una fecha.
function FechaOk(Campo, Obligatorio) {
    if (Campo.value == "") {
        if (Obligatorio) {
            Campo.focus();
            alert("Introduzca la fecha en el formato : dd/mm/yyyy en el campo " + Campo.name);
            Campo.select();
            return (false);
        } else {
            return true;
        }
    }
    var checkOK = "0123456789/";
    var checkStr = Campo.value;
    var allValid = true;
    var decPoints = 0;
    var allNum = "";
    for (i = 0; i < checkStr.length; i++) {
        ch = checkStr.charAt(i);
        for (j = 0; j < checkOK.length; j++) {
            if (ch == checkOK.charAt(j)) {
                break;
            }
        }
        if (j == checkOK.length) {
            allValid = false;
            break;
        }
        allNum += ch;
    }
    if (!allValid) {
        Campo.focus();
        alert("Introduzca la fecha en el formato : dd/mm/yyyy en el campo " + Campo.name);
        Campo.select();
        return (false);
    }
    var err = 0;
    var a;
    var b;
    var c;
    var d;
    var e;
    var f;
    a = Campo.value;
    if (a.length != 10) {
        err = 1;
    } else {
        d = a.substring(0, 2);// day
        c = a.substring(2, 3);// '/'
        b = a.substring(3, 5);// month
        e = a.substring(5, 6);// '/'
        f = a.substring(6, 10);// year
    //basic error checking
        if (b < 1 || b > 12) {
            err = 1;
        }
        if (c != "/") {
            err = 1;
        }
        if (d < 1 || d > 31) {
            err = 1;
        }
        if (e != "/") {
            err = 1;
        }
    //advanced error checking
    // months with 30 days
        if (b == 4 || b == 6 || b == 9 || b == 11) {
            if (d == 31) {
                err = 1;
            }
        }
    // february, leap year
        if (b == 2) { //feb
            var g;
            g = parseInt(f / 4);
            if (isNaN(g)) {
                err = 1;
            }
            if (d > 29) {
                err = 1;
            }
            if (d == 29 && ((f / 4) != parseInt(f / 4))) {
                err = 1;
            }
        }
    }
    if (err == 1) {
        Campo.focus();
        alert("Introduzca la fecha en el formato : dd/mm/yyyy en el campo " + Campo.name);
        Campo.select();
        return (false);
    }
    return (true);
}

//M?todo que comprueba la hora.
function HoraOk(Campo, Obligatorio) {
    if (Campo.value == "") {
        if (Obligatorio) {
            Campo.focus();
            alert("Introduzca la hora en el formato : hh:mm:ss en el campo " + Campo.name);
            Campo.select();
            return (false);
        } else {
            return true;
        }
    }
    var checkOK = "0123456789:";
    var checkStr = Campo.value;
    var allValid = true;
    var decPoints = 0;
    var allNum = "";
    for (i = 0; i < checkStr.length; i++) {
        ch = checkStr.charAt(i);
        for (j = 0; j < checkOK.length; j++) {
            if (ch == checkOK.charAt(j)) {
                break;
            }
        }
        if (j == checkOK.length) {
            allValid = false;
            break;
        }
        allNum += ch;
    }
    if (!allValid) {
        Campo.focus();
        alert("Introduzca la hora en el formato : hh:mm:ss en el campo " + Campo.name);
        Campo.select();
        return (false);
    }
    var err = 0;
    var a;
    var b;
    var c;
    var d;
    var e;
    var f;
    a = Campo.value;
    if (a.length != 8) {
        err = 1;
    } else {
        d = a.substring(0, 2);// hour
        c = a.substring(2, 3);// ':'
        b = a.substring(3, 5);// minute
        e = a.substring(5, 6);// ':'
        f = a.substring(6, 8);// second
    //basic error checking
        if (b < 0 || b > 59) {
            err = 1;
        }
        if (c != ":") {
            err = 1;
        }
        if (d < 0 || d > 23) {
            err = 1;
        }
        if (e != ":") {
            err = 1;
        }
        if (f < 0 || f > 59) {
            err = 1;
        }
    }
    if (err == 1) {
        Campo.focus();
        alert("Introduzca la fecha en el formato : hh:mm:ss en el campo " + Campo.name);
        Campo.select();
        return (false);
    }
    return (true);
}

//M?todo que comprueba el nif
function NIFOk(Campo, Obligatorio) {
    if (Campo.value == "") {
        if (Obligatorio) {
            Campo.focus();
            alert("Introduzca un valor en " + Campo.name);
            Campo.select();
            return false;
        } else {
            return true;
        }
    }
    var letrasInicialesCIF = "ABCDEFGHKLMPQSXZ";
    var mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var LETRAS = "TRWAGMYFPDXBNJZSQVHLCKET";
    var CIFconLetra = "PQSNMKA";
    var encontrado = false;
    var checkOK = "0123456789";
    var checkStr = Campo.value;
    checkStr = checkStr.toUpperCase();
    var letra1 = checkStr.charAt(0);
    var allValid = true;
    if (!(contiene(letra1, checkOK))) {
        result = "CIF";
    } else {
        result = "NIF";
    }
    if (result == "NIF") {
        if (!(contiene(checkStr.charAt(checkStr.length - 1), LETRAS))) {
            allValid = false;
            ErrorDesc = "El campo " + Campo.name + " tiene que tener un car?cter v?lido en la ?ltima posicion. ";
        } else {
            if (!allNum(checkStr.substr(0, checkStr.length - 1))) {
                allValid = false;
                ErrorDesc = "El campo " + Campo.name + " debe ser num?rico a excepci?n del ?ltimo car?cter.";
            } else {
                dValor = checkStr.substr(0, checkStr.length - 1);
                iNumero = (dValor % 23);
                if (LETRAS.charAt(iNumero) != checkStr.charAt(checkStr.length - 1)) {
                    allValid = false;
                    ErrorDesc = "El campo " + Campo.name + " tiene una letra asociada incorrecta.\nLa correcta es: " + LETRAS.charAt(iNumero);
                }
            }
        }
    } else {
        if (checkStr.charAt(0) != "X") {
            if (!(contiene(letra1, letrasInicialesCIF))) {
                allValid = false;
                ErrorDesc = "La primera letra del CIF es incorrecta";
            }
            if (!(contiene(letra1, CIFconLetra))) {
                if (!allNum(checkStr.substr(1, checkStr.length - 1))) {
                    allValid = false;
                    ErrorDesc = "El CIF no puede tener mas de una letra.";
                }
            }
            if (allValid) {
    // Eliminamos la primera letra y el d?gito de control
                var Valor = checkStr.substr(1, checkStr.length - 2);
    // Si no son 7 d?gitos a?adimos ceros
                var cerosAdicionales = 7 - Valor.length;
                for (i = 0; i < cerosAdicionales; i++) {
                    Valor = "0" + Valor;
                }

    // Obtenemos el d?gito de control
                var DC = checkStr.charAt(checkStr.length - 1);

    // Operaci?n con los pares
                var sumaA = Number(Valor.charAt(1)) + Number(Valor.charAt(3)) + Number(Valor.charAt(5));

    // Operaci?n con los impares
                var sumaB = 0;
                for (i = 0; i < 8; i = i + 2) {
                    aux1 = String(Number(Valor.charAt(i)) * 2);
                    if (aux1.length > 1) {
                        aux2 = Number(aux1.charAt(0)) + Number(aux1.charAt(1));
                    } else {
                        aux2 = Number(aux1);
                    }
                    sumaB = sumaB + aux2;
                }
    // Continua el algoritmo para obtener el d?gito de control
                var sumaC = String(sumaA + sumaB);
                var DCbis;
                DCbis = 10 - Number(sumaC.charAt(1));
                if (sumaC.length > 1) {
                    if (sumaC.charAt(1) == "0") {
                        DCbis = 10 - Number(sumaC.charAt(1));
                    } else {
                        DCbis = 10 - Number(sumaC.charAt(1));
                    }
                } else {
                    DCbis = 10 - Number(sumaC);
                }
                if (DCbis == 10) {
                    DCbis = 0;
                }
                if (contiene(DC, mayusculas)) {
                    if (DCbis != (mayusculas.indexOf(DC) + 1)) {
                        allValid = false;
                        ErrorDesc = "El CIF no es correcto.";
                    }
                } else {
                    if (contiene(DC, checkOK)) {
                        if (DCbis != DC) {
                            allValid = false;
                            ErrorDesc = "El CIF no es correcto.";
                        }
                    } else {
                        allValid = false;
                        ErrorDesc = "El CIF no es correcto.";
                    }
                }
            }
        } else {
            if (checkStr.charAt(0) == "X") {
                if (!(contiene(checkStr.charAt(checkStr.length - 1), LETRAS))) {
                    allValid = false;
                    ErrorDesc = "El campo " + Campo.name + " tiene que tener un car?cter v?lido en la ?ltima posici?n.";
                } else {
                    if (!allNum(checkStr.substr(1, checkStr.length - 2))) {
                        allValid = false;
                        ErrorDesc = "El campo " + Campo.name + " debe ser num?rico a excepci?n de la X y el ?ltimo car?cter.";
                    } else {
                        dValor = checkStr.substr(1, checkStr.length - 2);
                        iNumero = (dValor % 23);
                        if (LETRAS.charAt(iNumero) != checkStr.charAt(checkStr.length - 1)) {
                            allValid = false;
                            ErrorDesc = "El campo " + Campo.name + " tiene una letra asociada incorrecta.\nLa correcta es: " + LETRAS.charAt(iNumero);
                        }
                    }
                }
            } else {
                allValid = false;
                ErrorDesc = "El campo " + Campo.name + " es incorrecto.\nNo se ha detectado NIF/CIF/Tarj. Residencia.";
            }
        }
    }
    if (!allValid) {
        seguir = confirm("El formato del campo " + Campo.name + " no parece ser correcto.\n" + ErrorDesc + "\n?Est? seguro que desea seguir con el env?o del mensaje?");
        if (seguir == false) {
            Campo.focus();
            alert("Por favor, revisa el formato del campo " + Campo.name);
            Campo.select();
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
}
var ie45, ns6, ns4, dom;
if (navigator.appName == "Microsoft Internet Explorer") {
    ie45 = parseInt(navigator.appVersion) >= 4;
} else {
    if (navigator.appName == "Netscape") {
        ns6 = parseInt(navigator.appVersion) >= 5;
        ns4 = parseInt(navigator.appVersion) < 5;
    }
}
dom = ie45 || ns6;
function showhide(id) {
    el = document.all ? document.all[id] : dom ? document.getElementById(id) : document.layers[id];
    els = dom ? el.style : el;
    if (dom) {
        if (els.display == "none") {
            els.display = "";
        } else {
            els.display = "none";
        }
    } else {
        if (ns4) {
            if (els.display == "show") {
                els.display = "hide";
            } else {
                els.display = "show";
            }
        }
    }
}
function show(id) {
    el = document.all ? document.all[id] : dom ? document.getElementById(id) : document.layers[id];
    els = dom ? el.style : el;
    if (dom) {
        els.display = "";
    } else {
        if (ns4) {
            els.display = "show";
        }
    }
}
function hide(id) {
    el = document.all ? document.all[id] : dom ? document.getElementById(id) : document.layers[id];
    els = dom ? el.style : el;
    if (dom) {
        els.display = "none";
    } else {
        if (ns4) {
            els.display = "hide";
        }
    }
}
function CompruebaHora(Campo1, Campo2, Campo3) {
    var checkOK = "0123456789";
    var hh = Campo1.value;
    var mm = Campo2.value;
    var ss = Campo3.value;
    var allValid = true;
    for (vv = 0; vv < 2; vv++) {
        ch = hh.charAt(vv);
        ch2 = mm.charAt(vv);
        ch3 = ss.charAt(vv);
        for (ww = 0; ww < checkOK.length; ww++) {
            if (ch == checkOK.charAt(ww)) {
                break;
            }
        }
        for (xx = 0; xx < checkOK.length; xx++) {
            if (ch2 == checkOK.charAt(xx)) {
                break;
            }
        }
        for (yy = 0; yy < checkOK.length; yy++) {
            if (ch3 == checkOK.charAt(yy)) {
                break;
            }
        }
        if ((ww == checkOK.length) || (xx == checkOK.length) || (yy == checkOK.length)) {
            allValid = false;
            break;
        }
    }
    if (!allValid) {
        Campo1.focus();
        alert("Hora incorrecta. Solo admite valores numericos");
        Campo1.select();
        return false;
    }
    var err = 0;
    if (ss > 59 || mm > 59 || hh > 23) {
        err = 1;
    }
    if (hh > 20 || hh < 8) {
        err = 1;
    }
    if ((hh == 20) && (mm != 0)) {
        err = 1;
    }
    if ((hh == 20) && (ss != 0)) {
        err = 1;
    }
    if (err == 1) {
        Campo1.focus();
        alert("Hora incorrecta. Solo admite valores desde 08:00:00 hasta 20:00:00");
        Campo1.select();
        return false;
    }
    return true;
}//Comprueba que la hora sea correcta, se le pasa (hora,minutos,segundos)

//obtiene el nombre de la pagina actual
function obtenNombrePagina() {
        //alert('Aqui');
    ipActual = window.document.location;
    ip = ipActual.toString();
    inicio = ip.indexOf("//", 0);
    ultimo = ip.indexOf(":", inicio + 2);
    sinIp = ip.substring(ultimo, ip.length);
    barras = sinIp.indexOf("/", 0);
    while (barras > 0) {
        ultimaBarra = barras;
        barras = sinIp.indexOf("/", barras + 1);
    }
    ruta = sinIp.substring(ultimaBarra + 1, sinIp.length);
    return ruta;
}

/**
    *  Función que pinta un boton en la posición donde es llamada. 
    *  
    *  @param   texto	    String con el valor mostrado en el boton
    *  @param   funcion		String con la función a ejecutar cuando se pulse el boton
    *
    */	
   
   function pintaBoton (textoBoton,funcionBoton){
   	
		  document.write ('<table class="tablaBoton" cellpadding="0" cellspacing="0" border="0" align="center" onclick="'+funcionBoton+'" >'+
				  '<tr>'+
						'<td rowspan="3" ><img src="images/curva_izq.gif" border="0" alt=""></td>'+
						'<td bgcolor="#f9f9f7"><img src="images/borde_sup.gif" width="100%" height="8" border="0" alt=""></td>'+
						'<td rowspan="3" align="right" ><img src="images/curva_der.gif" border="0" alt=""></td>'+
				  '</tr>'+
				  '<tr align="center">'+
						'<td background="images/fondo2.gif" ><font class="texto2">');
		  
			document.write(textoBoton);

			document.write ('</font></td></tr><tr>'+
					'<td ><img src="images/borde_inf4.gif" width="100%" height="8" border="0" alt=""></td>'+
  				'</tr></table>');
   }

   