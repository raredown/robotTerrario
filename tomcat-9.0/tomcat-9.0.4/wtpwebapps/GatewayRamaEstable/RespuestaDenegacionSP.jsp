
<%@page import="es.portanode.util.comunidades.ProvinciaBeanCollection"%>
<%@page import="es.portanode.util.operadores.OperadorBeanCollection"%>
<%@page import="java.text.SimpleDateFormat"%>
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
             f.ValueCausaDenegacion.value = f.CausaDenegacion.options[i].value;
               break;
          }
      }
}

function TodoOk(num){
     f = document.theForm;
     todoCorrecto = true;
     if (f.porta24Activo.value == "1"
			&& f.idProcesoSub.value == "15") {
    	 if (f.idUll.value == f.idUllFicticioConstante.value
  			&& f.adUll.value == f.numAdminUllFicticioConstante.value
			&& f.CausaDenegacion.value != "0010") {
 	 		 todoCorrecto = false;
 	 		 numMayorista = trim (f.NumAdminMayorista.value);
 	 		 if (numMayorista.length == 14) {
 	 			 todoCorrecto = true;
 	 		 } else {
 	 			 alert ("El número administración mayorista es obligatorio y ha de rellenarse completo");
 	 		 }
 	 	 }
     } else {
    	 if (f.traspasoActivo.value == "1"
 			&& f.idProcesoSub.value == "12"
 			&& f.idUll.value == f.idUllFicticioConstante.value
 			&& f.adUll.value == f.numAdminUllFicticioConstante.value
			&& f.CausaDenegacion.value != "0010") {
	 		 todoCorrecto = false;
	 		 numMayorista = trim (f.NumAdminMayorista.value);
	 		 if (numMayorista.length == 14) {
	 			 todoCorrecto = true;
	 		 } else {
	 			 alert ("El número administración mayorista es obligatorio y ha de rellenarse completo");
	 		 }
	 	 }
     }
	 elementoCombo(f.CausaDenegacion);
	 if (f.porta24Activo.value == "1"
			 && f.ValueCausaDenegacion.value == "0069"
			 && f.opeRevDon.value == "") {
		 alert("Con la causa de denegación seleccionada el mensaje debe incluir el campo 'Operador Revendedor Donante' informado");
		 todoCorrecto = false;
	 }
	 if (todoCorrecto == true) {
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
}

function trim(strText) {
    while('' + strText.charAt(0) == ' ') {
        strText = strText.substring(1, strText.length);
    }
    while('' + strText.charAt(strText.length-1)==' ') {
        strText = strText.substring(0, strText.length-1);
    }
    return strText;
}

function comprobarNumMayor() {
	f = document.theForm;
	var valor;
    for (i=0; f.CausaDenegacion.length; i++){
        if (f.CausaDenegacion.options[i].selected){
        	valor = f.CausaDenegacion.options[i].value;
             break;
        }
    }

    if (f.porta24Activo.value != "1") {
    	if (f.traspasoActivo.value == "1" &&
        		f.idProcesoSub.value == "12" &&
        		f.idUll.value == f.idUllFicticioConstante.value &&
        		f.adUll.value == f.numAdminUllFicticioConstante.value) {
    		if (valor == "0068") {
            	f.NumAdminMayorista.disabled = "";
            } else {
            	f.NumAdminMayorista.value = "";
            	f.NumAdminMayorista.disabled = "disabled";
            }
    	}
    }
}


//-->
</SCRIPT>
<body onload="comprobarNumMayor()" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="es.portanode.mensajes.MensajeSP,
                 es.portanode.util.PersonaContactoBean,
                 es.portanode.util.FechaInterna,
                 es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.util.html.SelectOptionBean,
                 es.portanode.util.Constantes"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
	String porta24Activo = (String) request.getAttribute("porta24Activo");
    String numFormulario = (String) request.getAttribute("numFormulario");
    String remitente = (String) request.getAttribute("Remitente");
    PersonaContactoBean pContacto = (PersonaContactoBean) request.getAttribute("PersonaContacto");
    MensajeSP mensaje = (MensajeSP)request.getAttribute("MensajeSP");
    String fechaInicial = (String) request.getAttribute("FechaInicial"+numFormulario);
    String horaInicial = (String)request.getAttribute("HoraInicial"+numFormulario);
    Vector vdescripciones = (Vector) request.getAttribute("SelectDescripciones");
    String traspasoActivo = (String) request.getAttribute("traspasoActivo");
  String idProceso = mensaje.getIdProceso();
  String mensajeNif = mensaje.getNIF();
  String mensajeNombre = mensaje.getNombre();
  String mensajeDireccion = mensaje.getDireccion();
  String mensajeLocalidad = mensaje.getLocalidad();
  /*String codigoProvincia = mensaje.getProvincia();
  ProvinciaBeanCollection pbc = new ProvinciaBeanCollection(null);
  String mensajeProvincia = pbc.obtenerNombre(codigoProvincia);*/
  String mensajeProvincia = mensaje.getProvincia();
  String mensajeFechaInterna = mensaje.getFechaCambio();
  String mensajeFecha = FechaInterna.ConvertToFechaExterna(mensajeFechaInterna);
  String hora1 = mensaje.getHoraCambio();
  String horaMensaje = "";
  if(hora1.length()>=6)
     horaMensaje = hora1.substring(0,2)+":"+hora1.substring(2,4)+":"+hora1.substring(4,6);
  /*NUEVA ESPECIFICACION */
  NRNBeanCollecion nrns = new NRNBeanCollecion(null,remitente, remitente);
  int numNrns = nrns.getNumeroNRNs();
  Vector vnrn = nrns.getNRNs(0,numNrns);
  /*****************/
  /* String codigoTipoPortabilidad = mensaje.getTipoPortabilidad();
  String mensajeTipoPortabilidad = "";
  if (codigoTipoPortabilidad.equals("01")) {
	  mensajeTipoPortabilidad = "Acceso individual";
  } else if (codigoTipoPortabilidad.equals("02") || codigoTipoPortabilidad.equals("03")) {
	  mensajeTipoPortabilidad = "Accesos m&uacute;ltiples";
  } else if (codigoTipoPortabilidad.equals("04")) {
	  mensajeTipoPortabilidad = "N&uacute;meros inteligentes";
  } */
  String mensajeTipoPortabilidad = mensaje.getTipoPortabilidad();
  String mensajeOpReceptor = mensaje.getOpReceptor();

  /*String codigoOpReceptor = mensaje.getOpReceptor();
  OperadorBeanCollection obc = new OperadorBeanCollection(null);
  String mensajeOpReceptor = codigoOpReceptor + " - " + obc.GetCDOperadoresDescripcion(codigoOpReceptor);*/
  String idInterno = mensaje.getIdInterno();
  Vector rangos = mensaje.getRangosNumeracion();
  String personaNombre = pContacto.getContacto();
  String personaEmail = pContacto.getEmailContacto();
  String personaFax = pContacto.getFaxContacto();
  String personaTel = pContacto.getTfnoContacto();
  String m_NRN = request.getParameter("NRN").toString();
	String m_NIR = request.getParameter("NIR").toString();
	String m_NFR = request.getParameter("NFR").toString();
        if (m_NRN!=null)
            m_NRN = m_NRN.substring(1,m_NRN.length()-1);
        if (m_NFR!=null)
            m_NFR = m_NFR.substring(1,m_NFR.length()-1);
        if (m_NIR!=null)
            m_NIR = m_NIR.substring(1,m_NIR.length()-1);

        Vector v_NRN = new Vector();
	StringTokenizer st_NRN = new StringTokenizer(m_NRN,",");
        while (st_NRN.hasMoreTokens()) {
            v_NRN.add(st_NRN.nextToken());
        }

        Vector v_NIR = new Vector();
	StringTokenizer st_NIR = new StringTokenizer(m_NIR,",");
        while (st_NIR.hasMoreTokens()) {
            v_NIR.add(st_NIR.nextToken());
        }

        Vector v_NFR = new Vector();
	StringTokenizer st_NFR = new StringTokenizer(m_NFR,",");
        while (st_NFR.hasMoreTokens()) {
            v_NFR.add(st_NFR.nextToken());
        }

  String flagNumCompleta = mensaje.getFlagNumCompleta();
  String flagUll = mensaje.getFlagULL();
  String idUll = mensaje.getIdSolicitudULL();
  String adUll = mensaje.getNumAdminULL();

  System.out.println("VEMOS ADMINISTRATIVO ????????" +traspasoActivo);
  System.out.println("VEMOS idUll ????????" +idUll);
  System.out.println("VEMOS adUll ????????" +adUll);
  String opeRevRec = mensaje.getOpeRevRec();
  String opeRevDon = mensaje.getOpeRevDon();
  String fechaSolUsu = mensaje.getFechaSolUsu();
	if (fechaSolUsu != null && !fechaSolUsu.equals("")) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		Date fecha = sdf.parse(fechaSolUsu);
		sdf = new SimpleDateFormat("dd/mm/yyyy");
		fechaSolUsu = sdf.format(fecha);
	}

  String filtro = request.getParameter("filtroULL");
  if(filtro==null) filtro = "TODOS";
  String subtitulo1 = new String("Denegaci&oacute;n de una solicitud de cambio");

  String nombreProceso = "";
  if (idProceso.substring(13,15).equals("15")) {
  	nombreProceso = "Básico - 15";
  } else {
  	nombreProceso = "Asegurado - 16";
  }
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
		<INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="IdInterno" value="<%=idInterno%>">
		<INPUT TYPE="hidden" name="DescCausaDenegacion">
		<INPUT TYPE="hidden" name="ValueCausaDenegacion">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
		<INPUT TYPE="hidden" name="idUll" value="<%=idUll%>">
		<INPUT TYPE="hidden" name="adUll" value="<%=adUll%>">
		<INPUT TYPE="hidden" name="flagUll" value="<%=flagUll%>">
		<INPUT TYPE="hidden" name="porta24Activo" value="<%=porta24Activo%>">
		<INPUT TYPE="hidden" name="idProcesoSub" value="<%=idProceso.substring(13,15)%>">
		<INPUT TYPE="hidden" name="traspasoActivo" value="<%=traspasoActivo%>">
		<INPUT TYPE="hidden" name="idUllFicticioConstante" value="<%=Constantes.ID_ULL_FICTICIO%>">
		<INPUT TYPE="hidden" name="numAdminUllFicticioConstante" value="<%=Constantes.NUM_ADMIN_ULL_FICTICIO%>">
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
                    <%
                    if ( adUll== null ) {
                    %>
                     <TD class="texto"> </TD>
                     <%
                   } else {
                    %>
                    <TD class="texto"><%=adUll%></TD>
                    <%
                    }
                    %>
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
		        <%if (porta24Activo.equals("1")) { %>
	            <tr>
			        <td colspan="2"><font class="texto2">Operador Revendedor Receptor:</font></td>
			        <td colspan="5"><font class="texto"><%=opeRevRec%></font><INPUT TYPE="hidden" name="opeRevRec" value="<%=opeRevRec%>"></td>
			    </tr>
			    <tr>
			        <td colspan="2"><font class="texto2">Operador Revendedor Donante:</font></td>
			        <td colspan="5"><font class="texto"><%=opeRevDon%></font><INPUT TYPE="hidden" name="opeRevDon" value="<%=opeRevDon%>"></td>
			    </tr>
			    <tr>
			        <td><font class="texto2">Fecha Solicitud Usuario:</font></td>
			        <td colspan="2"><font class="texto"><%=fechaSolUsu%></font><INPUT TYPE="hidden" name="fechaSolUsu" value="<%=fechaSolUsu%>"></td>
			    </tr>
			    <tr>
			        <td><font class="texto2">Tipo de Proceso:</font></td>
			        <td colspan="2"><font class="texto"><%=nombreProceso%></font><INPUT TYPE="hidden" name="tipoProcesoRead" value="<%=nombreProceso%>"></td>
		    	</tr>
		    	<%}%>
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
            for (int i=0; i< v_NRN.size(); i++)
            {   if((i%2)==0)
                clase="";
            else
                clase="bgFila";
		            %>
		            <tr>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=v_NIR.elementAt(i).toString()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=v_NFR.elementAt(i).toString()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19" colspan="4"><font class="texto"><%=v_NRN.elementAt(i).toString()%></font></td>
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
             <td><font class="texto2">Causas denegación </font></td>
             <!-- <td colspan="1"><select class="inputText" name="CausaDenegacion"> -->
             <td colspan="1"><select class="inputText" id="comboCausaDeneg" name="CausaDenegacion" onchange="comprobarNumMayor()">
            <%
                int tam = vdescripciones.size();
                for (int i=0 ; i<tam ; i++){
                    SelectOptionBean des= (SelectOptionBean) vdescripciones.elementAt(i);
            %>
                    <option <%=des.seleccionado%> value="<%=des.valor%>" ><%=des.nombre%></option>			<%
                }
            %>
              </select></td>
          </tr>
          <tr>
          <td><font class="texto2">Observaciones</font></td><td>
          <input type="text" class="inputText" class="inputText" size="60" maxlength="70" name="Observaciones">
          </td>
          </tr>
          <%if (traspasoActivo.equals("1")
        		 && idProceso.substring(13,15).equals("12")
        		 && adUll != null && idUll != null
        		 && adUll.equals(Constantes.NUM_ADMIN_ULL_FICTICIO) && idUll.equals(Constantes.ID_ULL_FICTICIO)) { %>
          <tr>
          <td><font class="texto2">Num. Admin. Mayorista</font></td><td>
          <input type="text" class="inputText" class="inputText" size="60" maxlength="14" name="NumAdminMayorista">
          </td>
          </tr>
          <%} else if (porta24Activo.equals("1")){%>
                    <tr>
		          <td><font class="texto2">Num. Admin. Mayorista</font></td><td>
		          <input type="text" class="inputText" class="inputText" size="60" maxlength="14" name="NumAdminMayorista">
		          </td>
		          </tr>
          <%} %>
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
    celda3.innerHTML = "<input type='text' size='8'  name='NRN' value='<%= (String)v_NRN.elementAt(0)%>' disabled>";

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

	if (rangos > <%=v_NRN.size()%>)
	{
	if(rangos>numfilas){

		for(var i=0;i<rangos-numfilas-<%=v_NRN.size()%>;i++){
			sumaRelacion();
		}

	}else {
		restarFilas(rangos-<%=v_NRN.size()%>);
	}
	}
	else
	{
            restarFilas(0);
	}
}



        </script>
</html>