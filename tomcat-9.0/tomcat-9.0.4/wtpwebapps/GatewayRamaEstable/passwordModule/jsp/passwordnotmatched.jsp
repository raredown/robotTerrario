<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>

<div class="texto">
    <bean:message bundle="usersmodule" key="passwordnotmatched.failure"/>
    <br>
    <html:link page="/home.jsp"> <bean:message bundle="usersmodule" key="login.usernotfound.homepage" /> </html:link>
</div>    
