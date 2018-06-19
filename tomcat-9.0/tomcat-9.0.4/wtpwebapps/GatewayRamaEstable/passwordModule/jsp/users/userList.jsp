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
<%@ page import="java.util.List" %>

<script language="javaScript" src="passwordModule/jscripts/userList.js"></script>

<form name="userlist" action="userinfo.do" onSubmit="return userfunction()" method="post">
 <%  java.util.List list=null;
     if(request.getAttribute("userListattribute")!=null){
		 list = (List)request.getAttribute("userListattribute");
		
       }else if(session.getAttribute("searhlist")!=null){
		list = (List)session.getAttribute("searhlist");
	
      }
     request.setAttribute("listAttribute",list);

      if(((java.util.List)request.getAttribute("listAttribute")).isEmpty()) {
%>

<bean:message bundle="usersmodule" key="users.list.noUsersInDB"/>
<%
       }else {

%>
  <div>
  <table cellspacing="0">
     
     <thead class="" >
      <tr>
			<td width="5%" class="cabeceratabla" >&nbsp;</td>
 	 		<td width="35%" class="cabeceratabla" ><bean:message bundle="usersmodule" key="users.ui.screen.userid"/></td>
 	 		<td width="60" class="cabeceratabla"><bean:message bundle="usersmodule" key="users.ui.screen.email"/></td>

	 </tr>
</thead>
<tfoot class="" >
	 <tr class="texto" >
	 <td colspan="4" class="texto" style="text-align:center"><input type="submit" value="Editar" class="boton2"></td>
      </tr>
    </tfoot>
<tbody class="texto" >

  <c:forEach var="userList" items="${listAttribute}">
       <tr>
    	   <td class="texto" align="right" style="text-align:right">  <input name=usercheck type=radio value="<c:out value="${userList.userid}" />"/></td>
          <td class="texto" style="text-align:center">
           <c:out value="${userList.userid}" />
		   </td>
		   <td class="texto" style="text-align:center">
           		<c:out value="${userList.email}" />
		   </td>
	 </tr> 
		   
</c:forEach>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>
<% } %>	
</tbody>
</table>
</div>
</form>



