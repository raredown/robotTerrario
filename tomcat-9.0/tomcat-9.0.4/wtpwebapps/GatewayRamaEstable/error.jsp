<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="sesiones.util.ErrorControl"%>
<%@ page import="org.apache.commons.logging.Log"%>
<%@ page import="org.apache.commons.logging.LogFactory"%>
<c:url var="imagesURL" value="/images" />
<c:url var="cssURL" value="/estilos" />
<c:url var="jsURL" value="/js" />

<html:html>
<HEAD>
	<TITLE>ERROR</TITLE>
	<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	<link rel="stylesheet" href='${cssURL}/estilos.css'>
	<script language="javascript" src='${jsURL}/util.js'></script>

</HEAD>

<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

	<!-- Insercion de Cabecera -->


	<%@include file="/jsp/include/cabeceraLogo.jsp"%>
	<script language="JavaScript">
      var tabla="<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
    </script>
	<TBODY>
		<TR>
			<td width="10" class="Fondoverdederecha">
				&nbsp;
			</td>
			<TD vAlign=top width="180" class="celdalineaderecha">
				<%@include file="/jsp/include/menu.jsp"%>
			</TD>
			<!-- InstanceBeginEditable name="contenido" -->
			<TD class=Titulo vAlign=top align=center
				background="images/fondocentro.gif">
				<br>
				<DIV align=left class="Titulo">
					&nbsp;&nbsp;&nbsp;
				</DIV>
				<CENTER>
					<br>
					<br>
					<br>
					<table>
						<tr>
							<td class="texto5" align="center">
								<%  String textError = "";
							ErrorControl  objError=new ErrorControl();
							Throwable e = (Throwable) request.getAttribute("javax.servlet.error.exception");
							Exception ex=(Exception) request.getAttribute("javax.servlet.error.exception");
							Exception errData=(Exception) request.getAttribute("javax.servlet.jsp.ErrorData");
							
																		
							try{
								if (e != null) 
								{
									textError = e.toString();
									Log logError = LogFactory.getLog(textError);
									out.print("Código de incidencia - " + objError.pintarLog((Exception)e));						
								}
								else if(ex != null)
								{
									textError = ex.toString();
									Log logError = LogFactory.getLog(textError);
									out.print("Código de incidencia - " + objError.pintarLog(ex));					
								}
							
								else
								{
									if(request.getAttribute("javax.servlet.error.exception_type")!= null)
										out.println("<br>Tipo excepcion - " + request.getAttribute("javax.servlet.error.exception_type").toString());
									if(request.getAttribute("javax.servlet.error.status_code")!= null)
										out.println("<br>Código de estado - " +  request.getAttribute("javax.servlet.error.status_code").toString());
									if(request.getAttribute("javax.servlet.error.request_uri")!= null)
										out.println("<br>Uri - " +  request.getAttribute("javax.servlet.error.request_uri").toString());
									if(request.getAttribute("javax.servlet.error.message")!= null)
										out.println("<br>incidencia - " +  request.getAttribute("javax.servlet.error.message").toString());
									if(request.getAttribute("javax.servlet.error.servlet_name")!= null)
										out.println("<br>Nombre del servlet - " +  request.getAttribute("javax.servlet.error.servlet_name").toString());
								}
								
							}
							catch(Exception esc)
							{
								textError = esc.toString();
								Log logError = LogFactory.getLog(textError);
								out.print("Código de incidencia - " + objError.pintarLog(esc));			
							}
						%>
								<p>
									<% if(textError!=null&&!textError.equals("")){%>
									Mensaje
									<%=textError%>
									<%}%>
								</p>
							</td>
						</tr>
					</table>
				</CENTER>
				<br>
				<br>
				<%--Nueva imagen--%>
			</td>
			<td width="10" class="Fondoverdederecha">
				&nbsp;
			</td>
		</TR>
	</TBODY>
	<jsp:include page="include/pie.jsp" flush="true" />
	
	<%
	HttpSession sesion = request.getSession(false);

	if (sesion !=null){
		sesion.removeAttribute("accionStruts");
	}
	
	%>

</BODY>


</html:html>
