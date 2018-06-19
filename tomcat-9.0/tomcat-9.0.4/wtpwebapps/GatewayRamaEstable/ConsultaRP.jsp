<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
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
      return false;
    }
    else return true;
  }
  var checkOK = "0123456789";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  // All characters  of the input string are digits
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
    return false;
  }
  else
     return true;
}
function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
      if (!NumberOk(Campo1,false)){
         err = 1;}else{
      if (!NumberOk(Campo2,false)){
         err = 1; }else{
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
	  }
	  }
      if (err == 1){
         return false;
      }
      else
         return true;
}
var check = 99;

function asignar(num){
     f1 = document.theForm;
     f2 = document.form1;
   var mystr;
   var namehid;
   var separator= "+";
   if (f2.seleccion.value == "1"){
      mystr = f2.radio[num].value;
   }
   else{
     mystr = f2.radio.value;
   }

   arrayStr = mystr.split(separator);
   namehid =f1.elements[0].name;

    if (namehid.search("session") != -1){
	     for (i=0; i < (arrayStr.length); i++)
	         f1.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < (arrayStr.length); i++)
        	 f1.elements[i].value = arrayStr[i];
    }
}

function Carga(){
      f1 = document.theForm;
      f2 = document.form1;
         if (check=="99"){

            alert("Ha de escoger una fila");
            return;
         }
	 asignar(check);
	 f1.action = "PrevioEnviarMsgRP";
         f1.submit();
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaRP";
       f.submit();
}

function TodoOk(){
    var err = 0;
       f = document.theForm;
   	   if (!RangoOk(f.RangoIni,f.RangoFin)) return;
       if (!FechaOk(f.FechaReferencia,false)) return;
       f.Posicion.value = 1;
       f.action="PrevioConsultaRP";
       f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.MensajesOrigenRP,
                 es.portanode.mensajes.MensajeOrigenRP"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
  
  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("RP");
	
    String subtitulo1=new String("Rechazo tras confirmaci&oacute;n previa");

	//Varibles del navegador
	int Limite=10;
	String posurl = (new Integer(request.getParameter("Posicion"))).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String remitente = (String) request.getParameter("OperadorConectado");
	String fechaReferencia = (String) request.getAttribute("FechaReferencia");
	String rangoInicial = (String) request.getAttribute("RangoIni");
	String rangoFinal = (String) request.getAttribute("RangoFin");
	String procesoSel = (String) request.getAttribute("ProcesoSelect");
	
	MensajesOrigenRP mensajes = (MensajesOrigenRP) request.getAttribute("MensajesOrigen");
	Vector vmensaje = mensajes.getMensajesOrigenRP();
	int nummensaje = mensajes.getNumMensajesOrigenRP();

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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta <%=tipoMDescripcion %></DIV>

                

                <table border="0">
                <FORM METHOD=POST ACTION="javascript:void(null)" name="theForm">
                <INPUT TYPE="hidden" name="Operador" value=0>
                <INPUT TYPE="hidden" name="NumProceso" value="">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name=Posicion value="<%=posurl%>">
                <INPUT TYPE="hidden" name="Primera" value="1">
                  <tr>
                    <td><font class="texto2">Fecha Referencia: </font></td>
                    <td><input type="text" class="inputText" class="inputText" ReadOnly NAME="FechaReferencia" size="10" maxlength="10" value="<%=fechaReferencia%>">
                        <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                    </td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Rango Inicial: </font></td>
                    <td><input type="text" class="inputText" class="inputText" NAME="RangoIni" size="15" maxlength="15" value="<%=rangoInicial%>"></td>
                    <td>&nbsp;</td>
                    <td><font class="texto2">Rango Final: </font></td>
                    <td><input type="text" class="inputText" class="inputText" NAME="RangoFin" size="15" maxlength="15" value="<%=rangoFinal%>"></td>
                  </tr>
                  <tr>
                    <td><font class="texto2">Proceso </FONT></td>
                    <td class="text"><select class="inputText"  name="ProcesoSelect">
                      <% if (procesoSel.equals("*") || procesoSel.equals("")) { %>
                          <OPTION selected value="*">TODOS</OPTION>
                      <% } else { %>
                          <OPTION value="*">TODOS</OPTION>

                      <% }if (procesoSel.equals("01")) { %>
                          <OPTION selected value="01">Proceso de Cambio</OPTION>
                      <% } else { %>
                          <OPTION value="01">Proceso de Cambio</OPTION>

                      <% }if (procesoSel.equals("03")) { %>
                          <OPTION selected value="03">Proceso de Baja</OPTION>
                      <% } else { %>
                          <OPTION value="03">Proceso de Baja</OPTION>

                      <% }if (procesoSel.equals("04")) { %>
                          <OPTION selected value="04">Proceso de Modificaci&oacute;n</OPTION>

                      <% } else { %>
                          <OPTION value="04">Proceso de Modificaci&oacute;n</OPTION>
                      <% } %>

                      </SELECT></td>
                    </tr>

                </table>

                </FORM>
                <table border="0" width="100%">
                <FORM METHOD=POST name="form1">

                    <tr>
                        <td width="100%"><div align="center"><center><table
                         border="1" class="tablas">
                           <tr>

                <%	if ((nummensaje-inici) > 1){
                %>
                    <INPUT TYPE="hidden" name=seleccion value="1">
                <%	}else{
                %>
                    <INPUT TYPE="hidden" name=seleccion value="0">
                <%	}
                %>
                    <td class="bgCabeceraFila">&nbsp;</td>
                        <td align="center" class="bgCabeceraFila">Operador destino</td>
                        <td align="center" class="bgCabeceraFila">Tipo Mensaje</td>
                        <td align="center" class="bgCabeceraFila">N&uacute;m. proceso</td>
                        <td align="center" class="bgCabeceraFila">Fecha inicio ventana</td>
                        <td align="center" class="bgCabeceraFila">Hora inicio ventana</td>
                        <td align="center" class="bgCabeceraFila">N&uacute;mero inicial</td>
                        <td align="center" class="bgCabeceraFila">N&uacute;mero final</font></td>
                     </tr>
                <%
                    int fin;
                    String clase="";
                    if (nummensaje < inici+Limite) fin = nummensaje;
                    else fin = inici+Limite;
                    for (int i=inici; i<fin; i++)
                    {
                         int index = i-inici;
                         MensajeOrigenRP mensajeO = (MensajeOrigenRP) vmensaje.elementAt(i);

                         String CodigoOperador = mensajeO.getCodigoOperador();
                        String descripcionOperador = mensajeO.getDescOperador();
                        if (descripcionOperador.length()>50)
                        {
                            descripcionOperador = descripcionOperador.substring(0,50);
                        }
                         String TipoMensaje = mensajeO.getTipoMensaje();
                         String IdProceso = mensajeO.getIdProceso();
                         String FechaInicio = mensajeO.getFechaInicio();
                         FechaInicio = FechaInicio.substring(6,8)+"/"+FechaInicio.substring(4,6)+"/"+FechaInicio.substring(0,4);
                         String HoraInicio = mensajeO.getHoraInicio();		
                         String NumInicialRango = mensajeO.getNumInicialRango();
                         String NumFinalRango = mensajeO.getNumFinalRango();
                         if((i%2)==0)
                            clase="";
                         else
                            clase="bgFila";
                %>
                            <tr>
                               <td class="<%=clase%>"><p><input type="radio" name="radio"
                        value="<%=CodigoOperador%>+<%=IdProceso%>+<%=remitente%>" onClick="check=<%=index%>"></p>
                        <!-- Operador+Idproceso -->
                                </td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=descripcionOperador%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=TipoMensaje%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=IdProceso%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=FechaInicio%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=HoraInicio%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=NumInicialRango%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=NumFinalRango%></font></td>
                            </tr>
                <%
                    }
                %>

                            </FORM>
                        </table>
                        </center></div></td>
                    </tr>
                </table>

                <!--
                    Calling Navegador.jsp
                -->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=nummensaje%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>
                <div align="center"><center>
                    <br><br><br>
                    <table border="0" cellpadding='0' cellspacing='0' width="100%">
                      <tr>
                      <td align="center"><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Ejecutar consulta';return true" onMouseOut="window.status=' '"><img
                        src="images/Consul5.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                    <%
                        if (nummensaje==0){
                    %>
                            <A HREF="javascript:/*'*/void(alert('No hay ningún mensaje a rechazar'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                    <%
                        }
                        else{
                    %>
                            <A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                    <%
                        }
                    %>

                          <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
                     </tr>
                    </table>
                    </center>
                  </div>
                <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
    <script language="JavaScript">
           setPath('<%= request.getContextPath() %>');
           var calendario1 = new calendar1(document.theForm.FechaReferencia);
    </script>
    <%--Nueva imagen--%>
    <jsp:include page="pie.jsp" flush="true"/>
  </body>
</html>
