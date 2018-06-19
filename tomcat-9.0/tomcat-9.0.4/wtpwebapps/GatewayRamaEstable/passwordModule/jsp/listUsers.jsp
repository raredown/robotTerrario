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
  <table>
  <tr><td><bean:message key="form.listUsers.title" /></td></tr>
  <logic:iterate id="users" name="LISTS" indexId="index">
  <tr><td><bean:write name="user" property="name1" /></td></tr>
  </logic:iterate>
  </table>
 
