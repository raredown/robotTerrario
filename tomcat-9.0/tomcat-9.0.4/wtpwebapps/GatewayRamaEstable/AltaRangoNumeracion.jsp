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
    alert("Sólo puede escribir números en " + Campo.name);
    if (navigator.appName=="Netscape") Campo.select();
    return (false);
  }
  else
     return true;
}

function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
      if (!NumberOk(Campo1,true))
         return false;
      if (!NumberOk(Campo2,true))
         return false;
      if ((Campo1.value == "")&&(Campo2.value != "")){
         Campo1.focus();
         alert("No es posible que "+Campo1.name+" esté en blanco cuando "+Campo2.name+" tiene valor");
         if (navigator.appName=="Netscape") Campo1.select();
         err = 1;
      }
      if ((Campo1.value != "")&&(Campo2.value == "")){
         err = 0;
         num1 = parseInt(Campo1.value,10);
         Campo2.value = Campo1.value;
      }
      if ((Campo1.value != "")&&(Campo2.value != "")){
         num1 = parseInt(Campo1.value,10);
         num2 = parseInt(Campo2.value,10);
         if (num1 > num2){
            Campo1.focus();
            alert("El rango es incorrecto");
            if (navigator.appName=="Netscape") Campo1.select();
            err = 1;
         }
         else err = 0;
      }
      if (err == 1){
         return false;
      }
      else
         return true;
}

function TodoOk(){
      f = document.theForm;
      if (!RangoOk(f.Rango1,f.Rango2))
         return;
      f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
 <%@ page import="java.util.Vector"%>
 <%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Alta de rango de numeraci&oacute;n");
    String operadorActual = (String) request.getAttribute("operadorConectado");
	String descOperador = (String) request.getAttribute("DescripcionOperador");  
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos del rango de numeraci&oacute;n&nbsp;</DIV>

                <div align="center"><div align="center"><center>
                <table border="0" cellspacing="15">
                <FORM METHOD=POST ACTION="PrevioMantenimientoRangoNumeracion" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form name="theForm" action="AltaRangoNumeracion" method="POST">
                  <tr>
                    <td><font class="texto2">Operador</font></td><td><font class="texto"><%=descOperador%></font><INPUT TYPE="hidden" name="Operador" value="<%=operadorActual%>"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">N&uacute;mero inicial rango</font></td>
                    <td class="texto"><input type="text" class="inputText" class="inputText" size="15"  maxlength="15" name="Rango1"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">N&uacute;mero final rango</font></td>
                    <td class="texto"><input type="text" class="inputText" class="inputText" size="15"   maxlength="15" name="Rango2"></td>
                  </tr>
                </form>
                </table>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td class="text"><a href="javascript:TodoOk()//'" onMouseOver="window.status='Insertar operador';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></A></td>
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



