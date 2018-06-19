<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images" />
<c:url var="jsURL" value="/js" />

<HTML>
	<HEAD>
		<TITLE>Aviso Caducidad Contraseña</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link href="css/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="js/util.js"></script>

	</HEAD>
	<BODY>
		<CENTER>
			<font class="Titulo">
				<bean:message bundle="usersmodule" key="alerta.avisocaducidad1" />
				${avisoHoras}
				<bean:message bundle="usersmodule" key="alerta.avisocaducidad2" />
			</font>
			<BR>
			<BR>
			<bean:message bundle="usersmodule" key="alerta.avisocaducidad3" />
			<BR>
			<BR>
			<%--<form METHOD="post" ACTION="MenuPrincipal" name="inicio">
				<input type="hidden" name="accion" value="inicio" />
				<input name="BotonContinue" type="submit" value="Continuar" class=cabeceratabla>
			</form> --%>
		</center>
	</BODY>
</HTML>
