<html>
<head>
<title>Operador</title>

<script  language="JavaScript" type="text/javascript">
function Detalle(id, numProceso, fechaLanzamiento){
	var p24 = document.getElementById("p24");
	var convivencia24 = document.getElementById("convivencia24");

	var anio = fechaLanzamiento.substring(6,10);
	var mes = fechaLanzamiento.substring(3,5);
	var dia = fechaLanzamiento.substring(0,2);
	var hora = fechaLanzamiento.substring(10,20);
	var fecLanzamiento = anio + "/" + mes + "/" + dia + hora;
	var dateFechaLanzamiento = new Date(fecLanzamiento);

	var fechaConvivencia24H = document.getElementById("fechaConvivencia");
	anio = fechaConvivencia24H.value.substring(0,4);
	mes = fechaConvivencia24H.value.substring(4,6);
	dia = fechaConvivencia24H.value.substring(6,8);
	fechaConvivencia24H = anio + "/" + mes + "/" + dia + " 00:00:00";
	var dateFechaConvivencia24H = new Date(fechaConvivencia24H);

	if(p24.value == "1" && (numProceso == "01" || numProceso == "12")){
		alert("Tipo solicitud cargada en base a especificaciones distintas a portabilidad 24h");
	}else if(p24.value == "0" && convivencia24.value == "1"  && dateFechaLanzamiento <= dateFechaConvivencia24H && (numProceso == "15" || numProceso == "16")){
		alert("Tipo solicitud cargada en base a especificaciones de portabilidad 24h");
	}else if(p24.value == "0" && convivencia24.value == "1" && (numProceso == "01" || numProceso == "12")){
		alert("Tipo solicitud cargada en base a especificaciones distintas a portabilidad 24h");
	}else{
		f = document.theForm;
		f.id_seleccionado.value = id;
		f.action = "DetalleSP";
		f.submit();
	}
	return;
}

function Eliminar(id){
	f = document.theForm;
	f.id_seleccionado.value = id;
	f.action = "EliminarSolicitud";
	f.submit();
}

function TodoOk(){
    f = document.theForm;
	var i = 0;
	var ok = false;

	for (i=0;i<f.elements.length;i++){
         if (f.elements[i].type=="radio" && f.elements[i].checked==true){
        	var p24 = document.getElementById("p24");
        	var convivencia24 = document.getElementById("convivencia24");
        	var numProcesoFechaLanzamiento = document.getElementById(f.elements[i].value);
        	var numProceso = numProcesoFechaLanzamiento.value.substring(0,2);
        	var fechaLanzamiento = numProcesoFechaLanzamiento.value.substring(2,21);

	       	var anio = fechaLanzamiento.substring(6,10);
       		var mes = fechaLanzamiento.substring(3,5);
       		var dia = fechaLanzamiento.substring(0,2);
       		var hora = fechaLanzamiento.substring(10,20);
       		var fecLanzamiento = anio + "/" + mes + "/" + dia + hora;
       		var dateFechaLanzamiento = new Date(fecLanzamiento);

       		var fechaConvivencia24H = document.getElementById("fechaConvivencia");
       		anio = fechaConvivencia24H.value.substring(0,4);
       		mes = fechaConvivencia24H.value.substring(4,6);
       		dia = fechaConvivencia24H.value.substring(6,8);
       		fechaConvivencia24H = anio + "/" + mes + "/" + dia + " 00:00:00";
       		var dateFechaConvivencia24H = new Date(fechaConvivencia24H);

        	if(p24.value == "1" && (numProceso == "01" || numProceso == "12")){
        		alert("Tipo solicitud cargada en base a especificaciones distintas a portabilidad 24h");
        		return;
        	}else if(p24.value == "0" && convivencia24.value == "1"  && dateFechaLanzamiento <= dateFechaConvivencia24H && (numProceso == "15" || numProceso == "16")){
        		alert("Tipo solicitud cargada en base a especificaciones de portabilidad 24h");
        		return;
        	}else if(p24.value == "0" && convivencia24.value == "1" && (numProceso == "01" || numProceso == "12")){
        		alert("Tipo solicitud cargada en base a especificaciones distintas a portabilidad 24h");
        		return;
        	}else{
				f.id_seleccionado.value = f.elements[i].value;
			 	ok=true;
			 	if (p24.value == "1") {
				 	f.action = "EnviarMsgSP24";
			 	}
				f.submit();
        	 }
		}
	}
	if(ok==false){
		alert("Debe seleccionar una solicitud para enviar.");
	}

}

function Abrir_ventanaAnt(NRN,NIR,NFR){
	var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
	window.open("PopUpJSP?NRN="+NRN+"&NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

function Abrir_ventana(indice,NRN,NIR,NFR){

    var elementoNRN = document.getElementById("NRNCadena"+indice);
    var nrns = elementoNRN.value;
    var nrns2 = "";
    var longi = nrns.length - 1;
    for (k = 1 ; k < longi; k++ )
    {
        nrns2 = nrns2 + nrns.charAt(k);
    }


	var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
	window.open("PopUpJSP?NRN="+nrns2+"&NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

</script>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="es.portanode.solicitudes.*"%>
<%@ page import="es.portanode.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="es.portanode.util.excepciones.PnodeException"%>


<%
	String anterior = (String) request.getAttribute("Anterior");
	String remitente = (String) request.getAttribute("OperadorConectado");

	String p24 = "";
  	if (ParametroBeanCollection.isPorta24Activo()){
		p24 = "1";
  	} else {
		p24 = "0";
  	}

  	String convivencia24 = "";
  	if (ParametroBeanCollection.isInhabilitaSolPortaActivo()){
  		convivencia24 = "1";
  	} else {
  		convivencia24 = "0";
  	}

  	 String[] convivencia24H = ParametroBeanCollection.getValor(Constantes.CLAVE_CONVIVENCIA_24H).split("/");
     String fechaConvivencia24H = convivencia24H[0];
%>
  <!-- Insercion de Cabecera -->
  <%
  	String subtitulo1 = new String("Solicitudes cargadas");
  	String mensaje = new String("SP");
  	String subtitulo2 = new String("Detalle solicitudes pendientes");
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
        	<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Solicitudes cargadas</DIV>


			<FORM METHOD=POST ACTION="<%=anterior%>" name="fback">
				<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
				<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
				<INPUT TYPE="hidden" name="jsp" value="EnvioMensajeSP">
				<INPUT TYPE="hidden" name="p24" id="p24" value="<%=p24%>">
				<INPUT TYPE="hidden" name="convivencia24" id="convivencia24" value="<%=convivencia24%>">
				<INPUT TYPE="hidden" name="fechaConvivencia" id="fechaConvivencia" value="<%=fechaConvivencia24H%>">
			</FORM>


<%

	String info = (String) request.getAttribute("infoDelete");

	if (info == null) {
		info = "";
	}

	Vector<SolicitudPendienteBean> pendientes = (Vector<SolicitudPendienteBean>) request.getAttribute("Pendientes");

	if (pendientes == null || pendientes.size() == 0) {
		info = "No hay ninguna solicitud pendiente";

%>
			<CENTER>
				<font class="texto2" size=4><%=info%></font><br><br>
				<TABLE align="center">
					<TR>
						<td>
							<A HREF="EnvioMensajeSPFicheroJSP" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '">
								<img src="images/Back.jpg" border="0" width="107" border="0" height="28">
							</A>
						</td>
					</TR>
				</TABLE>
			</CENTER>
<%

	} else {

%>
			<CENTER>
				<font class="texto2" size=2><%=info%></font>

				<form action="EnviarMsgSP" name="theForm" method="post">
					<table  border="1" class="tablas" >
					    <tr>
					    	<td class="bgCabeceraFila"></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Abonado</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">NIF</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Fecha cambio</font></td>
		                    <td class="bgCabeceraFila" align="center" ><font size="2">Fecha Lanzamiento</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Rango Inicial</font></td>
				    		<td class="bgCabeceraFila" align="center"><font size="2">Rango Final</font></td>
				    		<td class="bgCabeceraFila" align="center"><font size="2">Tipo Proceso</font></td>
		                    <td class="bgCabeceraFila" colspan="3">&nbsp;</td>
						</tr>
		                <tr>
<%

		int id = 0;
		String clase, numProceso;

		for (int i = 0; i < pendientes.size(); i++) {
			SolicitudPendienteBean solBean = pendientes.elementAt(i);
			if ((i % 2) == 0) {
				clase = "";
			} else {
				clase = "bgFila";
			}

			id = Integer.parseInt(solBean.getIdSolicitud());
			numProceso = solBean.getNumProceso();
			Calendario fechaLanzamiento = solBean.getFechaLanzamiento();

			String ventana = "";
			Calendario calVentana = solBean.getFechaIVCCalendario();
			if (calVentana != null) {
				ventana = calVentana.toString();
			}

			Vector<SolicitudesPendientesNumeracion> rangosNum = solBean.getRangosNum();

%>
		                    <td class="<%=clase%>" align="center"><input name="opt_solicitud" type="radio" value="<%=solBean.getIdSolicitud()%>"></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=solBean.getAbonado()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=solBean.getNifCif()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=ventana%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=solBean.getFechaLanzamiento().toString()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangosNum.elementAt(0).getInicioRango()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangosNum.elementAt(0).getFinalRango()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=solBean.getNumProceso()%></font></td>
 				    		<input type="hidden" id="<%=solBean.getIdSolicitud()%>" name="<%=solBean.getIdSolicitud()%>" value="<%=solBean.getNumProceso()+solBean.getFechaLanzamiento().toString()%>" >

<%

			if (rangosNum.size() > 1) {
               	Vector<String> m_NRN = new Vector<String>();
				Vector<String> m_NIR = new Vector<String>();
				Vector<String> m_NFR = new Vector<String>();

 				for (int b = 1; b < rangosNum.size(); b++) {
					SolicitudesPendientesNumeracion rango = rangosNum.elementAt(b);
                    m_NRN.add(rango.getNRN());
                    m_NIR.add(rango.getInicioRango());
                    m_NFR.add(rango.getFinalRango());
                }

%>
		                    <input type="hidden" name="NRNCadena<%=i%>" value="<%=m_NRN.toString()%>" >
							<td class="<%=clase%>"><a href="javascript:Abrir_ventana(<%=i%>,<%=m_NRN.toString()%>, <%=m_NIR.toString()%>,<%=m_NFR.toString()%>)//'"><font class="textoEnlace">M</font></a></td>
<%

			} else {

%>
							<td class="<%=clase%>">&nbsp;</td>
<%

			}

%>
							<td class="<%=clase%>"><a href="javascript:Detalle(<%=id%>, '<%=numProceso%>', '<%=fechaLanzamiento%>')" onMouseOver="window.status='Detalle';return true" onMouseOut="window.status=' '"><img border="0" src="images/veer.gif" id="<%=id%>" border="0" alt="Mostrar detalle"></a></td>
							<td class="<%=clase%>"><a href="javascript:Eliminar(<%=id%>)" onMouseOver="window.status='Eliminar';return true" onMouseOut="window.status=' '"><img src="images/delete.gif" border="0" alt="Eliminar"></a></td>
						</tr>
<%

		}

%>
					</table>

					<br/>
		            <br/>
					<CENTER>
				    	<a href="javascript:Eliminar(0)" onMouseOver="window.status='Eliminar Todas';return true" onMouseOut="window.status=' '"><img src="images/EliminarTodas.jpg" border="0"></a>
				    </CENTER>
					<input type="hidden" name="id_seleccionado">
					<table align="center">
						<tr>
							<td>
								<A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>
							</td>
							<td>
								<A HREF="EnvioMensajeSPFicheroJSP" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" border="0" height="28"></A>
							</td>
						</tr>
		    		</table>
				</form>
			</CENTER>
<%

	}

%>

<%--Nueva imagen--%>
		</td>
		<td width="10" class="Fondoverdederecha">
        	&nbsp;
		</td>
	</TR>
</TBODY>
<jsp:include page="pie.jsp" flush="true"/>


</body>
</html>
