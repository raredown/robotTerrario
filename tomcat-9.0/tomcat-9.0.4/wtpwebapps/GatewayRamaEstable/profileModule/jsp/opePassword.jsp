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
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

		<%@include file="include/CabeceraLogo.jsp"%>

		<script language="JavaScript">
var totalHeight=window.screen.availHeight - 211;
var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script>

		<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>

			<tr>


				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<td class="Titulo" vAlign="top" align="Center" background="images/fondocentro.gif">

					<p>
						&nbsp;
					</p>

					<center>
						<form name="loginForm" action="gest_Login" method="post">
							<input type="hidden" name="accion" value="inicio" />
							<input type="hidden" name="tipo_Cambio" value="0" />
							<table border="0" width="90%">
								<tr>
									<td colspan="2" align="center">
										<p>
											<font class="texto2"><b>&nbsp;</b></font>
										</p>
									</td>
								</tr>
								<tr>
									<td colspan="2" height="30">
										<p>
											&nbsp;
										</p>
									</td>
								</tr>
								<tr>
									<td align="right" width="50%">
										<b><font class="texto2">User</font></b>
									</td>
									<td align="left" width="50%">
										<input type="text" class="inputText" name="usuario">
									</td>
								</tr>
								<%if (((String) session.getAttribute("opcPass")).equals("2")) {%>
								<tr>
									<td align="right">
										<b><font class="texto2">Password Actual</font></b>
									</td>
									<td align="left">
										<input type="password" class="inputText" name="password" >
									</td>
								</tr>
								<tr>
									<td align="right">
										<b><font class="texto2">Password Nueva</font></b>
									</td>
									<td align="left">
										<input type="password" class="inputText" name="passwordnew" >
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20" align="center">
										<A HREF="#" onClick="document.loginForm.tipo_Cambio.value='4';document.forms[0].submit();return false"> <img src='images/Aceptar.jpg' name='aceptar' ALT='aceptar' border="0"> </a>
									</td>
								</tr>
								<%} else {%>
								<tr>
									<td colspan="2" height="20">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20" align="center">
										<A HREF="#" onClick="document.loginForm.tipo_Cambio.value='3';document.forms[0].submit();return false"> <img src='images/Aceptar.jpg' name='aceptar' ALT='aceptar' border="0"> </a>
									</td>
								</tr>
								<%}%>

							</table>
							<script>document.forms[0].usuario.focus()</script>
						</form>
					</center>
				</td>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>

			</tr>

		</table>
	</BODY>
</HTML>
