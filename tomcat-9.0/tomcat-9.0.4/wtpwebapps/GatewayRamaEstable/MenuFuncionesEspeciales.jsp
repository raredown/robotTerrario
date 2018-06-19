<jsp:include page="/ComprobarSesion"/>
<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function Carga(num){
    f = document.form2;

    switch (num){
        case 1: f.action = "CerrarProcesoCambioJSP";
                f.submit();
                  break
        case 2: f.action="PrevioEnviarMsgCNC";
                f.submit();
                  break
	}

}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.ArrayList,
                 java.util.Iterator"%>
  <%
      String subtitulo1 = new String("Men&uacute; Funciones especiales tras incidencia");
  %>
 <%@include file="cabeceraLogo.jsp"%>
<%
          String operador = (String) request.getParameter("OperadorConectado");
        System.out.println("Operador:" + operador);
          if (operador==null) operador="";
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
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Funciones especiales&nbsp;</DIV>
                <br>
                <br>
                <br>
                <br>
                <table border="0" align="center" width="95%">
                    <tr>
                        <td width="40%" align="right"><img src="images/item.gif" border="0"/></td>
                        <td class="texto"><nobr><a href="javascript:Carga(1)//'" onMouseOver="window.status='Cerrar Proceso de Cambio';return true" onMouseOut="window.status=''">Cerrar Procesos de Cambio</a></nobr></td>
                    </tr>

                    <tr>
                        <td width="40%" align="right"><img src="images/item.gif" border="0"/></td>
                        <td class="texto"><nobr><a href="javascript:Carga(2)//'" onMouseOver="window.status='Envio Mensaje CNC';return true" onMouseOut="window.status=''">Envio de Mensajes CNC</a></nobr></td>
                    </tr>
                </table>
                <FORM METHOD=POST NAME="form2">
                    <INPUT TYPE="hidden" name="Posicion" value="1">
                    <INPUT TYPE="hidden" name="Primera" value="0">
                    <INPUT TYPE="hidden" name="NProceso" value="0">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                    <INPUT TYPE="hidden" name="origen" value="MenuFuncionesEspeciales.jsp">
                </FORM>
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
