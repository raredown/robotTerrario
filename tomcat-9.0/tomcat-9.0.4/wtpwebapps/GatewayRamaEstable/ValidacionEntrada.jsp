<HTML>
<head>
<title>Validacion Entrada</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<!--
********************************************************************************************************
  Attributes
	Mensaje -> Result of the last operation.
	Pagina -> Link for the next page.
********************************************************************************************************
-->

<!--
****************************     Part of the import libraries.    *************************************
-->
<!--
****************************     Part of the global vars.    *************************************
-->
 <% 
	  String mensaje=(String)request.getAttribute("Mensaje");
	  String pagina=(String)request.getAttribute("Pagina");
	  String operadorConectado  = (String) request.getAttribute("OperadorConectado");
      String filtroULL = request.getParameter("filtroULL");
     String opcionMenu = request.getParameter("opcionMenu");
      System.out.println("ValidacionEntrada.jsp->filtroULL = " + filtroULL);
      if(filtroULL==null) filtroULL = "";
%>

  <BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String origen = request.getParameter("origen");
    if(origen==null) origen = "";
    String subtitulo1="Envio Mensaje";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envio de mensajes</DIV>

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
                         <font class="texto"><%=mensaje%></font>
                       </td>
                     </tr>
                    </table>
                </CENTER>

		 <form name="formu" action="<%=pagina%>" method="POST">
		 <input type="HIDDEN" name="OperadorConectado" value="<%=operadorConectado%>">
		 <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		 <input type="HIDDEN" name="Posicion" value="1">
		 <INPUT TYPE="hidden" name="Primera" value="1">
		 <INPUT TYPE="hidden" NAME="primera" VALUE="SI">
		 <INPUT TYPE="hidden" name="filtroULL" value="<%=filtroULL%>">
		 <INPUT TYPE="hidden" name="origen" value="<%=origen%>">
         <INPUT TYPE="hidden" name="opcionMenu" value="<%=opcionMenu%>">

		 <CENTER><A HREF="javascript:document.formu.submit()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" border="0" width="107" height="28"></A></CENTER>
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
