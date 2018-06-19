<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@page import="java.io.File" %>
<%@page import="org.apache.log4j.Logger" %>
<%@page import="es.gateway.sesiones.users.utils.core.LoadUtility" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<HTML>
<HEAD>
    <title>User Module </title>
    <%
        HttpSession session = request.getSession();
        session.removeAttribute("userId");
        Logger logger = Logger.getLogger("home");
        logger.info("comign herere"); 
        java.util.Locale local = java.util.Locale.getDefault();
        String locString= local.getLanguage()+"_"+ local.getCountry();
        LoadUtility util = new LoadUtility();
        session.setAttribute("utility",util.getProperties());
      
    %>
    <TITLE><fmt:message key="um.home.title"/></TITLE>
    <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="js/util.js"></script>

    <script language="javascript">
        <!--

        function applystyles()
        {
            document.getElementById("userId").focus();
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

        function submitaForm(val){

            document.form1.userLoginMode.value="";
            document.form1.action=val;
            document.form1.submit();
        }

        function submit(){
            document.form1.submit();

        }

        function reset(){
            document.form1.userId.value="";
            document.form1.password.value="";
        }
		
        //-->
		function deshabilitaBoton(){
		    if (document.forms['form1'].debug.value == "false"){
				deshabilita();
			}
		}

    </script>
</HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" onload="applystyles();deshabilitaBoton();">
<%@include file="jsp/include/cabeceraAuth.jsp"%>
<%--<%@include file="/cabeceraLogo.jsp"%>--%>
<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
    <TR>
        <td width="10" class="Fondoverdederecha">
            &nbsp;
        </td>
        <td vAlign=top width="180" class="celdalineaderecha"><%@include file="jsp/include/menu_vacio.jsp"%><br></td>
        <td class="Titulo" vAlign="top" align="center" background="images/fondocentro.gif" align="center">

            <p>
                &nbsp;
            </p>
            <br><br>
            <c:set var="loc" value="<%=locString%>"/>
            <fmt:setLocale value="${loc}" />
            <%
                String path = java.io.File.separator;
                //String propPath="com"+path+"usermodule"+path+"users"+path+"struts"+path+"resources"+path+"ApplicationResources";
                String propPath="es.gateway.sesiones"+path+"resources"+path+"ApplicationResources";
            %>
            <fmt:bundle basename="<%=propPath %>">
                <table width="60%">
                    <tr>
                        <td class="Titulo" align="center">
                            <fieldset>
                                <legend><bean:message key="login.usermanagement.legend" /></legend>
                                 <form id="form1" name="form1" method="post" action="login.do" onkeypress="if(event.keyCode==13){javascript:submit();}">
                                    <input type="hidden" name="debug" id ="debug" value="${requestScope.debug}"/>
                                    <center><html:errors/></center><br> 
                                    <TABLE align=center width="90%">
                                            <TR>
                                                <TD class="texto2" align="right" width="40%"><fmt:message  key="um.home.userid"/></TD>
                                                <TD class="texto2" align="left" width="50%" ><input type="text" name="userId" id="userId" /></TD>
                                            </TR>
                                            <TR>
                                                <TD class="texto2" align="right" width="40%"><fmt:message key="um.home.password" /></TD>
                                                <TD class="texto2" align="left" width="50%"><input type="password" name="password"/></TD>
                                            </TR>
                                            <input type="hidden" name="userLoginMode" value="true"/>
                                            <TR>
                                                <TD class="texto2" colspan="2" align="center">
                                                    <br>
                                                    <table>
                                                       <tr>
                                                        <td>
                                                          <A HREF="#" onClick="submit();return false"> <img src='images/Aceptar.jpg' name='aceptar' ALT='aceptar' border="0"></A>
                                                        </td>
                                                        
                                                        <TD class="texto2">
                                                           <A HREF="#" onClick="javascript:window.history.go(-1);"> <img src='images/Back.jpg' name='aceptar' ALT='reset' border="0"></A>
                                                        </TD>
                                                       </tr>
                                                    </table>
                                                </TD>

                                            </TR>
                                            <tr>
                                                <td class="texto" align="right" colspan="2">
                                                    <br><br>
                                                   <a  onclick="submitaForm('getpassword.do')" href="#"><fmt:message key="um.home.forgotpassword"/></a>
                                                    &nbsp;&nbsp;
                                                    <a  onclick="submitaForm('changePassword.do')" href="#" ><fmt:message key="um.home.changepassword"/></a></td>
                                            </tr>

                                        </TABLE>
                                </form>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </fmt:bundle>
        </td>
        <td width="10" class="Fondoverdederecha">
            &nbsp;
        </td>

    </TR>

</table>

</BODY>
</HTML>
