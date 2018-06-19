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
     alert("No escribir números en ni vocales con acento" +Campo.name);
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

 <%@ page import="java.util.Vector,
                  es.portanode.util.TipoMensajeBeanCollection,
                  es.portanode.util.TipoMensajeBean"%>
 <%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Alta de persona de contacto");
	String operadorActual = (String) request.getAttribute("operadorConectado");
	String idContacto = (String) request.getAttribute("idContacto");  
	String descOperador = (String) request.getAttribute("DescripcionOperador");  
	TipoMensajeBeanCollection tiposMsg = (TipoMensajeBeanCollection) request.getAttribute("colTiposMsg");
	Vector vmensajes = tiposMsg.getAllTiposMensaje();
	int numfilas = tiposMsg.GetNumeroTiposMensaje();
	System.err.print(numfilas);
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos persona contacto&nbsp;</DIV>

                <div align="center"><div align="center"><center>
                <table border="0" cellspacing="15">
                <FORM METHOD=POST ACTION="PrevioMantenimientoContacto" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="AltaPersonaContacto" method="POST" name="theForm">
                <tr>
                    <td colspan="3"><font class="texto2">Operador: </font><font class="texto"><%=descOperador%><INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>"></font></td>
                </tr>
                <tr>
                   <td>
                     <font class="texto2">Mensaje: </font>
                     <select class="inputText" name="TipoMensaje">
                      <option value="DFCTO">Defecto:</option>
                <%
                      for (int i=0; i<vmensajes.size(); i++){
                          TipoMensajeBean mensaje = (TipoMensajeBean) vmensajes.elementAt(i);
                          String codigomensaje = mensaje.GetCodigo();
                %>
                       <option value="<%=codigomensaje%>"><%=codigomensaje%></option>
                <%
                }
                %>
                    </select></td>
                    <td colspan="2"><font class="texto2">Nombre: </font><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Nombre"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Teléfono:</font> <input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Telefono"></td>
                    <td><font class="texto2">Fax: </font><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Fax"></td>
                    <td><font class="texto2">E-mail:</font> <input type="text" class="inputText" class="inputText" size="20" maxlength="80" name="Email"></td>
                  </tr>
                </form>
                </table>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td class="text"><a href="javascript:TodoOk()//'" onMouseOver="window.status='Insertar persona contacto';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>
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

