<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->


<HTML lang="Spanish">
	<HEAD>
		<TITLE>Pantalla principal</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
		<%@include file="include/CabeceraLogo.jsp"%>



		<script language="JavaScript">
var totalHeight=window.screen.availHeight - 211;
var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script><%String msg;%>
		<TBODY>
			<TR>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="include/Menu.jsp"%>



				</TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">


					<br>

					<DIV align=left class="Titulo">
						&nbsp;&nbsp;

					</DIV>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<CENTER>
						<h5>
							<%msg = (String) session.getAttribute("resultado_Borrado");
			out.println(msg);%>
						</h5>
					</CENTER>

					<BR>
					<BR>
					<br>
					<br>



					<form METHOD="post" ACTION="gest_Perf" name="eliminarpermiso">

						<CENTER>
			<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("Volver_Inicio")%>" , "document.eliminarpermiso.submit()")</script>
							<CENTER>
					</Form>
			</TR>
		</TBODY>
	</BODY>
</HTML>



