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

<div class="texto">
    <bean:message bundle="usersmodule" key="passworddiffered.reenteredpasswordnotmatching"/>
    <html:link page="/home.jsp"><bean:message bundle="usersmodule" key="passworddiffered.tryagain"/></html:link>
</div>    


