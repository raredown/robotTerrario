<HTML>
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
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<!--****************************
	****************************     Part of calling Cabecera.jsp
	****************************-->
<%@ page import="java.util.Vector,
                 es.portanode.util.html.SelectOptionBean"%>
<%@ page import="java.io.*"%>

  <%

    String subtitulo1=new String("Cancelación mensaje de modificación de NRN");

	System.err.println("EnvioMensajeCNM.JSP : -inicio-");

	String OperadorRemitente 	= (String) request.getParameter("OperadorConectado");
	String descripcionRemitente = (String) request.getAttribute("DescripcionOperador");
	String OperadorDestinatario 	=  new String("00000");
	String IdProceso 		= (String) request.getAttribute("IdProceso");	
	Vector descripciones 		= (Vector) request.getAttribute("SelectDescripciones");
	String nomServlet 		= new String("EnviarMsgCNM");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia CNM</DIV>

                <FORM METHOD=POST ACTION="PrevioConsultaCNM" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="EnviarMsgCNM" method="POST" name="theForm">
                <input type="hidden" name="Descripcion">

                    <div align="center"><center>
                    <table border="0" cellspacing="5">
                        <tr>
                            <td colspan="3">
                                <font class="texto2">Operador&nbsp;remitente: </font>
                                <font class="texto"><%=OperadorRemitente%>-<%=descripcionRemitente%></font>
                                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                            </td>
                            <td colspan="3">
                                <font class="texto2">Operador destinatario: &nbsp;</font>
                                <font class="texto"><%=OperadorDestinatario%>-Entidad de Referencia</font>
                                <INPUT TYPE="hidden" name="Destinatario" value="<%=OperadorDestinatario%>">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <font class="texto2">Observaciones: </font>
                                <input type="text" class="inputText" class="inputText" size="65" maxlength="80" name="Observaciones">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <font class="texto2">Número identificaci&oacute;n&nbsp;proceso:&nbsp;</font>
                                <font class="texto"><%=IdProceso%></font>
                                <INPUT TYPE="hidden" name="IdProceso" value="<%=IdProceso%>">&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <font class="texto2">C&oacute;digo&nbsp;causa&nbsp;cancelaci&oacute;n:
                                <select class="inputText" name="Causa">
                    <%
                        int tam = descripciones.size();
                        for (int i=1 ; i<tam ; i++){
                            SelectOptionBean des= (SelectOptionBean) descripciones.elementAt(i);
                    %>
                            <option <%=des.seleccionado%> value="<%= des.valor%>" ><%=des.nombre%></option>			<%
                        }
                    %>
                        </SELECT>
                            </font>
                       </td>
                        </tr>
                    </table>
                   <BR>
                    </center></div>
                    <div align="center"><center>
                    <table border="0">
                     <tr>
                        <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

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

</BODY>
</HTML>
