<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images" />
<c:url var="jsURL" value="/js" />

<HEAD>
<TITLE><fmt:message key="permisos.alta.perfil.titulo" /></TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<!-- <link href="estilos/estilos.css" rel="stylesheet" type="text/css">-->
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="profileModule/js/util.js"></script>
</HEAD>

<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" onLoad="document.formAlta.nombre.focus()">

<%@include file="include/CabeceraLogo.jsp"%>
<script language="JavaScript">
function doIt(val){
	
	if((document.formAlta.nombre == null)||(document.formAlta.nombre.value.replace(/^\s*|\s*$/g,"") == "")){
		alert("<fmt:message key ="permisos.alta.texto8"/>");
		document.formAlta.nombre.select();
		document.formAlta.nombre.focus();
	}
	else{
		document.formAlta.accion.value=val;
		document.formAlta.submit();
 	}
 }

function superSeleccion(){

	checkB = document.getElementById("todos");
	booleano = checkB.checked;
       
       for(var i=0; i < document.formAlta.idPermisos.length; i++)
           document.formAlta.idPermisos[i].checked = booleano

}

function getPadres(idPerm){

	var hiddens = new Array();
	var fathers = new Array();
	var cadena = "";
	var elementos = document.formAlta.elements.length;

	// Recojo los campos ocultos del formulario
	for(i=0; i<elementos;i++){
		if (document.formAlta[i].type == "hidden")
			hiddens.push(document.formAlta[i]);
	}

	for (i=0;i<hiddens.length;i++){
		if (hiddens[i].name == idPerm){
			if ( hiddens[i].value == 0 ){
				return hiddens[i].name;
			}else{
				cadena += hiddens[i].name;
				cadena += "-";
				cadena += (getPadres(hiddens[i].value));
				return cadena;
				}
			}
	}
}

function getHijos(idPerm){

	var hiddens = new Array();
	var fathers = new Array();
	var cadena = "";
	var aux;
	var elementos = document.formAlta.elements.length;

	// Recojo los campos ocultos del formulario
	for(i=0; i<elementos;i++){
		if (document.formAlta[i].type == "hidden")
			hiddens.push(document.formAlta[i]);
	}
	cadena += idPerm+"-";
	for (i = 0;i<hiddens.length;i++){
		if (idPerm == hiddens[i].value){
			cadena += hiddens[i].name + "-";
			aux = i;
			cadena += getHijos(hiddens[i].name);
			i = aux;
		}
	}
	return cadena;
}

function refreshChecks(idPerm){

	checki = document.getElementById(idPerm);
	var arra = new Array();

	if (checki.checked){
		arra = getPadres(idPerm)
		marca(arra,true);
	} else {
		arra = getHijos(idPerm)
		marca(arra,false);
	}
}// getPadre

function marca(cadena,booleano){

	var elementos  = cadena.split("-");

	for(i=0;i<elementos.length;i++){
		elemento = document.getElementById(elementos[i]);
		if (elemento != null)
			if(elemento.value != 0)
				elemento.checked = booleano;
		}
	}

function validaPadres(val,val_actual){
	var checkAux;
	var checkAux2;
	checkAux = document.getElementById(val);
	checkAux2 = document.getElementById(val_actual);
	if(checkAux2.checked == true){
		if(checkAux.checked == false)
			checkAux.click();
	}

}

function go_back() {
	history.back();
      return true;
} 

var totalHeight=window.screen.availHeight - 211;
var tabla="		<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script>
<TBODY>
	<TR>
		<td width="10" class="Fondoverdederecha">&nbsp;</td>
		<TD vAlign=top width="180" class="celdalineaderecha">
			<%@include file="include/Menu.jsp"%>
		</TD>
		<TD class="Titulo" vAlign="top" align="left" background="${imagesURL}/fondocentro.gif">
			<br />
			<DIV align="left" class="Titulo">&nbsp;&nbsp;&nbsp; 
				<img src="${imagesURL}/flecha.gif" border="0" />
				<logic:notEmpty	name="tarea">
					<logic:equal name="tarea" value="alta">
						<fmt:message key="permisos.alta.texto1" />
					</logic:equal>
					<logic:equal name="tarea" value="modifica">
						<fmt:message key="permisos.alta.texto2" />
					</logic:equal>
				</logic:notEmpty> &nbsp;
			</DIV>
			<br />
			<br />
			<br />
			<FORM action="AccesoPerfilesAction.do" name="formAlta" method="post">
			<input type="hidden" name="accion" value="altaPerfil" /> 
			<input type="hidden" name="idPerfil" value="<bean:write name="idPerfil" />" />
			<TABLE border="0" ALIGN="center" WIDTH="90%" cellpadding="5">
				<TR>
					<TD class="texto" align="right">
						<fmt:message key="permisos.alta.texto3" />
					</TD>
					<TD>
						<logic:notEmpty name="nombrePerfil">
							<INPUT TYPE="text" name="nombre" value="<bean:write name="nombrePerfil" />" maxlength="20" />
					</logic:notEmpty> 
					<logic:empty name="nombrePerfil">
						<INPUT TYPE="text" name="nombre" value="" maxlength="20" />
					</logic:empty></TD>
					<TD class="texto" align="left">
						<input type="checkbox" id="todos" onClick="superSeleccion()" />
						<fmt:message key="permisos.alta.texto4" />
					</TD>
				</TR>
				<TR>
					<TD class="texto" align="right">
						<fmt:message key="permisos.alta.texto6" />
					</TD>
					<TD class="texto" colspan="2"><logic:notEmpty name="permisos">
						<logic:iterate id="permiso" type="es.gateway.sesiones.obj.Permiso"	name="permisos" indexId="i">
							<% for (int espacios=0;espacios<permiso.getLevel()-1;espacios++){ %>
								&nbsp;&nbsp;&nbsp;
							<%}%>
							<bean:define id="literal">
								<fmt:message>
									<bean:write name="permiso" property="descripcion" />
								</fmt:message>
							</bean:define>
							<bean:define id="activo">
								<logic:notEmpty name="permiso" property="activo">
									<logic:equal name="permiso" property="activo" value="true">
										checked=true
									</logic:equal>
									<logic:notEqual name="permiso" property="activo" value="true">
										&nbps;
									</logic:notEqual>
								</logic:notEmpty>
								<logic:empty name="permiso" property="activo">
									&nbps;
								</logic:empty>
							</bean:define>
							<input type="checkbox" name="idPermisos" id="<bean:write name='permiso' property='idPerm' />"
								onclick="javascript:refreshChecks('<bean:write name='permiso' property='idPerm' />')"
								value="<bean:write name='permiso' property='idPerm' />"
							<bean:write name="activo" /> />
								<INPUT TYPE="hidden"
									name="<bean:write name='permiso' property='idPerm' />"
									value="<bean:write name='permiso' property='idPadre' />" />
							<bean:write name="literal" />
							<BR />
						</logic:iterate>
						</logic:notEmpty> <logic:empty name="permisos">
							<fmt:message key="permisos.alta.texto7" />
						</logic:empty>
					</TD>
				</TR>
				<!--  <TR>
										<TD colspan="2" align="center">
											<logic:notEmpty name="tarea">
												<logic:equal name="tarea" value="alta">
													<script type="text/javascript">pintaBoton ("Alta" , "doIt('altaPerfil')")</script>
												</logic:equal>
												<logic:equal name="tarea" value="modifica">
													<script type="text/javascript">pintaBoton ("Modificar" , "doIt('editaPerfil')")</script>
												</logic:equal>
											</logic:notEmpty>
										<A HREF="javascript:go_back()" 
											onMouseOver="window.status='P&aacute;gina anterior ';return true;" 
											onMouseOut="window.status=' '"><img 
											src="images/Back.jpg" border="0" width="107"  height="28"/></A>
										</TD>
	
										
									</TR>  -->
				<!--     Introducimos los Botones -->
				<tr>
					<td colspan="5" align="center">
						<table border="0">
							<tr>
								<td>
									<A HREF="#"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='';return true;"	onMouseOut="window.status=' '"> 
										<logic:notEmpty name="tarea">
											<logic:equal name="tarea" value="alta">
												<script type="text/javascript">pintaBoton ("<font class='texto2'>Alta</font>" , "doIt('altaPerfil')")</script>
											</logic:equal>
											<logic:equal name="tarea" value="modifica">
												<script type="text/javascript">pintaBoton ("<font class='texto2'>Modificar</font>" , "doIt('editaPerfil')")</script>
											</logic:equal>
										</logic:notEmpty>
									</A>
								</td>
								<td>&nbsp;</td>
								<td>
									<A HREF="javascript:go_back()"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='P&aacute;gina anterior ';return true;"	onMouseOut="window.status=' '">
										<script type="text/javascript">pintaBoton ("Página Anterior" , "go_back()")</script>
									</A>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<!-- 	    Fin de los Botones  -->
			</TABLE>
			</FORM>
			<br />
		</TD>
		<td width="10" class="Fondoverdederecha">&nbsp;</td>
	</TR>
</TBODY>
</TABLE>
</BODY>
</HTML>
