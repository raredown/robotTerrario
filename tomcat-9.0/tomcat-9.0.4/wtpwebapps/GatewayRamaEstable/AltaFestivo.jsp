<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--

function TodoOk(){
      f = document.theForm;
      if (!FechaOk(f.Fiesta,true))
         return;
      f.submit();
}
//-->
</SCRIPT>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Alta de festivo");
	String operadorActual = (String) request.getAttribute("operadorConectado");
	String descOperador = (String) request.getAttribute("DescripcionOperador");  
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos Festividad</DIV>

                <div align="center"><div align="center"><center>
                <table border="0" cellspacing="15" width="95%">
                <FORM METHOD=POST ACTION="PrevioMantenimientoFestivo" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form name="theForm" action="AltaFestivo" method="POST">
                <INPUT TYPE="hidden" name="ComunidadAutonoma" value="00">
                  <tr>
                    <td><font class="texto2">Operador:</font></td><td><font class="texto"><%=descOperador%></font><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Fiesta:</font></td><td><input type="text" class="inputText" class="inputText" size="10" maxlength="10" name="Fiesta">
                        <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                    </td>
                  </tr>
                </form>
                </table>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td class="text"><a href="javascript:TodoOk()//'" onMouseOver="window.status='Insertar operador';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>
                    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                  </tr>
                </table>
                </center></div>
              </div>
             </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
 <script language="JavaScript">
       setPath('<%= request.getContextPath() %>');
       var calendario1 = new calendar1(document.theForm.Fiesta);
     </script>
</body>
</html>


