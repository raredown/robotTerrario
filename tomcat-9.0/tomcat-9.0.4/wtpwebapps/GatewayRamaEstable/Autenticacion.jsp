<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.*,
                 es.portanode.util.Calendario" %>
<%
  try{
    String mensaje = (String)request.getAttribute("Mensaje");
if(mensaje == null)
	mensaje = "";
    String subtitulo1 = new String("Autenticación");
%>
<html>
<head>
   <title>Validaci&oacute;n de Usuarios</title>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<SCRIPT Language="javascript">


function Enviar(){

	var f = document.theForm;
	if(f.usuario.value==""){
		alert("Introduza su Nombre de Usuario");
		f.usuario.focus();
		return false;
	}
	/*if(f.password.value==""){
		alert("Introduzca su Contraseña")
		f.password.focus();
		return false;
	}*/

	f.submit();
}

function detectarEnter(e) {
	var ieKey=event.keyCode;
    if(ieKey==13)
    Enviar();
}
</SCRIPT>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

<!-- link="#666666" alink="#000000" vlink="#008080" -->
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@include file="cabeceraAuth.jsp"%>
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
      <jsp:include page="menu_vacio.jsp" flush="true"/>
    </TD><!-- InstanceBeginEditable name="contenido" -->
    <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
        <center>
         <font class="textonegro">VALIDACI&Oacute;N DE USUARIOS</font>
        <p>&nbsp;</p>
        </center>
        <center>
          <form action="gest_LoginPerf" method="post" name="theForm">
          		<input type="hidden" name="accion" value="inicio" />
				<input type="hidden" name="tipo_Login" value="0" />
				<input type="hidden" name="autenti" value="0" />
				<input type="hidden" name="redirect" value="/MenuPrincipal.jsp" />
            <table border="0" width="90%">
                <tr>
                    <td colspan="2" align="center"><p><font class="texto2"><b><%=mensaje%>&nbsp;</b></font></p></td>
                </tr>
                <tr>
                    <td colspan="2" height="30"><p>&nbsp;</p></td>
                </tr>
                <tr>
                    <td align="right" width="50%"><b><font class="texto2">Usuario:</font></b></td>
                    <td align="left"  width="50%"><input type="text" class="inputText" name="usuario"></td>
                </tr>
                <tr>
                    <td align="right"><b><font class="texto2">Contrase&ntilde;a:</font></b></td>
                    <td align="left"><input type="password" class="inputText" name="password" onKeyUp="detectarEnter(this)"></td>
                </tr>
                <tr>
                    <td colspan="2" height="20">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" height="20" align="center">
                      <A HREF="#" onClick="Enviar()">
                        <img src='images/Aceptar.jpg' name='aceptar' ALT='aceptar' border="0">
                      </a>
                      </td>
                </tr>
            </table>
          </form>
          <script>document.theForm.usuario.focus()</script>
        </center>
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
<%

    } catch (Throwable t) {
        System.out.println(t);
    } finally{

    }
%>

