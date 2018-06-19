<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="es.gateway.sesiones.users.utils.core.*"%>
<%@page import="es.gateway.sesiones.users.struts.constants.ConfigurationFilesPath"%>

<html:html>
<head>
	<LINK rel="stylesheet" type="text/css" href="/css/stilos.css">
	
	<script language="javaScript">
	function emailvalidation(){
		if(document.userDetailsForm.userid.value=="" && document.userDetailsForm.EMAIL.value=="" && document.userDetailsForm.LASTNAME.value=="" && document.userDetailsForm.FIRSTNAME.value=="" && document.userDetailsForm.MIDDLENAME.value=="" && document.userDetailsForm.TELEFONO.value=="" && document.userDetailsForm.FAX.value==""){
	         alert("Ingrese al menos un campo. ")
	         return false
	     }
//		if(document.userDetailsForm.EMAIL.value!=""){
//	          var x=document.userDetailsForm.EMAIL.value;
//	          var y= /^([a-zA-Z0-9\-\.\_])+\@(([a-zA-Z])+\.)+([a-zA-Z]{2,4})+$/;
//	          if(!(y.test(x)))
//	          {
//	                alert("Ingrese un correo electrónico correcto.")
//	                return false;
//	           }
//	     } 
	     return true;
	} 
	
	function Enviar(){

		var f = document.userDetailsForm;
		if(emailvalidation()){
		f.submit();	
	}
	
}
	</script>
</head>
<body>
	  <form name="userDetailsForm" action="usersQuery.do" method="post">
    	  <table>
	 		<TR>
				<TD class="texto"><input type="hidden" name="mode" value="query"/></TD>
			</TR>
			<tr>
				<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.userid"/> </td> <TD class="texto"> :<input type ="text" name="userid" /></td></tr>
	  		<!-- tr>
	  			<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.email"/> </td> <TD class="texto"> :<input type ="text" name="email" /></td></tr-->
			<%
			es.gateway.sesiones.users.utils.core.PropertyValueBean pb = new es.gateway.sesiones.users.utils.core.PropertyValueBean();
			pb.setPath(ConfigurationFilesPath.USER_DETAILS_PROPERTIES);  
			Collection col = pb.getProperties();
			  Iterator it = col.iterator();
			  while (it.hasNext()){
				  PropertyValueBean pair = (PropertyValueBean)it.next();
			      pair.setPath(ConfigurationFilesPath.USER_DETAILS_PROPERTIES);
				  if(!("TABLENAME".equals(pair.getProperty()))){
			      %>
			     <tr> <TD class="texto"><%=pair.getValue()%> </td>
			     <TD class="texto">  :<input type="text" name="<%=pair.getProperty()%>" value="" /></td></tr>
			      <%
			      }
			  }
			  
			  %>
			  	<tr>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
	    	<TR>
				<TD align=center colspan=2>
				
				<!-- <input type="submit"  value="Consultar" name ="consultar" onClick="return emailvalidation()" class="boton2" /></TD>
				-->
				<A HREF="#" onClick="Enviar()">
                        <img src='images/Consul5.jpg' name='consultar' ALT='<fmt:message key="texto.autenticacion.altaceptar" />' border="0">
                      </a>
			</TR>
	    </table>
    </form>
</body>
</html:html>

