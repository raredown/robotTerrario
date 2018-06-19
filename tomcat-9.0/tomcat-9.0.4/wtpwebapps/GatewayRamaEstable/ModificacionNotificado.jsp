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
    if (Obligatorio) {
      Campo.focus();
      alert("Introduzca un valor en "+Campo.name);
      if (navigator.appName=="Netscape") Campo.select();
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
    alert("Sólo puedes escribir números en " + Campo.name);
    if (navigator.appName=="Netscape") Campo.select();
    return (false);
  }
  else
     return true;
}

// returns true if Campo is String
function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {
          Campo.focus();
          alert("Introduzca una cadena de caracteres en " + Campo.name);
          if (navigator.appName=="Netscape") Campo.select();
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
    if (navigator.appName=="Netscape") Campo.select();
    return false;
  }
  return true;
}

function SelectOk(Campo){
    var seleccion,totalopt
         totalopt = Campo.length;
         for (i = 0;  i < totalopt; i++){
             if (Campo.options[i].selected)
               break
         }
         seleccion = Campo.options[i].text;
         if (seleccion == ""){
            Campo.focus();
            alert("No puede haver una selección vacía en " + Campo.name );
            Campo.select();
            return false;
         }
         else return true;
}

function TodoOk(){
     f = document.theForm;
     if (!StringOk(f.Nombre,true))
        return;
     if (f.Email.value == ""){
        f.Email.focus();
        alert("Ha de introducir un valor en el campo "+ f.Email.name);
        return;
     }
     f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.TipoMensajeBeanCollection"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Modificación notificación");

	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String idNotificacion = (String) request.getAttribute("IdNotificacion");

	String descripcion = (String) request.getAttribute("DescripcionOperador");
	TipoMensajeBeanCollection tipos = (TipoMensajeBeanCollection) request.getAttribute("TiposMensaje");
	int numtipos = tipos.GetNumeroTiposMensaje();
	Vector vtipos = tipos.GetTiposMensaje(0,numtipos);

	String mensaje = (String) request.getAttribute("Mensaje");
	String nombre = (String) request.getAttribute("Nombre");
	String email = (String) request.getAttribute("Email");
	String mensajeselec = (String) request.getAttribute("MensajeSelec");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos notificación:</DIV>

                <FORM METHOD=POST ACTION="PrevioMantenimientoNotificacion" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="MensajeSelec" value="<%=mensajeselec%>">
                </FORM>
                <form action="ModificacionNotificacion" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="seleccion" value="">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Mensaje" value="<%=mensaje%>">
                <INPUT TYPE="hidden" name="IdNotificacion" value="<%=idNotificacion%>">
                    <div align="center"><center>
                    <table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador </font></td>
                             <td><font class="texto"><%=descripcion%></font>
                        </tr>
                        <tr>
                            <td><font class="texto2">Mensaje</font></td>
                             <td><font class="texto"><%=mensaje%></font>
                        </tr>
                        <tr>
                            <td><font class="texto2">Nombre notificado</font></td>
                         <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="Nombre" value="<%=nombre%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">E-mail notificado</font></td>
                         <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="Email" value="<%=email%>"></td>
                        </tr>
                        </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                        <tr>
                           <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Modificar';return true" onMouseOut="window.status=' '"><IMG src="images/Manten2.jpg" border="0" width="107" height="28" border="0"></A></td>
                           <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
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