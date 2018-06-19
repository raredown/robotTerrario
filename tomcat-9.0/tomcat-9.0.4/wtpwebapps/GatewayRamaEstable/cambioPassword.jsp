<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.*"%>
<%String mensaje = (String)request.getAttribute("Mensaje");
if(mensaje == null)
	mensaje = "";
%>
<html>
	<head>
		<title><fmt:message key="titulo.cambiopassword" />
		</title>
		<SCRIPT Language="javascript">

var ie4,ns4;
if (navigator.appName=="Microsoft Internet Explorer") {
  ie4=parseInt(navigator.appVersion)>=4;
} else if (navigator.appName=="Netscape") {
  ns4=parseInt(navigator.appVersion)<5;
}

function Enviar(){

	var f = document.theForm;
	/*if(f.pass.value==""){
		alert('<fmt:message key="javascript.cambiopassword.alerta_actual_contrasenia"/>');
		f.pass.focus();
		return false;
	}*/
	if(f.newpass.value==""){
		alert('<fmt:message key="javascript.cambiopassword.alerta_nueva_contrasenia"/>')
		f.newpass.focus();
		return false;
	}
	if(f.newpass2.value==""){
		alert('<fmt:message key="javascript.cambiopassword.alerta_confirme_contrasenia"/>')
		f.newpass2.focus();
		return false;
	}

	if(f.newpass.value != f.newpass2.value){
		alert('<fmt:message key="javascript.cambiopassword.alerta_nocoincide_contrasenia"/>');
		return false;
	}

	f.submit();
}

function validatePass(campo) {
	var tipo = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,10})$/;
	var f = document.theForm;      
	if ((campo.value.match(tipo)) && (campo.value!='')) {        
		//alert('Password Valido');     
	} else {        
		alert('- Password Incorrecta\n Debe ser entre 6 y 10 caracteres, alfanumerico,\n por lo menos un digito, y no puede contener caracteres especiales.');        
		//campo.focus();
		if(campo.name == "newpass2"){
			   if(f.newpass.value != f.newpass2.value){
				alert('<fmt:message key="javascript.cambiarpassword.alerta_nocoincide_contrasenia"/>');
				return false;
			   }
			}
	} 
	
}

function detectarEnter(e) {
	if (ns4)
      {
       var nKey=e.which;
       if(nkey==13)
         Enviar();
      }
	if (ie4)
     {
       var ieKey=event.keyCode;
       if(ieKey==13)
         Enviar();
     }
} 
</SCRIPT>
		<script language="JavaScript" src="js/util.js"></script>
		<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
	</head>

	<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
		<%
    String usuario = (String) request.getAttribute("Usuario");
	String subtitulo1 = new String("texto.cambiopassword.subtitulo.modificacion_contrasenia");
  %>

		<%@include file="/passwordModule/jsp/include/cabeceraLogo.jsp"%>
		<script language="JavaScript">
      var tabla="<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
		<TBODY>
			<TR>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="/passwordModule/jsp/menu.jsp"%>
				</TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align="center" background="images/fondocentro.gif">
					<br>
					<DIV align=left class="Titulo">
						&nbsp;&nbsp;&nbsp;
						<img src="images/flecha.gif" border="0" />
						<fmt:message key="texto.cambiopassword.cambio_password" />
						&nbsp;
					</DIV>

					<br>
					<center>
						<form action="CambioPassword" method="post" name="theForm">
							<input type="hidden" name="usuario" value="<%=usuario %>">
							<table border="0" width="100%">
								<tr>
									<td colspan="2" align="center">
										<p><font class="texto2"><b><%=mensaje%>&nbsp;</b></font></p>
									</td>
								</tr>
								<tr>
									<td colspan="2" height="30" align="center">
										<p>
											<font class="texto2"><b><fmt:message key="texto.cambiopassword.uuario" />:</b>
											</font>&nbsp;
											<font class="texto"><%=usuario%></font>
										</p>
									</td>
								</tr>
								<tr>
									<td colspan="2" height="20" align="center">
										<p>
											<font color="#FFFFFF">&nbsp;</font>
										</p>
									</td>
								</tr>
								<tr>
									<td align="right" width="50%">
										<font class="texto2" size="3"><b><fmt:message key="texto.cambiopassword.contrasenia_actual" />:</b>
										</font>
									</td>
									<td align="left" width="50%" class="text">
										<input type="password" name="pass" value="" maxlength="10">
									</td>
								</tr>
								<tr>
									<td align="right">
										<font class="texto2" size="3"><b><fmt:message key="texto.cambiopassword.contrasenia_nueva" />: </b>
										</font>
									</td>
									<td align="left" class="text"><input type="password" name="newpass" maxlength="10" onblur="validatePass(this);"></td>
								</tr>
								<tr>
									<td align="right">
										<font class="texto2" size="3"><b><fmt:message key="texto.cambiopassword.confirm_contrasenia_nueva" />: </b>
										</font>
									</td>
									<td align="left" class="text">
										<input type="password" name="newpass2" onKeyUp="detectarEnter(this)" maxlength="10" onblur="validatePass(this);">
									</td>
								</tr>

								<tr>
									<td colspan="2" height="20">&nbsp;</td>
								</tr>
								<tr>
									<td style="padding-right: 20px" height="20" align="center" colspan="2">
										<img src="<fmt:message key="images.aceptar"/>" onClick="Enviar()" alt="Aceptar">
									</td>
								</tr>
							</table>

						</form>
						<script>document.theForm.pass.focus();</script>
					</center>
					<BR>
				</td>
				<td width="10" class="Fondoverdederecha">
					&nbsp;
				</td>
			</TR>
		</TBODY>
		</TABLE>
		<jsp:include page="/jsp/include/pie.jsp" flush="true" />
	</body>
</html>

