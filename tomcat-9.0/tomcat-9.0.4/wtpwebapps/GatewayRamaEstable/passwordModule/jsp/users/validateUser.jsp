<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@page import="java.util.List"%>
<LINK rel="stylesheet" type="text/css" href="estilos/estilos.css">
<%
	String loc = (String) session.getAttribute("local");
	if (loc == null)
		loc = "en_US";
%>
<c:set var="loc" value="<%=loc%>" />
<script language="javaScript" src="passwordModule/jscripts/validateUser.js"></script>


<script>
var ajax;

function funcionCallback()
{
	// Comprobamos si la peticion se ha completado (estado 4)
	if( ajax.readyState == 4 )
	{
		// Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
		if( ajax.status == 200 )
		{
			// Escribimos el resultado en la pagina HTML mediante DHTML
			document.all.salida.innerHTML = "<b>"+ajax.responseText+"</b>";	
		}
	}
}

	function compruebaUsuarios()
	{
		// Creamos el control XMLHttpRequest segun el navegador en el que estemos 
		if( window.XMLHttpRequest ){
			ajax = new XMLHttpRequest(); // No Internet Explorer
		}
		else			
			ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
		// Almacenamos en el control al funcion que se invocara cuando la peticion
		// cambie de estado	
		ajax.onreadystatechange = funcionCallback;
		// Enviamos la peticion
		ajax.open( "GET", "passwordModule/jsp/users/ValidaUsuario.jsp?usuario="+document.all.userId.value, true );
		ajax.send( "" );
	}
	function solonumeros(evt){
		var nav4 = window.Event ? true : false;
		var key = nav4 ? evt.which : evt.keyCode;
		return (key <= 13 || (key >= 48 && key <= 57));
	}
</script>




	<center>
		<html:errors />
	</center>

	<center>
		<br>

		<%@ page
			import="java.util.Vector,es.gateway.bean.MultiOperador, es.gateway.sesiones.obj.Grupo"%>
		<%@ page import="es.gateway.sesiones.obj.Perfil"%>
		<%
			Vector vOperadores = (Vector) request.getAttribute("vectorOperadores");
				int totalOperadores = vOperadores.size();
				List<Perfil> vPerfiles = (List<Perfil>) request.getAttribute("vectorPerfiles");
				int totalPerfiles = 0;
				if (vPerfiles != null)
					totalPerfiles = vPerfiles.size();
				
			Vector listaGrupos = (Vector)session.getAttribute("vectorAllGrupos");
			int totalGrupos = listaGrupos.size();
		%>
<body onload="document.all.userId.focus();">
		<!-- onSubmit="return userfunction()" -->
<form name="validateUserForm" action="validateUser.do" method="post">
<input type="hidden" name="mode" value="" /> 
<input type="hidden"name="numTotalOp" value="<%=totalOperadores%>" /> 
<input type="hidden" name="numTotalGr" value="<%=totalGrupos %>" />
<input type="hidden" name="operadores" value="">
<input type="hidden" name="grupos" value="">
<div class="Titulo" align=center><bean:message
	bundle="usersmodule" key="users.ui.screen.listUsers.title" /></div>
<br />
<br />
<TABLE align=center>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.userid" /></TD>
		<TD class="texto"><input type="text" name="userId" maxlength="15"
			required="yes" id="userId" onfocus="compruebaUsuarios()"
			onkeyup="compruebaUsuarios()"
			value='<logic:notEmpty name="validateUserForm" property="userId"><bean:write name="validateUserForm" property="userId"/></logic:notEmpty>' />
		<span id="salida"></span></TD>
	</TR>

	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.password" /></TD>
		<TD class="texto"><input type="password" name="password"
			maxlength="10" required="yes" id="password"
			onblur="validatePass(this);" /></TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.ttlPassword" /></TD>
		<TD class="texto"><input type="text" name="ttlpwd" id="ttlpwd"
			maxlength="4" required="yes" onkeypress="return solonumeros(event)"
			value='<logic:notEmpty name="validateUserForm" property="ttlpwd"><logic:notEqual name="validateUserForm" property="ttlpwd" value="0"><bean:write name="validateUserForm" property="ttlpwd"/></logic:notEqual></logic:notEmpty>' />
		</TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.usertype" /></TD>
		<TD class="texto"><select name="userType" class="bgFila2" />

			<%
								for (int k = 0; k < totalPerfiles; k++) {
									if (vPerfiles.get(k) != null){
										Perfil perfil = (Perfil) vPerfiles.get(k);
							%>
			<option value="<%=perfil.getIdProf()%>"
				<logic:notEmpty name="validateUserForm" property="userType"><logic:equal name="validateUserForm" property="userType" value='<%=String.valueOf(perfil.getIdProf())%>'> selected="selected" </logic:equal></logic:notEmpty>><%=perfil.getDescripcion() %></option>
			<%
									}
								}
							%>

		</select></TD>
	</TR>

	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.timeAdvice" /></TD>
		<TD class="texto"><input type="text" maxlength="4"
			name="timeadvice" id="timeadvice"
			onkeypress="return solonumeros(event)"
			value='<logic:notEmpty name="validateUserForm" property="timeadvice"><logic:notEqual name="validateUserForm" property="timeadvice" value="0"><bean:write name="validateUserForm" property="timeadvice"/></logic:notEqual></logic:notEmpty>' />
		</TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.norPasswrods" /></TD>
		<TD class="texto"><input type="text" maxlength="2"
			name="norPasswrods" id="norPasswrods"
			onkeypress="return solonumeros(event)"
			value='<logic:notEmpty name="validateUserForm" property="norPasswrods"><logic:notEqual name="validateUserForm" property="norPasswrods" value="0"><bean:write name="validateUserForm" property="norPasswrods"/></logic:notEqual></logic:notEmpty>' />
		</TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.lfbBlockUser" /></TD>
		<TD class="texto"><input type="text" maxlength="2"
			name="lfbblockuser" id="lfbblockuser"
			onkeypress="return solonumeros(event)"
			value='<logic:notEmpty name="validateUserForm" property="lfbblockuser"><logic:notEqual name="validateUserForm" property="lfbblockuser" value="0"><bean:write name="validateUserForm" property="lfbblockuser"/></logic:notEqual></logic:notEmpty>' />
		</TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.caseSensitive" /></TD>
		<TD class="texto"><input type="checkbox" name="casesensitive"
			id="casesensitive"
			<logic:notEmpty name="validateUserForm" property="casesensitive"><logic:equal name="validateUserForm" property="casesensitive" value="Y">checked='checked'</logic:equal></logic:notEmpty> />
		</TD>
	</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.password_update_the_first_time" /></TD>
		<TD class="texto"><input type="checkbox"
			name="updatepwdfirsttime" id="updatepwdfirsttime"
			<logic:notEmpty name="validateUserForm" property="updatepwdfirsttime"><logic:equal name="validateUserForm" property="updatepwdfirsttime" value="Y">checked='checked'</logic:equal></logic:notEmpty> />
		</TD>
	</TR>
	<tr>
		<TD>&nbsp;</TD>
	</tr>
	<tr>
		<td>
		<div align="right"><font class="texto2" size="3"><B>
		<bean:message bundle="usersmodule" key="users.ui.screen.ops" />:&nbsp;</B>
		</font></div>
		</td>
		<td class="text">
		<table>
			<%
				for (int j = 0; j < totalOperadores; j++) {
					MultiOperador operator = (MultiOperador) vOperadores.elementAt(j);
					String operador = operator.getOperador().getOperadorCodigo();
					String descripcionOperador = operator.getOperador().getOperadorDescripcion();
			%>
			<tr>
				<td>
					<INPUT type="checkbox" name="chooseOpe<%=j%>" id="chooseOpe<%=j%>" value="Si" checked="checked" disabled="true">
				</td>
				<td class="texto">
					<INPUT TYPE="hidden" name="operador<%=j%>" id="operador<%=j%>" value="<%=operador%>"><%=operador%>&nbsp;
				</td>
				<td class="texto">- &nbsp;<%=descripcionOperador%></td>
			</tr>
			<%
			}
			%>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<div align="right"><font class="texto2" size="3"><B>
		<bean:message bundle="usersmodule" key="users.ui.screen.grs" />:&nbsp;</B>
		</font></div>
		</td>
		<td class="text">
		<table>

			<%
			
								Grupo grupo = null;
		
								String idGrupo = "";
								String nombreGrupo = "";
								String checkedGrupo = "";

								for (int i=0;i<listaGrupos.size();i++){
										grupo = (Grupo)listaGrupos.elementAt(i);
										idGrupo = grupo.getIdGrupo();
										nombreGrupo = grupo.getNombreGrupo();
										
								%>
			<tr>
				<td><input type="checkbox" name="chooseGrupo<%=i%>" id="chooseGrupo<%=i%>"
					value="Si" checked="checked" disabled="true"/></td>
				<td class="texto">
				<INPUT TYPE="hidden" name="grupo<%=i%>" id="grupo<%=i%>" value="<%=idGrupo%>"></td>
				<td class="texto">&nbsp;<%=nombreGrupo%></td>
			</tr>
			<%
								}%>


		</table>
		</td>

	</tr>
	<tr>
		<TD>&nbsp;</TD>
	</tr>
	<TR align=center>
		<TD class="texto"></TD>

		<td align=center colspan=2>
		<table>
			<tr>
				<td><A HREF="#" onClick="Enviar(0)"> <img
					src='images/Aceptar.jpg' name='aceptar' ALT='Aceptar' border="0">
				</a></td>
				<td><A HREF="#" onClick="Limpiar()"> <img
					src='images/limpiar.gif' name='limpiar' ALT='Limpiar' border="0">
				</a></td>
				<td><A HREF="#" onClick="Enviar(1)"> <img
					src='images/cargar.gif' name='cargar' ALT='Cargar plantilla'
					border="0"> </a></td>
				<!-- <TD><input type="submit"  value="Siguiente" onClick="return validations()" class="boton2"></TD>
	<TD><input type="reset" value="Borrar" class="boton2"/></TD>
	<TD><input type="submit"   value="Cargar" onClick="return setModeToLoad()" class="boton2"></TD>-->
			</tr>
		</table>
		</td>
	</TR>
</TABLE>
</form>
</body>
	</center>