<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Enumeration,es.portanode.util.html.SesionConectada"%>
<%@page session="true" contentType="text/html;charset=iso-8859-1"%>
<HTML lang="Spanish">
<HEAD>
<TITLE>Pantalla principal</TITLE><!-- InstanceBegin template="/Templates/internas2.dwt" codeOutsideHTMLIsLocked="false" --><!-- InstanceBeginEditable name="doctitle" --><!-- InstanceEndEditable -->
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/util.js"></script>
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%String subtitulo1 = new String("Men&uacute; principal");%>
<%@include file="cabeceraLogo.jsp"%>
<%
    try{
        
        String nombreOperador = (String)request.getAttribute("NombreOperadorConexion");
        String existePc = (String)request.getAttribute("existePersonaContacto");
        String existePcmsg = "";
        if("false".equals(existePc)){
           existePcmsg = "<br><br><font class='textoRojo'>Aviso:&nbsp;&nbsp;NO HAY NINGUNA PERSONA DE CONTACTO DEFINIDA POR DEFECTO</font>";
        }
        String codigoOperador = imagen;

        SesionConectada cs=null;
        try {
            cs = new SesionConectada(request);
        }catch (Exception e){
            System.err.println("Imposible conectarse a la SESSION: " + e.getMessage());
        }
        try{
            cs.RefrescarInformacion();
        }catch(Exception e){
            System.err.println("Imposible refrescar la SESSION: " + e.getMessage());
        }
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
       <DIV align=left class="Titulo">&nbsp;&nbsp;</DIV>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
         <FORM METHOD=POST NAME="theForm">
            <TBODY>
            <TR>
              <TD class="texto" valing="center" align="center">
                  Los servicios a los que tiene acceso son los relacionados en el menú de la izquierda.<br>
                  <%=existePcmsg%>
              </TD>
             </TR>
           </TBODY>
         </form>
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