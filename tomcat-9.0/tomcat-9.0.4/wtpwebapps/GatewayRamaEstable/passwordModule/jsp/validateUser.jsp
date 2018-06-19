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

<form name="validteUserForm" action="validateUser.do" method="post">
<center><html:errors /></center>
<h3 align=center><bean:message bundle="usersmodule" key="users.ui.screen.listUsers.title" /> </h3>
<TABLE align=center>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.userid" /></TD>
	<TD class="texto"><input type="text" name="userId"/></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.password"/></TD>
	<TD class="texto"><input type="password" name="password"/></TD>
</TR>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.email" /></TD>
	<TD class="texto"><input type="text" name="email"/></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.firstname"/></TD>
	<TD class="texto"><input type="text" name="firstName"/></TD>
</TR>
<TR>
	<TD class="texto"></TD>
	<TD class="texto"><html:submit/></TD><TD class="texto"><html:cancel/></TD>

</TR>
</TABLE>
</form>
