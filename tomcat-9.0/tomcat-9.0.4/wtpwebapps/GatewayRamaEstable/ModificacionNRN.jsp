<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function TodoOk(){
      f = document.theForm;
      f.submit();   
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
      String subtitulo1 = new String("Modificación NRN");

      String operadorActual = (String) request.getAttribute("OperadorConectado");
      String descripcion = (String) request.getAttribute("DescripcionOperador");
      String nrn = (String) request.getAttribute("NRN");
      String estado = (String) request.getAttribute("Estado");
      String inicioNRN = (String) request.getAttribute("IniNRN");
      String finalNRN = (String) request.getAttribute("FinNRN");
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 211;
      var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos NRN:</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMantenimientoNRN" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="RangoInicio" value="<%=inicioNRN%>">
                <INPUT TYPE="hidden" name="RangoFinal" value="<%=finalNRN%>">
                <INPUT TYPE="hidden" name="Estado" value="<%=estado%>">
                </FORM>
                <FORM METHOD=POST ACTION="ModificacionNRN" name="theForm">
                <INPUT TYPE="hidden" name="RangoInicio" value="<%=inicioNRN%>">
                <INPUT TYPE="hidden" name="RangoFinal" value="<%=finalNRN%>">
                <INPUT TYPE="hidden" name="Estado" value="<%=estado%>">
                <table border="0" cellspacing="15">
                  <tr>
                    <td><font class="texto2">Operador</font>
                    <td><font class="texto"><%=descripcion%>
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>"></font></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">NRN</font>
                    <td><font class="texto"><%=nrn%>
                    <INPUT TYPE="hidden" name="NRN" value="<%=nrn%>"></font></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Estado</font></td>
                    <td class="text"><select class="inputText"  name="Estadom">
                <%	if (estado.equals("0")){
                %>
                        <option selected value="0">CERRADO
                        <option value="1">ABIERTO
                <%	}else{
                %>
                        <option value="0">CERRADO
                        <option selected value="1">ABIERTO
                <%	}
                %>
                    </select></td>
                  </tr>
                </table>
                </FORM>
                </center></div>
                <BR>
                <div align="center"><center>
                <table border="0">
                  <tr>
                    <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Modificar';return true" onMouseOut=""><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>

                <td><A HREF="javascript:history.back()"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                  </tr>
                </table>
                </center></div></div>
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
