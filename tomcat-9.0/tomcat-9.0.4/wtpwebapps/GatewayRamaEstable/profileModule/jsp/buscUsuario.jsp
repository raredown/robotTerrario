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

function buscUsuario(val){
	//val=0 buscar
	//val=1 cancelar
  document.enviopeticionbuscUser.accionBuscUsuario.value=val;
  document.enviopeticionbuscUser.submit();
	
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
				<TD class=Titulo vAlign=top align=middle background="../images/fondocentro.gif">
					<br>
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;
						<p align=center>
							<%msg = (String) session.getAttribute("search_user_cad_1");
			out.println(msg);%>

						</p>
					</DIV>

					<table ALIGN="CENTER" border="1" width="400">
					<tr>
					<td>
					<form METHOD="post" ACTION="buscusuariosjsp" name="enviopeticionbuscUser">
						<table ALIGN="CENTER" border="0">
							<tr>
								<td colspan="2" ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td colspan="2" ALIGN="CENTER" class="Titulo">
									<P>
										<B> <%msg = (String) session.getAttribute("search_user_cad_2");
										out.println(msg);%></B>
									</P>
								</td>
							<tr>
								<td colspan="2" ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td ALIGN="CENTER">
									<P>
										&nbsp;
									</P>
								</td>
							<tr>
								<td colspan="2">
									<input type="text" name="busc_user" size="25">
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

								<td ALIGN="CENTER">
									<input type="hidden" name="accionBuscUsuario">
									<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("search_user_cad_3")%>" , "buscUsuario(0)")</script>
								</td>

								<td ALIGN="CENTER">
									<script type="text/javascript">pintaBoton ("<%=(String) session.getAttribute("search_user_cad_4")%>" , "buscUsuario(1)")</script>
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
