<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@page import="org.apache.log4j.Logger"%>
<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images"/>
<c:url var="jsURL" value="/js"/>
<HTML lang="Spanish">
	<HEAD>
		<TITLE>Pantalla principal</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="profileModule/js/util.js"></script>
		<%//Logger logger = Logger.getLogger("home");
			//logger.info("comign herere");%>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

		<%@include file="include/CabeceraLogo.jsp"%>

		<script language="JavaScript">
var totalHeight=window.screen.availHeight - 211;
var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script>

		<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>

			<TR>

				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<td class="Titulo" vAlign="top" align="center" background="images/fondocentro.gif">

					<p>
						&nbsp;
					</p>

					<center>
						<form name="loginForm" action="gest_LoginPerf" method="post">
							<input type="hidden" name="accion" value="inicio" />
							<input type="hidden" name="tipo_Login" value="0" />
							<input type="hidden" name="redirect" value="/profileModule/jsp/inicio.jsp" />
							<table border="0" width="90%">

								<tr>
									<td colspan="2">
										<p>
											&nbsp;
										</p>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="Center">
										<font class="Titulo">GESTION PERFILES</font>
									</td>
								</tr>

								<tr>
									<td colspan="2">
										<p>
											&nbsp;
										</p>
									</td>
								</tr>
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
								<tr>
									<td align="right">
										<b><font class="texto2">Password</font></b>
									</td>
									<td align="left">
										<input type="password" class="inputText" name="password" >
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td height="20" align="right">
										<A HREF="#" onClick="document.loginForm.tipo_Login.value='0';document.forms[0].submit();return false"> <img src='images/Aceptar.jpg' name='aceptar' ALT='aceptar' border="0"> </a>
									</td>
									<td height="20" align="left">
										<A HREF="MenuPrincipalJSP"> <img src='images/Back.jpg' name='volver' ALT='volver' border="0"> </a>
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20">
										&nbsp;
									</td>
								</tr>
								
							</table>
							<script>document.forms[0].usuario.focus()</script>
						</form>
					</center>
				</td>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>

			</TR>

		</table>

	</BODY>
</HTML>
