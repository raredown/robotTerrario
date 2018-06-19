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

function ComprobarNumeracion(tipo){
      f = document.theForm;
      if (f.comprobarNumeracion.value == 0)
         f.comprobarNumeracion.value = tipo;
      else{
         f.comprobarNumeracion.value = 0;
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

      if (!NumberOk(f.DiasANotificar,false)) return;

      if(f.p24.value == "1") {
        	if (!NumberOk(f.numMaxSol,true)) return;
      }

      f.submit();
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
    String subtitulo1 = new String("Mantenimiento de par&aacute;metros de sistema generales");
	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String permiso = (String) request.getAttribute("PermisoPortabilidad");
	
	boolean bajaBatchActivo = false;
	if (ParametroBeanCollection.getValor(ParametroBeanCollection.CLAVE_BAJA_BATCH_ACTIVO).equals("1")) {
		bajaBatchActivo = true;
	}

 	//Envio automatico CP
 	String CPAutomatico = (String) request.getAttribute("CPAutomatico");
    //Comprobar la numeracion portada
    String compNumeracion = (String) request.getAttribute("comprobarNumeracion");
	//Cerrar procesos por expiracion de alarmas
	String cerrarPorAlarmaA02 = (String) request.getAttribute("cerrarPorAlarmaA02");
    String cerrarPorAlarmaA04 = (String) request.getAttribute("cerrarPorAlarmaA04");
    String cerrarPorAlarmaA21 = (String) request.getAttribute("cerrarPorAlarmaA21");
	String cerrarPorAlarmaA22 = (String) request.getAttribute("cerrarPorAlarmaA22");

    String cerrarP03PorAlarmaA22 = (String) request.getAttribute("cerrarP03PorAlarmaA22");
    String cerrarP03PorAlarmaA30 = (String) request.getAttribute("cerrarP03PorAlarmaA30");
    String cerrarP03PorAlarmaA19 = (String) request.getAttribute("cerrarP03PorAlarmaA19");
	String cerrarP03PorAlarmaA09 = (String) request.getAttribute("cerrarP03PorAlarmaA09");
    String cerrarP03PorAlarmaA03 = (String) request.getAttribute("cerrarP03PorAlarmaA03");
    String cerrarP03PorAlarmaA02 = (String) request.getAttribute("cerrarP03PorAlarmaA02");
	String cerrarP03PorAlarmaA01 = (String) request.getAttribute("cerrarP03PorAlarmaA01");

	String notificacionesErrores   = (String) request.getAttribute("NotificacionesErrores");
    String notificacionesExpirados = (String) request.getAttribute("NotificacionesExpirados");
	String notificacionesInformes  = (String) request.getAttribute("NotificacionesInformes");
    String notificacionesInformesErrores = (String) request.getAttribute("NotificacionesInformesErrores");
	String diasANotificar = (String) (request.getAttribute("DiasANotificar")==null?"0":request.getAttribute("DiasANotificar"));

	String avisarantesfinalplazo	= (String) request.getAttribute("AvisarAntesFinalPlazo");
	String tiempoantelacionaviso	= (String) request.getAttribute("TiempoAntelacionAviso");
    String tiempoavisoABEX          = (String) request.getAttribute("TiempoAvisoABEX");
    String numMaxSol = (String) request.getAttribute("numMaxSol");



	//cargar valores por defecto
	if (tiempoantelacionaviso.equals("0"))
    {
        tiempoantelacionaviso	= (String)ParametroBeanCollection.ANTELACION_POR_DEFECTO;
    }

    if (tiempoavisoABEX.equals("0"))
    {
        tiempoavisoABEX	= (String)ParametroBeanCollection.ANTELACION_POR_DEFECTO;
    }

    // Atributo Notificaciones ADQ
    String notificacionesADQ = (String) request.getAttribute("val_notificaADQ");
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
                <FORM ACTION="ModificacionParamGeneral" method="POST" NAME="theForm">
                <input type="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="queRadio">
                <INPUT TYPE="hidden" name="p24" id="p24" value="<%=p24%>">

	            <DIV align=left class="Titulo"><img src="images/flecha.gif" border="0"/>Parámetros del Sistema
    	        <a onclick="showhide('paramsGeneral');"><img align="middle" name="ocultar" border="0" height="13" width="14" src="images/ocultar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)" /></a></DIV>


                <table id="paramsGeneral" border="0" cellspacing="15" cellpadding="1"  width="100%">
                  <tr>
                    <td><font class="texto2" size="2">Flag permiso portabilidad </font></td>
                    <td><small>
                      <select size="1" name="PermisoPortabilidad">
                        <%
                    if (permiso.equals(ParametroBeanCollection.FUERZA_MAYOR_ACTIVA)){
                %>
                        <option selected value="<%=ParametroBeanCollection.FUERZA_MAYOR_ACTIVA%>">NO</option>
                        <option value="<%=ParametroBeanCollection.FUERZA_MAYOR_INACTIVA%>">SI</option>
                        <%	}else{
                %>
                        <option value="<%=ParametroBeanCollection.FUERZA_MAYOR_ACTIVA%>">NO</option>
                        <option selected value="<%=ParametroBeanCollection.FUERZA_MAYOR_INACTIVA%>">SI</option>
                        <%	}
                %>
                      </select>
                    </small></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>

                  </tr>


                  <tr>
                    <!-- **********************************		CLAVE_TIEMPO_ANTELACION_AVISOS_FINAL_PLAZO ********************************* -->
                    <td colspan="1" width="50%"><font class="texto2" size="2">Tiempo de Antelaci&oacute;n de los Avisos de final de plazo </font>
                    <td><small>
                      <select size="1" name="TiempoAntelacionAviso">
                      <%
                        String aux="";
                        for(int i=0;i<25;i++){
                          aux=(i*5)+"";
                          if(tiempoantelacionaviso.equals(aux)){
                      %>
                             <option selected value='<%=aux%>'><%=aux%> </option>
                      <%  }else{%>
                             <option value='<%=aux%>'><%=aux%></option>
                      <%   }//del else
                      }//del for
                      %>
                      </select>
                    <font class="texto2" size="2">&nbsp;&nbsp;minutos</font>
                    </td></small>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>

                  <tr>
                    <!-- **********************************		CLAVE_TIEMPO_ANTELACION_AVISOS_FINAL_PLAZO ********************************* -->
                    <td colspan="1" width="50%"><font class="texto2" size="2">Tiempo de Aviso para procesos Abiertos y Expirados </font>
                    <td><small>
                      <select size="1" name="TiempoAvisoABEX">
                      <%
                        String aux3="";
                        for(int i=0;i<25;i++){
                          aux3=(i*5)+"";
                          if(tiempoavisoABEX.equals(aux3)){
                      %>
                             <option selected value='<%=aux3%>'><%=aux3%> </option>
                      <%  }else{%>
                             <option value='<%=aux3%>'><%=aux3%></option>
                      <%   }//del else
                      }//del for
                      %>
                      </select>
                    <font class="texto2" size="2">&nbsp;&nbsp;minutos</font>
                    </td></small>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
				<tr>
                    <td colspan="1" width="50%"><font class="texto2" size="2">Paramétro activación Portabilidad 24 Horas </font>
                    <td><small>
                      <select size="1" name="porta24Activo">
                        <%
                    if (ParametroBeanCollection.isPorta24Activo()){
                %>
                        <option value="0">NO</option>
                        <option selected value="1">SI</option>
                        <%	}else{
                %>
                        <option selected value="0">NO</option>
                        <option value="1">SI</option>
                        <%	}
                %>
                      </select>
                    </small></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="1" width="50%"><font class="texto2" size="2">Paramétro inhabilitación de solicitudes de Portabilidad</font>
                    <td><small>
                      <select size="1" name="inhabilitaSolPortaActivo">
                        <%
                    if (ParametroBeanCollection.isInhabilitaSolPortaActivo()){
                %>
                        <option value="0">NO</option>
                        <option selected value="1">SI</option>
                        <%	}else{
                %>
                        <option selected value="0">NO</option>
                        <option value="1">SI</option>
                        <%	}
                %>
                      </select>
                    </small></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>

                   <!--//****************************************		CLAVE_AVISAR_ANTES_FINAL_PLAZO *********************************-->
                  <tr>
                  <td colspan="1"><small>
                    <input type="checkbox" name="AvisarAntesPlazo" value="<%=avisarantesfinalplazo%>"
                    <%if (avisarantesfinalplazo.equals(ParametroBeanCollection.AVISO_ACTIVADO)){%>checked<%}%>
                    onClick="CargarAvisarAntesPlazo('<%=ParametroBeanCollection.AVISO_ACTIVADO%>','<%=ParametroBeanCollection.AVISO_DESACTIVADO%>')">
                  </small> <font class="texto2" size="2"> Avisar antes de Final de Plazo</font> </td>
				<%if(!"1".equals(p24)) { %>
                  <td colspan="1"><small>
                    <input type="checkbox" name="CPAutomatico" value="<%=CPAutomatico%>"
                    <%if (CPAutomatico.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                    onClick="CargarCPAutomatico(<%=ParametroBean.ACTIVADO%>)">
                  </small><font class="texto2" size="2"> Env&iacute;o Autom&aacute;tico de CP </font></td>
                <%} else {%>
                    <td colspan="1"><small>
                    <input type="checkbox" style="visibility: hidden;" name="CPAutomatico" value="<%=CPAutomatico%>"
                    <%if (CPAutomatico.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                    onClick="CargarCPAutomatico(<%=ParametroBean.ACTIVADO%>)">
                  </small><font style="visibility: hidden;" class="texto2" size="2"> Env&iacute;o Autom&aacute;tico de CP </font></td>
                <%} %>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                 </tr>

                 <tr>
                 <td colspan="1"><small>
                    <input type="checkbox" name="comprobarNumeracion" value="<%=compNumeracion%>"
                    <%if (compNumeracion.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                    onClick="ComprobarNumeracion(<%=ParametroBean.ACTIVADO%>)">
                  </small><font class="texto2" size="2"> Comprobar Numeraci&oacute;n Portada</font></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                 </tr>
				 <%
	                if("1".equals(p24)){
	                %>
					 <tr>
	                    <td colspan="1" width="50%"><font class="texto2" size="2">N&uacute;mero solicitudes m&aacute;ximas por d&iacute;a</font>
	                    <td><small>
	                      <input type="text" size="6" maxlength="10" name="numMaxSol" value="<%=numMaxSol%>">
	                    </td></small>
	                    <td>&nbsp;</td>
	                    <td>&nbsp;</td>
	                  </tr>
				<% } %>
                </table>


                <HR>
                <!-- **********************************		Parametros que indican si se cierran los procesos por exipracion de alarmas			 ********************************* -->
                <table border="0" width="100%">
                	<tr>
                		<td><font class="Titulo" size="2"><B><img src="images/flecha.gif" border="0"/>Cerrar proceso Cambio de Operador por expiraci&oacute;n de Alarmas</B></font>
                		<a onclick="showhide('paramsAlarmas');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a></td>
                	</tr>
                	<!--En esta tabla van los parametros que son los que se hacen visibles al linkar-->
                	<tr style="display:none" id="paramsAlarmas">
                		<td>
                			<table border="0" cellspacing="15" width="100%">
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso <%if("1".equals(p24)){%>cambio<%}else{%>01<%} %> por Alarma A02</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarPorAlarmaA02" value="<%=cerrarPorAlarmaA02%>"
                      					<%if (cerrarPorAlarmaA02.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso si no enviamos mensaje ASP dentro del plazo establecido.</font></td>
                				</tr>
                				<%if(!"1".equals(p24)) { %>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 01 por Alarma A04</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarPorAlarmaA04" value="<%=cerrarPorAlarmaA04%>"
                      					<%if (cerrarPorAlarmaA04.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso si no envía/recibe el mensaje CP dentro del plazo establecido.</font></td>
                				</tr>
                				<%}%>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso <%if("1".equals(p24)){%>cambio<%}else{%>01<%}%> por Alarma A21</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarPorAlarmaA21" value="<%=cerrarPorAlarmaA21%>"
                      					<%if (cerrarPorAlarmaA21.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso que previamente había sido encolado, al no haber recibido mensaje ASP dentro del plazo establecido.</font></td>
                				</tr>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso <%if("1".equals(p24)){%>cambio<%}else{%>01<%}%> por Alarma A22</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarPorAlarmaA22" value="<%=cerrarPorAlarmaA22%>"
                      					<%if (cerrarPorAlarmaA22.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso al no haber recibido mensaje ASP dentro del plazo establecido.</font></td>
                				</tr>
                				<%if("1".equals(p24)) { %>
                				<tr>
                					<td><font class="texto2" style="visibility: hidden;"  size="2"><B>Cerrar proceso 01 por Alarma A04</B></font></td>
                					<td>
                						<input type="checkbox" style="visibility: hidden;"  name="cerrarPorAlarmaA04" value="<%=cerrarPorAlarmaA04%>"
                      					<%if (cerrarPorAlarmaA04.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font style="visibility: hidden;"  class="texto2" size="2">Cierra proceso si no envía/recibe el mensaje CP dentro del plazo establecido.</font></td>
                				</tr>
                				<%}%>
                			</table>
                		</td>
                	</tr>
                </table>
                <HR>


                <table border="0" width="100%">
                	<tr>
                		<td><font class="Titulo" size="2"><B><img src="images/flecha.gif" border="0"/>Cerrar proceso Baja Numeraci&oacute;n por expiraci&oacute;n de Alarmas</B></font>
                		<a onclick="showhide('paramsAlarmas2');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a></td>
                	</tr>
                	<!--En esta tabla van los parametros que son los que se hacen visibles al linkar-->
                	<tr style="display:none" id="paramsAlarmas2">
                		<td>
                			<table border="0" cellspacing="15" width="100%">
                			
                			<% if (!bajaBatchActivo) { %>
                                <tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A22</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA22" value="<%=cerrarP03PorAlarmaA22%>"
                      					<%if (cerrarP03PorAlarmaA22.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso al no haber recibido mensaje ANB/DNB dentro del plazo establecido.</font></td>
                				</tr>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A30</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA30" value="<%=cerrarP03PorAlarmaA30%>"
                      					<%if (cerrarP03PorAlarmaA30.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso al no haber recibido mensaje CNB dentro del plazo establecido.</font></td>
                				</tr>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A19</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA19" value="<%=cerrarP03PorAlarmaA19%>"
                      					<%if (cerrarP03PorAlarmaA19.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso al no haber recibido mensaje ACNB/DCNB dentro del plazo establecido.</font></td>
                				</tr>
                				<tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A09</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA09" value="<%=cerrarP03PorAlarmaA09%>"
                      					<%if (cerrarP03PorAlarmaA09.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso si no enviamos el mensaje CNB dentro del plazo establecido.</font></td>
                				</tr>
                				<% }

                				if (bajaBatchActivo) {%>

                                <tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A02</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA02" value="<%=cerrarP03PorAlarmaA02%>"
                      					<%if (cerrarP03PorAlarmaA02.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso si no recibimos el mensaje NBACK dentro del plazo establecido.</font></td>
                				</tr>
                				
                				<% } %>

                                <tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A03</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA03" value="<%=cerrarP03PorAlarmaA03%>"
                      					<%if (cerrarP03PorAlarmaA03.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				
                      				<% if (!bajaBatchActivo) { %>
                      				<td><font class="texto2" size="2">Cierra proceso si no enviamos el mensaje ACNB/DCNB2 dentro del plazo establecido.</font></td>
                      				<% } else { %>
                      				<td><font class="texto2" size="2">Cierra proceso si no recibimos el mensaje CFC dentro del plazo establecido.</font></td>
                      				<% } %>
                				</tr>

							<% if (!bajaBatchActivo) { %>

                                <tr>
                					<td><font class="texto2" size="2"><B>Cerrar proceso 03 por Alarma A01</B></font></td>
                					<td>
                						<input type="checkbox" name="cerrarP03PorAlarmaA01" value="<%=cerrarP03PorAlarmaA01%>"
                      					<%if (cerrarP03PorAlarmaA01.equals(ParametroBean.ACTIVADO)){%> checked <%}%>
                      					onClick="CargarChekbox(this,<%=ParametroBean.ACTIVADO%>)">
                      				</td>
                      				<td><font class="texto2" size="2">Cierra proceso por falta de recepci&oacute;n del mensaje CFC dentro del plazo establecido.</font></td>
                				</tr>
                			<% } %>
                			</table>
                		</td>
                	</tr>
                </table>
                <HR>

          <!-- **********************************		NOTIFICACIONES			 ********************************* -->
        <table border="0" width="100%">
          <tr><td>
            	<font class="Titulo" size="2"><img src="images/flecha.gif" border="0"/><B>Notificaciones</B></font>
				<a onclick="showhide('paramNoti');"><img align="middle" border="0" height="13" width="14" name="mostrar" src="images/mostrar.gif" onclick="mostrarOcultar(this)" onMouseOver="mostrarAlt(this)"/></a>
			</td></tr>
		</table>


        <table style="display:none" id="paramNoti" border="0" cellspacing="15" width="100%">

          <tr>
            <td width="40%"></td>
          </tr>
          <tr>
            <td width="40%"><font class="texto2" size="2">Notificaciones Errores</font></td>
            <td><small>
              <input type="text" size="50" maxlength="100" name="NotificacionesErrores" value="<%=notificacionesErrores%>">
              </small></td>
          </tr>
          <tr>
            <td width="40%"><font class="texto2" size="2">Notificaciones Adquisici&oacute;n
              (Diaria y <%if("1".equals(p24)){%>PNC<%}else{%>CP<%}%>)</font></td>
            <td><small>
              <input type="text" size="50" maxlength="100" name="NotificacionesADQ" value="<%=notificacionesADQ%>">
              </small></td>
          </tr>
          <tr>
            <td width="40%"><font class="texto2" size="2">N&uacute;mero de d&iacute;as
              a visualizar</font></td>
            <td><small>
              <select size="1" name="DiasANotificar">
              <%
                String aux2="";
                for(int i=0;i<7;i++){
                  aux2=(i*5)+"";
                  if(diasANotificar.equals(aux2)){
              %>
                     <option selected value='<%=aux2%>'><%=aux2%> </option>
              <%  }else{%>
                     <option value='<%=aux2%>'><%=aux2%></option>
              <%   }//del else
              }//del for
              %>
              </select>
            </td></small>
          </tr>
          <tr>
            <td width="40%"><font class="texto2" size="2">Notificaciones Procesos Expirados</font></td>
            <td><small>
              <input type="text" size="50" maxlength="100" name="NotificacionesExpirados" value="<%=notificacionesExpirados%>">
              </small></td>
          </tr>
        </table>

                </FORM>

                <BR>
                <FORM METHOD=POST ACTION="PrevioMenuParamSis" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
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