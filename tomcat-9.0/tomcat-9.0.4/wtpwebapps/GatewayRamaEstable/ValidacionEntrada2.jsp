<HTML>

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
          String rangoIni =  (String) request.getAttribute("RangoIni");
          String rangoFin =  (String) request.getAttribute("RangoFin");
%>

  <BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  
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
          <TD vAlign=top width="180" >
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envio de mensajes</DIV>


			<CENTER><H3> <%=mensaje%> <BR></H3></CENTER>
			
			 <form name="formu" action="<%=pagina%>" method="POST">
			 <input type="HIDDEN" name="OperadorConectado" value="<%=operadorConectado%>">
			 <input type="HIDDEN" name="Posicion" value="1">
			 <INPUT TYPE="hidden" name="Primera" value="1">
			 <INPUT TYPE="hidden" name="RangoInicio" value="<%=rangoIni%>">
			 <INPUT TYPE="hidden" name="RangoFin" value="<%=rangoFin%>">
			
			 <CENTER><input type="submit" name="BtLink" value="Aceptar"></CENTER>
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
