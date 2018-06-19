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
					<td class="texto" valing="center" align="center">
						<fmt:message key="permisos.menu.texto.largo" />
					</td>
					<td width="10" class="Fondoverdederecha">
						&nbsp;
					</td>
				</TR>
			</TBODY>
		</TABLE>
	</BODY>
</HTML>
