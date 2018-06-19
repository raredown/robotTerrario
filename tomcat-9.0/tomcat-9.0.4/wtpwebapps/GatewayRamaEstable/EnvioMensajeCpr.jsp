<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function TodoOk(){
     f = document.theForm;
      f.submit()
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1=new String("Reenvío confirmación");

	 String remitente = (String) request.getAttribute("OperadorConectado");
	 String descRemitente = (String) request.getAttribute("DescripcionRemitente");
	 String destinatario = new String("00000");
	 String descDestinatario = (String) request.getAttribute("DescripcionDestinatario");
	 String IdProceso = (String) request.getAttribute("IdProceso");
	 String IdSubProceso = (String) request.getAttribute("IdSubProceso");
	 String [] info = (String[]) request.getAttribute("InfoCPR");
	 String fecha = info[0].substring(6,8)+"/"+info[0].substring(4,6)+"/"+info[0].substring(0,4); 
	 String hora = info[1].substring(0,2)+":"+info[1].substring(2,4)+":"+info[1].substring(4,6); 
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia CPR</DIV>

                <FORM METHOD=POST ACTION="PrevioConsultaCPR" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>


                <form action="EnviarMsgCPR" METHOD=POST name="theForm">
                <INPUT TYPE="hidden" name="IdSubProceso" value="<%=IdSubProceso%>">

                      <div align="center"><center><table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador&nbsp;remitente: </font></td>
                         <td><font class="texto"><%=remitente%>-<%=descRemitente%></font>
                            <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                            <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                         </td>
                            <td><font class="texto2">Operador destinatario: &nbsp;</font></td>
                         <td><font class="texto"><%=destinatario%>-<%=descDestinatario%></font><INPUT TYPE="hidden" name="Destinatario" value="<%=destinatario%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Observaciones </font></td>
                         <td colspan="3"><input type="text" class="inputText" class="inputText" size="50" maxlength="80" name="Observaciones">  </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Número identificación&nbsp;proceso:&nbsp;</font></td>
                         <td><font class="texto"> <%=IdProceso%>  </font><INPUT TYPE="hidden" name="IdProceso" value="<%=IdProceso%>"></td>

                <%	if (!info[4].equals("")){
                %>
                            <td><font class="texto2">NRN:</FONT></td>
                        <td><font class="texto"><%=info[4]%></font>
                        </td>
                <%	}	%>
                       <INPUT TYPE="hidden" name="NRN" value="<%=info[4]%>">

                        </tr>
                        <tr>
                            <td><font class="texto2">Número inicial
                            del rango: </font></td>
                        <td><font class="texto"><%=info[2]%><INPUT TYPE="hidden" name="InicioRango"
                        value="<%=info[2]%>">
                        </td>
                            <td><font class="texto2">Número final
                            del rango: </font></td>
                        <td><font class="texto"><%=info[3]%><INPUT TYPE="hidden" name="FinalRango"
                        value="<%=info[3]%>">
                        </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Fecha inicio ventana:</font></td>
                        <td><font class="texto"><%=fecha%><INPUT TYPE="hidden" name="FechaInicio"
                        value="<%=info[0]%>">
                        </td>

                            <td><font class="texto2">Hora inicio ventana:</font></td>
                        <td><font class="texto"><%=hora%><INPUT TYPE="hidden" name="HoraInicio"
                        value="<%=info[1]%>">
                        </td>
                        </tr>
                        </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                        <tr>
                            <td><A HREF="javascript:TodoOk()//'"onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>
                </form>
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
