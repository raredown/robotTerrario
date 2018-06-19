<html>
<head>
<title>Operador</title>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/util.js"></script>
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
      String codigoOperador = (String) request.getParameter("OperadorConectado");
	  String posicion = (String) request.getParameter("Posicion");
	  String fecha = (String) request.getParameter("Fecha");
	  String primera = (String) request.getParameter("Primera");
	  String subtitulo1 = new String("Men&uacute; de Par&aacute;metros del Sistema");
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
          <td width="10" class="Fondoverdederecha">
             &nbsp;
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Tipos de Par&aacute;metros de Sistema&nbsp;</DIV>
             <table align="left" border="0" cellpadding="0" cellspacing="2" width="95%">
 				<logic:iterate id="link" name="linksParam" type="es.gateway.sesiones.permisos.bean.LinkBean" indexId="ij" scope="request">
                <FORM METHOD=POST ID="theForm<c:out value="${ij}"/>" NAME="theForm<c:out value="${ij}"/>">
                <INPUT TYPE="hidden" NAME="OperadorConectado" value="<%=codigoOperador%>">
                <INPUT TYPE="hidden" NAME="Posicion" VALUE="<%=posicion%>">
                <INPUT TYPE="hidden" NAME="Fecha" VALUE="<%=fecha%>">
                <INPUT TYPE="hidden" NAME="Primera" VALUE="<%=primera%>">
                <INPUT TYPE="hidden" NAME="OperadorConexion" VALUE="<%=imagen%>">
                <br>
                <br>
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
                
                </FORM>
               </logic:iterate>
            </table>
             </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>

</body>
</html>
