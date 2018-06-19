<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts.tld" prefix="c"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>

<script language="javaScript" src="passwordModule/jscripts/templateLoad.js">	</script>

<%
if(((java.util.List)request.getAttribute("searchresultAttribute")).isEmpty()) {
%>
<bean:message bundle="usersmodule" key="users.list.noUsersInDB"/>
<%
}else {
%>
<form name="templatelist" method="post" action="template.do" onSubmit="return templatefunction()">
<div class="Titulo" align="center"><fmt:message key="templates.ui.screen.templatelist.title"/></div>
<div>
  <table cellspacing="0">
     <thead class="" >
      <tr> 
<td width="10%" class="cabeceratabla" >&nbsp;</td>
        <td width="30%" class="cabeceratabla" ><strong><bean:message bundle="usersmodule" key="templates.ui.screen.templateName"/></strong></td>
        <td width="60%" class="cabeceratabla" ><strong><bean:message bundle="usersmodule" key="templates.ui.screen.description"/></strong></td>
       </tr>
    </thead>

   <tfoot class="" >
      <tr class="texto" style="text-align:center">
        <td colspan="4" class="texto" >
        	<!-- <input type="submit" value="Cargar plantilla" class="boton2" />-->
        	<A HREF="#" onClick="enviar()">
              <img src='images/cargar.gif' name='borra' ALT='Borrar' border="0">
        	</a>
        </td>
      </tr>
    </tfoot>
<tbody class="mytbody" >
<c:forEach var="templatelist" items="${searchresultAttribute}">
      <tr>
    	   <td class="texto" align="right"  style="text-align:right">
    	   <input name=templatecheck type=radio value="<c:out value="${templatelist.templateId}" />"/>  
           </td>
           <td class="texto" style="text-align:center">
           <c:out value="${templatelist.templateName}" />
		   </td>
		   <td class="texto" style="text-align:center">
		   <c:out value="${templatelist.description}" />
		   </td>
		  </tr>
		   
</c:forEach>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>
</tbody>
</table>
</div>
<input type="hidden" name="mode" value="Load Template" />
<% }  %>
</form>
