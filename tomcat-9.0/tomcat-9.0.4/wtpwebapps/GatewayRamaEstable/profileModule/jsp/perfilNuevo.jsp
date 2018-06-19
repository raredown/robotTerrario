<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images" />
<c:url var="jsURL" value="/js" />
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

  function newPerfil(val){
  	document.enviopeticioncreacionPerfil.accionCreaPerfil.value=val;
  	document.enviopeticioncreacionPerfil.submit();
  
  }
</script>
		<%
			String msg;
		%>
		<TBODY>
			<TR>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="include/Menu.jsp"%>


				</TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align=middle
					background="../images/fondocentro.gif">
					<br>
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;
						<p align=center>
							<%
								msg = (String) session.getAttribute("new_prof_cad_1");
								out.println(msg);
							%>
						</p>
					</DIV>

					<table ALIGN="CENTER" border="1">
						<tr>
							<td>
								<form METHOD="post" ACTION="gestperfiljsp"
									name="enviopeticioncreacionPerfil">
									<INPUT TYPE="hidden" NAME="desp" VALUE="0" id="comienzalista">
									<table ALIGN="CENTER" border="0">
										<tr>
											<td colspan="2" ALIGN="CENTER">
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td>
												<P ALIGN="CENTER" class="Titulo">
													<B>
														<%
															msg = (String) session.getAttribute("new_prof_cad_4");
															out.println(msg);
														%>
													</B>
												</P>
											</td>
											<td ALIGN="CENTER" class="Titulo">
												<P>
													<B>
														<%
															msg = (String) session.getAttribute("new_prof_cad_3");
															out.println(msg);
														%>
													</B>
												</P>
											</td>
										<tr>
											<td colspan="2" ALIGN="CENTER">
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td colspan="2" ALIGN="CENTER">
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td VALIGN="TOP">
												<input type="text" NAME="prof_desc" size="20">

											</td>
											<td>
												<%
													msg = (String) session.getAttribute("servlet_tabla_perm_crea_perf");
													out.println(msg);
												%>
											</td>
										<tr>
											<td>
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td>
												<P>
													&nbsp;
												</P>
											</td>
										<tr>

											<td ALIGN="RIGTH">

												<input type="hidden" name="accionCreaPerfil">
												<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("new_prof_cad_5")%>" , "newPerfil(0)")</script>

											</td>
											<td ALIGN="LEFT">
												<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("new_prof_cad_6")%>" , "newPerfil(1)")</script>
											</td>
									</table>
								</Form>
							</td>
						</tr>
					</table>
			</TR>
		</TBODY>
	</BODY>
</HTML>



