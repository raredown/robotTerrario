<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" import="java.util.*, es.iecisa.gateway.gestorerrores.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="cssURL" value="estilos" />
<c:url var="imagesURL" value="images" />
<c:url var="jsURL" value="js" />
<script language="JavaScript" src="${jsURL}/pops.js"></script>

<style type="text/css">
#recuadroLupa{
 vertical-align: middle;
 clear: both;
 padding: 0.5em;
 margin-bottom: 1em;
 margin-top:    1em;
 height: 4em;
 width: 13em;
 overflow: auto;
 border: thin solid;
 text-align: left; 
}
</style>
<div id="recuadroLupa">
<a href="javascript:DetalleNotificacionesMotor('jsp/include/DetalleNotificacionesMotor.jsp')"><img style="border-style: none" height=30 align="right"  src="${imagesURL}/notificacion.jpg" ></a>
<span style="PADDING-RIGHT:25;" class="Titulo">
Notificaciones </br> 
de procesos
</span>
</div>
</div>


