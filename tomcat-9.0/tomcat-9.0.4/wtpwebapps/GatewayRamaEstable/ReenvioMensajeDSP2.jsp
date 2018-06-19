<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<SCRIPT LANGUAGE="JavaScript">
<!--

function elementoCombo(Campo){
      f = document.theForm;
      for (i=0; Campo.length; i++){
          if (Campo.options[i].selected){
             f.DescCausaDenegacion.value = f.CausaDenegacion.options[i].text;
               break;
          }
      }
}

function TodoOk(num){
     f = document.theForm;
     elementoCombo(f.CausaDenegacion);
     if (num == 1){
        if (!FechaOk(f.FechaInicial,true))
           return;
        if (!HoraOk(f.HoraInicial,true))
           return;
     }
     if (num == 2){
        document.theForm.action='DenegarMsgSP';
     }
     f.submit();
}


//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="es.portanode.mensajes.MensajeSP,
				 es.portanode.mensajes.MensajeSPNumeracion,
				 es.portanode.mensajes.MensajeDSP2,
                 es.portanode.util.PersonaContactoBean,
                 es.portanode.util.FechaInterna,
                 es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.util.html.SelectOptionBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
    String numFormulario = (String) request.getAttribute("numFormulario");
    String remitente = (String) request.getAttribute("Remitente");
    PersonaContactoBean pContacto = (PersonaContactoBean) request.getAttribute("PersonaContacto");
    MensajeSP mensaje = (MensajeSP)request.getAttribute("MensajeSP");
    MensajeDSP2 mensajeDSP2 = (MensajeDSP2)request.getAttribute("mensajeDSP2");
    String fechaInicial = (String) request.getAttribute("FechaInicial"+numFormulario);
    String horaInicial = (String)request.getAttribute("HoraInicial"+numFormulario);
    Vector vdescripciones = (Vector) request.getAttribute("SelectDescripciones");
  String idProceso = mensaje.getIdProceso();
  String mensajeNif = mensaje.getNIF();
  String mensajeNombre = mensaje.getNombre();
  String mensajeDireccion = mensaje.getDireccion();
  String mensajeLocalidad = mensaje.getLocalidad();
  String mensajeProvincia = mensaje.getProvincia();
  String mensajeFechaInterna = mensaje.getFechaCambio();
  String mensajeFecha = FechaInterna.ConvertToFechaExterna(mensajeFechaInterna);
  String hora1 = mensaje.getHoraCambio();
  String horaMensaje = "";
  if(hora1.length()>=6)
     horaMensaje = hora1.substring(0,2)+":"+hora1.substring(2,4)+":"+hora1.substring(4,6);
  String mensajeTipoPortabilidad = mensaje.getTipoPortabilidad();
  String mensajeOpReceptor = mensaje.getOpReceptor();
  String idInterno = mensaje.getIdInterno();
  Vector rangos = mensaje.getRangosNumeracion();
  String personaNombre = pContacto.getContacto();
  String personaEmail = pContacto.getEmailContacto();
  String personaFax = pContacto.getFaxContacto();
  String personaTel = pContacto.getTfnoContacto();
  String flagNumCompleta = mensaje.getFlagNumCompleta();
  String flagUll = mensaje.getFlagULL();
  String idUll = mensaje.getIdSolicitudULL();
  String adUll = mensaje.getNumAdminULL();

  String filtro = request.getParameter("filtroULL");
  if(filtro==null) filtro = "TODOS";
  String subtitulo1 = new String("Denegaci&oacute;n de una solicitud de cambio");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos denegación de una solicitud de cambio</DIV>



		<div align="center"><center>
		<FORM METHOD=POST ACTION="PrevioConsultaSP" name="fback">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
		<INPUT TYPE="hidden" name="Posicion" value="1">
        <INPUT TYPE="hidden" name="opcionMenu" value="2">
		</FORM>
		<FORM METHOD=POST ACTION="ResponderMsgSP" name="theForm">
		<input type="hidden" name="idInternoMensajeErroneo" value="<c:out value="${idInternoMensajeErroneo }"/>">
		<INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="IdInterno" value="<%=idInterno%>">
		<INPUT TYPE="hidden" name="DescCausaDenegacion">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
		<table border="0" width="90%">
        <tr>
		        <td align="left" class="texto2">&gt; <font class="texto6"> Identificador de Proceso</font>&nbsp;&nbsp;&nbsp;&nbsp;<%=idProceso%>
		     
		    	</td>
		    </tr></table>
		<table border="0">
		
				    
            <tr>
		        <td colspan="8" align="left" class="texto2"><br> > <font class="texto6"> Datos abonado</font></td>
		    </tr>
		    <tr>
		        <td><font class="texto2">NIF/CIF:</font></td>
		        <td><font class="texto"><%=mensajeNif%></font><INPUT TYPE="hidden" name="NIF" value="<%=mensajeNif%>"></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">Nombre:</font></td>
		        <td><font class="texto"><%=mensajeNombre%></font><INPUT TYPE="hidden" name="Nombre" value="<%=mensajeNombre%>"></td>
		        <td colspan="3">&nbsp;</td>
		    </tr>
		    <TR>
		      <TD><font class="texto2">Dirección:</font></TD>
		      <TD><font class="texto"><%=mensajeDireccion%></font><INPUT TYPE="hidden" name="Direccion" value="<%=mensajeDireccion%>"></TD>
		      <TD></TD>
		      <TD><font class="texto2">Localidad:</font></TD>
		      <TD><font class="texto"><%=mensajeLocalidad%></font><INPUT TYPE="hidden" name="Localidad" value="<%=mensajeLocalidad%>"></TD>
		      <TD></TD>
		      <TD><font class="texto2">Provincia:</font></TD>
		      <TD><font class="texto"><%=mensajeProvincia%></font><INPUT TYPE="hidden" name="Provincia" value="Castellón"></TD>
		    </TR>
		    <tr>
		        <td colspan="8" align="left" class="texto2"><br> > <font class="texto6"> Datos solicitud</font></td>
		    </tr>
		    <tr>
                <td><font class="texto2">Fecha ventana preferida:</font></td>
		        <td><font class="texto"><%=mensajeFecha%></font><INPUT TYPE="hidden" name="FechaPreferida" value="<%=mensajeFecha%>"></td>
		        <td><font class="texto2">&nbsp;&nbsp;Tipo de portabilidad:</font></td>
		        <td><font class="texto"><%=mensajeTipoPortabilidad%></font><INPUT TYPE="hidden" name="TipoPorta" value="<%=mensajeTipoPortabilidad%>"></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">Operador receptor:</font></td>
		        <td><font class="texto"><%=mensajeOpReceptor%></font><INPUT TYPE="hidden" name="Receptor" value="<%=mensajeOpReceptor%>"></td>
		        <td>&nbsp;</td>
		    </tr>
		    <tr>
		    <TD colspan="8"><font class="texto2">Portar numeración asociada a número de cabecera:</font>
		    &nbsp;
		<%
		    if (flagNumCompleta.equals("1"))
		        {
		%>

				<input type="checkbox" name="flag_num_completa" value="<%=flagNumCompleta%>" disabled checked>

		<%
		    }
		    else
		        {
		%>
				<input type="checkbox" name="flag_num_completa" value="<%=flagNumCompleta%>" disabled>

		<%
		    }
		%>
			</TD>
		    <TD>&nbsp;</TD>
		    <TD>&nbsp;</TD>
		    <TD>&nbsp;</TD>
		    </tr>
            <tr>
              <td colspan="8">
                <%
                    if ((flagUll!= null) && (flagUll.equals("1")))
                    {
                %>
                <br>
                <TABLE border="0">
                  <TR>
                    <td class="texto2" rowspan="2">
                        Flag de solicitud ULL:
                        &nbsp;<input type="checkbox" name="flag_num_completa"  checked value="<=%flagULL%>" disabled>&nbsp;&nbsp;	</td>
                    <TD class="texto2">Nº Orden Administrativo ULL:</TD>
                    <TD class="texto"><%=adUll%></TD>
                </TR>
                <tr>
                    <TD class="texto2">Identificador del proceso ULL:</TD>
                    <TD class="texto"><%=idUll%></TD>
                </tr>
                </TABLE>
                <%
                    }else{}
                %>
              </td>
            </tr>
            <tr>
		        <td colspan="8" align="left"> <font class="texto5"> <br>> </font> <font class="texto6"> Datos persona contacto</font></td>
		    </tr>
            <tr>
		        <td><font class="texto2">Persona contacto:</font></td>
		        <td><font class="texto"><%=personaNombre%></font><INPUT TYPE="hidden" name="PersonaContacto" value="<%=personaNombre%>"></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">E-mail:</font></td>
		        <td colspan="4"><font class="texto"><%=personaEmail%></font><INPUT TYPE="hidden" name="Email" value="<%=personaEmail%>"></td>
		    </tr>
		    <tr>
		        <td><font class="texto2">Teléfono:</font></td>
		        <td><font class="texto"><%=personaTel%></font></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">Fax:</font></td>
		        <td colspan="4"><font class="texto"><%=personaFax%></font></td>
		    </tr>
            <tr>
		        <td colspan="8" align="left" class="texto5"> <br>> <font class="texto6"> Rangos numeración</font><br><br></td>
		    </tr>
            <TR>
		    <TD align="center" class="bgCabeceraFila">Núm. inicial rango</TD>
		    <TD align="center" class="bgCabeceraFila">&nbsp;</TD>
		    <TD align="center" class="bgCabeceraFila">Núm. final rango</TD>
		    <TD align="center" class="bgCabeceraFila">&nbsp;</TD>
		    <TD align="center" colspan="4" class="bgCabeceraFila">NRN</TD>
		  </TR>
		<%
            String clase="";
            for (int i=0; i< rangos.size(); i++)
            {   if((i%2)==0)
                clase="";
            else
                clase="bgFila";
		            %>
		            <tr>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=((MensajeSPNumeracion)rangos.elementAt(i)).getNumInicialRango()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=((MensajeSPNumeracion)rangos.elementAt(i)).getNumFinalRango()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19" colspan="4"><font class="texto"><%=((MensajeSPNumeracion)rangos.elementAt(i)).getNRN()%></font></td>
		            </tr>
		            <%
		        }
		%>

		</table>
		</center></div>
        <br>
		<font size=2><strong>Datos mensaje a enviar para denegar<BR></strong></font>
        <div align="center"><center>
        <table border="0">
          <tr>
             <td><font class="texto2">Causas denegacion </font></td>
             <td colspan="1"><select class="inputText" name="CausaDenegacion">
              <%
                int tam = vdescripciones.size();
                for (int i=0 ; i<tam ; i++){
                    SelectOptionBean des= (SelectOptionBean) vdescripciones.elementAt(i);
            %>
                    <option <%=des.seleccionado%> value="<%=des.valor%>" <%if (mensajeDSP2.getCodCausaDenegacion().equals(des.valor)){ %>selected<%} %>><%=des.nombre%></option>			<%
                }
            %>
              </select></td>
          </tr>
          <tr>
          <td><font class="texto2">Observaciones</font></td><td>
          <input type="text" class="inputText" class="inputText" size="60" maxlength="70" name="Observaciones" value="<c:out value="${mensajeDSP2.observaciones }"/>">
          </td>
          </tr>
        </table>
         </center></div>
		 </FORM>
		<div align="center"><center>
		<table border="0">
		    <tr>
		        <td><A HREF="javascript:TodoOk(2)//'" onMouseOver="window.status='Denegar';return true" onMouseOut="window.status=' '"><img src="images/denegar.jpg" border="0" WIDTH="107" HEIGHT="28"/></A></td>
     		    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" width="107" border="0" height="28"/></A></td>
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
<script>
var numfilasRelacion=0;
var form=document.theForm;

function  sumaRelacion()	{

		var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");

		var fila = document.createElement("tr");
		var celda1 = document.createElement("td");
		var celda2 = document.createElement("td");
		var celda3 = document.createElement("td");


    numfilasRelacion=miTablaRelacion.getElementsByTagName("tr").length + 1 ;

   celda1.innerHTML = "<input name='NumInicialRango' type='text' id='inicioRango' size='15'  maxlength='15' >";
    celda2.innerHTML = "<input name='NumFinalRango' type='text' id='finalRango' size='15'  maxlength='15' >";
    celda3.innerHTML = "<input type='text' size='8'  name='NRN' value='<%= ((MensajeSPNumeracion)rangos.elementAt(0)).getNRN()%>' disabled>";

		fila.appendChild(celda1);
		fila.appendChild(celda2);
		fila.appendChild(celda3);

		miTablaRelacion.appendChild(fila);

}

function restarFilas(rangos) {
	var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");
	var i = numfilasRelacion-1;
	do{
	    miTablaRelacion.deleteRow(i);
	    numfilasRelacion--;
	    i--;
	  }
	while (miTablaRelacion.rows.length != rangos)
}

function sumarFilas(){
	var numfilas=numfilasRelacion;
	var rangos=	form.num_rangos.options[form.num_rangos.options.selectedIndex].value;

	if (rangos > <%=rangos.size()%>)
	{
	if(rangos>numfilas){

		for(var i=0;i<rangos-numfilas-<%=rangos.size()%>;i++){
			sumaRelacion();
		}

	}else {
		restarFilas(rangos-<%=rangos.size()%>);
	}
	}
	else
	{
            restarFilas(0);
	}
}



        </script>
</html>