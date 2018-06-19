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
     alert("No escribir números ni vocales con acento en " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function TodoOk(){
      f = document.theForm;
      if (!StringOk(f.Nombre,true)){
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
    String subtitulo1 = new String("Modificación operador");

	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String operador = (String) request.getAttribute("Operador");
	String nombre = (String) request.getAttribute("Nombre");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos operador:</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMantenimientoOperador" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="ModificarOperador" method="POST" name=theForm >
                <INPUT type="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT type="hidden" name="Operador" value="<%=operador%>">
                <table border="0" cellspacing="15">
                        <tr>
                            <td><font class="texto2">Código operador:</font></td>
                         <td><font class="texto"><%=operador%></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Nombre operador:</font></td>
                         <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="Nombre" value="<%=nombre%>"></td>
                        </tr>
                        </table>
                        </center></div>
                </body>
                    </center></div>
                <BR>
                    <div align="center"><center><table border="0">
                    <body >
                    <tr>
                            <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Modificar operador';return true" onMouseOut=""><IMG src="images/Manten2.jpg" border="0" width="107" height="28" border="0"></A></td>
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
