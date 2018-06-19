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
	f.action = "EliminarBaja";
	f.submit();
}

function TodoOk(){
    f = document.theForm;
	var i = 0;
	var ok = false;

	for (i=0;i<f.elements.length;i++){
         if (f.elements[i].type=="radio" && f.elements[i].checked==true){
			f.id_seleccionado.value = f.elements[i].value;
		 	ok=true;
			f.submit();
		}
	}
	if(ok==false){
		alert("Debe seleccionar una solicitud para enviar.");
	}
}

</script>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="es.portanode.procesos.*"%>
<%@ page import="es.portanode.util.*"%>
<%@ page import="es.portanode.util.operadores.*"%>
<%@ page import="java.io.*"%>
<%
	String anterior = (String) request.getAttribute("Anterior");
	String remitente = (String) request.getAttribute("OperadorConectado");
	OperadorBeanCollection operadores = (OperadorBeanCollection) request.getAttribute("Operadores");
%>	  
  <!-- Insercion de Cabecera -->
  <%
  	String subtitulo1 = new String("Bajas cargadas");
  	String mensaje = new String("NB");
  	String subtitulo2 = new String("Detalle bajas pendientes");
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
        	<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Bajas cargadas</DIV>


			<FORM METHOD=POST ACTION="<%=anterior%>" name="fback">
				<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
				<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
				<INPUT TYPE="hidden" name="jsp" value="EnvioMensajeNBFicheroJSP">
			</FORM>
		
		
<%

	String info = (String) request.getAttribute("infoDelete");

	if (info == null) {
		info = "";
	}

	Vector<BajasPendientesBean> pendientes = (Vector<BajasPendientesBean>) request.getAttribute("Pendientes");
	
	if (pendientes == null || pendientes.size() == 0) {
		info = "No hay ninguna baja pendiente";
		
%>
			<CENTER>
				<font class="texto2" size=4><%=info%></font><br><br>
				<TABLE align="center">
					<TR>
						<td>
							<A HREF="EnvioMensajeNBFicheroJSP" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '">
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
		
				<form action="EnviarMsgNb" name="theForm" method="post">
					<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
					<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
				
					<table  border="1" class="tablas" >
					    <tr>
					    	<td class="bgCabeceraFila"></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Fecha Lanzamiento</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Donante Inicial</font></td>
						    <td class="bgCabeceraFila" align="center" ><font size="2">Rango Inicial</font></td>
				    		<td class="bgCabeceraFila" align="center"><font size="2">Rango Final</font></td>
		                    <td class="bgCabeceraFila" colspan="1">&nbsp;</td>
						</tr>
		                <tr>
<%

		int id = 0;
		String clase;
		
		for (int i = 0; i < pendientes.size(); i++) {
			BajasPendientesBean bajaBean = pendientes.elementAt(i);
			if ((i % 2) == 0) {
				clase = "";
			} else {
				clase = "bgFila";
			}
									
			id = Integer.parseInt(bajaBean.getIdBaja());
			String descripcion = operadores.GetCDOperadoresDescripcion(bajaBean.getDonanteInicial());

%>
		                    <td class="<%=clase%>" align="center"><input name="opt_solicitud" type="radio" value="<%=bajaBean.getIdBaja()%>"></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=bajaBean.getFechaLanzamiento().toString()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=descripcion%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=bajaBean.getInicioRango()%></font></td>
		                    <td class="<%=clase%>" align="center"><font class="texto2"><%=bajaBean.getFinalRango()%></font></td>
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
								<A HREF="EnvioMensajeNBFicheroJSP" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" border="0" height="28"></A>
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
