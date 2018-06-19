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
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<c:url var="imagesURL" value="/images" />
<c:url var="cssURL" value="/estilos" />
<c:url var="jsURL" value="/js" />

<html:html>
<HEAD>
	<TITLE>
		<fmt:message key="texto.comprobacion.error.no.acceso"/>
	</TITLE>
	<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	<link rel="stylesheet" href='${cssURL}/estilos.css'>
	<script language="javascript" src='${jsURL}/util.js'></script>

</HEAD>

<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

	<!-- Insercion de Cabecera -->
	<%@include file="/jsp/include/cabeceraLogo.jsp"%>

	<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
		<TBODY>
			<TR>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="/jsp/include/menu.jsp"%>
				</TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align=center
					background="images/fondocentro.gif">
					<br>
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;&nbsp;
					</DIV>
					<CENTER>
						<br>
						<br>
						<br>
						<table>
							<tr>
								<td class="texto5" align="left">
									<logic:notEmpty name="informacion">
										<logic:iterate name="informacion" id="errorConcreto" indexId="i" type="java.lang.String">
											<fmt:message>
												<bean:write name='errorConcreto' />
											</fmt:message>
											<BR /><BR />
										</logic:iterate>
									</logic:notEmpty>
								</td>
								<td class="texto5" align="left">
									<logic:notEmpty name="informacionDirecta">
										<logic:iterate name="informacionDirecta" id="errorConcreto" indexId="i" type="java.lang.String">
												<bean:write name='errorConcreto' />
											<BR /><BR />
										</logic:iterate>
									</logic:notEmpty>
								</td>
							</tr>
						</table>
					</CENTER>
					<br>
					<br>
					<%--Nueva imagen--%>
				</td>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
			</TR>
		</TBODY>
	<jsp:include page="include/pie.jsp" flush="true" />
</BODY>
</html:html>
