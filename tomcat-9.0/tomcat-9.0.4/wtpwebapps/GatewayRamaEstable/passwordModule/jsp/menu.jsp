<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<c:url var="imagesURL" value="/images"/>

<table cellspacing='0' cellpadding='0' width="100%" border=0>
		<!-- <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		          <TD valign="top">&nbsp;</TD>
		          <TD width=6 valign="top">&nbsp;</TD>
		          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
		          <TD valign="top" class="itemmenubold">
		          	<A href="userquerylist.do" onMouseOver="window.status='Usuarios';return true" onMouseOut="window.status=' '" class="itemmenu">
		            	<bean:message bundle="usersmodule" key="users.ui.screen.link.users"/>
		   			</a>
		          </TD>
		</TR>-->
		<tr>
		<TD>&nbsp;</TD>
		</tr>		
		
		<TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <A href="userquerylist.do" onMouseOver="window.status='Usuarios';return true" onMouseOut="window.status=' '" class="itemmenu">
                <bean:message bundle="usersmodule" key="users.ui.screen.link.users"/>
              </A>
          </TD>
    	</TR>
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		          <TD valign="top">&nbsp;</TD>
		          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
		          <TD valign="top" class="itemmenu">
		          	<A href="searchUser.do" onMouseOver="window.status='Consulta Usuario';return true" onMouseOut="window.status=' '" class="itemmenu">
		            	<bean:message bundle="usersmodule" key="users.ui.screen.link.query"/>
		   			</a>
		          </TD>
		</TR>
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		          <TD valign="top">&nbsp;</TD>
		          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
		          <TD valign="top" class="itemmenu" >
		          	<A href="newuser.do" onMouseOver="window.status='Nuevo Usuario';return true" onMouseOut="window.status=' '" class="itemmenu">
		            	<bean:message bundle="usersmodule" key="users.ui.screen.link.new"/>
		   			</a>
		          </TD>
		</TR>
		
		
		<!--  <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		          <TD valign="top">&nbsp;</TD>
		          <TD width=6 valign="top">&nbsp;</TD>
		          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
		          <TD valign="top" class="itemmenubold">
		          	<A href="templatelist.do" onMouseOver="window.status='Plantilla';return true" onMouseOut="window.status=' '" class="itemmenu">
		            	<bean:message bundle="usersmodule" key="templates.ui.screen.link.template"/>
		   			</a>
		          </TD>
		</TR>-->
		<tr>
		<TD>&nbsp;</TD>
		</tr>		
		
		<TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <A href="templatelist.do" onMouseOver="window.status='Plantilla';return true" onMouseOut="window.status=' '" class="itemmenu">
                <bean:message bundle="usersmodule" key="templates.ui.screen.link.template"/>
              </A>
          </TD>
    	</TR>
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenu">
          	<A href="newtemplate.do" onMouseOver="window.status='Nueva Plantilla';return true" onMouseOut="window.status=' '" class="itemmenu">
            	<bean:message bundle="usersmodule" key="templates.ui.screen.link.newtemplate"/>
   			</a>
          </TD>
		</TR>
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
  		   <TD valign="top" class="itemmenu">
          	<A href="deleteTemplate.do" onMouseOver="window.status='Borrar Plantilla';return true" onMouseOut="window.status=' '" class="itemmenu">
          		<bean:message bundle="usersmodule" key="templates.ui.screen.link.deleteTemplate"/>
   			</a>
          </TD>
		</TR>
		
		<tr>
		<TD>&nbsp;</TD>
		</tr>		
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		          <TD valign="top">&nbsp;</TD>
		          <!-- <TD width=6 valign="top">&nbsp;</TD>-->
		           <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
		          
		          <TD valign="top" class="itemmenubold">
		          	<A href="MenuPrincipalJSP" onMouseOver="window.status='Salir';return true" onMouseOut="window.status=' '" class="itemmenu">
		            	<bean:message bundle="usersmodule" key="templates.ui.screen.link.logout"/>
		   			</a>
		          </TD>
		</TR>
</table>		
