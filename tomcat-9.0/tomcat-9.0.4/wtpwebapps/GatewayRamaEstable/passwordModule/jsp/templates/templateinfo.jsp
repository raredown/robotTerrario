<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 * Modifica
 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page import="java.util.List"%>

<% String csVal="Y";
es.gateway.sesiones.users.vo.TemplateVo tvo = (es.gateway.sesiones.users.vo.TemplateVo)request.getAttribute("templatedataattribute");
%>
<script language="javaScript" src="passwordModule/jscripts/templateinfo.js"></script>
<script language="javaScript">

function call(){

	var f = document.templateForm;

	f.description.value   = '<%=tvo.getDescription()%>';
	f.ttlPassword.value   = '<%=tvo.getTtlPassword()%>';
	f.timeAdvice.value    = '<%=tvo.getTimeAdvice()%>';
	f.norPasswrods.value  = '<%=tvo.getNorPasswrods()%>';
	f.lfbBlockUser.value  = '<%=tvo.getLfbBlockUser()%>';
	f.caseSensitive.value = '<%=tvo.getCaseSensitive()%>';
		
	for(var i =0;i<document.templateForm.userType.length;i++) {	
	     if(document.templateForm.userType[i].value==document.templateForm.ut.value)
			document.templateForm.userType.selectedIndex=i;
	 }

     if(document.templateForm.cs.value=="Y"){
        <%csVal="Y";%> 	    
		document.templateForm.caseSensitive.value="Y";
		document.templateForm.caseSensitive.checked=true;

      }
      else document.templateForm.caseSensitive.value="N";
	     <%csVal="N";%>    
}

function solonumeros(evt){
	var nav4 = window.Event ? true : false;
	var key = nav4 ? evt.which : evt.keyCode;
	return (key <= 13 || (key >= 48 && key <= 57));
}

function solonumerosynegativo(evt, objeto){
	var pos = objeto.value.indexOf("-",-1);
	var nav4 = window.Event ? true : false;
	var key = nav4 ? evt.which : evt.keyCode;
	if (key == 45 && pos==-1 && objeto.value.length == 0)
		return true;
	else
		return (key <= 13 || (key >= 48 && key <= 57));
}
</script>

<form name="templateForm" action="template.do" method="post" onSubmit="return templatefunction()">

<div class="Titulo" align=center><bean:message bundle="usersmodule" key="templates.ui.screen.template.title" /> </div>
<br/><br/>
<TABLE align=center>

<TR>
	<TD class="texto"></TD>
	<TD class="texto"><input type="hidden" name="templateId" value="<%=tvo.getTemplateId()%>" /></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.templateName"/></TD>
	<TD class="texto"><b><%=tvo.getTemplateName()%></b></TD>
	<input type="hidden" name="templateName" value="<%=tvo.getTemplateName()%>" />
</TR>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.description"/></TD>
	<TD class="texto"><textarea maxlength="512" name="description"></textarea></TD>
</TR>
<input type="hidden" name="ut" value="<%=tvo.getUserType()%>" >
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.usertype"/></TD>
	<TD class="texto"><select    name="userType"  class="bgFila2"/>
	<%@ page import="es.gateway.sesiones.obj.Perfil,java.util.Vector" %>
	<%
		List<Perfil> lista = (List<Perfil>) request.getAttribute("vectorPerfiles");
    	int totalPerfiles = lista.size();
	
		for (int k=0; k<totalPerfiles;k++){
           Perfil perfil = (Perfil)lista.get(k);
    %>
        <option value="<%=perfil.getIdProf()%>"><%=perfil.getDescripcion() %></option>
    <%}%>
    
	</select></TD>
</TR>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.ttlPassword"/></TD>
	<TD class="texto"><input type="text"  maxlength="4" name="ttlPassword" value="" onkeypress="return solonumerosynegativo(event, this)"></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.timeAdvice"/></TD>
	<TD class="texto"><input type="text" maxlength="4" name="timeAdvice" value="" onkeypress="return solonumeros(event)"></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.norPasswrods"/></TD>
	<TD class="texto"><input type="text" maxlength="2" name="norPasswrods" value="" onkeypress="return solonumeros(event)"></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.lfbBlockUser"/></TD>
	<TD class="texto"><input type="text" maxlength="2" name="lfbBlockUser" value="" onkeypress="return solonumeros(event)"></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.caseSensitive"/></TD>
	<TD class="texto"><input type="checkbox" name="caseSensitive" value="<%=csVal%>" /></TD>
	<input type="hidden" name="cs" value="<%=tvo.getCaseSensitive()%>"/>
	
</TR>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>	
<TR align=center>
	<TD class="texto"></TD>
	<input type="hidden" name="mode" value="">
	<td align=center colspan=2>
	<table>
	<tr >
	<td>
		<A HREF="#" onClick="Enviar(0)">
           <img src='images/Modificar.jpg' name='aceptar' ALT='Modificar' border="0">
        </a>
    </td>
    <td>
		<A HREF="#" onClick="Limpiar()">
           <img src='images/limpiar.gif' name='limpiar' ALT='Limpiar' border="0">
        </a>
    </td>
    <td>
		<A HREF="#" onClick="Enviar(1)">
           <img src='images/Back.jpg' name='volver' ALT='Volver' border="0">
        </a>
    </td>
	<!-- <TD class="texto"><input type="submit"  value="Guardar" onClick="return validations() " class="boton2" ></TD>
	<TD class="texto"><input type="reset"   value="Deshacer" class="boton2" onclick="resetea()"/></TD>
	<TD class="texto"><input type="submit"  value="Volver" onClick="modefun()" class="boton2"/></TD>
	-->
</tr>
   </table>
   </td>
</TR>
</TABLE>
<script language="javaScript">call();
	</script>
</form>

