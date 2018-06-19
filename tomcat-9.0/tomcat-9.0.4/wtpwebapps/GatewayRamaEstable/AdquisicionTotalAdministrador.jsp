<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">

  <%
    String subtitulo1=new String("Adquisición Total Administrador");
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
            <TD vAlign="top" width="180" class="celdalineaderecha">
              <%@include file="menu.jsp"%>
            </TD>
            <TD class="Titulo" vAlign="top" align="middle" background="images/fondocentro.gif">
               <br>
               <DIV align="left" class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Adquisición total de conocimiento de numeración portada</DIV>
	                    <table border="0" width="100%">
	                    <tr>
	                    	<td>
	                    		<br><br>
	                    	</td>
	                    </tr>
	                    <tr>
	                   		<td>
	                    	<div align="center" class="texto">
	                    <%       
	                    boolean iniciado = (Boolean)request.getAttribute("iniciado");
	                    if(iniciado){
	                    %>
	                    Proceso de adquisición total finalizado correctamente
	                    <% }else{ %>
	                    Se ha producido un error en el proceso de adquisición total.
	                    <%} %>   
	                    </div>  
	                    </td>
	                    </tr>
	                    <tr>
	                    <td align="center">
	                    <br>
	                    <A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A>
	                    </td>
	                    </tr>
						</table>					
            &nbsp;          
                                    
		</TD>
               
               <td>
             <div align="center"><center>
                <table border="0">
                 <tr>
                <td></td>
                </tr>
                </table>
                </center></div>
             </td>
    	<%--Nueva imagen--%>
                 <td>&nbsp;</td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>

        </TBODY>

<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>