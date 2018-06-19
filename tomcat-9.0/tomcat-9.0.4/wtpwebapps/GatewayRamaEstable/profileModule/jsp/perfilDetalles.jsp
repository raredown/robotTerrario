<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->

<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images"/>
<c:url var="jsURL" value="/js"/>
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
  
  function detaPerfil(val){
	  document.enviodetallesPerfil.accionDetaPerfil.value=val;
	  document.enviodetallesPerfil.submit();
  
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
							<%msg = (String) session.getAttribute("det_prof_cad_1");
			out.println(msg);%>
						</p>
					</DIV>
					<br>
					<br>

					<table ALIGN="CENTER" border="1">
						<tr>
							<td>
								<form METHOD="post" ACTION="gestperfiljsp" name="enviodetallesPerfil">
									<table ALIGN="CENTER" border="0">
										<tr>
											<td ALIGN="CENTER" class="Titulo">
												<p>
													<B><%msg = (String) session.getAttribute("det_prof_cad_2");
														out.println(msg);%></B>
												</p>
											</td>
											<td ALIGN="CENTER" class="Titulo">
												<p>
													<B><%msg = (String) session.getAttribute("det_prof_cad_4");
														out.println(msg);%></B>
												</p>

											</td>
											<td ALIGN="CENTER" class="Titulo">
												<p>
													<B><%msg = (String) session.getAttribute("det_prof_cad_3");
														out.println(msg);%></B>
												</p>

											</td>
										<tr>
											<td>
												<P>
													&nbsp;
												</P>
											</td>
											<%msg = (String) session.getAttribute("servlet_tabla_edit_perf");
												out.println(msg);%>
										<tr>
											<td>
												<P>
													&nbsp;
												</P>
											</td>
										<tr>

											<td ALIGN="CENTER" colspan="3">
												<input type="hidden" name="accionDetaPerfil">
			<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("det_prof_cad_5")%>" , "detaPerfil(0)")</script>
											</td>
									</table>
								</Form>
							</td>
					</table>
			</TR>
		</TBODY>
	</BODY>
</HTML>



