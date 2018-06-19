<HTML>
<head>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

  	<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<!--****************************
	****************************     Part of the global vars.
	****************************-->
<%
	  	String mensaje=(String)request.getAttribute("Mensaje");
%>

<!--****************************     
	****************************     Part of calling Cabecera.jsp
	****************************-->
<%
	String titulo= (String)request.getAttribute("Titulo");
	String subtitulo1= new String("Error en la aplicación");
	String subtitulo2= new String("");
	String urlRetorno = (String)request.getAttribute("UrlRetorno");
	//if (urlRetorno.equals("")) urlRetorno = new String("");
	String NumeroLinks=new String("2");
	String refreshLink=new String("");
%>


<%@ include file="/cabeceraLogo.jsp"%>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>error&nbsp;</DIV>

                  <center><font class="texto2"><%=titulo%></font> <BR></CENTER>
		<P>
 -->		<CENTER> <font class="texto"><%=mensaje%></font> <BR></CENTER>
  		<CENTER>
			<form method="POST" align="center" name="theForm" action="<%= urlRetorno%>">
		 		<center>
                  <A HREF="javascript:theForm.submit()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" border="0" width="107" height="28"/></A>
		 		</center>
			</form>
<!--   			<a href="General"  align="center" > ACEPTAR </a> -->
  		</CENTER>
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