<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Operador</title>

<script  language="JavaScript" type="text/javascript">
function Eliminar(id){
	f = document.theForm;
	f.id_seleccionado.value = id;
	f.action = "EliminarCancelacion";
	f.submit();
}

function Abrir_ventanaAnt(NIR,NFR){
	var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
	window.open("PopUpJSP?NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

function Abrir_ventana(indice,NIR,NFR){

    var elementoRango = document.getElementById("RangoCadena"+indice);
    var rangos = elementoRango.value;
    var rangos2 = "";
    var longi = rangos.length - 1;
    for (k = 1 ; k < longi; k++ )
    {
    	rangos2 = rangos2 + rangos.charAt(k);
    }


	var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
	window.open("PopUpJSP?NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

</script>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="es.portanode.procesos.*"%>
<%@ page import="es.portanode.util.*"%>
<%@ page import="java.io.*"%>
<%
	String anterior = (String) request.getAttribute("Anterior");
	String remitente = (String) request.getAttribute("OperadorConectado");
	String rol = (String) request.getAttribute("Rol");
%>	  
  <!-- Insercion de Cabecera -->
  <%
  	String subtitulo1 = new String("Cancelaciones cargadas");
  	String mensaje = new String("CNC");
  	String subtitulo2 = new String("Detalle cancelaciones pendientes");
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
        	<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>
        		Cancelaciones cargadas
        		<% if (rol.equals("Receptor")) { %>(Rol Receptor)<% } else { %>(Rol Donante)<% } %>
        	</DIV>


			<FORM METHOD=POST ACTION="EnvioMensajeCNCFicheroJSP" name="fback">
				<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
				<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
				<INPUT TYPE="hidden" name="jsp" value="<%= rol %>">
			</FORM>
		
		
<%

	String info = (String) request.getAttribute("infoDelete");

	if (info == null) {
		info = "";
	}

	Vector<CancelacionPendienteBean> pendientes = (Vector<CancelacionPendienteBean>) request.getAttribute("Pendientes");
	
	if (pendientes == null || pendientes.size() == 0) {
		info = "No hay ninguna cancelaci&oacute;n pendiente";
		
%>
			<CENTER>
				<font class="texto2" size=4><%=info%></font><br><br>
				<TABLE align="center">
					<TR>
						<td>
							<A HREF="javascript:document.fback.submit();//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '">
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
		
				<form name="theForm" method="post">
					<input type="hidden" name="Rol" value="<%=rol%>"/>
					
					<table  border="1" class="tablas" >
					    <tr>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Fecha Lanzamiento</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Id Proceso Cancelado</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Rango Inicial</font></td>
				    		<td class="bgCabeceraFila" align="center"><font size="2">Rango Final</font></td>
		                    <td class="bgCabeceraFila" colspan="2">&nbsp;</td>
						</tr>
		                <tr>
<%

		String id;
		String clase;
		
		for (int i = 0; i < pendientes.size(); i++) {
			CancelacionPendienteBean cancBean = pendientes.elementAt(i);
			if ((i % 2) == 0) {
				clase = "";
			} else {
				clase = "bgFila";
			}
									
			id = cancBean.getIdProcesoCancelado();

			Vector<ProcesoNumeracion> rangosNum = cancBean.getRangos();
			
%>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=cancBean.getFechaLanzamiento().toString()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=cancBean.getIdProcesoCancelado()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangosNum.elementAt(0).getNumInicialRango()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangosNum.elementAt(0).getNumFinalRango()%></font></td>
<%

			if (rangosNum.size() > 1) {
				Vector<String> m_NIR = new Vector<String>();
				Vector<String> m_NFR = new Vector<String>();
                                    		
 				for (int b = 1; b < rangosNum.size(); b++) {
 					ProcesoNumeracion rango = rangosNum.elementAt(b);
                    m_NIR.add(rango.getNumInicialRango());
                    m_NFR.add(rango.getNumFinalRango());
                }
 				
%>
		                    <input type="hidden" name="RangoCadena<%=i%>" value="<%=m_NIR.toString()%>" >
							<td class="<%=clase%>"><a href="javascript:Abrir_ventana(<%=i%>,<%=m_NIR.toString()%>,<%=m_NFR.toString()%>)//'"><font class="textoEnlace">M</font></a></td>
<%

			} else {
				
%>
							<td class="<%=clase%>">&nbsp;</td>
<%

			}

%>
							<td class="<%=clase%>"><a href="javascript:Eliminar('<%=id%>')" onMouseOver="window.status='Eliminar';return true" onMouseOut="window.status=' '"><img src="images/delete.gif" border="0" alt="Eliminar"></a></td>
						</tr>
<%

		}
		
%>
					</table>
		
					<br/>
		            <br/>
					<input type="hidden" name="id_seleccionado">
					<table align="center">
						<tr>
							<td>
				    			<a href="javascript:Eliminar(0)" onMouseOver="window.status='Eliminar Todas';return true" onMouseOut="window.status=' '"><img src="images/EliminarTodas.jpg" border="0"></a>
							</td>
							<td>
								<A HREF="javascript:document.fback.submit();//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" border="0" height="28"></A>
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
