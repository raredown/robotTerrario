<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<div class="texto">
    <bean:message bundle="usersmodule" key="um.jsp.usernamewrong.usernotfound"/>
    <html:link page="/home.jsp"><bean:message bundle="usersmodule" key="um.jsp.usernamewrong.checkusername"/></html:link>
</div>


