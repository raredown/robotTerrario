<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.util.PersonaContactoBean"%>
<%@ page import="java.io.*"%>
  <%
   String subtitulo1 = new String("Baja de persona de contacto");
   	PersonaContactoBean contacto = (PersonaContactoBean) request.getAttribute("personaContacto");
	String descOperador = (String) request.getAttribute("DescripcionOperador");  

	String idContacto = contacto.getIdContacto();
	String operadorActual = contacto.getOperador();
	String tipoMensaje = contacto.getTipoMensaje();	
	String nombreContacto = contacto.getContacto();
	String tfnoContacto = contacto.getTfnoContacto();
	String faxContacto = contacto.getFaxContacto();
    String emailContacto = contacto.getEmailContacto();
    if (tipoMensaje.equals("DFCTO")) tipoMensaje = "Defecto";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos de la persona de contacto&nbsp;</DIV>

                <div align="center"><div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMantenimientoContacto" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <FORM METHOD="POST" ACTION="BajaPersonaContacto" name="theForm">
                <INPUT TYPE="hidden" name="IdContacto" value="<%=idContacto%>">
                  <table border="0" cellspacing="15">
                  <tr>
                    <td colspan="2" class="texto"><font class="texto2">Operador: </font><font class="texto"><%=descOperador%><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></font><p>Mensaje:
                    <font class="texto"><%=tipoMensaje%><INPUT TYPE="hidden" name="Mensaje" value="<%=tipoMensaje%>"></font></td>
                    <td colspan="2" class="texto"><font class="texto2">Nombre: </font><font class="texto"><%=nombreContacto%></font><INPUT TYPE="hidden" name="Nombre" value="<%=nombreContacto%>"></td>
                  </tr>
                  <tr>
                    <td class="texto"><font class="texto2">Teléfono</font>: <font class="texto"><%=tfnoContacto%></font><INPUT TYPE="hidden" name="Telefono" value="<%=tfnoContacto%>"></td>
                    <td colspan="2"><font class="texto2">Fax: </font><font class="texto"><%=faxContacto%></font><INPUT TYPE="hidden" name="Fax" value="<%=faxContacto%>"></td>
                    <td class="texto"><font class="texto2">E-mail</font>: <font class="texto"><%=emailContacto%></font><INPUT TYPE="hidden" name="Email" value="<%=emailContacto%>"></td>
                  </tr>
                </table>
                 </FORM>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td><A HREF="javascript:void(document.theForm.submit())//'" onMouseOver="window.status='Baja Contato';return true" onMouseOut="window.status=''"><IMG src="images/Manten3.jpg" width="107" height="28" border="0"></td>

                    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                  </tr>
                </table>
                </center>
              </div>
            </div>
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
