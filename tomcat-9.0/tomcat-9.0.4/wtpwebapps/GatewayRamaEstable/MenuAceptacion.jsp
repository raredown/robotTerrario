<html>
<SCRIPT LANGUAGE="JavaScript">
<!--

function Linkage(clk){
	if(clk==1){
		document.theForm.action='PrevioConsultaSP';
    document.theForm.submit();
	}
	if(clk==2){
		document.theForm.action='PrevioConsultaASP';
    document.theForm.submit();
	}
}
//-->
</SCRIPT>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.operadores.OperadorBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
<%
   String operador = (String) request.getAttribute("OperadorConectado");
  OperadorBean matrizOperadorConectado[] = (OperadorBean []) request.getAttribute("MatrizOperadorConectado");
%>
  <%
    String subtitulo1 = new String("Env&iacute;os de mensajes de Respuesta");
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
              <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>&nbsp;</DIV>

                <div align="center"><center>

                <form method=Post align="center" name="theForm" onSubmit="return pass()">
                <INPUT type="hidden" name="Posicion" value="1">
                <table border="0">
                <tr>
                   <TD><font class="texto2">Operador Conectado </font></TD>
                    <td class="text"><select class="inputText"  name="OperadorConectado">

                        <% for (int i=0; i<matrizOperadorConectado.length;i++){
                           String codigo = matrizOperadorConectado[i].getCodigo();
                           String descripcion = matrizOperadorConectado[i].getDescripcion();
                               if (codigo.equals(operador)){
                        %><option value="<%=codigo%>" selected><%=descripcion%> </option>
                <%}else{%><option value="<%=codigo%>"><%=descripcion%> </option>
                        <% }
                           }
                        %></select></TD>
                </tr>
                <tr><td colspan="2"></td></tr>
                   <tr>
                    <td colspan="2" class="texto"><a href="javascript:Linkage(1)//'" onMouseOver="window.status='PrevioConsultaSP';return true" onMouseOut="window.status=' '">Aceptación (ASP) / Denegaci&oacute;n (DSP2) como DONANTE de una solicitud de cambio</a><font color="#800000"></font></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="texto"><a href="javascript:Linkage(2)//'" onMouseOver="window.status='PrevioConsultaASP';return true" onMouseOut="window.status=' '">Confirmación (CP) como RECEPTOR de solicitud de cambio</a><font color="#800000"></font></td>
                </table>
                </form>
                </center></div>
                <BR>
                <center align="center"><div>
                <table border=0>
                  <tr>
                     <td>
                        <A HREF="MenuPrincipal"><IMG SRC="images/Consul4.jpg" border="0" WIDTH="107" HEIGHT="28"></A>
                     </td>
                  </tr>
                </table>
                </center></div>
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
