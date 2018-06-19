<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@page import="es.gateway.sesiones.users.utils.core.LabelValueBean, es.gateway.sesiones.users.utils.core.PropertyValueBean, es.gateway.sesiones.users.struts.constants.ConfigurationFilesPath" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  	<LINK rel="stylesheet" type="text/css" href="/css/stilos.css">
  	<script language="javaScript" src="passwordModule/jscripts/edituserdetails.js"> </script>
</HEAD>
<body>
<form name="editdetailsForm" action="userDetails.do" method="post">
<table>
	
	<% 
		try{
		if(request.getAttribute("columnnameattribute")!=null){
	
			PropertyValueBean propBean= new PropertyValueBean();
			propBean.setPath(ConfigurationFilesPath.USER_DETAILS_PROPERTIES);
			java.util.Map ls = (java.util.Map)request.getAttribute("columnnameattribute");
			Set se= ls.keySet();
			Iterator it = se.iterator();
			while(it.hasNext()){
				String name = (String)it.next();
				String nameParam="";
	
				if(ls.get(name)!=null && !(ls.get(name).toString().equals("null"))){
				nameParam=ls.get(name).toString();
			}
			 if(name.equalsIgnoreCase("userid")){ 
			  %>
			  <input type="hidden" name="<%=name %>" value="<%=nameParam%>"/>
			  <%}else{ %>
			  <tr><TD class="texto"> <%=propBean.getPropertyValue(name)%>   </td><TD class="texto"><input type="text" name="<%=name %>" value="<%=nameParam%>"></td></tr>
	    	  <%
			  }
			}
		}
		%>
		<input type="hidden" name="mode" value="" />
		<tr><TD>
		<!-- <input type="submit"  value="Guardar" onClick="return emailvalidation()" class="boton2"/>-->
		<A HREF="#" onClick="enviar()">
              <img src='images/Aceptar.jpg' name='aceptar' ALT='Aceptar' border="0">
        </a>
		</td></tr>
		<%
		}catch(Exception e) {
			out.println("exep"+e);
		}

%>
 
	
</table>
</form>
</body>
</html:html>
