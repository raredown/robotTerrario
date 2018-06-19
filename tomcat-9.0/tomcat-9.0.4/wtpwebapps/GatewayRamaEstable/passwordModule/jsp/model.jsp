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
<%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="cssURL" value="/css" />
<c:url var="imagesURL" value="/images"/>
<c:url var="jsURL" value="/js"/>
<html:html >
    <head>
        <title><tiles:insert attribute="title" /></title>
        <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="no-cache">
        <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="no-store">
        <META HTTP-EQUIV="EXPIRES" CONTENT="0">
        <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

        <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">
            <!--

            function applystyles() {
                var els = document.getElementsByTagName('input');
                var elsLen = els.length;
                var i = 0;
                for ( i=0;i<elsLen;i++ ) {
                    if ( els[i].getAttribute('type') ) {
                        if ( els[i].getAttribute('type') == "text" )
                            els[i].className = 'text';
                        else if ( els[i].getAttribute('type') == "button" )
                            els[i].className = 'button';
                        else if ( els[i].getAttribute('type') == "submit" )
                            els[i].className = 'submit';
                        else if ( els[i].getAttribute('type') == "radio" )
                            els[i].className = 'radio';
                        else if  ( els[i].getAttribute('type') == "checkbox" )
                            els[i].className = 'checkbox';
                        else
                            els[i].className = 'text';

                    }
                }
            }

            //-->
        </SCRIPT>

    </head>

    <BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
    <%@include file="include/cabeceraLogo.jsp"%>
    <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
        <TR>
            <td width="10" class="Fondoverdederecha">
                &nbsp;
            </td>
            <td vAlign=top width="180" class="celdalineaderecha"><tiles:insert attribute="menu" /><br></td>
            <td class="Titulo" vAlign="top" align="center" background="images/fondocentro.gif" align="center">
                <br><br>
                <tiles:insert attribute="body" />
            </td>
            <td width="10" class="Fondoverdederecha">
                &nbsp;
            </td>
        </tr>
     </table>
     <tiles:insert attribute="footer" />
     
     <!-- Añadido pie para elimar la sesión activa -->
     <jsp:include page="/passwordModule/jsp/include/pie.jsp" flush="true" />
    </body>

</html:html>
