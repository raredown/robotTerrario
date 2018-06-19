<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bean" uri="/WEB-INF/tld/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>

<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.Calendario"%>
<%@ page import="es.portanode.util.html.SesionConectada" %>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
  //SesionConectada cs1 = new SesionConectada(request);	
  //String operadorPerfil = cs1.GetPerfil();
  //int perfil =  Integer.parseInt(operadorPerfil);
  
          Calendario fHoy = new Calendario();

         /*   if ( fHoy.esFestivo())
             {
                System.err.println("Es Festivo");	    
                response.setContentType("text/html");
                request.setAttribute("Titulo", "CONSOLA DESHABILITADA:");
                request.setAttribute("Mensaje", "FESTIVO");
                request.setAttribute("UrlRetorno","MenuPrincipal");
                RequestDispatcher dispatcher;
                dispatcher = getServletContext().getRequestDispatcher("/ErrorSessionJSP");
                try{

                    dispatcher.include(request,response);
                }catch(ServletException e){
                    System.err.println("MenuRolReceptor.java Excepcion en Servlet -->"+e);
                }catch(IOException e){
                    System.err.println("MenuRolReceptor.java Excepcion en Servlet -->"+e);
                }

              return;
             }

            if (!fHoy.inJornada())
            {
            System.err.println("Fecha fuera de Jornada");	
            response.setContentType("text/html");
            request.setAttribute("Titulo", "CONSOLA DESHABILITADA:");
            request.setAttribute("Mensaje", "FIN DE JORNADA");
            request.setAttribute("UrlRetorno","MenuPrincipal");
            RequestDispatcher dispatcher;
            dispatcher = getServletContext().getRequestDispatcher("/ErrorSessionJSP");
            try{
                    dispatcher.forward(request,response);
                }catch(ServletException e){
                    System.err.println("MenuRolReceptor.java Excepcion en Servlet -->"+e);
                }catch(IOException e){
                    System.err.println("MenuRolReceptor.java Excepcion en Servlet -->"+e);
            }
            return;
           }  */

	  String codigoOperador = (String) request.getParameter("OperadorConectado");
	  String posicion = (String) request.getParameter("Posicion");
	  String fecha = (String) request.getParameter("Fecha");
	  String primera = (String) request.getParameter("Primera");
      String subtitulo1 = new String("Env&iacute;o de mensajes");
  %>
  <%@include file="cabeceraLogo.jsp"%>
  <script language="JavaScript">
  var tabla="<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>";
  document.write(tabla);
  </script>
  
  <script language="JavaScript">
		//Función que permite abrir el fichero de ayuda correspondiente a la página

		function lanzaFormulario(accionName, param, numForm){
			f = document.getElementById('theForm' + numForm);
			f.action = accionName;
			f.submit();
		}
	</script>
  
    <TBODY>
    <TR>
      <td width="10" class="Fondoverdederecha">
         &nbsp;
      </td>
      <TD vAlign=top width="180" class="celdalineaderecha">
        <%@include file="menu.jsp"%>
      </TD><!-- InstanceBeginEditable name="contenido" -->
      <TD class=Titulo vAlign="top" align="left" background="images/fondocentro.gif">
		<br>
         <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Rol de Receptor&nbsp;</DIV>
         <br>
         <br>
         <table align="left" border="0" cellpadding="0" cellspacing="2" width="95%">
         <logic:iterate id="link" name="linksReceptor" type="es.gateway.sesiones.permisos.bean.LinkBean" indexId="ij" scope="request">
          <FORM METHOD=POST ID="theForm<c:out value="${ij}"/>" NAME="theForm<c:out value="${ij}"/>">
            <INPUT TYPE="hidden" NAME="OperadorConectado" value="<%=codigoOperador%>">
            <INPUT TYPE="hidden" NAME="Posicion" VALUE="<%=posicion%>">
            <INPUT TYPE="hidden" NAME="Fecha" VALUE="<%=fecha%>">
            <INPUT TYPE="hidden" NAME="Primera" VALUE="<%=primera%>">
            <INPUT TYPE="hidden" NAME="OperadorConexion" VALUE="<%=imagen%>">
            <INPUT TYPE="hidden" NAME="jsp" VALUE="<bean:write property="metodo" name="link" />">
            <INPUT TYPE="hidden" NAME="filtroULL" VALUE="TODOS">
            <INPUT TYPE="hidden" NAME="primera" VALUE="SI">
            <INPUT TYPE="hidden" NAME="origen" VALUE="MenuRolReceptor.jsp">
         
             <tr>
                <td width="10%"></td>
                <td width="20"><img src="images/item.gif" border="0"/></td>
                <td class="texto" width="1%">&nbsp;</td>
                <td class="texto"> <A
					href="javascript:lanzaFormulario('<bean:write property="accion" name="link" />', '<bean:write property="metodo" name="link" />', '<bean:write name="ij" />')"
												onMouseOver="window.status='<fmt:message>
													<bean:write property='descripcion' name='link' />
												</fmt:message>';return true"
												onMouseOut="window.status=' '">
												<% for (int i=0;i<link.getNivel().intValue()-2;i++){ %>
													&nbsp;
												<% } %>
												
												<fmt:message>
													<bean:write property='descripcion' name='link' />
												</fmt:message>
											</A></td>
             </tr>
        
        </FORM>
	</logic:iterate>    
	      </table>
        </td>
      <td width="10" class="Fondoverdederecha">
       &nbsp;
      </td>
    </TR>	
    </TBODY>
<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>