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

<%
	String msg = (String)request.getAttribute("SYS_MSG");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <h4><%if(msg!=null)
        out.println(msg); %></h4>
