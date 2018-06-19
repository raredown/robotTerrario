<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Baja notificación");
 	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String idNotificacion = (String) request.getAttribute("IdNotificacion");

	String descripcion = (String) request.getAttribute("DescripcionOperador");
	String mensaje = (String) request.getAttribute("Mensaje");
	String nombre = (String) request.getAttribute("Nombre");
	String email = (String) request.getAttribute("Email");
	String mensajeselec = (String) request.getAttribute("MensajeSelec");
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
        <TBODY>
        <TR>
          <td width="10" class="Fondoverdederecha">
             &nbsp;
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos notificación&nbsp;</DIV>

                <FORM METHOD=POST ACTION="PrevioMantenimientoNotificacion" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="MensajeSelec" value="<%=mensajeselec%>">
                </FORM>

                <form action="BajaNotificacion" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="IdNotificacion" value="<%=idNotificacion%>">

                    <div align="center"><center>
                    <table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador</font></td>
                         <td class="texto"><font class="texto"><%=descripcion%></font>
                         <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Mensaje</font></td>
                         <td class="texto"><font class="texto"><%=mensaje%></font>
                         <INPUT TYPE="hidden" name="Mensaje" value="<%=mensaje%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Nombre notificado</font></td>
                         <td class="texto"><font class="texto"><%=nombre%></font>
                         <INPUT TYPE="hidden" name="Nombre" value="<%=nombre%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">E-mail notificado</font></td>
                         <td class="texto"><font class="texto"><%=email%></font>
                         <INPUT TYPE="hidden" name="Email" value="<%=email%>"></td>
                        </tr>
                        </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                        <tr>
                           <td><A HREF="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Borrar';return true" onMouseOut="window.status=' '"><IMG src="images/Manten3.jpg" width="107" height="28" border="0"></A></td>
                           <td><A HREF="MenuPrincipal"><img src="images/Consul4.jpg" width="107" height="28"></A></td>
                           <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>
                </form>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>

