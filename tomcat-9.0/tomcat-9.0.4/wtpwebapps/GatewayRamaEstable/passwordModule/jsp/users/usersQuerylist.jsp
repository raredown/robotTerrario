<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page import="es.gateway.sesiones.users.vo.UserDetailsVo" %>
<%@ page import="es.iecisa.util.conexion.Registro" %>

<html:html>

<center> <html:errors/></center>

<center>
	<script language="javaScript" src="passwordModule/jscripts/usersQuerylist.js"></script>
	
		<body>
			<table cellspacing="0" width="50%">
			<form name="userlist" action="userinfo.do" method="post">
				<div>
					<% List list=(List)session.getAttribute("searhlist");
                    %>
						
    				<%	try{
  							Iterator it = list.iterator();
  							Iterator it1 = list.iterator();
 							boolean b = false;
 							if (it.hasNext()){
	 				%>
 					<thead>
      					<tr class="cabeceratabla" >
							<td width="10%" class="cabeceratabla" >&nbsp;</td>
 							<td width="30%" class="cabeceratabla" ><bean:message bundle="usersmodule" key="users.ui.screen.userid"/></td>
	 						<td width="60%" class="cabeceratabla" ><bean:message bundle="usersmodule" key="users.ui.screen.email"/></td>
	 					</tr>
					</thead>
					<tbody>
							<%
								while (it.hasNext()){
		  								UserDetailsVo vo=(UserDetailsVo)it.next();
		 					%>
					   <tr> 
					   	<td width="10%" class="texto" align="right" style="text-align:right"> <input type="radio" name="usercheck" value="<%=vo.getUserid()%>" /> </td>
					   	<td width="30%" class="texto" style="text-align:center"><%=vo.getUserid()%> </td>
					   	<td width="60%" class="texto" style="text-align:center"><%=vo.getEmail()%></td>
					   </tr>
						<%
                            b=true;
     				 		 }%>
                      </tbody>
	  					<%
							}else {
						%>	
  							<tr>
  							<td colspan="3">
  								<bean:message bundle="usersmodule" key="users.list.noUsersInDB"/>
  							</td>
  							</tr>
						<%
 							}
  							if(b) {
  						%>
                    <tr>
  							<td colspan="3">
  								&nbsp;
  							</td>
  					</tr>
                      <tfoot class="" >
						<tr class="texto" >
							<input type="hidden" name="mode" value="">
							<td colspan=4  class="texto" align=center>
							<A HREF="#" onClick="userfunction()">
                        		<img src='images/Modificar.jpg' name='modifica' ALT='Modificar usuario' border="0">
                      		</a>
                      		<A HREF="#" onClick="viewcall()">
                        		<img src='images/Visualizar.jpg' name='visualiza' ALT='Ver' border="0">
                      		</a>
                      		<A HREF="#" onClick="deletecall()">
                        		<img src='images/Eliminar.jpg' name='borrar' ALT='Borrar usuario' border="0">
                      		</a>
								<!-- <input type="submit"  value="Editar" onClick="return userfunction()" class="boton2"/>
								<input type="submit"  value="Ver" onClick="return viewcall()" class="boton2"/>
								<input type="submit"  value="Borrar" onClick="return deletecall()" class="boton2"/>-->
							</td>
    					</tr>
	 				</tfoot>
				
						<% 
  							}
  							}catch(Exception e) {
	  						}
  						%>
				</div>
			</form>
			</table>
		</body>
</center>
</html:html>
