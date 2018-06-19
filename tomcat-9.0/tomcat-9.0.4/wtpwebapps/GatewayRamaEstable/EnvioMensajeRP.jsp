<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--
function SelectOk(Campo){
    var seleccion,totalopt
         totalopt = Campo.length;
         for (i = 0;  i < totalopt; i++){
             if (Campo.options[i].selected)
               break
         }
         seleccion = Campo.options[i].text;
         if (seleccion == ""){

            Campo.focus();
            alert("No puede haver una selección vacía en " + Campo.name );
            Campo.select();
            return false;
         }
         else{
            document.theForm.Descripcion.value = Campo.options[i].text;
            return true;
         }
}

function TodoOk(){
     f = document.theForm;
     if (!SelectOk(f.Causa))
        return;
     f.submit();
}
//-->
</SCRIPT>


<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<!--****************************
	*************************     Part of calling Cabecera.jsp
	****************************-->
<%@ page import="java.util.Vector,
                 es.portanode.util.html.SelectOptionBean"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1=new String("Rechazo tras confirmación previa");

	System.err.println("EnvioMensajeRP.JSP : -inicio-");

	String OperadorRemitente 	= (String) request.getAttribute("OperadorConectado");
	String descripcionRemitente = (String) request.getAttribute("DescripcionOperador");	
	String OperadorDestinatario	= new String("00000");
	String IdProcesoCancelar	= (String) request.getAttribute("IdProceso");
	Vector vdescripciones		= (Vector) request.getAttribute("SelectDescripciones");
	String nomServlet 		= new String("EnviarMsgRP");
	String fecha = (String) request.getAttribute("FechaReferencia");
	String rangoInicial = (String) request.getAttribute("RangoIni");
	String rangoFinal = (String) request.getAttribute("RangoFin");
	String procesoSelec = (String) request.getAttribute("ProcesoSelect");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia RP</DIV>

                <FORM METHOD=POST ACTION="PrevioConsultaRP" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="FechaReferencia" value="<%=fecha%>">
                <INPUT TYPE="hidden" name="RangoIni" value="<%=rangoInicial%>">
                <INPUT TYPE="hidden" name="RangoFin" value="<%=rangoFinal%>">
                <INPUT TYPE="hidden" name="ProcesoSelect" value="<%=procesoSelec%>">

                </FORM>

                <FORM action="EnviarMsgRP" method="post" name="theForm">

                <input type="hidden" name="Descripcion">
                <INPUT TYPE="hidden" name="Primera" value="1">
                <INPUT TYPE="hidden" name="FechaReferencia" value="<%=fecha%>">
                <INPUT TYPE="hidden" name="RangoIni" value="<%=rangoInicial%>">
                <INPUT TYPE="hidden" name="RangoFin" value="<%=rangoFinal%>">
                <INPUT TYPE="hidden" name="ProcesoSelect" value="<%=procesoSelec%>">

                    <div align="center"><center><table border="0" cellspacing="5">

                        <tr>
                            <td><font class="texto2">Operador&nbsp;remitente: </font></td>
                         <td><font class="texto"><%=OperadorRemitente%>-<%=descripcionRemitente%></font>
                         <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                         <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"></td>
                            <td><font class="texto2">Operador destinatario: &nbsp;</font></td>
                         <td><font class="texto"><%=OperadorDestinatario%>-Entidad de Referencia</font>
                         <INPUT TYPE="hidden" name="Destinatario" value="<%=OperadorDestinatario%>"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Observaciones </font></td>
                         <td colspan="3"><input type="text" class="inputText" class="inputText" size="50" maxlength="80" name="Observaciones"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Número identificación&nbsp;proceso:&nbsp;</font></td>
                         <td><font class="texto"><%=IdProcesoCancelar%></font>
                         <INPUT TYPE="hidden" name="IdProceso" value="<%=IdProcesoCancelar%>"></td>
                            <td><font class="texto2">Código&nbsp;causa&nbsp;cancelación </FONT></td>
                         <td class="text"><select class="inputText"  name="Causa">
                    <%
                        int tam = vdescripciones.size();
                        for (int i=1 ; i<tam ; i++){
                            SelectOptionBean des= (SelectOptionBean) vdescripciones.elementAt(i);
                    %>
                            <option <%=des.seleccionado%> value="<%= des.valor%>" ><%=des.nombre%></option>			<%
                        }
                    %>

                      </SELECT></td>
                        </tr>
                     </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                       <tr>
                         <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" width="107" height="28" border="0"></A></td>

                            <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                      </tr>
                    </table>
                    </center></div>
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
</body>
</html>
