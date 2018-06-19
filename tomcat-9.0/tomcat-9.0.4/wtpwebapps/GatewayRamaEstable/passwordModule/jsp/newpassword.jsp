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

<link href="estilos/estilos.css" rel="stylesheet" type="text/css">


<FORM METHOD="post" ACTION="createnewpassword.do">
<%String userid=(String)session.getAttribute("username");%>
<%String oldpassword=(String)session.getAttribute("password");%>
<%session.setAttribute("username",userid); %>
<%session.setAttribute("oldpassword",oldpassword); %>
<center><html:errors /></center>
<input type=hidden name=userid value="<%=userid %>" />
<input type=hidden name=oldpassword value="<%=oldpassword%>" /> 
<TABLE>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="newpassword.enternewpassword"/></TD>
	<TD class="texto"><INPUT TYPE="password" NAME="newpassword1">
	<input type="hidden" name="userLoginMode" value="change"></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="newpassword.reenternewpassword"/></TD>
	<TD class="texto"><INPUT TYPE="password" NAME="newpassword2"></TD>
</TR>
<TR>
	<TD class="texto"></TD>
	<TD class="texto"><INPUT TYPE="submit" class="boton2" value=<bean:message bundle="usersmodule" key="newpassword.changepassword"/>></TD>
</TR>
</TABLE>


</FORM>
