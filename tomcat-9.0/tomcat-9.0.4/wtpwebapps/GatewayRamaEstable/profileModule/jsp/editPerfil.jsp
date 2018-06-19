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



function editPerfil(val){
//val=0 aceptar
//val=1 cancelar
	document.enviopeticionedicionPerfil.accionEditPerfil.value=val;
	document.enviopeticionedicionPerfil.submit();

}
</script>
		<TBODY>
			<%
				String msg;
			%>
			<TR>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="include/Menu.jsp"%>


				</TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align=middle
					background="images/fondocentro.gif">
					<br>
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;
						<p align=center>
							<%
								msg = (String) session.getAttribute("edit_perf_cad_1");
								out.println(msg);
							%>
						</p>
					</DIV>

					<table ALIGN="CENTER" border="1">
						<tr>
							<td>
								<form METHOD="post" ACTION="gestperfiljsp"
									name="enviopeticionedicionPerfil">
									<INPUT TYPE="hidden" NAME="desp" VALUE="0" id="comienzalista">
									<table ALIGN="CENTER" border="0">
										<tr>
											<td colspan="3" ALIGN="CENTER">
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td ALIGN="CENTER" class="Titulo">
												<P>
													<B> 
														<%
 															msg = (String) session.getAttribute("edit_perf_cad_2");
 															out.println(msg);
 														%> 
													</B>
												</P>
											</td>
											<td ALIGN="CENTER" class="Titulo">
												<P>
													<B> 
														<%
 															msg = (String) session.getAttribute("edit_perf_cad_6");
 															out.println(msg);
 														%> 
													</B>
												</P>
											</td>
											<td ALIGN="CENTER" class="Titulo">
												<P>
													<B> 
														<%
 															msg = (String) session.getAttribute("edit_perf_cad_3");
 															out.println(msg);
 														%> 
													</B>
												</P>
											</td>											
										<tr>
											<td colspan="3" ALIGN="CENTER">
												<P>
													&nbsp;
												</P>
											</td>
										<tr>
											<td valign="top" align="center">
												<%
													msg = (String) session.getAttribute("servlet_tabla_edit_perf_edit");
												%>

												<input type="text" name="profile_edit" readonly size="8"
													value=<%=msg%>>
											</td>
											<td valign="top" align="center">
												<%
													msg = (String) session.getAttribute("Descripcion");
												%>
												<input type="text" name="description_edit" size="20"
													value="<%=msg%>">
											</td>
											<td>
												<%
													msg = (String) session.getAttribute("servlet_tabla_perm_edit_perf");
													out.println(msg);
												%>
											</td>											
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>

										<tr>
											<td ALIGN="CENTER" colspan="3">
												<div>
													<table align="center">
														<tr>
															<td ALIGN="RIGHT">
																<input type="hidden" name="accionEditPerfil">
																<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("edit_perf_cad_4")%>" , "editPerfil(0)")</script>
															</td>
															<td ALIGN="LEFT">
																<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("edit_perf_cad_5")%>" , "editPerfil(1)")</script>
															</td>
														</tr>
													</table>
												</div>
											</td>
										</tr>
									</table>
								</Form>
							</td>
					</table>
			</TR>
		</TBODY>
	</BODY>
</HTML>



