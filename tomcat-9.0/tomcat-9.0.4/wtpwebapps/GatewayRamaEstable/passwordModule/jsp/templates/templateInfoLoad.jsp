<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>


<% String csVal="N";
es.gateway.sesiones.users.vo.TemplateVo tvo = (es.gateway.sesiones.users.vo.TemplateVo)request.getAttribute("templatedataattribute");%>

<html:html>

	<HEAD>
		<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<LINK rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/stilos.css">
		<script language="javaScript">
		
		function call(){
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
		</script>
		<script language="javaScript" src="passwordModule/jscripts/templateInfoLoad.js"></script>
	</HEAD>
	<body>
		<form name="templateForm" method="post" action="template.do">
		
		<div class="Titulo" align=center><bean:message bundle="usersmodule" key="templates.ui.screen.template.title" /> </div>
		
		<TABLE align=center>
		
		<TR>
			<TD class="texto"></TD>
			<TD class="texto"><input type="hidden" name="templateId" value="<%=tvo.getTemplateId()%>" /></TD>
		</TR>
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.templateName"/></TD>
			<TD class="texto"><input type="text" maxlength="40" name="templateName" value="" /></TD>
		</TR>
		
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.description"/></TD>
			<TD class="texto"><textarea maxlength="512" name="description"><%=tvo.getDescription()%></textarea></TD>
		</TR>
		<input type="hidden" name="ut" value="<%=tvo.getUserType()%>" >
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.usertype"/></TD>
			<TD class="texto"><select    name="userType"  class="bgFila2"/>
				<%@ page import="es.gateway.sesiones.obj.Perfil,java.util.Vector" %>
				<%
					Vector vPerfiles=(Vector) session.getAttribute("vectorPerfiles");
			    	int totalPerfiles = vPerfiles.size();
				
					for (int k=0; k<totalPerfiles;k++){
			           Perfil perfil = (Perfil)vPerfiles.elementAt(k);
			    %>
			        <option value="<%=perfil.getIdProf()%>"><%=perfil.getDescripcion() %></option>
			    <%}%>
			    
				</select></TD>
		</TR>
		
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.ttlPassword"/></TD>
			<TD class="texto"><input type="text" maxlength="4" name="ttlPassword" value="<%=tvo.getTtlPassword()%>"/></TD>
		</TR>
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.timeAdvice"/></TD>
			<TD class="texto"><input type="text" maxlength="4" name="timeAdvice" value="<%=tvo.getTimeAdvice()%>" /></TD>
		</TR>
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.norPasswrods"/></TD>
			<TD class="texto"><input type="text" maxlength="2" name="norPasswrods" value="<%=tvo.getNorPasswrods()%>"/></TD>
		</TR>
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.lfbBlockUser"/></TD>
			<TD class="texto"><input type="text" maxlength="2" name="lfbBlockUser" value="<%=tvo.getLfbBlockUser()%>"/></TD>
		</TR>
		<TR>
			<TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.caseSensitive"/></TD>
			<TD class="texto"><input type="checkbox" name="caseSensitive" value="<%=csVal%>" /></TD>
		<input type="hidden" name="cs" value="<%=tvo.getCaseSensitive()%>"/>
			
		</TR>
		<TR align=center>
			<TD></TD>
			<input type="hidden" name="mode" value="">
			<td align=center colspan=2>
			<table>
			<tr >
			<td>
		<A HREF="#" onClick="Enviar(0)">
           <img src='images/Aceptar.jpg' name='aceptar' ALT='Aceptar' border="0">
        </a>
    </td>
    <td>
		<A HREF="#" onClick="Limpiar()">
           <img src='images/limpiar.gif' name='limpiar' ALT='Limpiar' border="0">
        </a>
    </td>
    <td>
		<A HREF="#" onClick="Enviar(1)">
           <img src='images/cargar.gif' name='cargar' ALT='Cargar' border="0">
        </a>
    </td>
			<!-- <TD><input type="submit"  value="Crear" onClick="return validations()" class="boton2"></TD>
			<TD><input type="reset"   value="Borrar" class="boton2"/></TD>
			<TD><input type="submit"  value="Cargar" onClick="return setModeToLoad()" class="boton2"/></TD>
			-->
			
		</tr>
		   </table>
		   </td>
		</TR>
		</TABLE>
		<script language="javaScript">call();
			</script>
		</form>
	</body>
</html:html>
