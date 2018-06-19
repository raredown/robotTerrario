<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script></head>
<SCRIPT LANGUAGE="JavaScript">
<!--
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
         f1.submit();
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaDenegacion";
       f.submit();
}

function TodoOk(){
   f = document.form1;  
     if (!FechaOk(f.FechaRef,true){
        return;
     }
     f.action="PrevioConsultaDenegaciones";
     f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.mensajes.MensajeDenegadoCollection,
                 es.portanode.mensajes.MensajeDenegadoBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1=new String("Reenvío por Erroneos");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String remitente = (String) request.getAttribute("OperadorConectado");
	String fechaRef = (String) request.getAttribute("Fecha");
	MensajeDenegadoCollection colMsgs = (MensajeDenegadoCollection) request.getAttribute("MensajesOrigen");
	Vector vmensaje = colMsgs.getMensajesDenegacion();
	int nummensaje = colMsgs.getNumMensajesDenegacion();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Mensajes de Denegacion de la ER</DIV>

                <FORM METHOD=POST ACTION="MensajesDenegacion.htm" name="theForm"><!-- ACTION="EnviarMsgREPM" -->
                <INPUT TYPE="hidden" name="IdInterno" value="">
                <INPUT TYPE="hidden" name="IdProceso" value="">
                <INPUT TYPE="hidden" name="IdSubProceso" value="">
                <INPUT TYPE="hidden" name="TipoMess" value="">
                <INPUT TYPE="hidden" name="Operador" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name=Posicion value="1">
                </FORM>
                <table border="0" width="100%">
                <FORM METHOD=POST name="form1">
                <table border=0>
                <tr>
                <td>Fecha Referencia</td><td><input type="text" class="inputText" class="inputText" NAME="FechaRef" value="<%=fechaRef%>"></td>
                </tr>
                </table>
                    <tr>
                        <td width="100%"><div align="center"><center><table
                         border="1" class="tablas"
                        >
                        <tr>
                <% if (nummensaje > 1){ %>
                    <INPUT TYPE="hidden" name=seleccion value="1">
                <%}else{ %>
                    <INPUT TYPE="hidden" name=seleccion value="0">
                <%}%>
                        <td>&nbsp;</td>
                        <td align="center" ><font class="texto2" size=2>Id Proceso</font></td>
                        <td align="center" ><font class="texto2" size=2>Id Proc. Referencia</font></td>
                        <td align="center" ><font class="texto2" size=2>Mensaje</font></td>
                        <td align="center" ><font class="texto2" size=2>Fecha Registro</font></td>
                        <td align="center" ><font class="texto2" size=2>Hora Registro</font></td>
                        <td align="center" ><font class="texto2" size=2>Error</font></td>
                </tr>
                <%
                    int fin;
                    if (nummensaje < inici+Limite) fin = nummensaje;
                    else fin = inici+Limite;
                    for (int i=inici; i<fin; i++)
                    {
                         int index = i-inici;
                         MensajeDenegadoBean msg = (MensajeDenegadoBean) vmensaje.elementAt(i);

                         String idProceso = msg.getIdProceso();
                         if ((idProceso.equals("null"))||(idProceso == null)){
                            idProceso = "&nbsp;";
                         }
                         String idSubProceso = msg.getIdSubProceso();
                         if ((idSubProceso.equals("null"))||(idSubProceso == null)){
                            idSubProceso = "&nbsp;";
                         }
                         String idInterno = msg.getIdInterno();
                         if ((idInterno.equals("null"))||(idInterno == null)){
                            idInterno = "&nbsp;";
                         }
                         String tipoMsg = msg.getTipoMensaje();
                         if ((tipoMsg.equals("null"))||(tipoMsg == null)){
                            tipoMsg = "&nbsp;";
                         }
                         String descripcionError = msg.getCodigoCausa();
                         if ((descripcionError.equals("null"))||(descripcionError == null)){
                            descripcionError = "&nbsp;";
                         }
                         String fecha = msg.getFechaRegistro();
                         if ((fecha.equals("null"))||(fecha == null)){
                            fecha = "&nbsp;";
                         }
                         String hora = msg.getHoraRegistro();
                         if ((hora.equals("null"))||(hora == null)){
                            hora = "&nbsp;";
                         }
                %>
                   <tr>
                     <td>
                     <p><input type="radio" name="radio" value="<%=idInterno%>+<%=idProceso%>+<%=idSubProceso%>+<%=tipoMsg%>" onClick="check=0"></p>
                                </td>
                                <td align="center"><font class="texto2" size=2><%=idProceso%></font></td>
                                <td align="center"><font class="texto2" size=2><%=idSubProceso%></font></td>
                                <td align="center"><font class="texto2" size=2><%=tipoMsg%></font></td>
                                <td align="center"><font class="texto2" size=2><%=fecha%></font></td>
                                <td align="center"><font class="texto2" size=2><%=hora%></font></td>
                                <td align="center"><font class="texto2" size=2><%=descripcionError%></font></td>
                            </tr>
                <%}%>
                            </FORM>
                        </table>
                        </center></div></td>
                    </tr>
                </table>
                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=nummensaje%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>
                <!--
                    Calling Navegador.jsp
                -->
                </center></div>
                <FORM METHOD=POST ACTION="MenuCreacionMensajes" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                </BODY>
                <div align="center"><center>
                <body >
                <table border="0">
                <% if (nummensaje == 0){ %>
                    <tr>
                      <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Ejecutar consulta';return true" onMouseOut="window.status=' '"><img src="images/Consul5.jpg" width="107" height="28"></A></td>
                        <td><A HREF="javascript:/*'*/void(alert('No hay ningún mensaje de Denegación'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" width="107" height="28"></A>
                <% }else{ %>
                    <tr>
                        <td><A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="Respue6.jpg" width="107" height="28"></A></td>
                <%}%>
                    <td><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="Back.jpg" width="107" border="0" height="28"></A></td>
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


