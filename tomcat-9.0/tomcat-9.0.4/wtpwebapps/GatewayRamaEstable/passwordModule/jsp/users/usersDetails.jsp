<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@page import="java.util.*"%>
<%@page import="es.gateway.sesiones.users.utils.core.*"%>
<%@page import="es.gateway.sesiones.users.struts.constants.ConfigurationFilesPath"%>
<script language="javaScript" src="passwordModule/jscripts/usersDetails.js"></script>

<center>
<form name="userDetailsForm" action="userDetails.do" method="post">
<table>
<TR>
	<TD><input type="hidden" name="mode" value="create"/></TD>
</TR>
<input type ="hidden" name="userid" value="<%=session.getAttribute("userid").toString()%>"/>
  <!-- tr><TD class="texto">EMAIL </td> <TD class="texto"> :<input type ="text" name="email" /></td></tr-->
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

  <tr><TD class="texto">
  		<!-- <input type="submit"  value="Crear" onClick="return emailvalidation()" class="boton2">-->
  		<A HREF="#" onClick="Enviar()">
     <img src='images/Manten1.jpg' name='crear' ALT='Crear Usuario' border="0">
 </a>
  </td></tr>
   </table>
      </form>
   </center>
