<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<head>
<title>Documento sin t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function TodoOk(num){
     var f=dameFormulario(num);
     var opciones='toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=192,height=215,focus=true,Titlebar=no';
     var x = window.open('blanco.jsp','detalle',opciones);
     x.focus();
     x.resizeTo(500,490);
     f.target='detalle';
     f.submit();
}

//-->
</SCRIPT>
<%@ page import="java.util.Vector,
                 es.portanode.util.TipoMensajeBean,
                 es.portanode.consultas.SentenciaAccesoBean,
                 es.portanode.mensajes.RangoNumeracionBean,
                 es.portanode.consultas.SentenciaAccesoMensaje,
                 es.portanode.procesos.ProcesoNumeracion,
                 es.portanode.util.CabeceraMensajeBean,
                 es.portanode.mensajes.PadreMensaje"%>
                 
<%
  try{
    Vector vMensajes = (Vector) request.getAttribute("vMensajes");
    String imagen = (String) request.getAttribute("OperadorConexion");
    int nummensaje = vMensajes!=null?vMensajes.size():0;
    String idProceso = (String) request.getAttribute("idProceso");
%>
<%@ page import="java.io.*"%>



<META http-equiv="content-type" content="text/html; CHARSET=ISO-8859-1">
<META http-equiv="imagetoolbar" content="no">

<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>

<BODY style="OVERFLOW-X: hidden" leftMargin="0" topMargin="0"MARGINHEIGHT="0" MARGINWIDTH="0">

<center>
<table width="100%" border="1" bordercolor="#FFFFFF" align="center" class="tablas">
   <%
      if(vMensajes!=null)
      {
          int fin;
          String clase="";
          int j=1;
          for(int i=0;i<nummensaje;i++){
              PadreMensaje pM = (PadreMensaje) vMensajes.get(i);
              int indice = j;
              String indiceStr=indice+"";
              j++;
              if((i%2)==0)
                  clase="bgFila2";
              else
                  clase="bgFila3";
   %>
           <tr>
               <form action="obtenDetalleHisMensaje" method=post name="form<%=indice%>">
                   <INPUT TYPE="hidden" name="IdInterno" value="<%=pM.getIdInterno()%>">
                   <INPUT TYPE="hidden" name="TipoMensaje" value="<%=pM.getTipoMensaje()%>">
                   <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                   <%=pM.toHTML(clase,indiceStr)%>
               </form>
           </tr>
                    <%                  }
      }   %>
</table>
</center>

<script language="JavaScript"> parent.ajustarTamanioIFrame('<%=idProceso%>', <%=nummensaje%>)</script>
</body>
</html>
<%

    } catch (Throwable t) {
        System.out.println("DetalleProceso.JSP:-------> " + t);
    } finally{

    }
%>
