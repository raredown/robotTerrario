<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<h2><bean:message bundle="usersmodule" key="credentialserror.checkunamepword"/>
<html:link page="/home.jsp"><bean:message bundle="usersmodule" key="newpassword.checkunameandpword"/></html:link>
