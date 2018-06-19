<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" import="java.util.*, es.iecisa.gateway.gestorerrores.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images" />
<c:url var="jsURL" value="/js" />
<%
/*
**** Instrucciones de acoplamiento a los proyectos 

- Es necesario que el proyecto en el que se utilice este modulo contenga las librerias
	de jstl version 1.1 y de struts. Dichas librerias son jstl.jar y standard.jar para
	jstl y struts.jar y struts-legacy.jar para struts.
 
- Es necesario añadir estas llaves al properties del proyecto correspondiente...
	warning.navegador_sin_ajax=Su navegador no soporta AJAX, no se mostrara el panel de notificaciones

- Hay que añadir el javascript htmlhttprequest.js al proyecto y modificar el apartado en el que se incluye para que
    apunte a esta ruta. Si se necesita mas informacion sobre este JS esta en http://www.twinhelix.com/javascript/htmlhttprequest/
    (existe una version comentada, disponible para descargar)

- Hay que añadir el servlet de notificaciones (más instrucciones en dicho componente) 

- Opcionalmente, cambiar las propiedades graficas del cuadro de notificaciones,
  en el apartado de estilos que aparece más abajo.

*/

// Parametros del modulo: rutas de los javascripts y estilos, tiempos de espera (para 
// la primera carga  y para el intervalo de recargas)
%>

<%
// Existe un tiempo de primera carga distinto para IE6 porque si la pagina tarda
// mucho en cargarse, ocurre un error de javascript debido a que el javascript
// no esta al principio de la pagina (puesto que estamos incluyendo este jsp
// dentro del body de otra pagina) y no lo puede ejecutar hasta que este cargado
// ya que lo intenta mover al principio y no puede.
// No ocurre en Firefox, no hay información de otros navegadores.
%>
<c:url var="tiempoEnMsEsperaPrimeraCargaIE" value="3000"/>
<c:url var="tiempoEnMsEsperaPrimeraCargaOtros" value="100"/>
<c:url var="tiempoEnMsRecarga" value="15000"/>

<%
// Estilos del cuadro de notificaciones
%>

<style type="text/css">

#targetArea {
 clear: both;
 padding: 0.5em 1.5em;
 margin-bottom: 2em;
 margin-top:    2em;
 height: 5em;
 width: 35em;
 overflow: auto;
 border: thin solid green;
 vertical-align: text-top;
 text-align: left;
 
}
</style>

<%
// Nos aseguramos de que el navegador no hara una copia en cache de esta pagina
response.addHeader("expires", "-1");

// Mostramos el panel de notificaciones, con las notificacines pertinentes
%>

<!-- HTMLHttpRequest v1.0beta by Angus Turnbull http://www.twinhelix.com -->
<script type="text/javascript" src="${jsURL}/htmlhttprequest.js"></script>

<script type="text/javascript">//<![CDATA[

// Welcome to HTMLHttpRequest
//
// This script allows you to make background asynchronous GET and POST requests to a
// server in an accessible manner that is backwards-compatible with older browsers,
// mobile devices, screenreaders and search engines.
//
// The overall architecture is assembled in 3 layers:
//
// 1) A "Transport" object ('HTMLHttpRequest') that makes a request to the server.
// 2) A "Threading" object ('RemoteFileLoader') that creates and allocates Transports
//    and provides an easy way of loading content into your existing page.
// 3) An "Interface" layer of code that captures clicks/submissions on the document.
//
// Layers (1) and (2) are objects included in the external .JS file above.
// Both contain documentation if you are interested in customising the implementation.
// Otherwise, the code below is the "Interface" layer that will process our document.


// First, we create an example object for our document click handler.
var docClickLoader = new RemoteFileLoader('docClickLoader');

// At any stage you can call docClickLoader.loadInto('file.html', 'IDOfTarget') to trigger
// a content load into an element from your script.


// Establecemos que se cargue el panel de notificaciones segun los parametros
// de tiempo de carga
// Tenemos que utilizar esta funcion porque sino IE da un error de operacion
// abortada, aparentemente debido a que el codigo javascript no esta fuera
// del body de la pagina y lo intenta mover al principio cuando la pagina aun
// no esta cargada del todo
if(navigator.appName == "Microsoft Internet Explorer")
{
 window.setTimeout("docClickLoader.loadInto('<%= response.encodeURL("Notificaciones")%>', 'targetArea')", ${tiempoEnMsEsperaPrimeraCargaIE});
}
else window.setTimeout("docClickLoader.loadInto('<%= response.encodeURL("Notificaciones")%>', 'targetArea')", ${tiempoEnMsEsperaPrimeraCargaOtros});
window.setInterval("docClickLoader.loadInto('<%= response.encodeURL("Notificaciones")%>', 'targetArea')",${tiempoEnMsRecarga});

//]]></script>

<!--  Este es el area en el que se insertaran las notificaciones -->
<div id="targetArea">
</div>
