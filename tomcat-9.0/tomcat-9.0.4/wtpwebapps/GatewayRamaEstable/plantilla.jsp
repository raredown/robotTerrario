<%@ page import="java.util.Enumeration"%>
<%@page session="true" contentType="text/html;charset=iso-8859-1"%>
<%
    try{


 %>
<HTML lang="Spanish">
<HEAD>
<TITLE>Pantalla principal</TITLE><!-- InstanceBegin template="/Templates/internas2.dwt" codeOutsideHTMLIsLocked="false" --><!-- InstanceBeginEditable name="doctitle" --><!-- InstanceEndEditable -->
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<jsp:include page="cabeceraLogo.jsp" flush="true"/>

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
      <jsp:include page="menu.jsp" flush="true"/>
    </TD><!-- InstanceBeginEditable name="contenido" -->
    <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
       <br>
       <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>&nbsp;&nbsp;</DIV>
       <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD class=texto>
            Aqui va el cuerpo de la pagina.
         </TD>
         </TR>
       </TBODY>
      </TABLE>
      <P>&nbsp;</P>
      <!-- InstanceEndEditable -->
      </td>
      <td width="10" class="Fondoverdederecha">
       &nbsp;
      </td>
    </TR>
    </TBODY>
  </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
</BODY></HTML>
 <%
    } catch (Throwable t) {
        System.out.println("");
    } finally{
    }
%>