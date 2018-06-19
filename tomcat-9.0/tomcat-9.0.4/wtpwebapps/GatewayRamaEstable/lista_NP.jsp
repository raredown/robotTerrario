<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<html>
<head>
	<title>Consulta BDR</title>
	<meta http-equiv="expires" content="1">
	<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
	<link href="estilos/style.css" rel="stylesheet" type="text/css" media="screen" /> 
	
	<style media="all" type="text/css">	
    	@import url("estilos/screen.css");
	</style>
	
	<SCRIPT LANGUAGE="JavaScript">
	function detectarEnter(e) {
		var ieKey=event.keyCode;
    	if(ieKey==13) {
    		consultaBDRAction.submit();
    	}
	}
    </SCRIPT>
	
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%
    String subtitulo1=new String("Consulta BDR");
%>
<%@include file="cabeceraLogo.jsp"%>

<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
	<tbody>
    	<tr>
				<td width="10" class="Fondoverdederecha">&nbsp;
				</td>
          	<td vAlign=top width="180" class="celdalineaderecha">
            	<%@include file="menu.jsp"%>
          	</td>
          	<td class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
				RANGO NUMERACIONES
				<form id="consultaBDRAction" action="ConsultaBDRAction.do" method="post"> 
					<p>
						<input id="page" name="page" type="hidden" value="1">
						
						<label for="rangoInicial" class="texto2">Rango Inicial</label>
						<input id="rangoInicial" name="rangoInicial" type="text" class="inputText"  onKeyUp="detectarEnter(this)">
						
						<label for="rangoFinal" class="texto2">Rango Final</label>
						<input id="rangoFinal" name="rangoFinal" type="text" class="inputText"  onKeyUp="detectarEnter(this)">
						<br/>
						<center>						
							<a href="javascript:consultaBDRAction.submit();//'" onmouseover="window.status='Realizar búsqueda';return true" onmouseout="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
						</center>						
					</p>
				</form>
				LISTA NUMERACION PORTADA <c:out value="${ConsultaBDRForm.rangoInicial}"/> - <c:out value="${ConsultaBDRForm.rangoFinal}"/>
				<display:table 	class="displayTag" name="lista" uid="bdr" export="true" sort="external"
								pagesize = "10" size="${lista.pageSize}" defaultsort="1" defaultorder="descending"
								requestURI="/ConsultaBDRAction.do" partialList="false" >
					
					<display:setProperty name="paging.banner.placement" value="bottom" />
					
					<display:setProperty name="export.pdf" value="false" />
                    <display:setProperty name="export.csv" value="false" />
                    <display:setProperty name="export.rtf" value="false" />
                    <display:setProperty name="export.xml" value="false" />

					<display:column title="Numero" property="numero" style="text-align:center"/>
					
					<display:column title="Donante" style="text-align:center" maxLength="5">${bdr.donante} - ${bdr.descripcionDonante}</display:column>
					
					<display:column title="Receptor" style="text-align:center" maxLength="5">${bdr.receptor} - ${bdr.descripcionReceptor}</display:column>
				
					<display:column title="Donante Inicial" style="text-align:center" maxLength="5">${bdr.donanteInicial} - ${bdr.descripcionDonanteInicial}</display:column>
					
					<display:column title="NRN Actual" property="nrnActual" style="text-align:center"/>
					
					<display:column title="NRN Anterior" property="nrnAnterior" style="text-align:center"/>
					
					<display:column title="Info Tarifa" property="infoTarifa" style="width:250px; text-align:center"/>
					
					<display:column title="Ultimo Proceso" style="text-align:center" maxLength="2">${bdr.ultimoProceso} - ${bdr.descripcionUltimoProceso}</display:column>
					
					<display:column title="Inicio Proceso" property="inicioProceso" format="{0, time, dd-MM-yyyy HH:mm:ss}" style="width:250px; text-align:center"/>
					
					<display:column title="Inicio Ventana" property="inicioVentana" format="{0, time, dd-MM-yyyy HH:mm:ss}" style="width:250px; text-align:center"/>
					
					<display:column title="Duracion Ventana" property="duracionVentana" style="text-align:center"/>
					
					<display:column title="Estado" style="text-align:center" maxLength="2">${bdr.estado} - ${bdr.descripcionEstadoNumeracion}</display:column>					
				</display:table>
				
			</td>
			<td width="10" class="Fondoverdederecha">&nbsp;
				</td>
		</tr>
	</tbody>
</table>
<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>