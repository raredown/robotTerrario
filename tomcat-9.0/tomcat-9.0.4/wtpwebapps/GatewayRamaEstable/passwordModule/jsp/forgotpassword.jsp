<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<FORM METHOD="post" ACTION="getpassword.do">
<TABLE>
<tr><td >
<bean:message bundle="usersmodule" key="um.jsp.forgotpassword.enterusername"/>	
</td></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<TR>
	<TD class="formText"><bean:message bundle="usersmodule" key="um.jsp.forgotpassword.username"/></TD>
	<INPUT TYPE="hidden" NAME="subject" value='<bean:message bundle="usersmodule" key="um.jsp.forgotpassword.mail_subject"/>' >
	<INPUT TYPE="hidden" NAME="message" value='<bean:message bundle="usersmodule" key="um.jsp.forgotpassword.mail_text"/> '>

	
	<TD><INPUT TYPE="text" NAME="userid"/></TD>
</TR>
<TR>
	<TD></TD>
	<TD ><INPUT TYPE="submit"  class="login-button" value=<bean:message bundle="usersmodule" key="um.jsp.forgotpassword.getpassword"/>class="boton2"></TD>
</TR>
</TABLE>

</form>
