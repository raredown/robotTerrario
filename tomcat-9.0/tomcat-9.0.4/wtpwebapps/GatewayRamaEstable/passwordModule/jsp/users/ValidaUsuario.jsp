<%@page import="es.gateway.sesiones.users.dao.UserDaoImpl"%>

<%
	// Si no existe el usuario, es un �xito
	if (  UserDaoImpl.existe( request.getParameter("usuario") ) )
		out.print("<font color='RED'>Id. de usuario no disponible</font>");
%>