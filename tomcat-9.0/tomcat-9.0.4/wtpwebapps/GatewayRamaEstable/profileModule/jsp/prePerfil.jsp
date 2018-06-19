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
<HTML lang="Spanish">
	<HEAD>
		<TITLE><fmt:message key="permisos.editar.titulo"/></TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<!-- <link href="estilos/estilos.css" rel="stylesheet" type="text/css">-->
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
	</HEAD>
	
<bean:define id="tareaRealizar" type="java.lang.String" name="tarea" scope="request" />

	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

		<%@include file="include/CabeceraLogo.jsp"%>

		<script language="JavaScript">
			function showhideParam(parametro,imagen){
				if(imagen.name=="ocultar"){
		        	imagen.name="mostrar";
		        }
		    	else if(imagen.name=="mostrar"){
		        	imagen.name="ocultar";
		        }
				showhide(parametro);
			}
			var totalHeight=window.screen.availHeight - 211;
			var tabla="		<table width='100%' height='" + totalHeight + "' border='1' cellpadding='0' cellspacing='0'>";
			document.write(tabla);
			
			function getRadioButtonSelected(){
				var i = 0;
				var formulario = document.envioperfil;
				var seleccion = formulario.group_prof.length;
				for (i = 0; i < seleccion; i++) {
					if (formulario.group_prof[i].checked) { break; }
				}
			return i+1;
			}
			
			function gestPerfiles(val){
				  /*
				  	val=1 Borrar perfil
				  	val=2 Editar perfil
				  */
				  
				  if (val==1){
				  
					//NO BORRAR SUPREME ADMINISTRATO
					perfilSeleccionado = getRadioButtonSelected();
					if (perfilSeleccionado == 1){
						alert("<fmt:message key='javascript.noSupreme'/>");
					}
					//END NO BORRAR SUPREME ADMINISTRATO
					else{
					  	document.envioperfil.accion.value="bajaPerfil";
					  	document.envioperfil.action = "AccesoPerfilesAction.do";
					  	if(confirm('<fmt:message key="permisos.confirmacion.eliminar" />'))
						  	document.envioperfil.submit();
					}
				  } else {
				  	document.envioperfil.accion.value = "altaPerfil";
				  	document.envioperfil.accionGestPerfiles.value = "modifica";
				  	document.envioperfil.action = "MantenimientoPerfilesAction.do";
				  	document.envioperfil.submit();
				  }
			 }// gestPerfiles
				function go_back() {
					history.back();
				      return true;
				}  
					
		</script>
		
			<TBODY>
				<TR>
					<td width="10" class="Fondoverdederecha">
						&nbsp;
					</td>

					<TD vAlign=top width="180" class="celdalineaderecha">
						<%@include file="include/Menu.jsp"%>
					</TD>

					<TD class=Titulo vAlign="top" align="left" background="${imagesURL}/fondocentro.gif">
					<br />
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;&nbsp;
						<img src="${imagesURL}/flecha.gif" border="0" />
							<logic:notEmpty name="tarea">
								<logic:equal name="tarea" value="Eliminar">
									<fmt:message key="permisos.editar.texto1" />
								</logic:equal>
								<logic:equal name="tarea" value="Modificar">
									<fmt:message key="permisos.editar.texto2" />
								</logic:equal>
							</logic:notEmpty>
						&nbsp;
					</DIV>
					<br /><br /><br />
					
					<form METHOD="post" ACTION="AccesoPerfilesAction.do" name="envioperfil">
					<input type="hidden" name="accionGestPerfiles" value="modifica">
					<input type="hidden" name="accion">
					
					<logic:iterate id="perfil" name="perfiles" type="es.gateway.sesiones.obj.Perfil" indexId="i">
						<TABLE width="70%" border="0" align="center" cellspacing="2">	
								<TR>
									<TD width='2%'>
										<input type="radio" checked="true" name="group_prof" value="<bean:write name='perfil' property='idProf'/>">
									</TD>
									<TD width='98%'>
									    <font class="texto2"><bean:write name="perfil" property="idProf" />. </font>
										<font class="texto2"><bean:write name="perfil" property="descripcion" /></font>
									</TD>
								</TR>
						</TABLE>
							
						<HR align="center" width="80%" />
					</logic:iterate>
					
					
					<TABLE align="center" border="0"  cellspacing="2">
						<tr>
							<td>
								<logic:equal name="tarea" value="Modificar">
									<A HREF="javascript:gestPerfiles(2)"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='P&aacute;gina anterior ';return true;"	onMouseOut="window.status=' '">
										<script type="text/javascript">pintaBoton ("Editar" , "gestPerfiles(2)")</script>
									</A>
								</logic:equal>
								<logic:equal name="tarea" value="Eliminar"> 
									<A HREF="javascript:gestPerfiles(1)"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='P&aacute;gina anterior ';return true;"	onMouseOut="window.status=' '">
										<script type="text/javascript">pintaBoton ("Eliminar" , "gestPerfiles(1)")</script>
									</A>
								</logic:equal>
							</TD>
						<TD>&nbsp;</TD>
						<!-- El problema está en que la función pintaBoton alinea al centro una tabla que ella misma crea
							 (por ello pasa de tu alineación) y termina cerrando la tabla (por lo que te hace el salto de línea)
							 Como está hecho en el resto de la aplicación es poniendo las opciones arriba centradas; justamente
							 debajo (también centrado) se coloca el botón de volver.-->
							<TD>
									<A HREF="javascript:go_back()"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='P&aacute;gina anterior ';return true;"	onMouseOut="window.status=' '">
										<script type="text/javascript">pintaBoton ("Página Anterior" , "go_back()")</script>
									</A>
							</td>
						</tr>
					</TABLE>
					</form>

					<br />
					</td>
					
					<td width="10" class="Fondoverdederecha">
						&nbsp;
					</td>
					
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>
