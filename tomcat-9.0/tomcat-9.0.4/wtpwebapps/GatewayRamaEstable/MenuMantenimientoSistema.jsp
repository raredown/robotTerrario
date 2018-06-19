<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Men&uacute; parámetros de la aplicación");
    String operador = (String) request.getAttribute("OperadorConexion");
    String nameOperador = (String) request.getAttribute("NameOperadorConectado");
    if(nameOperador==null)
        nameOperador="";
  %>
  
 <%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 211;
      var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
        <script language="JavaScript">
		//Función que permite abrir el fichero de ayuda correspondiente a la página

		function lanzaFormulario(accionName, numForm){
			f = document.getElementById('theForm' + numForm);
			f.action = accionName;
			f.submit();
		}
		</script>
        <TBODY>
        <TR>
          <td width="10" class="Fondoverdederecha">&nbsp;
             
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Mantenimiento parámetros aplicación</DIV>
             <br><br><br>
             <table align="left" border="0" cellpadding="0" cellspacing="2" width="95%">
             <logic:iterate id="link" name="linksMantenimiento" type="es.gateway.sesiones.permisos.bean.LinkBean" indexId="ij" scope="request">
                     <FORM METHOD=POST ID="theForm<c:out value="${ij}"/>" NAME="theForm<c:out value="${ij}"/>">
                       <INPUT TYPE="hidden" name="Posicion" value="1">
                       <INPUT TYPE="hidden" name="Primera" value="0">
                       <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                       <input type="hidden" name="OperadorConectado" value="<%=operador%>">
                      <tr>
                <td width="10%"></td>
                <td width="20"><img src="images/item.gif" border="0"/></td>
                <td class="texto" width="1%">&nbsp;</td>
                <td class="texto"><A
					href="javascript:lanzaFormulario('<bean:write property="accion" name="link" />', '<bean:write name="ij" />')"
												onMouseOver="window.status='<fmt:message>
													<bean:write property='descripcion' name='link' />
												</fmt:message>';return true"
												onMouseOut="window.status=' '">
												<% for (int i=0;i<link.getNivel().intValue()-2;i++){ %>
													&nbsp;
												<% } %>
												<fmt:message>
													<bean:write property='descripcion' name='link' />
												</fmt:message>
											</A></td>
             </tr>   
             </form>    
                  </logic:iterate>
                   </table>
                </center></div>
             </td>
             <td width="10" class="Fondoverdederecha">&nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>
