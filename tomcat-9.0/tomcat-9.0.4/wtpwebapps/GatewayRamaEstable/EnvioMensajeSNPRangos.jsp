<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var tipoAdquisicion = 99;

function NumberOk(Campo,Obligatorio){
   if (Campo.value == '') {
    if (Obligatorio) {

      Campo.focus();
      alert("Introduzca un valor en"+Campo.name);
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

function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
      if (!NumberOk(Campo1,true))     return false;
      if (!NumberOk(Campo2,true))     return false;
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
         if (num1 != num2 ){
	         if (num1 > num2){

	            Campo1.focus();
	            alert("El rango es incorrecto");
	            Campo1.select();
	            err = 1;
	         }
	         if ((num2 - num1 + 1) > 500){  // Validacion introducida por Alberto Elias
	             alert("El rango introducido es mayor de 500");
	             err = 1;
	        }
         }
         else err = 0;
      }
      if (err == 1){
         return false;
      }
      else
         return true;
}

function ValorRadio(){
   var encontrado = false;
     f= document.theForm;
     for (i=0; i < f.radio.length; i++){
         if (f.radio[i].checked){
             tipo = f.radio[i].value;
             encontrado = true;
              break;
         }
     }
     if (!encontrado){
        alert("Ha de escoger un tipo de adquisición (Total, por fechas o por números)");
        return 11;
     }
     return tipo;
}

function TodoOk(){
      f = document.theForm;
         if (!RangoOk(f.Rango1,f.Rango2))
            return;
         else{
             f.submit();
         }
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBeanCollection"%>
<%@ page import="java.io.*"%>
  <%
 	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("SNP");

    String subtitulo1=new String("Adquisici&oacute;n de conocimiento de numeraci&oacute;n portada");

	   String remitente = (String) request.getParameter("OperadorConectado");
	   String DescripcionRemitente = (String) request.getAttribute("DescripcionRemitente");
	   OperadorBeanCollection ops = (OperadorBeanCollection) request.getAttribute("SelectOperadores");
	   Vector vops = ops.GetSelectOperadores();
	   int numoperadores = ops.GetNumSelectOperadores();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia <%=tipoMDescripcion %></DIV>

                <FORM METHOD=POST ACTION="MenuOtrosMensajes.jsp" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="EnviarMsgSNP" method=POST name="theForm">
				<INPUT TYPE="hidden" name="FechaInicial" value="">
				<INPUT TYPE="hidden" name="FechaFinal" value="">
                    <div align="center"><center><table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador&nbsp;remitente: </font></td>
                            <td>
                                  <font class="texto"><%=remitente%>-<%=DescripcionRemitente%></font>
                                  <input type="hidden" name="OperadorConectado" value="<%=remitente%>">
                                  <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"></input>
                        </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Operador destinatario: &nbsp;</font></td>
                            <td><font class="texto">00000-Entidad de Referencia </font></td>
                            <input type="hidden" name="Destinatario" value="00000"></input>
                        </tr>
                        <tr>
                            <td><font class="texto2">Observaciones: </font></td>
                         <td colspan="3"><input type="text" class="inputText" class="inputText" size="50" maxlength="80" name="Observaciones"></td>
                        </tr>
                        <tr>
                            <td></td>
                         <td><INPUT type="radio" name="radio" checked value="2"><font class="texto2"> Por n&uacute;meros</font></td>
                            <td><font class="texto2"> N&uacute;mero inicial:</font></td>
                         <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango1"></td>
                        </tr>
                        <tr>
                            <td></td>
                         <td></td>
                            <td><font class="texto2"> N&uacute;mero final:</font></td>
                         <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango2"></td>
                        </tr>
                        </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                        <tr>
                            <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                            <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A></td>
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
<script language="JavaScript">
       setPath('<%= request.getContextPath() %>');
</script>
</body>
</html>
