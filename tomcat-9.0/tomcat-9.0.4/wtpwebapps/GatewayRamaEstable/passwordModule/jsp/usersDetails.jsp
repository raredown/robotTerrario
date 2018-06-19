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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.*"%>
<%@page import="es.gateway.sesiones.users.utils.core.*"%>
<%@page import="es.gateway.sesiones.users.struts.constants.ConfigurationFilesPath"%>
<center>
<form name="userDetailsForm" action="userDetails.do" method="post">
<table>
<TR>
	<TD><input type="hidden" name="mode" value="create"/></TD>
</TR>
  <%
  es.gateway.sesiones.users.utils.core.PropertyValueBean pb = new es.gateway.sesiones.users.utils.core.PropertyValueBean();
	pb.setPath(ConfigurationFilesPath.USER_DETAILS_PROPERTIES);
	Collection col = pb.getProperties();
  Iterator it = col.iterator();
  while (it.hasNext()){
	  PropertyValueBean pair = (PropertyValueBean)it.next();
      pair.setPath(ConfigurationFilesPath.USER_DETAILS_PROPERTIES);
      %>
     <tr> <td class="texto"><%=pb.getValue()%></td>
     <td class="texto">  <input type="text" name="<%=pair.getProperty()%>" value="<%=pair.getValue()%>" /></td></tr>
      <%
  }
  
  %>
    <TR>
	
	<TD colspan=2 align=center class="texto"><html:submit/><html:cancel/></TD>

</TR>
   </table>
      </form>
   </center>
