<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head><title>Baja de Usuario</title><script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
  <%@ page import="es.portanode.util.usuarios.UsuarioBean"%>
  <%@ page import="java.util.Vector"%>
    <%
    String subtitulo1 = new String("Mantenimiento de Usuarios");
    String usuario = (String)request.getAttribute("Usuario");
	UsuarioBean user = (UsuarioBean)request.getAttribute("ObjUser");
    Vector vOperadores = (Vector)request.getAttribute("vectorOperadores");
    int totalOperadores = vOperadores.size();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Baja usuario&nbsp;</DIV>

               <form action="CambioEnUsuario" method="POST" name="theForm">
                <input type="hidden" name="Operacion" value="3">
                <center>
                <table  border="0" width="90%" align="center">
                <tr>
                <td align="center">
                <BR>

                <table border="0">
                <tr>
                  <td><font class="texto2" size="3"><B>Usuario:</B></font></td>
                    <td><font class="texto" size="3"><%=user.getUsuario()%></font><input type="hidden" name="Usuario" value="<%=user.getUsuario()%>"></td>
                </tr>
                <tr>
                  <td><font class="texto2" size="3"><B>Nombre:&nbsp;</B></font></td>
                  <td><font class="texto" size="3"><%=user.getNombre()%></font></td>
                </tr>
                <tr>
                  <td><font class="texto2" size="3"><B>Apellidos:&nbsp;</B></font></td>
                  <td><font class="texto" size="3"><%=user.getApellidos()%></font></td>
                </tr>
                <tr>
                  <td><font class="texto2" size="3"><B>Telefono:&nbsp;</B></font></td>
                  <td><font class="texto" size="3"><%=user.getTelefono()%></font></td>
                </tr>
                <tr>
                  <td><font class="texto2" size="3"><B>Fax:&nbsp;</B></font></td>
                  <td><font class="texto" size="3"><%=user.getFax()%></font></td>
                </tr>
                <tr>
                  <td><font class="texto2" size="3"><B>E-mail:&nbsp;</B></font></td>
                  <td><font class="texto" size="3"><%=user.getEmail()%></font></td>
                </tr>
                <tr>
                    <td><font class="texto2" size="3"><B>Perfil:&nbsp;</B></font></td>
                    <td><font class="texto" size="3"><%=user.getPerfil()%></font></td>
                </tr>
                    <tr>
                        <td><font class="texto2" size="3"><B>Operadores:&nbsp;</B></font></td>
                        <td><table>
                         <%for (int j=0; j<totalOperadores;j++)
                             {

                                 OperadorMultipleBean operator = (OperadorMultipleBean)vOperadores.elementAt(j);
                                 String operador = operator.getCodigo();
                                 if(user.isOperador(operador)) {
                                 String descripcionOperador = operator.getNombre();
                                 out.print("<tr><td><font class='texto' size='3'>"+operador+"</font></td></td>");
                               }

                             }%>

                         </table></td>
                    </tr>
                </table>
                <P>
                <table border="0">
                <tr>
                   <td align="center"><a href="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Borrar Usuario';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" width="107" height="28" border="0" alt="Eliminar Usuario"></a></td>
                   <td align="center"><a href="MantenimientoUsuarios" onMouseOver="window.status='Ir a la Página anterior';return true" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" height="28" border="0"></a></td>
                </tr>
                </table>
                </td>
                </tr>
                </table>
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
