<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var check=99;
function asignar(num){
     f1 = document.theForm;
     f2 = document.form1;
   var mystr;
   var separator= "+";
     if (f2.seleccion.value == 1){
        mystr = f2.radio[num].value;
     }
     else{
         mystr = f2.radio.value;
     }
     arrayStr = mystr.split(separator);
    namehid =f1.elements[0].name;
    if (namehid.search("session") != -1){
	     for (i=0; i < arrayStr.length; i++)
	         f1.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < arrayStr.length; i++)
        	 f1.elements[i].value = arrayStr[i];
    }
}

function Carga(num){
      f1 = document.theForm;
      f2 = document.form1;
      f3 = document.formRangos;
      f1.Servlet.value=num;
      if (num == 1){
         f1.Estado.value=f3.Estado.value;
         f1.submit();
         return;
      }
      if (check == "99"){
            alert("Ha de escoger una fila");
            return;
      }
      else{
         asignar(check);
         if (num == 2){
            f1.submit();
         }
         if (num == 3){
            f1.submit();
         }
      }
}

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
  else{
     if ((Campo.name == "RangoInicio" || Campo.name == "RangoFinal")&& checkStr.length!=6){
        Campo.focus();
        alert("El campo "+Campo.name+" ha de tener 6 cifras");
        if (navigator.appName=="Netscape") Campo.select();
        return false;
     }
     return true;
     }
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
            Campo1.select();
            err = 1;
         }
      }
      if (err == 1){
         return false;
      }
      else
         return true;
}

function TodoOk(num){
       f = document.formRangos;
       if (!RangoOk(f.RangoInicio,f.RangoFinal))
          return;
       f.Accion.value = num;
       f.submit();
}

function Navegar(nPagina){

       f = document.theForm;
       f2 = document.formRangos;
       f.Posicion.value = nPagina;
       f.RangoInicio.value = f2.RangoInicio.value;
       f.RangoFinal.value = f2.RangoFinal.value;
       f.Estado.value = f2.Estado.value;
       f.action="PrevioMantenimientoNRN";
       f.submit();
}

function Consulta(){
   f = document.formRangos;
     if (!RangoOk(f.RangoInicio,f.RangoFinal))
        return;
     f.action='PrevioMantenimientoNRN';
     f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.BDR.NRNBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
      String subtitulo1 = new String("Mantenimiento de NRN");

      //Varibles del navegador

      int Limite=10;

      String posurl = ((Integer)request.getAttribute("Posicion")).toString();
      int posActual = (new Integer(posurl)).intValue();
      int inici = (posActual-1)*Limite;
      //-----------------------------

      String operadorActual = (String) request.getAttribute("OperadorConectado");
      String descOperador = (String) request.getAttribute("DescripcionOperador");
      String inicioNRN = (String) request.getAttribute("IniNRN");
      String finalNRN = (String) request.getAttribute("FinNRN");
      String estadoNRN = (String) request.getAttribute("Estado")==null?"0":(String) request.getAttribute("Estado");
      String opcionCerrado=estadoNRN.equals("0")?"selected":"";
      String opcionAbierto=estadoNRN.equals("1")?"selected":"";

      NRNBeanCollecion colnrn = (NRNBeanCollecion) request.getAttribute("NRNs");
      Vector vnrn = colnrn.getNRNs(inici,Limite);
      int numnrn = colnrn.getNumeroNRNs();
	
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Lista NRN</DIV>

                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM  ACTION="MantenimientoNRN" METHOD=POST NAME="theForm">
                      <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                      <INPUT TYPE="hidden" name="NRN">
                      <INPUT TYPE="hidden" name="Estado" value="">
                      <INPUT TYPE="hidden" name="Posicion" value="1">
                      <INPUT TYPE="hidden" name="Servlet">
                      <INPUT TYPE="hidden" name="Primera" value="1">
                      <INPUT TYPE="hidden" name="RangoInicio" value="<%=inicioNRN%>">
                      <INPUT TYPE="hidden" name="RangoFinal" value="<%=finalNRN%>">
                </FORM>
                <table border="0">
                <tr>
                <FORM METHOD=POST ACTION="MantenimientoRangoNRN" name="formRangos">
                <INPUT TYPE="hidden" name="Accion">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <td><font class="texto2">Inicio Rango</td>
                <td><%
                if (inicioNRN.equals("a")){
                %><input type="text" class="inputText" class="inputText" NAME="RangoInicio" size="6" maxlength="6"><%
                }
                else{
                 %>
                <input type="text" class="inputText" class="inputText" NAME="RangoInicio" size="6" maxlength="6" value="<%=inicioNRN%>"><%
                }%></td>
                <td><font class="texto2">Final Rango</td>
                <td><%
                if (finalNRN.equals("a")){
                %><input type="text" class="inputText" class="inputText" NAME="RangoFinal" size="6" maxlength="6"><%
                }else{
                %><input type="text" class="inputText" class="inputText" NAME="RangoFinal" size="6" maxlength="6" value="<%=finalNRN%>"><%
                }
                %></td>
                <td><font class="texto2">Estado</td>
                <td class="text"><select class="inputText"  NAME="Estado">
                            <OPTION value="0" <%=opcionCerrado%>>CERRADO
                            <OPTION value="1" <%=opcionAbierto%>>ABIERTO
                </SELECT></td>
                </td>
                <td><a href="javascript:Consulta()//'" onMouseOver="window.status='Consultar';return true;" onMouseOver="window.status=' '"><img src="images/Consul5.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                </FORM>
                </tr>
                </table>
                <br>
                <br>

                <table border="0" width="100%">
                  <tr>
                    <td align="center"><div align="center"><center><table  border="1" class="tablas" >
                     <FORM METHOD=POST NAME="form1">
                      <tr >
                        <th class="bgCabeceraFila">&nbsp;</th>
                        <th class="bgCabeceraFila">Operador Conectado</th>
                        <th class="bgCabeceraFila">&nbsp;NRN&nbsp;</th>
                        <th class="bgCabeceraFila">&nbsp;Estado&nbsp;</th>
                      </tr>
                <% 	if (numnrn >= 1){
                       if ((numnrn-inici) > 1)
                       {
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="1">
                <%	   }else{
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="0">
                <%	   }
                       String clase="";
                       for (int i=0; i<vnrn.size(); i++){
                        NRNBean item = (NRNBean) vnrn.elementAt(i);
                        String operador = item.getOperador();
                        String pref = item.getNrn();
                        String estado = item.getEstado();
                        String strestado="";
                        if (estado.equals("0")) strestado = "CERRADO";
                        else strestado = "ABIERTO";
                        if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";
                %>
                      <tr>
                        <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=operador%>+<%=pref%>+<%=estado%>" onClick="check=<%=i%>"></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=pref%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=strestado%></font></td>
                      </tr>
                <%	   }
                    }
                %>
                      </FORM>
                    </table>
                <!--
                    Calling Navegador.jsp
                -->



                <%System.out.println("Estamos en el jsp MantenenimientoNRN");%>


                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                        <jsp:param name="Total" value="<%=numnrn%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>



                    </center></div></td>
                  </tr>
                </table>
                <BR>
                </center></div><div align="center"><center>
                <table border="0">
                  <tr>
                    <td><a href="javascript:Carga(1)//'" onMouseOver="window.status='Alta';return true;" onMouseOver="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>

                <%
                    if (numnrn==0){
                %>
                   <td><A HREF="javascript:/*'*/void(alert('No hay ningun NRN a modificar'))"
                   onMouseOver="window.status='Modificación';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten2.jpg" border="0" width="107" height="28"></A></td>
                   <td><A HREF="javascript:/*'*/void(alert('No hay ningun NRN para dar de baja'))"
                   onMouseOver="window.status='Baja';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <%
                        }
                        else{
                %>
                <td><a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificación';return true;" onMouseOver="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                <td><a href="javascript:Carga(3)//'" onMouseOver="window.status='Baja';return true;" onMouseOver="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                <%
                        }
                %>
                </tr>
                </table>
                <P>

                <BR>
                <table border=0>
                <tr>
                <td align="center"><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                  </tr>
                </table>
                </center></div>
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
