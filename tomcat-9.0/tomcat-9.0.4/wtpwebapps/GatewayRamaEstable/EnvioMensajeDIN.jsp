<%@ page import="es.portanode.util.Singleton"%>
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

function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
      if (!NumberOk(Campo1,true))
         return false;
      if (!NumberOk(Campo2,false))
         return false;
      if ((Campo1.value == "")&&(Campo2.value != "")){

         Campo1.focus();
         alert("No es posible que "+Campo1.name+" esté en blanco cuando "+Campo2.name+" tiene valor");
         Campo1.select();
         err = 1;
      }
      if ((Campo1.value != "")&&(Campo2.value == "")){
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

function Combos(Campo,remitente){
     escogido = Campo.options.selectedIndex;
     if (remitente.value == Campo.options[escogido].value){
        alert("El remitente y el destinatario del mensaje no puede ser el mismo");
        return false;
     }
     return true;
}

function TodoOk(){
     f = document.theForm;
     if (!RangoOk(f.Rango1,f.Rango2))
        return;
     if (!NumberOk(f.NRN,true))
        return;
     if (!Combos(f.OperadorError,f.OperadorConectado))
        return;
     f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<!--****************************
	*************************     Part of calling Cabecera.jsp
	****************************-->
<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.util.operadores.OperadorBean"%>
<%@ page import="java.io.*"%>

  <%
  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("DIN");
	
    String subtitulo1=new String("Resoluci&oacute;n de posibles incoherencias");

	System.err.println("EnvioMensajeDIN.JSP : -inicio-");

	String OperadorRemitente 	= (String) request.getParameter("OperadorConectado");
	String DescripcionRemitente 	= (String) request.getAttribute("DescripcionRemitente");
	OperadorBeanCollection ops		= (OperadorBeanCollection) request.getAttribute("SelectOperadores");
	Vector vops = ops.GetSelectOperadoresActivos();
	int numoperadores = ops.GetNumSelectOperadoresActivos();
	String nomServlet 		= new String("EnviarMsgDIN");
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
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="EnviarMsgDIN" method=post name="theForm">
                <table border="0" cellspacing="5">

                    <tr>
                      <TD><font class="texto2">Remitente: </font></TD>
                      <TD><font class="texto"><%=OperadorRemitente%>-<%=DescripcionRemitente%></font>
                      <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                      <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"></TD>
                    </tr>

                    <tr>
                      <TD><font class="texto2">Destinatario: </font></TD>
                      <TD><font class="texto">00000-Entidad de Referencia </font>
                      <input type="hidden" name="Destinatario" value="00000"></input></TD>
                    </tr>

                    <tr>
                      <TD><font class="texto2">Observaciones: </font></TD>
                      <TD colspan="3"><input type="text" class="inputText" class="inputText" size="70" maxlength="80" name="Observaciones"></TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">N&uacute;mero inicial del rango: </font></TD>
                      <TD><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango1" ></TD>
                      <TD><font class="texto2">N&uacute;mero final del rango: </font></TD>
                            <TD><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango2"></TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">NRN:</font></TD><TD><input type="text" class="inputText" class="inputText" size="6" maxlength="6" name="NRN"></TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">Operador&nbsp;origen&nbsp;error: </font></TD>
                      <TD colspan="3"><select class="inputText" name="OperadorError">

                        <%
                        for (int i=0 ; i<numoperadores ; i++){
                            OperadorBean op = (OperadorBean) vops.elementAt(i);
                            if(!op.getCodigo().equals("00000")){
                    %>
                            <option value="<%=op.getCodigo()%>" ><%=op.getDescripcion()%>-<%=op.getCodigo()%></option>				<%
                            }
                        }
                    %>

                      </select></TD>
                    </tr>
                    </table>
                <BR>
                <div align="center"><center><table border="0">
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
</body>
</html>
