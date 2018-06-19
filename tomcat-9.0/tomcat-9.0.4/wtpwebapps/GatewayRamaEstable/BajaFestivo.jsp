<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.util.FestivoUtil"%>

 <%
    String subtitulo1 = new String("Baja de festivo");
    String subtitulo2 = new String("Datos del festivo");
    FestivoUtil fest = (FestivoUtil) request.getAttribute("festivoMantenimiento");
    String operadorActual = (String) request.getAttribute("operadorConectado");
	String descOperador = (String) request.getAttribute("DescripcionOperador");  

	String ca = (String) fest.getFestivoCodigoCA();
    String fecha = (String) fest.getFestivoFecha();
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
             <DIV align=left class="Titulo">Datos festividad&nbsp;</DIV>

                <FORM METHOD=POST ACTION="PrevioMantenimientoFestivo" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="BajaFestivo" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="ComunidadAutonoma" value="00">

                    <div align="center"><center>
                    <table border="0" cellspacing="5" width="95%">
                        <tr>
                            <td><font class="texto2">Operador</font></td>
                         <td><font class="texto"><%=descOperador%></font><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Fiesta</font></td>
                         <td><font class="texto"><%=fecha%></font><INPUT TYPE="hidden" name="Fiesta" value="<%=fecha%>"></td>
                        </tr>
                        </table>
                    </center></div>
                <BR>
                    <div align="center"><center>
                     <table border="0">
                        <tr>
                           <td class="text"><a href="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Borrar';return true" onMouseOut="window.status=' '"><IMG src="images/Manten3.jpg" width="107" height="28" border="0"></A></td>
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
