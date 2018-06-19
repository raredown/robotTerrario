<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.io.*" %>
<%

  try{
    String mensaje = (String)request.getAttribute("Mensaje");
if(mensaje == null)
	mensaje = "";
    String subtitulo1 = new String("Autenticación");
%>
<html>
<head>
   <title><fmt:message key="titulo.cambiarpassword"/></title>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<SCRIPT Language="javascript">

var ie4,ns4;
if (navigator.appName=="Microsoft Internet Explorer") {
  ie4=parseInt(navigator.appVersion)>=4;
} else if (navigator.appName=="Netscape") {
  ns4=parseInt(navigator.appVersion)<5;
}

function Enviar(){

	var f = document.theForm;
	if(f.usuario.value==""){
		alert('<fmt:message key="javascript.cambiarpassword.alerta_nombre_usuario"/>');
		f.usuario.focus();
		return false;
	}
    if(f.pass.value==""){
		alert('<fmt:message key="javascript.cambiarpassword.alerta_actual_contrasenia"/>');
		f.usuario.focus();
		return false;
	}
    if(f.newpass.value==""){
		alert('<fmt:message key="javascript.cambiarpassword.alerta_nueva_contrasenia"/>');
		f.newpass.focus();
		return false;
	}
	if(f.newpass2.value==""){
		alert('<fmt:message key="javascript.cambiarpassword.alerta_confirme_contrasenia"/>');
		f.newpass2.focus();
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
<link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

<!-- link="#666666" alink="#000000" vlink="#008080" -->
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@include file="/cabeceraLogo.jsp"%>
<script language="JavaScript">
var totalHeight=window.screen.availHeight - 211;
var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
</script>
  <TBODY>
  <TR>
    <td width="10" class="Fondoverdederecha">
       &nbsp;
    </td>
    <TD vAlign=top width="180" class="celdalineaderecha">
      <jsp:include page="/menu_vacio.jsp" flush="true"/>
    </TD><!-- InstanceBeginEditable name="contenido" -->
    <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
        <center>
         <font class="textonegro"><fmt:message key="titulo.cambiarpassword"/></font>
        <p>&nbsp;</p>
        </center>
        <center>
          <form action="CambioPassword" method="post" name="theForm">
            <table border="0" width="90%">
                <tr>
                    <td colspan="2" align="center"><p><font class="texto2"><b><%=mensaje%>&nbsp;</b></font></p></td>
                </tr>
                <tr>
                    <td colspan="2" height="30"><p>&nbsp;</p></td>
                </tr>
                <tr>
                    <td align="right" width="50%"><b><font class="texto2"><fmt:message key="texto.cambiarpassword.usuario"/>:</font></b></td>
                    <td align="left"  width="50%"><input type="text" class="inputText" name="usuario" maxlength="15"></td>
                </tr>
                <tr>
                    <td align="right"><b><font class="texto2"><fmt:message key="texto.cambiarpassword.contrasenia_actual"/>: </font></b></td>
                    <td align="left"><input type="password" class="inputText" name="pass" maxlength="10"></td>
                </tr>
                 <tr>
                    <td align="right"><b><font class="texto2"><fmt:message key="texto.cambiarpassword.contrasenia_nueva"/>: </font></b></td>
                    <td align="left"><input type="password" class="inputText" name="newpass" maxlength="10" onblur="validatePass(this);"></td>
                </tr>
                 <tr>
                    <td align="right"><b><font class="texto2"><fmt:message key="texto.cambiarpassword.confirm_contrasenia_nueva"/>: </font></b></td>
                    <td align="left"><input type="password" class="inputText" name="newpass2" maxlength="10" onblur="validatePass(this);"></td>
                </tr>
                <tr>
                    <td colspan="2" height="20">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" height="20" align="center">
                      <A HREF="#" onClick="Enviar()">
                        <img src="<fmt:message key="images.aceptar"/>" name='aceptar' ALT='aceptar' border="0">
                      </a>
                      </td>
                </tr>
            </table>
              <input type="hidden" name="inicio" value="true">
          </form>
          <jsp:include page="/passwordModule/jsp/include/pagAnterior.jsp" flush="true"/>
          <script>document.theForm.usuario.focus();</script>
        </center>
      </td>
      <td width="10" class="Fondoverdederecha">
       &nbsp;
      </td>
    </TR>
    </TBODY>
  </TABLE>
<jsp:include page="/passwordModule/jsp/include/pie.jsp" flush="true"/>
</body>
</html>
<%

    } catch (Throwable t) {
        System.out.println(t);
    } finally{

    }
%>

