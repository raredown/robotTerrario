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

<%@page import="java.util.List"%>
<%@page import="es.gateway.sesiones.obj.Perfil"%>
<%@page import="es.gateway.sesiones.obj.Permiso"%><HTML lang="Spanish">
	<HEAD>
		<TITLE><fmt:message key="permisos.ver.titulo"/></TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<!-- <link href="estilos/estilos.css" rel="stylesheet" type="text/css">-->
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
	</HEAD>

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
			function go_back() {
				history.back();
			      return true;
			}  
				
			var totalHeight=window.screen.availHeight - 211;
			var tabla="		<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
			document.write(tabla);
		</script>
		<bean:define id="permisosLink" type="java.util.ArrayList" name="links" scope="session" />
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
						<fmt:message key="permisos.ver.texto1" />
						&nbsp;
					</DIV>
					<br /><br /><br />

					<logic:iterate id="perfil" name="perfiles" type="es.gateway.sesiones.obj.Perfil" indexId="i">
					<% boolean hay = false; %>
						<TABLE width="70%" border="0" align="center" cellspacing="2">
							<TR>
								<TD width='2%'>
									<img align="middle" name="ocultar" border="0" height="13" width="14" src="${imagesURL}/mostrar.gif" onclick="showhideParam('kk<bean:write name="i" />',this);" />
								</TD>
								<TD width='98%'>
								    <font class="texto2"><bean:write name="perfil" property="idProf" />. </font>
									<font class="texto2"><bean:write name="perfil" property="descripcion" /></font>
								</TD>
							</TR>
							<TR>
								<TD colspan=2>
									<div ID="kk<bean:write name='i' />" style="display:none" >
										<logic:notEmpty name="permisos">
										<TABLE width="70%" align="center" border="3">
										<%
										List perfiles = (List)request.getAttribute("perfiles");
										List todosLosPermisos = (List)request.getAttribute("permisos");

											List permisos = (List)todosLosPermisos.get(i);
											for (int b=0;b<permisos.size();b++){
												hay = true;
												%>
												<TR>
													<TD class="texto">
														<% for (int espacios=0;espacios<((Permiso)(permisos.get(b))).getLevel()-1;espacios++){ %>
															&nbsp;&nbsp;&nbsp;
														<%}%>
														<bean:define id="literal">
															<fmt:message>
																<%=((Permiso)(permisos.get(b))).getDescripcion() %>
															</fmt:message>
														</bean:define>
														<bean:write name="literal" />
													</TD>
												</TR>
											<% }
											if (!hay){ %>
												<TR>
													<TD class="texto">
														<fmt:message key="permisos.ver.texto2"/>
													</TD>
												</TR>
											<% }	%>
										</TABLE>
										</logic:notEmpty>
									</div>
								</TD>
							</TR>
						</TABLE>
						
					<HR align="center" width="80%" />
					</logic:iterate>
					<TABLE width="70%" border="0" align="center" cellspacing="2">
					<tr align="center">	
					<td>
						<A HREF="javascript:go_back()"	onMouseOver="JavaScript:this.style.cursor='hand'; window.status='P&aacute;gina anterior ';return true;"	onMouseOut="window.status=' '">
							<script type="text/javascript">pintaBoton ("Página Anterior" , "go_back()")</script>
						</A>
					</td></tr>
					</TABLE>
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
