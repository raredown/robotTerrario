<HTML>
<head>
  <script language="JavaScript" src="js/util.js"></script>
  <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>

  <%
/****************************************************************************************************
  Attributes
	Titulo => Titulo de la página
	Mensaje => Resultado de la ultima operacion
	Pagina => Link de la siguiente pagina
*****************************************************************************************************/

	String subtitulo1 = (String )request.getAttribute("Titulo");
	String mensaje=(String)request.getAttribute("Mensaje");
	String destino = (String)request.getAttribute("UrlRetorno");
	if(subtitulo1==null)
		subtitulo1="";
%>

<%@include file="cabeceraLogo.jsp"%>
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
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Resultado</DIV>

                <CENTER>
                   <br><br><br>
                   <table border="1" class="tablas">
                     <tr>
                        <td class="bgCabeceraFila" align="center">
                           Resultado de la operación
                        </td>
                     </tr>
                     <tr>
                       <td class="bgFila">
                         <font class="texto5"><%=mensaje%></font>
                       </td>
                     </tr>
                    </table>
                </CENTER>
                <br>
                <form action="<%=destino%>" method="POST" name="theForm">
                <CENTER>
                  <img src="images/Aceptar.jpg" width="107" height="28" onClick="document.theForm.submit()">
                  </CENTER>
                </form>
                <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
</BODY>
</HTML>
