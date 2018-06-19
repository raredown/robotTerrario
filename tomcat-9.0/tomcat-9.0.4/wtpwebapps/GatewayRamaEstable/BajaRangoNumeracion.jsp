<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.RangoNumeracionBean"%>

 <%
     String subtitulo1 = new String("Baja de rango de numeraci&oacute;n");
     RangoNumeracionBean rango = (RangoNumeracionBean) request.getAttribute("rangoNumeracion");
 	 String descOperador = (String) request.getAttribute("DescripcionOperador");

	 String idInterno = (String) rango.getIdInterno();
	 String operadorActual = (String) rango.getOperador();
	 String rangoIni = (String) rango.getInicioRango();
     String rangoFin = (String) rango.getFinalRango();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos del rango de numeración&nbsp;</DIV>

                <FORM METHOD=POST ACTION="PrevioMantenimientoRangoNumeracion" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="BajaRangoNumeracion" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="IdRango" value="<%=idInterno%>">
                    <div align="center"><center><table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador</font></td>
                         <td class="texto"><font class="texto"><%=descOperador%></font><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">N&uacute;mero inicial rango</font></td>
                         <td class="texto"><font class="texto"><%=rangoIni%></font><INPUT TYPE="hidden" name="Rango1" value="23468947"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">N&uacute;mero final rango</font></td>
                         <td class="texto"><font class="texto"><%=rangoFin%></font><INPUT TYPE="hidden" name="Rango2" value="23468969"></td>
                        </tr>
                        </table>
                    </center></div>
                <BR>
                    <div align="center"><center><table border="0">
                        <tr>
                           <td><A HREF="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Borrar';return true" onMouseOut="window.status=' '"><IMG src="images/Manten3.jpg" width="107" height="28" border="0"></A></td>

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
