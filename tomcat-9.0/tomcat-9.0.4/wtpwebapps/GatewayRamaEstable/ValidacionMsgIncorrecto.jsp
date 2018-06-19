
<%@page import="es.portanode.solicitudes.SolicitudesPendientesNumeracion,
			es.portanode.util.PersonaContactoBean"%>
<HTML>
<head>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>


<%@ page import="java.util.Vector, java.util.List"%>
<%@ page import="java.io.*"%>

<!--
********************************************************************************************************
  Attributes
	Mensaje -> Result of the last operation.
	Pagina -> Link for the next page.
********************************************************************************************************
-->

 <%
 	String mensaje = (String) request.getAttribute("Mensaje");
 	String pagina = (String) request.getAttribute("Pagina");
 	String jsp = (String) request.getAttribute("jsp");
 	String operadorConectado = (String) request.getAttribute("OperadorConectado");

 	String destino = (String) request.getAttribute("Destinatario");
 	String remitente = (String) request.getAttribute("Remitente");
 	String observaciones = (String) request.getAttribute("Observaciones");
 	String nif = (String) request.getAttribute("NIF");
 	String nombre = (String) request.getAttribute("Nombre");
 	String direccion = (String) request.getAttribute("Direccion");
 	String cp = (String) request.getAttribute("CP");
 	String localidad = (String) request.getAttribute("Localidad");
 	String provincia = (String) request.getAttribute("Provincia");
    //Modificación 24/05/2010, cargamos el contacto por defecto, para su
    //posible modificación en el JSP.
    String nombreContacto = (String) request.getParameter("nombreContacto");
    String emailContacto = (String) request.getParameter("emailContacto");
    String telefContacto = (String) request.getParameter("telefContacto");
    String faxContacto = (String) request.getParameter("faxContacto");


 	// ** CAMBIO NUEVA ESPECIFICACION
 	//  	    String numIni = (String) request.getAttribute("NumeroInicial");
 	//          String numFin = (String) request.getAttribute("NumeroFinal");
 	//          String nrn = (String) request.getAttribute("NRN");

 	String num_rangos = (String) request.getAttribute("num_rangos") == null ? "0" : (String) request
 			.getAttribute("num_rangos");
 	String hora = (String) request.getAttribute("Hora") == null ? "" : (String) request.getAttribute("Hora");
 	String fecha = (String) request.getAttribute("Fecha") == null ? "" : (String) request.getAttribute("Fecha");
 	System.out.println("Fecha: " + fecha + "- Hora:  " + hora);
 	// Flag Numeración completa
 	String NumCompleta = (String) request.getAttribute("NumCompleta");
 	// Flag de solicitud ULL
 	String ull = (String) request.getAttribute("ULL");
 	// Nº Orden Administrativo ULL
 	String adUll = (String) request.getAttribute("AdULL");
 	// Identificador del proceso ULL
 	String idUll = (String) request.getAttribute("IdULL");

 	int numRangos = Integer.parseInt(num_rangos);
 	String[] tmp_nrns = null;
 	String[] tmp_numIniRango = null;
 	String[] tmp_numFinRango = null;
 	String tmp_nrnsS = "";
 	String tmp_numIniRangoS = "";
 	String tmp_numFinRangoS = "";

 	Vector<SolicitudesPendientesNumeracion> rangos = (Vector<SolicitudesPendientesNumeracion>) request.getAttribute("rango_seleccionado");
 	if (rangos != null) {
 		numRangos = rangos.size();
 		tmp_nrns = new String[numRangos];
 		tmp_numIniRango = new String[numRangos];
 		tmp_numFinRango = new String[numRangos];
 		
 		for (int i = 0; i < numRangos; i++) {
 	 		tmp_nrns[i] = rangos.elementAt(i).getNRN();
 	 		tmp_numIniRango[i] = rangos.elementAt(i).getInicioRango();
 	 		tmp_numFinRango[i] = rangos.elementAt(i).getFinalRango();
 		}
 	} else {
 		if (numRangos > 0) {
 			tmp_nrns = request.getParameterValues("NRN");
 			tmp_numIniRango = request.getParameterValues("NumInicialRango");
 			tmp_numFinRango = request.getParameterValues("NumFinalRango");
 		} else {
 			tmp_nrnsS = (String) request.getAttribute("NRN");
 			tmp_numIniRangoS = (String) request.getAttribute("NumeroInicial");
 			tmp_numFinRangoS = (String) request.getAttribute("NumeroFinal");
 		}
 	}

 	String tipo = (String) request.getAttribute("TipoPortabilidad");
 	String actuacion = (String) request.getAttribute("ActCoordPE");
 	String informacion = (String) request.getAttribute("InfoTarif");
 	String receptor = (String) request.getAttribute("Receptor");
 	String donante = (String) request.getAttribute("Donante");

 	String idSol = (String) request.getAttribute("idSolicitud");

 	String diferido = (String) request.getAttribute("diferido");
 	
 	String fechaLanzamiento = (String) request.getAttribute("FechaLanzamiento");
 	String horaLanzamiento = (String) request.getAttribute("HoraLanzamiento");
 	
 	String fechaSolUsuario = (String) request.getAttribute("fechaSolUsuario"); 
 	String operRevRec = (String) request.getAttribute("operRevRec"); 
 	String operRevDon = (String) request.getAttribute("operRevDon"); 

 	String subtitulo1 = "Envio mensaje";
 %>

  <BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
     <%@include file="cabeceraLogo.jsp"%>
      <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envio de mensajes</DIV>


		<CENTER>
               <br><br><br>
               <table border="1" class="tablas">
                 <tr>
                    <td class="bgCabeceraFila" align="center">
                       Resultado del envio
                    </td>
                 </tr>
                 <tr>
                   <td class="bgFila">
                     <font class="texto"><%=mensaje%></font>
                   </td>
                 </tr>
                </table>
                <BR>
         </CENTER>

		 <form name="formu" action="<%=pagina%>" method="POST">
		 <input type="HIDDEN" name="OperadorConectado" value="<%=operadorConectado%>">
		 <input type="HIDDEN" name="OperadorConexion" value="<%=imagen%>">
		 <input type="HIDDEN" name="jsp" value="<%=jsp%>">
		<input type="HIDDEN" name="Destinatario" value="<%=destino%>">
		<input type="HIDDEN" name="Remitente" value="<%=remitente%>">
		<input type="HIDDEN" name="Observaciones" value="<%=observaciones%>">
		<input type="HIDDEN" name="NIF" value="<%=nif%>">
		<input type="HIDDEN" name="Nombre" value="<%=nombre%>">
		<input type="HIDDEN" name="Direccion" value="<%=direccion%>">
		<input type="HIDDEN" name="CP" value="<%=cp%>">
		<input type="HIDDEN" name="Localidad" value="<%=localidad%>">
		<input type="HIDDEN" name="Provincia" value="<%=provincia%>">
		<input type="HIDDEN" name="nombreContacto" value="<%=nombreContacto%>">
		<input type="HIDDEN" name="emailContacto" value="<%=emailContacto%>">
		<input type="HIDDEN" name="telefContacto" value="<%=telefContacto%>">
		<input type="HIDDEN" name="faxContacto" value="<%=faxContacto%>">

		<!--  ** CAMBIO NUEVA ESPECIFICACION    -->

		<input type="HIDDEN" name="num_rangos" VALUE="<%=num_rangos%>">
		<input type="HIDDEN" name="NumCompleta" VALUE="<%=NumCompleta%>">
		<input type="HIDDEN" name="ULL" VALUE="<%=ull%>">
		<input type="HIDDEN" name="AdULL" VALUE="<%=adUll%>">
		<input type="HIDDEN" name="IdULL" VALUE="<%=idUll%>">

		<%
			if (numRangos > 0) {
				for (int i = 0; i < numRangos; i++) {
		%>
                <input type="HIDDEN" name="NRN" VALUE="<%=tmp_nrns[i]%>">
                <input type="HIDDEN" name="NumInicialRango" VALUE="<%=tmp_numIniRango[i]%>">
                <input type="HIDDEN" name="NumFinalRango" VALUE="<%=tmp_numFinRango[i]%>">
            <%
            	}
            	} else {
            %>
                <input type="HIDDEN" name="NRN" VALUE="<%=tmp_nrnsS%>">
                <input type="HIDDEN" name="NumeroInicial" VALUE="<%=tmp_numIniRangoS%>">
                <input type="HIDDEN" name="NumeroFinal" VALUE="<%=tmp_numFinRangoS%>">
                <input type="HIDDEN" name="Hora" VALUE="<%=hora%>">
                <input type="HIDDEN" name="Fecha" VALUE="<%=fecha%>">

         <%
         	}
         %>


            <input type="HIDDEN" name="TipoPortabilidad" value="<%=tipo%>">
            <input type="HIDDEN" name="ActCoordPE" value="<%=actuacion%>">
            <input type="HIDDEN" name="InfoTarif" value="<%=informacion%>">
            <input type="HIDDEN" name="Receptor" value="<%=receptor%>">
            <input type="HIDDEN" name="Donante" value="<%=donante%>">

            <%
            	if (idSol != null) {
            %>
            <input type="HIDDEN" name="idSolicitud" value="<%=idSol%>">
            <%
            	}
            %>
            
            <%
                        	if (diferido != null) {
                        %>
            <input type="HIDDEN" name="diferido" value="<%=diferido%>">
            <%
            	}
            %>

            <%
            	if (fechaLanzamiento != null && horaLanzamiento != null) {
            %>
            <input type="HIDDEN" name="FechaLanzamiento" value="<%=fechaLanzamiento%>">
            <input type="HIDDEN" name="HoraLanzamiento" value="<%=horaLanzamiento%>">
            <%
            	}
            %>
            
            <input type="HIDDEN" name="fechaSolUsuario" value="<%=fechaSolUsuario%>">
 			<input type="HIDDEN" name="operRevRec" value="<%=operRevRec%>">
            <input type="HIDDEN" name="operRevDon" value="<%=operRevDon%>">

		 </form>
          <CENTER>
             <A HREF="javascript:document.formu.submit()//'" onMouseOver="window.status='Enviar';return true;" onMouseOver="window.status=' '"><img src="images/Aceptar.jpg" border="0" width="107" height="28"></A>
		  </CENTER>

              <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>

</BODY>

      
</HTML>    
