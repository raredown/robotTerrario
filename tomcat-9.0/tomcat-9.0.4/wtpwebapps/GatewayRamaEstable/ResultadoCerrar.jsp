<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>
<%    String anterior = (String) request.getAttribute("Anterior");

    String subtitulo1=new String("Cerrar Proceso Expirado");
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
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envio solicitud</DIV>

                  <FORM METHOD=POST ACTION="<%=anterior%>" name="fback">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="Accion" value="Cerrar">
                  </FORM>


                  <CENTER>
                  <table align="center">
                    <tr>
                      <td align="center" class="texto">
                         <CENTER>
                          <br><br><br>
                           <table border="1" class="tablas">
                             <tr>
                                <td class="bgCabeceraFila" align="center">
                                   Resultado de la operación
                                </td>
                             </tr>
                             <tr>
                               <td class="bgFila">
                                 <font class="texto"><%=request.getAttribute("Mensaje")%></font>
                               </td>
                             </tr>
                            </table>
                        </CENTER>
                      </td>
                    </tr>
                    <tr>
                        <td align="center"><a href="javascript:history.back()//'" onMouseOver="window.status='Pagina Anterior';return true" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" border="0" height="28"></a></td>
                    </tr>
                  </table>
                </CENTER>

             <%--Nueva imagen--%>
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