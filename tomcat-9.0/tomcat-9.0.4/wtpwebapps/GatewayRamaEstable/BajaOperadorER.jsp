<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Baja operador ER");
  	String operador = (String) request.getParameter("OperadorConectado");
	String Codigo = (String) request.getParameter("codigo");
	String Descripcion = (String) request.getParameter("descripcion");
	String Licencia = (String) request.getParameter("licencia");
	String Comunidad = (String) request.getParameter("comunidad");
	String mensajeAviso = " Se va a proceder a dar de baja al operador";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos operador ER&nbsp;</DIV>

                <FORM METHOD=POST ACTION="ConsultaOperadoresERJSP" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="EfectuarBajaOperadorERJSP" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=operador%>">
                <div align="center"><center><table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">C&oacute;digo operador ER:</font></td>
                         <td class="texto"><font class="texto"><%=Codigo%></font><INPUT TYPE="hidden" name=Codigo
                        value="<%=Codigo%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Descripci&oacute;n:</font></td>
                         <td class="texto"><font class="texto"><%=Descripcion%></font><INPUT TYPE="hidden" name=Descripcion
                        value="<%=Descripcion%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Licencia:</font></td>
                         <td class="texto"><font class="texto"><%=Licencia%></font><INPUT TYPE="hidden" name=Licencia
                        value="<%=Licencia%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Comunidad:</font></td>
                         <td class="texto"><font class="texto"><%=Comunidad%></font><INPUT TYPE="hidden" name=Comunidad
                        value="<%=Comunidad%>"></td>
                        </tr>
                        </table>
                    </center></div>
                    <div align="center"><center>
                    <table border="0">
                        <tr>
                        <td align="center" class="textoRojo">AVISO: <%=mensajeAviso%></td>
                    </tr>
                    </table>
                <BR>
                    <table border="0">
                        <tr>
                            <td><A HREF="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Baja Operador';return true" onMouseOut="window.status=''"><IMG src="images/Manten3.jpg" width="107" height="28" border="0"></A></td>

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



