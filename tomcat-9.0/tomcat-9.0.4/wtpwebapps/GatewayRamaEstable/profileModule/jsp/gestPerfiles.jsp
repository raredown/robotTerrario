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

function gestPerfiles(val){
  
	  /*
	  	val=0 Detalles perfil
	  	val=1 Borrar perfil
	  	val=2 Editar perfil
	  */
  	document.envioperfil.accionGestPerfiles.value=val;
  	document.envioperfil.submit();
  }
  
</script>
		<%String msg;%>
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
						<p align=center>
							<%msg = (String) session.getAttribute("gest_prof_cad_1");
			out.println(msg);%>
						</p>
					</DIV>

					<form METHOD="post" ACTION="gestperfiljsp" name="envioperfil">
						<table ALIGN="CENTER" border="0">
							<tr>
								<td colspan="3">
								<table ALIGN='CENTER' border='0'>

										<tr>

											<td>

									<table ALIGN='CENTER' border='0'>

										<tr>

											<td>

											</td>

											<td ALIGN='CENTER' class="Titulo">
												<B><%msg = (String) session.getAttribute("gest_prof_cad_2");
												out.println(msg);%></B>
											</td>

											<td ALIGN='CENTER' class="Titulo">
												<B><%msg = (String) session.getAttribute("gest_prof_cad_3");
												out.println(msg);%></B>
											</td>

											<td ALIGN='CENTER' colspan='3'>

												<P>
													&nbsp;
												</P>

											</td>


											<%msg = (String) session.getAttribute("servlet_tabla_perf");
												out.println(msg);%>
										<tr>

											<td ALIGN='CENTER' colspan='3'>

												<P>
													&nbsp;
												</P>

											</td>
									</table>
										</td>
									</table>
								</td>
							<tr>
								<td colspan="3" ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td colspan="3" ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td colspan="3" ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td ALIGN="CENTER">
			<input type="hidden" name="accionGestPerfiles">
			<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("gest_prof_cad_4")%>" , "gestPerfiles(0)")</script>
								
								</td>
								<td ALIGN="CENTER">
			<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("gest_prof_cad_5")%>" , "gestPerfiles(1)")</script>
								</td>
								<td ALIGN="CENTER">
			<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("gest_prof_cad_6")%>" , "gestPerfiles(2)")</script>
								</td>
								
						</table>
					</Form>
			</TR>
		</TBODY>
	</BODY>
</HTML>



