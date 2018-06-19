<%
// Recogemos los valores del action del formulario y el parámetro acción
// Por defecto los dejamos para que se redirija a la página de inicio.
String actionDeAtras = "Inicio.do";
if ( request.getParameter("actionDeAtras") != null )
	actionDeAtras = (String) request.getParameter("actionDeAtras");
String accionDeAtras = "inicio";
if ( request.getParameter("accionDeAtras") != null )
	accionDeAtras = (String) request.getParameter("accionDeAtras");
%>
<form name="atras" action="<%=actionDeAtras %>">
	<input type="hidden" name="accion" value="<%=accionDeAtras %>" />
</form>
<A HREF="javascript:document.atras.submit()" onMouseOver="window.status='P&aacute;gina anterior ';return true;" onMouseOut="window.status=' '">
	<img src="images/Back.jpg" border="0" width="107"  height="28"/>
</A>