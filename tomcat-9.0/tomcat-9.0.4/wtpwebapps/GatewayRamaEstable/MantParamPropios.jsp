<html>
<head>
<title>Operador</title>
<!-- <META HTTP-EQUIV ="expires" CONTENT="1"> -->
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function NumberOk(Campo,Obligatorio){
   if (Campo.value == '') {
    if (Obligatorio){
      Campo.focus();
      alert("Introduzca un valor "+Campo.name);
      Campo.select();
      return (false);
    }
    else return true;
  }
  var checkOK = "0123456789";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  // All characters of the input string are digits
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

    Campo.focus();
    alert("S&oacute;lo puede escribir n&uacute;meros en " + Campo.name);
    Campo.select();
    return (false);
  }
  else
     return true;
}

function CargarAvisarAntesPlazo(tipoSI,tipoNO){
      f = document.theForm;
      if (f.AvisarAntesPlazo.value == tipoSI)
         f.AvisarAntesPlazo.value = tipoNO;
      else{
         f.AvisarAntesPlazo.value = tipoSI;
      }
}



function CargarVolcado(tipo){
      f = document.theForm;

/*      if (f.IN.value == 0){
         f.IN.value = tipo;
         f.queRadio = 0;
      }
      else{
         f.queRadio = 1;
         f.IN.value = 0;
      }*/
}

function CargarCancelacion(tipo){
      f = document.theForm;

/*      if (f.IN.value == 0){
         f.IN.value = tipo;
         f.queRadio = 0;
      }
      else{
         f.queRadio = 1;
         f.IN.value = 0;
      }*/
}



function CargarChekbox(campo, tipo){

	if(campo.value == 0)
		campo.value = tipo;
	else campo.value = 0;

}

function CargarCPAutomatico(tipo){
      f = document.theForm;
      if (f.CPAutomatico.value == 0)
         f.CPAutomatico.value = tipo;
      else{
         f.CPAutomatico.value = 0;
      }
}

function FicheroOk(num){
      f = document.theForm;
      if (f.elements[num].value == ""){

         f.elements[num].focus();
         alert("Ha de introducir un fichero en el "+f.elements[num].name);
         f.elements[num].select();
         return false;
      }
      return true;
}

function Validar(){
      f = document.theForm;
      var tam = f.elements.length;
    if (!NumberOk(f.TiempoProcesosFtp,true)) return;

      if (!NumberOk(f.claveHoraFileAdq,true)) return;
      var checkHoraFile = f.claveHoraFileAdq.value;
      if (checkHoraFile.length < 6 || checkHoraFile.length > 6){
             f.claveHoraFileAdq.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraFileAdq.select();
             return;
      }

      if (!NumberOk(f.claveHoraRefAdq,true)) return;
      var checkHoraRef = f.claveHoraRefAdq.value;
      if (checkHoraRef.length < 6 || checkHoraRef.length > 6){
             f.claveHoraRefAdq.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraRefAdq.select();
             return;
      }

      if (!NumberOk(f.clavetiempoProcesosAdq,true)) return;
      if (!NumberOk(f.clavePorcentajeAdq,true)) return;

    if(f.p24.value == "0") {
      if (!NumberOk(f.claveHoraRefAdqCP,true)) return;
      var checkHoraRefCP = f.claveHoraRefAdqCP.value;
      if (checkHoraRefCP.length < 6 || checkHoraRefCP.length > 6){
             f.claveHoraRefAdqCP.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraRefAdqCP.select();
             return;
      }

      if (!NumberOk(f.clavetiempoProcesosAdqCP,true)) return;
      if (!NumberOk(f.clavesegFichOpe,true)) return;


	  } else {

      	if (!NumberOk(f.claveHoraRefPNC15,true)) return;
      	if (f.claveHoraRefPNC15.value.length < 6 || f.claveHoraRefPNC15.value.length > 6){
	             f.claveHoraRefPNC15.focus();
	             alert("El valor introducido para el campo no es v&aacute;lido");
	             f.claveHoraRefPNC15.select();
	             return;
	    }
      	if (!NumberOk(f.claveHoraRefPNC16,true)) return;
      	if (f.claveHoraRefPNC16.value.length < 6 || f.claveHoraRefPNC16.value.length > 6){
	             f.claveHoraRefPNC16.focus();
	             alert("El valor introducido para el campo no es v&aacute;lido");
	             f.claveHoraRefPNC16.select();
	             return;
	    }

      	if (!NumberOk(f.claveTProcPNC,true)) return;
      	
      }

      f.submit();
}

function ValidarCamposAdq(){
      f = document.theForm;
      var tam = f.elements.length;

         if (f.claveDiasRefAdq.value == ""){
             f.claveDiasRefAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.claveDiasRefAdq.name);
             f.claveDiasRefAdq.select();
             return false;
          }
          if (f.claveHoraRefAdq.value == ""){
             f.claveHoraRefAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.claveHoraRefAdq.name);
             f.claveHoraRefAdq.select();
             return false;
          }
          if (f.clavetiempoProcesosAdq.value == ""){
             f.clavetiempoProcesosAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.clavetiempoProcesosAdq.name);
             f.clavetiempoProcesosAdq.select();
             return false;
          }
          if (f.PathFicherosAdq.value == ""){
             f.PathFicherosAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.PathFicherosAdq.name);
             f.PathFicherosAdq.select();
             return false;
          }
          if (f.clavePorcentajeAdq.value == ""){
             f.clavePorcentajeAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.clavePorcentajeAdq.name);
             f.clavePorcentajeAdq.select();
             return false;
          }
          if (f.claveDescargarAdq.value == ""){
             f.claveDescargarAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.claveDescargarAdq.name);
             f.claveDescargaAdq.select();
             return false;
          }
          if (f.claveHoraFileAdq.value == ""){
             f.claveHoraFileAdq.focus();
             alert("Ha de introducir un valor en el campo "+f.claveHoraFileAdq.name);
             f.claveHoraFileAdq.select();
             return false;
          }
          if (f.claveVolcadoIN.value == ""){
             f.claveVolcadoIN.focus();
             alert("Ha de introducir un valor en el campo "+f.claveVolcadoIN.name);
             f.claveVolcadoIN.select();
             return false;
          }
          if (!NumberOk(f.claveHoraFileAdq,true)) return false;
          var checkStr = f.claveHoraFileAdq.value;
          if (checkStr.length < 6 || checkStr.length > 6){
             f.claveHoraFileAdq.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraFileAdq.select();
             return false;
          }

          if (!NumberOk(f.claveHoraRefAdq,true)) return false;
          var checkStr1 = f.claveHoraRefAdq.value;
          if (checkStr1.length < 6 || checkStr1.length > 6){
             f.claveHoraRefAdq.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraRefAdq.select();
             return false;
          }

      if (!NumberOk(f.clavetiempoProcesosAdq,true)) return false;
      if (!NumberOk(f.clavePorcentajeAdq,true)) return false;


      fadq.submit();
}
function ValidarCamposAdqCP(){

          if (!NumberOk(f.claveHoraRefAdqCP,true)) return false;
          var checkStr1 = f.claveHoraRefAdqCP.value;
          if (checkStr1.length < 6 || checkStr1.length > 6){
             f.claveHoraRefAdqCP.focus();
             alert("El valor introducido para el campo no es v&aacute;lido");
             f.claveHoraRefAdqCP.select();
             return false;
          }

      if (!NumberOk(f.clavetiempoProcesosAdqCP,true)) return false;

}
function expiroAlarmaFTPJS(){
			f=document.fback;
			f.action='ExpirarAlarmaFTP';
			f.submit()
}

//-->

mostrar = new Image();
mostrar.src = "images/mostrar.gif";
ocultar = new Image();
ocultar.src = "images/ocultar.gif";

function mostrarOcultar(imagen)
{
	if(imagen.name=="ocultar"){
		imagen.src = mostrar.src;
		imagen.name="mostrar";
	}
	else{
		imagen.src = ocultar.src;
		imagen.name = "ocultar";
	}
	mostrarAlt(imagen);
}

function mostrarAlt(imagen){
	if(imagen.name=="ocultar")
		imagen.alt="Pulse para Ocultar...";

	else
		imagen.alt="Pulse para Mostrar...";


}


</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.util.ParametroBeanCollection,
                 es.portanode.util.ParametroBean"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
	String p24 = ParametroBeanCollection.getValor(ParametroBeanCollection.CLAVE_PORTA_24);
    String subtitulo1 = new String("Mantenimiento de par&aacute;metros de sistema particulares ");
	String operadorActual = (String) request.getAttribute("OperadorConectado");

    String pathOut = (String) request.getAttribute("PathOut");
    String pathLanzar= (String) request.getAttribute("PathLanzar");
    String pathCargar= (String) request.getAttribute("PathCargar");
    String pathPreg= (String) request.getAttribute("PathPreguntas");
    String pathResp= (String) request.getAttribute("PathRespuestas");
    String pathExpor= (String) request.getAttribute("PathExportacion");
    String pathIN= (String) request.getAttribute("PathIN");



    String tiempoprocesosFtp		= (String) request.getAttribute("TiempoProcesosFtp");


    //cargar valores por defecto
    if (tiempoprocesosFtp.equals(""))			{	tiempoprocesosFtp		= (String)ParametroBeanCollection.TIEMPO_FTP_POR_DEFECTO;		}

	String fechaFtp = (String) request.getAttribute("FechaFtp");

	//Adquisicion
	String claveHoraRefAdq = (String) request.getAttribute("claveHoraRefAdq");
	String clavetiempoProcesosAdq = (String) request.getAttribute("clavetiempoProcesosAdq");
	String PathFicherosAdq = (String) request.getAttribute("PathFicherosAdq");
	String clavePorcentajeAdq = (String) request.getAttribute("clavePorcentajeAdq");
	String claveHoraFileAdq = (String) request.getAttribute("claveHoraFileAdq");


    System.out.println("claveHoraFileAdq: " + claveHoraFileAdq);

    //Adquisicion MensajesCP's
	String claveHoraRefAdqCP        = (String) request.getAttribute("claveHoraRefAdqCP");
	String clavetiempoProcesosAdqCP = (String) request.getAttribute("clavetiempoProcesosAdqCP");
//Carga fichero Operadores
      String clavesegFichOpe        = (String) request.getAttribute("limiteDiferenciaOperadores");

    String claveactivatraspasos        = (String) request.getAttribute("claveactivatraspasos");

  	//Adquisicion PNC
  	String claveHoraRefPNC15 = (String) request.getAttribute("claveHoraRefPNC15");
  	String claveHoraRefPNC16 = (String) request.getAttribute("claveHoraRefPNC16");
  	String claveTProcPNC = (String) request.getAttribute("claveTProcPNC");

  	//Automatización Carga Fichero Solicitudes
  	/*String pathFicherosSinProcesar = (String) request.getAttribute("PathFicherosSinProcesar");
  	String pathFicherosProcesados = (String) request.getAttribute("PathFicherosProcesados");
  	String limiteRegistrosFichero = (String) request.getAttribute("LimiteRegistrosFichero");
  	String notificacionesFicherosProcesados = (String) request.getAttribute("NotificacionesFicherosProcesados");*/


%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
        <TBODY>
        <TR>
          <td width="10" class="Fondoverdederecha">&nbsp;

          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
                <FORM ACTION="ModificacionParamPropios" method="POST" NAME="theForm">
                <input type="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="queRadio">
	<INPUT TYPE="hidden" name="p24" id="p24" value="<%=p24%>">

                
                <table border="0" width="100%">

                        <!-- **********************************		CLAVE_TIEMPO_PROCESOS_FTP			 ********************************* -->

                    <tr>
            <td width="40%"><font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Tiempo de los procesos FTP</B></font>
                      <a onclick="showhide('paramsFtp');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
                      </td>
                    </tr>

                    <tr style="display:none" id="paramsFtp">
                    	<td>
                    		<table width="100%" cellspacing="15">
                    			<tr>
                        <td width="40%"><font class="texto2" size="2"><B>Carga de Datos</B><BR></font><font class="texto2" size="1"> (si se introduce un valor YYYYMMDDHHMISS se reprograma la alarma)</font></td>
                        <td width="25%"><small><input type="text" size="40" maxlength="40" name="TiempoProcesosFtp" value="<%=tiempoprocesosFtp%>"></small></td>
                        <td width="35%"><font class="texto2" size="2"><B>Valor actual: </B> <%=fechaFtp%></font></td>
                    </tr>

                    <tr>
                            		<td width="40%"><font class="texto2" size="2">Path Ficheros Verificaci&oacute;n (OUTPUT)</font></td>
                            		<td colspan=2><small><input type="text" size="60" maxlength="100" name="PathOut" value="<%=pathOut%>"></small></td>
								</tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros Lanzamiento (INPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathLanzar" value="<%=pathLanzar%>"></small></td>
                    </tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros Cargas (INPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathCargar" value="<%=pathCargar%>"></small></td>
                    </tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros Preguntas (OUTPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathPreguntas" value="<%=pathPreg%>"></small></td>
                    </tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros Respuestas (INPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathRespuestas" value="<%=pathResp%>"></small></td>
                    </tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros Exportaci&oacute;n (OUTPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathExportacion" value="<%=pathExpor%>"></small></td>
                    </tr>
                    <tr>
                        <td width="40%"><font class="texto2" size="2">Path Ficheros IN (OUTPUT)</font></td>
                        <td colspan=2><small><input type="text" size="60" maxlength="100" name="PathIN" value="<%=pathIN%>"></small></td>
                    </tr>
                    		</table>
                    	</td>
                    </tr>
                </table>
                <HR>
                <table border="0" width="100%">

                        <!-- **********************************		ADQUISICION			 ********************************* -->

                    <tr>
                      <td width="30%"><font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Adquisici&oacute;n Diaria</B></font>
                      <a onclick="showhide('paramsAdq');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
                      </td>
                      <td width="40%"></td>
                      <td width="30%">&nbsp;</td>
                    </tr>
                    <tr style="display:none" id="paramsAdq">
                    	<td width="100%" colspan="3">
                    		<table width="100%" cellspacing="15">
			                    <tr>
                            		<td width="40%"><font class="texto2" size="2">Hora Referencia Adquisici&oacute;n</font><font class="texto2" size="1"> (HHMMSS)</font></td>
                            		<td><small><input type="text" size="50" maxlength="100" name="claveHoraRefAdq" value="<%=claveHoraRefAdq%>"></small></td>
                    			</tr>
                    			<tr>
		                            <td width="40%"><font class="texto2" size="2">Tiempo Procesos Adquisici&oacute;n</font></td>
        		                    <td><small><input type="text" size="50" maxlength="100" name="clavetiempoProcesosAdq" value="<%=clavetiempoProcesosAdq%>"></small></td>
                			    </tr>
                    			<tr>
		                            <td width="40%"><font class="texto2" size="2">Porcentaje Adquisici&oacute;n</font></td>
		                            <td><small><input type="text" size="50" maxlength="100" name="clavePorcentajeAdq" value="<%=clavePorcentajeAdq%>"></small></td>
        			            </tr>
                			</table>
                		</td>
                	</tr>
                </table>

                <HR>
                <table border="0" width="100%">

                        <!-- **********************************		ADQUISICION MENSAJES CP'S			 ********************************* -->

                    <tr>
            <td width="30%"><font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Adquisici&oacute;n Mensajes <%if("1".equals(p24)){%>PNC's<%}else{%>CP's<%} %></B></font>
                      <a onclick="showhide('paramsCp');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
                      </td>
                    </tr>

                    <tr style="display:none" id="paramsCp">
                    	<td>
                    		<table width="100%" cellspacing="15">
				<%if("1".equals(p24)) { %>
			                    <tr>
    	                <td width="40%"><font class="texto2" size="2">Hora Referencia Adquisici&oacute;n Proceso B&aacute;sico</font><font class="texto2" size="1"> (HHMMSS)</font></td>
           		        <td><small><input type="text" size="50" maxlength="100" name="claveHoraRefPNC15" value="<%=claveHoraRefPNC15%>"></small></td>
           			</tr>
           			<tr>
    	                <td width="40%"><font class="texto2" size="2">Hora Referencia Adquisici&oacute;n Proceso Asegurado</font><font class="texto2" size="1"> (HHMMSS)</font></td>
           		        <td><small><input type="text" size="50" maxlength="100" name="claveHoraRefPNC16" value="<%=claveHoraRefPNC16%>"></small></td>
           			</tr>
                    <tr>
   		                <td width="40%"><font class="texto2" size="2">Tiempo Procesos Adquisici&oacute;n</font></td>
           		        <td><small><input type="text" size="50" maxlength="100" name="claveTProcPNC" value="<%=claveTProcPNC%>"></small></td>
           			</tr>
           		<%}else{ %>
                    <tr>
            		                <td width="40%"><font class="texto2" size="2">Hora Referencia Adquisici&oacute;n</font><font class="texto2" size="1"> (HHMMSS)</font></td>
                    		        <td><small><input type="text" size="50" maxlength="100" name="claveHoraRefAdqCP" value="<%=claveHoraRefAdqCP%>"></small></td>
                    			</tr>

			                    <tr>
            		                <td width="40%"><font class="texto2" size="2">Tiempo Procesos Adquisici&oacute;n</font></td>
                    		        <td><small><input type="text" size="50" maxlength="100" name="clavetiempoProcesosAdqCP" value="<%=clavetiempoProcesosAdqCP%>"></small></td>
                    			</tr>
                 <%}%>
	           			     </table>
						</td>
					</tr>
				</table>

                <HR>
                <!-- **********************************		PARAMETRO COMUN ADQUISICION DIARIA Y CP			 ********************************* -->
                <table border="0" width="100%">
                  <tr><td>
            <font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Par&aacute;metro Com&uacute;n ADQ Diaria y <%if("1".equals(p24)){%>PNC<%}else{%>CP<%} %></B></font>
                      	<a onclick="showhide('paramAdqCp');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
                    </td></tr>
				</table>
                <table style="display:none" id="paramAdqCp" border="0" cellspacing="15" width="100%">
                        <tr>
                            <td width="40%"><font class="texto2" size="2">Hora Fichero Adquisici&oacute;n</font><font class="texto2" size="1"> (HHMMSS)</font></td>
                            <td colspan=2><small><input type="text" size="50" maxlength="100" name="claveHoraFileAdq" value="<%=claveHoraFileAdq%>"></small></td>
                    	</tr>
			            <tr>
            <td width="40%"><font class="texto2" size="2">Path Ficheros Adquisici&oacute;n</font></td>
                    		<td><small><input type="text" size="50" maxlength="100" name="PathFicherosAdq" value="<%=PathFicherosAdq%>"></small></td>
                    	</tr>
                </table>
                <HR>
                    <table border="0" width="100%">

                               <!-- **********************************		CARGA FICHERO OPERADORES			 ********************************* -->

                               <tr>
                                   <td width="30%"><font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Carga Ficheros Operadoras</B></font>
                                       <a onclick="showhide('paramsCfo');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
                                   </td>
                               </tr>

                               <tr style="display:none" id="paramsCfo">
                                   <td>
                                       <table width="100%" cellspacing="15">

                                           <tr>
                                               <td width="40%"><font class="texto2" size="2">Porcentaje seguridad</font></td>
                                               <td><small><input type="text" size="50" maxlength="100" name="clavesegFichOpe" value="<%=(clavesegFichOpe!=null)?clavesegFichOpe:""%>"></small></td>
                                           </tr>


                                       </table>
                                   </td>
                               </tr>
                           </table>

    <HR>
    <table border="0" width="100%">

        <!-- **********************************		VERSIONADO TRASPASO TERCEROS			 ********************************* -->

        <tr>
            <td width="30%"><font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Versionado Traspaso Terceros</B></font>
                <a onclick="showhide('paramsacttraspasos');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
            </td>
        </tr>

        <tr style="display:none" id="paramsacttraspasos">
            <td>
                <table width="100%" cellspacing="15">

                    <tr>
                        <td width="40%"><font class="texto2" size="2">Activar Traspasos Terceros</font></td>

                        <td><small><input type="checkbox" name="claveactivatraspasos" value="true"  <%=(claveactivatraspasos!=null&& claveactivatraspasos.equals("1"))?"checked":" "%> ></small></td>
                    </tr>


                </table>
            </td>
        </tr>
    </table>
<hr>
                </FORM>

                <BR>
                <FORM METHOD=POST ACTION="PrevioMenuParamSis" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
    <input type="hidden" name="TiempoFtp" value="<%=tiempoprocesosFtp%>">

    <INPUT TYPE="hidden" name="Posicion" value="1">
    <INPUT TYPE="hidden" name="Primera" value="1">
</FORM>

<FORM METHOD=POST ACTION="ProcesarAdquisicion.jsp" name="fadq">
    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                </FORM>

                <div align="center"><center>
                <table border="0">
                    <tr>
                      <td valign="center"><A HREF="javascript:Validar()//'" onMouseOver="window.status='Actualizar datos';return true" onMouseOut="window.status=' '"><IMG src="images/Manten2.jpg" width="107" height="28" border="0"/></A></td>
                      <td><A HREF="javascript:history.back()//'" onMouseOver="window.status='P&aacute;gina Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"/></A></td>
                    </tr>
                </table>
                </center>
                </div>
<%--Nueva imagen--%>
             </td>
            <td width="10" class="Fondoverdederecha">&nbsp;

            </td>
         </TR>
       </TBODY>
   </TABLE>
<jsp:include page="pie.jsp" flush="true"/>

</body>
</html>