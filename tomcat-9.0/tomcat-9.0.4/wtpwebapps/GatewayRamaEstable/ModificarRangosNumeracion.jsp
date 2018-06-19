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

// returns true if Campo is String
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
         Campo1.select();
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
            Campo1.select();
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
<%@ page import="es.portanode.mensajes.RangoNumeracionBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Modificaci&oacute;n de rango de numeraci&oacute;n");

    RangoNumeracionBean rango = (RangoNumeracionBean) request.getAttribute("rangoNumeracion");
	String descOperador = (String) request.getAttribute("DescripcionOperador");  

	String idInterno = (String) rango.getIdInterno();
	String operadorActual = (String) rango.getOperador();
	String rangoIni = (String) rango.getInicioRango();
        String rangoFin = (String) rango.getFinalRango();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos rango numeración:</DIV>

                    <div align="center"><center><table border="0" cellspacing="5">
                <FORM METHOD=POST ACTION="PrevioMantenimientoRangoNumeracion" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="ModificacionRangoNumeracion" method="POST" name="theForm">
                <input type="hidden" name="Operador" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="IdRango" value="<%=idInterno%>">
                        <tr>
                            <td><font class="texto2">Operador:</font></td>
                            <td><font class="texto"><%=descOperador%></font></td>
                        </tr>
                        <tr>
                        <tr>
                           <td><font class="texto2">N&uacute;mero inicial rango:</font></td>
                           <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango1" value="<%=rangoIni%>"></td>
                        </tr>
                        <tr>
                           <td><font class="texto2">N&uacute;mero final rango:</font></td>
                           <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango2"value="<%=rangoFin%>"></td>
                        </tr>
                        </table>
                    </center></div>
                <BR>
                    <div align="center"><center><table border="0">
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
