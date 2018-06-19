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
		<TITLE><fmt:message key="permisos.menu.titulo"/></TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<!-- <link href="estilos/estilos.css" rel="stylesheet" type="text/css">-->
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
	</HEAD>

	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

		<%@include file="include/CabeceraLogo.jsp"%>

		<script language="JavaScript">
			var totalHeight=window.screen.availHeight - 211;
			var tabla="		<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
			document.write(tabla);
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
						<fmt:message key="permisos.menu.texto1"/>
						&nbsp;
					</DIV>
					<br /><br /><br />

						<table align="left" border="0" cellpadding="0" cellspacing="2" width="95%">
							<FORM METHOD=POST NAME="optionForm" action="MantenimientoPerfilesAction.do">
								<INPUT TYPE="hidden" NAME="accion" value="" />
								<tr>
									<td width="10%"></td>
									<td width="20">
										<img src="${imagesURL}/item.gif" border="0" />
									</td>
									<td class="texto" width="1%">
										&nbsp;
									</td>
									<td class="texto">
										<A href="#"
											onclick="javascript:entra('optionForm','vePerfil')"
											onMouseOver="window.status='<fmt:message key="permisos.menu.texto2"/>';return true"
											onMouseOut="window.status=' '" class="itemmenu">
										<fmt:message key="permisos.menu.texto2"/>
										</a>
									</td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="20">
										<img src="${imagesURL}/item.gif" border="0" />
									</td>
									<td class="texto" width="1%">
										&nbsp;
									</td>
									<td class="texto">
										<A href="#"
											onclick="javascript:entra('optionForm','altaPerfil')"
											onMouseOver="window.status='<fmt:message key="permisos.menu.texto3"/>';return true"
											onMouseOut="window.status=' '" class="itemmenu">
										<fmt:message key="permisos.menu.texto3"/>
										</a>
									</td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="20">
										<img src="${imagesURL}/item.gif" border="0" />
									</td>
									<td class="texto" width="1%">
										&nbsp;
									</td>
									<td class="texto">
										<A href="#"
											onclick="javascript:entra('optionForm','prePerfilM')"
											onMouseOver="window.status='<fmt:message key="permisos.menu.texto4" />';return true"
											onMouseOut="window.status=' '" class="itemmenu">
										<fmt:message key="permisos.menu.texto4" />
										</a>
									</td>
								</tr>
								<tr>
									<td width="10%"></td>
									<td width="20">
										<img src="${imagesURL}/item.gif" border="0" />
									</td>
									<td class="texto" width="1%">
										&nbsp;
									</td>
									<td class="texto">
										<A href="#"
											onclick="javascript:entra('optionForm','prePerfilE')"
											onMouseOver="window.status='<fmt:message key="permisos.menu.texto5"/>';return true"
											onMouseOut="window.status=' '" class="itemmenu">
										<fmt:message key="permisos.menu.texto5"/>
										</a>
									</td>
								</tr>
							</form>
						</table>
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
