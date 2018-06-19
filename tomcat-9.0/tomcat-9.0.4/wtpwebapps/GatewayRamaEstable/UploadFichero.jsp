<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">


<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>

  <%
  	String proxima = (String) request.getAttribute("Proxima");
  	String rol = (String) request.getAttribute("Rol");

  	String subtitulo1 = new String("Detalle de carga del fichero");
  %>


<%@include file="cabeceraLogo.jsp"%>
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
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Upload Fichero</DIV>




<%
	Vector mensajes = (Vector) request.getAttribute("Mensajes");
	Enumeration e = mensajes.elements();
%>
<br><br><br><CENTER>
	<TABLE border='1' align="center">
	<TR>
		<TD ><font class="texto2" size="4">Detalle de la carga del fichero</font></TD>
	</TR>
	<%
		while (e.hasMoreElements()) {
	%>
	<TR>
				
      	<td align="center" >
      		<font class="texto2" size="2"><%=e.nextElement().toString()%></font>
      	</TD>
	</TR>
			<%
				}
			%>
	</TABLE>
	<form action="<%=proxima%>" method="post" name="verPendientes">
		<input type="hidden" name="Rol" value="<%= rol %>"/>
	</form>
    <A HREF="javascript:document.verPendientes.submit();//'" onMouseOver="window.status='Aceptar';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" border="0" width="107" height="28"></A>

	</CENTER>


              <%--Nueva imagen--%>
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
