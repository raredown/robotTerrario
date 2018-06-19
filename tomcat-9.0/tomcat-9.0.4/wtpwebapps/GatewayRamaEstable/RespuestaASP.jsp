<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<SCRIPT LANGUAGE="JavaScript">
<!--

function TodoOk(num){
     f = document.theForm;
     if (num == 1){
         f.submit();   
     }
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.mensajes.MensajeASP,
                 es.portanode.util.PersonaContactoBean,
                 es.portanode.mensajes.MensajeASPNumeracion"%>
<%@ page import="java.util.Vector"%>
<%@ page import=" java.io.*"%>
<%
	String remitente = (String) request.getAttribute("Remitente");
	PersonaContactoBean pContacto = (PersonaContactoBean) request.getAttribute("PersonaContacto");
    	MensajeASP mensaje = (MensajeASP)request.getAttribute("MensajeASP");
   
	Vector rangos = mensaje.getRangosNumeracion();
		
	String idInterno = mensaje.getIdInterno();
  
    
  String personaNombre = pContacto.getContacto();
  String personaEmail = pContacto.getEmailContacto();
  String personaFax = pContacto.getFaxContacto();
  String personaTel = pContacto.getTfnoContacto();
  String filtro = request.getParameter("filtroULL");
  if(filtro==null) filtro = "TODOS";
  String subtitulo1="Detalle mensaje ASP";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Confirmación (CP) como RECEPTOR de solicitud de cambio</DIV>



			<FORM METHOD=POST ACTION="PrevioConsultaASP" name="fback">
			<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
			<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
			<INPUT TYPE="hidden" name="Posicion" value="1">
			<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
			</FORM>
			<form action="ResponderMsgASP" method=post name="theForm">
			 <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
			 <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
			 <INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
			 <INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
			 <INPUT TYPE="hidden" name="IdInterno" value="<%=idInterno%>">
			<div align="center"><center>
			<table border="1" class="tablas">
				<tr>
					<td colspan="5" class="bgCabeceraFila" align="center"><b>Detalle Rangos</b></td>
				</tr>
				
				<tr>
			        <td class="bgCabeceraFila">Núm. inicial rango:</td>
			        <td class="bgCabeceraFila">&nbsp;&nbsp;</td>
			        <td class="bgCabeceraFila">Núm. final rango:</td>
			        <td class="bgCabeceraFila">&nbsp;&nbsp;</td>
			        <td class="bgCabeceraFila">NRN:</td>
			    </tr>
			
			<%	String clase="";
                for(int i=0;i<rangos.size();i++){
			
				MensajeASPNumeracion mensASPNum = (MensajeASPNumeracion) rangos.elementAt(i);
                if((i%2)==0)
                    clase="";
                else
                    clase="bgFila";
			%>
			    <tr>
			        <td class="<%=clase%>"><font class="texto"><%=mensASPNum.getNumInicialRango()%></font></td>
			        <td class="<%=clase%>">&nbsp;&nbsp;</td>
			        <td class="<%=clase%>"><font class="texto"><%=mensASPNum.getNumFinalRango()%></font></td>
			        <td class="<%=clase%>">&nbsp;&nbsp;</td>
			        <td class="<%=clase%>"><font class="texto"><%=mensASPNum.getNRN()%></font></td>
			    </tr>
			    
			<%
				}
			%>
			
			</table>
			</center></div>
			<p>&nbsp;</p>
			<div align="center"><center>
			<table border="0">
			    <tr>
			        <td><font class="texto2">Persona contacto:</font></td>
			        <td><font class="texto"><%=personaNombre%></font><INPUT TYPE="hidden" name="PersonaContacto" value="<%=personaNombre%>"></td>
			        <td>&nbsp;&nbsp;</td>
			        <td><font class="texto2">E-mail:</font></td>
			        <td><font class="texto"><%=personaEmail%></font><INPUT TYPE="hidden" name="Email" value="<%=personaEmail%>"></td>
			    </tr>
			    <tr>
			        <td><font class="texto2">Teléfono:</font></td>
			        <td><font class="texto"><%=personaTel%></font><INPUT TYPE="hidden" name="Telefono" value="<%=personaTel%>"></td>
			        <td>&nbsp;&nbsp;</td>
			        <td><font class="texto2">Fax:</font></td>
			        <td><font class="texto"><%=personaFax%></font><INPUT TYPE="hidden" name="Fax" value="<%=personaFax%>"></td>
			    </tr>
			</table>
			</center></div>
			<hr>
			
			<!--
			<h5>Datos mensaje a enviar</h5>
			<div align="center"><center>
			<table border="0">
			    <tr>
			        <td><font class="texto2">Fecha inicio ventana </font><input
			        type="text" size="11" name="FechaInicial">&nbsp;</td>
			        <td><font class="texto2">Hora inicio ventana </font><input
			        type="text" size="9" name="HoraInicial"></td>
			    </tr>
			</table>
			</center></div>
			
			-->
			<p>&nbsp;</p>
			<div align="center"><center>
			<table border="0">
			    <tr>
			        <td><A HREF="javascript:TodoOk(1)//'" onMouseOver="window.status='Responder';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A></td>
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
