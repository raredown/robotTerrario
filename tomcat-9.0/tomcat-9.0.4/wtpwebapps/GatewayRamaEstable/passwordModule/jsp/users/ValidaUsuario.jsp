<%@page import="es.gateway.sesiones.users.dao.UserDaoImpl"%>

<%
	// Si no existe el usuario, es un éxito
	if (  UserDaoImpl.existe( request.getParameter("usuario") ) )
		out.print("<font color='RED'>Id. de usuario no disponible</font>");
%>