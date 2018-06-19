<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function NumberOk(Campo,Obligatorio){
   if (Campo.value == '') {
    if (Obligatorio){

      Campo.focus();
      alert("Introduzca un valor "+Campo.name);
      Campo.select();
      return (false);
    }
    else return true;
  }
  var checkOK = "0123456789";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  // All characters of the input string are digits
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

    Campo.focus();
    alert("Sólo puede escribir números en " + Campo.name);
    Campo.select();
    return (false);
  }
  return true;
}

function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          Campo.focus();
          alert("Introduzca una cadena de caracteres en" + Campo.name);
          Campo.select();
          return (false);
       }
       else return true;
    }

  var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,. -";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

     Campo.focus();
     alert("No escribir números ni vocales con acento en " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function TodoOk(){
      f = document.theForm;
       if (!StringOk(f.Nombre,true))
         return;
      if (!NumberOk(f.Telefono,true))
         return;
      if (!NumberOk(f.Fax,true))
         return;
      if (f.Email.value == ""){
         f.Email.focus();
         alert("Introduzca un valor en el campo E-mail");
         f.Email.select();
         return;
      }
      f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.PersonaContactoBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Modificación de persona de contacto");

	PersonaContactoBean contacto = (PersonaContactoBean) request.getAttribute("personaContacto");  
	String descOperador = (String) request.getAttribute("DescripcionOperador");  

	String idContacto = contacto.getIdContacto();
	String operadorActual = contacto.getOperador();
	String tipoMensaje = contacto.getTipoMensaje();
	String nombreContacto = contacto.getContacto();
	String tfnoContacto = contacto.getTfnoContacto();
	String faxContacto = contacto.getFaxContacto();
        String emailContacto = contacto.getEmailContacto();
	String tipoMensajeVer = tipoMensaje;
        if (tipoMensajeVer.equals("DFCTO")) tipoMensajeVer = "Defecto";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos persona de contacto:</DIV>

                <div align="center"><div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMantenimientoContacto" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM METHOD="POST" ACTION="ModificacionPersonaContacto" name="theForm">
                <INPUT TYPE="hidden" name="IdContacto" value="<%=idContacto%>">
                <table border="0" cellspacing="15">
                  <tr>
                    <td colspan="2"><font class="texto2">Operador: </font>
                    <font class="texto"><%=descOperador%></font><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></font>
                <p><font class="texto2">Mensaje: </font>
                    <font class="texto"><%=tipoMensajeVer%></font><INPUT TYPE="hidden" name="Mensaje" value="<%=tipoMensaje%>"></font></td>
                    <td colspan="2"><font class="texto2">Nombre </font><input type="text" class="inputText" class="inputText" size="31" maxlength="80" name="Nombre" value="<%=nombreContacto%>"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Teléfono </font></td>
                    <td><input type="text" class="inputText" class="inputText" name="Telefono" size="15" maxlength="15" value="<%=tfnoContacto%>"></td>
                    <td><font class="texto2">Fax </font></td>
                    <td><input type="text" class="inputText" class="inputText" name="Fax" size="15" maxlength="15" value="<%=faxContacto%>"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">E-mail </font></td>
                    <td colspan="2"><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Email" value="<%=emailContacto%>"></td>
                  </tr>
                </table>

                </FORM></center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Aceptar Modificación';return true" onMouseOut=""><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>
                    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
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

