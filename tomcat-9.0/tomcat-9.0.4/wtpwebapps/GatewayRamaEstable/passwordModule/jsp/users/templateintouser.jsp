<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<LINK rel="stylesheet" type="text/css" href="/css/stilos.css">
<script language="javaScript" src="passwordModule/jscripts/validateUser.js"></script>
<%
es.gateway.sesiones.users.vo.TemplateVo tv = (es.gateway.sesiones.users.vo.TemplateVo) request.getAttribute("templatedataintouser");
	Vector vOperadores = (Vector) request.getAttribute("vectorOperadores");
	int totalOperadores = vOperadores.size();
	
	Vector listaGrupos = (Vector)session.getAttribute("vectorAllGrupos");
	int totalGrupos = listaGrupos.size();
%>

	<%@ page
		import="java.util.Vector"%>
		
		<%@ page
		import="es.gateway.bean.*, es.gateway.bean.MultiOperador, es.gateway.sesiones.obj.Grupo"%>
	<%
		String csVal = "N";
	%>
	<script language="javaScript"
		src="passwordModule/jscripts/templateintouser.js"></script>
	<script language="javaScript">
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
function call(){
	
	for(var i =0;i<document.validateUserForm.userType.length;i++)
	 {	
	     
		if(document.validateUserForm.userType[i].value==document.validateUserForm.ut.value)
		 {
              
				document.validateUserForm.userType.selectedIndex=i;
		 }
	 }
//validation for casesensitive	 
    if(document.validateUserForm.cs.value=="Y"){
        <%csVal="Y";%> 	    
		document.validateUserForm.casesensitive.value="Y";
		document.validateUserForm.casesensitive.checked=true;
   
    }
      else document.validateUserForm.casesensitive.value="Y";
	  <%csVal="N";%>
 } 
	 
</script>
<body onload="document.all.userId.focus();">
	<form name="validateUserForm" method="post" action="validateUser.do"
		onSubmit="return newfun();">
		<input type="hidden" name="numTotalOp" value="<%=totalOperadores%>" />
		<input type="hidden" name="numTotalGr" value="<%=totalGrupos %>" />
		<input type="hidden" name="grupos" value="">
		<input type="hidden" name="operadores" value="">
		<h3 align=center>
			<bean:message bundle="usersmodule" key="users.ui.screen.listUsers.title" />
		</h3>

		<TABLE align=center>

			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.userid" />
				</TD>
				<TD class="texto">
					<input type="text" maxlength="40" name="userId" onfocus="compruebaUsuarios()" onkeyup = "compruebaUsuarios()"/>
					<span id="salida"></span>
				</TD>
			</TR>
			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.password" />
				</TD>
				<TD class="texto">
					<input type="password" name="password" maxlength="28" onblur="validatePass(this);"/>
				</TD>
			</TR>

			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.ttlPassword" />
				</TD>

				<TD class="texto">
					<input type="text" maxlength="4" name="ttlpwd"
						value="${templatedataintouser.ttlPassword}" />
				</TD>


			</TR>

			<input type="hidden" name="ut"
				value="${templatedataintouser.userType}" />
			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.usertype" />
				</TD>
				<TD class="texto">
					<select name="userType" class="bgFila2" />
						<%@ page import="es.gateway.sesiones.obj.Perfil,java.util.Vector"%>
						<%
							Vector vPerfiles = (Vector) session
										.getAttribute("vectorPerfiles");
								int totalPerfiles = vPerfiles.size();

								for (int k = 0; k < totalPerfiles; k++) {
									Perfil perfil = (Perfil) vPerfiles.elementAt(k);
						%>
						<option value="<%=perfil.getIdProf()%>"><%=perfil.getDescripcion()%></option>
						<%
							}
						%>

					</select>
				</TD>
			</TR>

			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.timeAdvice" />
				</TD>
				<TD class="texto">
					<input type="text" maxlength="4" name="timeadvice"
						value="${templatedataintouser.timeAdvice}" />
				</TD>
			</TR>
			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.norPasswrods" />
				</TD>
				<TD class="texto">
					<input type="text" maxlength="2" name="norPasswrods"
						value="${templatedataintouser.norPasswrods}" />
				</TD>
			</TR>
			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.lfbBlockUser" />
				</TD>
				<TD class="texto">
					<input type="text" maxlength="2" name="lfbblockuser"
						value="${templatedataintouser.lfbBlockUser}" />
				</TD>
			</TR>

			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.caseSensitive" />
				</TD>
				<TD class="texto">
					<input type="checkbox" name="casesensitive" value="<%=csVal%>" />
				</TD>
				<input type="hidden" name="cs"
					value="${templatedataintouser.caseSensitive}" />
			</TR>


			<TR>
				<TD class="texto">
					<bean:message bundle="usersmodule" key="users.ui.screen.password_update_the_first_time" />
				</TD>
				<TD class="texto">
					<input type="checkbox" name="updatepwdfirsttime" />
				</TD>


			</TR>
			<TR>
				<TD>
					<div align="right">
						<font class="texto2" size="3"><B> <bean:message bundle="usersmodule"
									key="users.ui.screen.ops" />:&nbsp;</B> </font>
					</div>
				</TD>
				<TD class="text">
					<table>
						<%
							for (int j = 0; j < totalOperadores; j++) {
								MultiOperador operator = (MultiOperador) vOperadores.elementAt(j);
								String operador = operator.getOperador().getOperadorCodigo();
								String descripcionOperador = operator.getOperador().getOperadorDescripcion();
						%>
						<tr>
							<td>
								<INPUT type="checkbox" name="chooseOpe<%=j%>"
									id="chooseOpe<%=j%>" value="Si" checked="checked" disabled="true">
							</td>
							<td class="texto">
								<INPUT TYPE="hidden" name="operador<%=j%>" id="operador<%=j%>"
									value="<%=operador%>"><%=operador%>&nbsp;
							</td>
							<td class="texto"><%=descripcionOperador%></td>
						</tr>
						<%
							}
						%>
					</table>
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
					value="Si" /></td>
				<td class="texto">
				<INPUT TYPE="hidden" name="grupo<%=i%>" id="grupo<%=i%>" value="<%=idGrupo%>"></td>
				<td class="texto">&nbsp;<%=nombreGrupo%></td>
			</tr>
			<%
								}%>


		</table>
				</TD>
			</TR>
			<TR>
				<TD>
					&nbsp;
				</TD>
			</TR>
			<TR align=center>
				<TD class="texto"></TD>
				<input type="hidden" name="mode" value="">
				<td align=center colspan=2>
					<table>
						<tr>

							<td>
								<A HREF="#" onClick="Enviar(0)"> <img
										src='images/Aceptar.jpg' name='aceptar' ALT='Aceptar'
										border="0"> </a>
							</td>
							<td>
								<A HREF="#" onClick="Limpiar()"> <img
										src='images/limpiar.gif' name='limpiar' ALT='Limpiar'
										border="0"> </a>
							</td>
							<td>
								<A HREF="#" onClick="Enviar(1)"> <img
										src='images/cargar.gif' name='cargar' ALT='Cargar plantilla'
										border="0"> </a>
							</td>
							<!-- <TD><input type="submit"  value="Siguiente" onClick="return validations() " class="boton2"></TD>
	<TD><input type="reset" value="Borrar" class="boton2"/></TD>
	<TD><input type="submit"   value="Cargar" onClick="return setModeToLoad()" class="boton2"/></TD>
	-->

						</tr>
					</table>
				</td>
			</TR>
		</TABLE>
		<script language="javaScript">call();
	</script>
		<script language="javaScript">
	function newfun(){
	     if(document.validateUserForm.updatepwdfirsttime.checked==true){
	
	         document.validateUserForm.updatepwdfirsttime.value="Y";

          }else{
             document.validateUserForm.updatepwdfirsttime.value="N";

          }
    }
	</script>

	</form>
</body>