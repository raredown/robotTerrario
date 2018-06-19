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
  else
     return true;
}

function OperadorOk(Campo,Obligatorio){
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
  else{
     if (Campo.value.length != 5){

        Campo.focus();
        alert("El campo "+Campo.name+" ha de tener 5 dígitos");
        Campo.select();
        return (false);
     }
     else return true;
  }
}

function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          Campo.focus();
          alert("Introduzca una cadena de caracteres en " + Campo.name);
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

function NombreOperadorOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          Campo.focus();
          alert("Introduzca una cadena de caracteres en " + Campo.name);
          Campo.select();
          return (false);
       }
       else return true;
    }

  var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,. -1234567890";
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
     alert("Sólo se pueden introducir caracteres alfanúmericos sin acento " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function TodoOk(){
      f = document.theForm;
      if (!OperadorOk(f.Operador,true))
         return;
      if (!NombreOperadorOk(f.Nombre,true))
         return;
      if (!StringOk(f.NombrePC,true))
      	 return;
      if (!NumberOk(f.TelefonoPC,true))
      	 return;
      if (!NumberOk(f.FaxPC,true))
      	 return;
      if (f.EmailPC.value == ""){

         f.EmailPC.focus();
         alert("El campo "+f.EmailPC.name+" no puede estar en blanco");
         f.EmailPC.select();
      	 return;
      }
      f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Alta operador");
  	String operadorActual = (String) request.getAttribute("OperadorConectado");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos operador&nbsp;</DIV>

                <div align="center"><center>
                <table border="0" cellspacing="15" width="95%">
                <FORM METHOD=POST ACTION="PrevioMantenimientoOperador" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="AltaOperador" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                    <tr>
                        <td><font class="texto2">Código operador</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="5" size="5" name="Operador"></td>
                    </tr>
                    <tr>
                        <td><font class="texto2">Nombre operador</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="Nombre"></td>
                    </tr>
                    <tr>
                        <td><font class="texto2">Nombre Persona de Contacto</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="NombrePC"></td>
                    </tr>
                    <tr>
                        <td><font class="texto2">Tel&eacute;fono Persona de Contacto</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="15" size="15" name="TelefonoPC"></td>
                    </tr>
                    <tr>
                        <td><font class="texto2">Fax Persona de Contacto</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="15" size="15" name="FaxPC"></td>
                    </tr>
                    <tr>
                        <td><font class="texto2">Email Persona de Contacto</font></td>
                     <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="EmailPC"></td>
                    </tr>
                      </table>
                    </center></div>
                    <div align="center"><center><table border="0">
                        <tr>
                        <td colspan="2" class="textoRojo">AVISO: Deben darse de alta las notificaciones y quitar el flag de fuerza mayor</td>
                    </tr>
                  </table>
                <BR>
                  <table border="0">
                        <tr>
                            <td class="text"><a href="javascript:TodoOk()//'" onMouseOver="window.status='Insertar operador';return true" onMouseOut="window.status=' '"><IMG src="images/Manten1.jpg" width="107" height="28" border="0"></A></td>
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
