<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@page import="org.apache.log4j.Logger"%>
<HTML lang="Spanish">
	<HEAD>
		<TITLE>Pantalla principal</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
	</HEAD>

	<%
	String subtitulo1 = new String("texto.mantenimientooperador.subtitulo1");
	Logger logger = Logger.getLogger("home");
			logger.info("comign herere");%>
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

		<%@include file="/profileModule/jsp/include/CabeceraLogo.jsp"%>

		<script language="JavaScript">
var totalHeight=window.screen.availHeight - 211;
var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script>
		
		<%String msg;%>

		<TBODY>
			<TR>
			
			
          <td width="10" class="Fondoverdederecha">
             &nbsp;
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="/profileModule/jsp/include/Menu.jsp"%>
          </TD>
				<TD align="center">
					<br>
					<br>
					<br>
					<br>


					<font class="Titulo"> <%msg = (String) session.getAttribute("res_cambio_cad_1");
				out.println(msg);%> </font>

					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>

					<form METHOD="post" ACTION="gest_Perf" name="inicio">

	 					<input name="BotonInicio" type="submit" value=<%msg = (String) session
					.getAttribute("res_cambio_cad_2");
			out.println(msg);%> ;class="boton2">
					</form>

				</td>

				
				</TBODY>
	</BODY>
</HTML>
