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
  if ((Campo.name == "NRN")&&(Campo.value.length != 6)){

     Campo.focus();
     alert("El campo " + Campo.name+ " ha tener seis cifras");
     Campo.select();
     return false;
  }
  return true;
}


function TodoOk(){
      f = document.theForm;
      if (!NumberOk(f.NRN,true))
         return;
      f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Alta NRN");
 	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String descripcion = (String) request.getAttribute("DescripcionOperador");
    String inicioNRN = (String) request.getAttribute("IniNRN");
    String finalNRN = (String) request.getAttribute("FinNRN");
    String estado = (String) request.getAttribute("Estado");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos NRN&nbsp;</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMantenimientoNRN" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="RangoInicio" value="<%=inicioNRN%>">
                <INPUT TYPE="hidden" name="RangoFinal" value="<%=finalNRN%>">
                <INPUT TYPE="hidden" name="Estado" value="<%=estado%>">
                </FORM>
                <table border="0" cellspacing="15" width="95%">
                <form name="theForm" action="AltaNRN" method="POST">
                <INPUT TYPE="hidden" name="RangoInicio" value="<%=inicioNRN%>">
                <INPUT TYPE="hidden" name="RangoFinal" value="<%=finalNRN%>">
                  <tr>
                            <td><font class="texto2">Operador: </font></td>
                             <td><font class="texto"><%=descripcion%></font>
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>"></td>
                  </tr>
                  <tr>
                            <td><font class="texto2">NRN: </font></td>
                             <td><input type="text" class="inputText" class="inputText" size="6" maxlength="6" name="NRN" value=""></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Estado:</font></td>
                    <td class="text"><select class="inputText"  name="Estado">
                        <option value="0">CERRADO
                        <option value="1">ABIERTO
                    </select></td>
                  </tr></form>
                </table>
                </center></div>
                <div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td class="text"><a href="javascript:TodoOk()//'" onMouseOver="window.status='Insertar NRN';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>
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
