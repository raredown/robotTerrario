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

<form name="validteUserForm" action="template.do" method="post">
    <center><html:errors /></center>
    <div align=center class="Titulo"><bean:message bundle="usersmodule" key="users.ui.screen.template.title" /> </div>

    <TABLE align=center>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.templateId" /></TD>
            <TD class="texto"><input type="text" name="templateId"/></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.templateName"/></TD>
            <TD class="texto"><input type="text" name="templateName"/></TD>
        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.ttlPassword" /></TD>
            <TD class="texto"><input type="text" name="ttlPassword"/></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.timeAdvice"/></TD>
            <TD class="texto"><input type="text" name="timeAdvice"/></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.norPasswrods"/></TD>
            <TD class="texto"><input type="text" name="norPasswrods"/></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.lfbBlockUser"/></TD>
            <TD class="texto"><input type="text" name="lfbBlockUser"/></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.caseSensitive"/></TD>
            <TD class="texto"><input type="text" name="caseSensitive"/></TD>
        </TR>
        <TR>
            <TD class="texto"></TD>
            <TD class="texto"><html:submit/></TD><TD><html:cancel/></TD>

        </TR>
    </TABLE>
</form>
