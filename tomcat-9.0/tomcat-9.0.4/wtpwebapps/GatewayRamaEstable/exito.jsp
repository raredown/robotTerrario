<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Enumeration,es.iecisa.log.LogUtil,es.iecisa.util.config.Config"%>
<%@page session="true" contentType="text/html;charset=iso-8859-1"%>
<HTML lang="Spanish">
	<HEAD>
	    <TITLE>
	    	<fmt:message key="titulo.exito" />
	    </TITLE>
	    <META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
	    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
	    <script language="JavaScript" src="js/util.js"></script>
	    <%@ include file="/jsp/include/javascript.jsp"%>
	
	    <script language="JavaScript">
	        function Volver(){     
				<%
				
					String accionStruts = null;
					String strAction = null; 
					String strAccion = null;
					HttpSession sesion = request.getSession(false);

					if (sesion !=null){
						accionStruts = (String) sesion.getAttribute("accionStruts");
						sesion.removeAttribute("accionStruts");
					}
					
					if (accionStruts != null && !accionStruts.trim().equals("")){
						strAction = accionStruts.substring(1, accionStruts.indexOf("@"));
						strAccion = accionStruts.substring(accionStruts.indexOf("@")+1);
					}
					if (strAction !=null && !strAction.equals(""))
					{      
				%>
			            document.theForm.action="<%=strAction%>";
    			        document.theForm.accion.value="<%=strAccion%>";
		      
		        <%
					}
					else
					{
				%>
		            document.theForm.action="MenuPrincipalJSP";
				<%		
					}
		        %>
        	    document.theForm.submit();
	        }
	    </script>
	</HEAD>
	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
	<%
	    String subtitulo1 = new String("texto.exito.subtitulo1");
	%>
	<%@include file="/jsp/include/cabeceraLogo.jsp"%>
	<%
	    String mensaje = (String) request.getAttribute("Mensaje");
	    if (mensaje == null)
	        mensaje = "";
	%>
	
		<script language="JavaScript">
		    var totalHeight=window.screen.availHeight - 211;
		    var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
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
			        <TD class=Titulo vAlign=top align="center" background="images/fondocentro.gif">
			            <br />
			            <DIV align=left class="Titulo">
			                &nbsp;&nbsp;
			            </DIV>
			            <br /><br />
			            <br /><br />
			            <br /><br />
			            <TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
			                <FORM METHOD=POST NAME="theForm">
							<input type="hidden" name="accion" value="">
			                    <TBODY>
			                        <TR>
			                            <TD class="texto" valing="center" align="center">
			                                <%=mensaje%>
			                                <br />
			                                <fmt:message key="texto.exito.info_centro" />
			                                <br />
			                            </TD>
			                        </TR>
			                        <tr>
			                            <TD class="itemmenubold" valing="center" align="center">
			                                <br />
			                                <script type="text/javascript">pintaBoton("<font class='texto2'>Volver</font>","Volver()","${imagesURL}")</script>
											<br />
			                            </TD>
			                        </tr>
			                    </TBODY>
			                </form>
			            </TABLE>
			            <P>
			                &nbsp;
			            </P>
			        </td>
			        <td width="10" class="Fondoverdederecha">
			            &nbsp;
			        </td>
			    </TR>
			</TBODY>
		</TABLE>
		<jsp:include page="/jsp/include/pie.jsp" flush="true" />
	</BODY>
</HTML>
