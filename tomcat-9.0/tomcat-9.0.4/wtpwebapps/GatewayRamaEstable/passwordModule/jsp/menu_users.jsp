<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/struts-html" prefix="html"%>

<div class="texto">
    <li>
        <html:link page="/newuser.do">
            <bean:message bundle="usersmodule" key="users.ui.screen.link.users"/>
        </html:link>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:link page="/newuser_query.do">
        <bean:message bundle="usersmodule" key="users.ui.screen.link.users.query"/>
    </html:link>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:link page="/newuser_new.do">
        <bean:message bundle="usersmodule" key="users.ui.screen.link.users.newuser"/>

    </html:link>
        <br>
    </li>

    <li>
        <html:link page="/newtemplate.do">
            <bean:message bundle="usersmodule" key="users.ui.screen.link.template"/>
        </html:link>
        <br>
    </li>
    <li>
        <html:link page="/home.jsp">
            <fmt:message key="templates.ui.screen.link.logout"/>
        </html:link>
    </li>
</div>
