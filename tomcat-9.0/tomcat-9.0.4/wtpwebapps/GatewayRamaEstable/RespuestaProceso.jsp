<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
    <!--


    function Navegar(nPagina){
        f = document.theForm;
        f.Posicion.value = nPagina;
        f.action="PrevioConsultaPorNumero";
        f.submit();
    }

    function Buscar(num){
        theForm.submit();
    }


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
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >
<%@ page import="java.util.ArrayList,
                 java.text.SimpleDateFormat,
                 java.util.Date,
                 es.portanode.util.CabeceraMensajeBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
<%
    try{
        Vector vMensajes = (Vector) request.getAttribute("vMensajes");
        String numeroAbonado = (String)request.getAttribute("NumeroAbonado");
        String numeroAbonadoF = (String)request.getAttribute("NumeroAbonadoF");
        String posurl = (String)request.getAttribute("Posicion");
        if ((numeroAbonado==null) || ("".equals(numeroAbonado)))
            numeroAbonado="";
        if ((numeroAbonadoF==null) || ("".equals(numeroAbonadoF)))
            numeroAbonadoF="";
        String idProceso = (String)request.getAttribute("IdProceso");
        int nummensaje = vMensajes!=null?vMensajes.size():0;


        String subtitulo1="Consulta por número";

%>
<%@include file="cabeceraLogo.jsp"%>
<script language="JavaScript">
    var tabla="<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>";
    document.write(tabla);

    function VerExcel() {

        var f = document.formListar;
        f.listarExcell.value="1";
        f.submit();
        info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
    }

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
        <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta por número&nbsp;</DIV>

        <div align="center"><center>
            <br>
            <br>
            <font class="texto2">Mensajes asociados al proceso: <%=idProceso%></font>
            <br>
            <br>
            <table border="0" width="100%">
                <tr>
                    <td width="100%"><div align="center"><center><table
                            border="1" class="tablas">
                        <tr>
                            <td class="bgCabeceraFila">&nbsp;</td>
                            <td class="bgCabeceraFila" align="center" >Operador</td>
                            <td class="bgCabeceraFila" align="center" >Operador Origen</td>
                            <td class="bgCabeceraFila" align="center" >Tipo Mensaje</td>
                            <td class="bgCabeceraFila" align="center" >Fecha llegada</td>
                        </tr>
                        <%
                            if(vMensajes!=null)
                            {
                                int fin;
                                String clase="";
                                int j=1;
                                for(int i=0;i<nummensaje;i++){
                                    CabeceraMensajeBean cMb = (CabeceraMensajeBean) vMensajes.get(i);
                                    String operador = cMb.getOperador();
                                    String operadorOrigen = cMb.getOperador_origen();
                                    if (operador == null)
                                        operador = "&nbsp;";
                                    String tipoMensaje = cMb.getTipo_mensaje();
                                    String idInterno = cMb.getId_interno();
                                    if (idInterno == null)
                                        idInterno = "&nbsp;";
                                    String fechaAlta = cMb.getFecha_alta();
                                    int indice = j;
                                    j++;
                                    if((i%2)==0)
                                        clase="";
                                    else
                                        clase="bgFila";
                        %>
                        <tr>
                            <form action="obtenDetalleMensaje" method=post name="form<%=indice%>">
                                <INPUT TYPE="hidden" name="IdInterno" value="<%=idInterno%>">
                                <INPUT TYPE="hidden" name="TipoMensaje" value="<%=tipoMensaje%>">
                                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                                <TD class="<%=clase%>"><p><a href="javascript:TodoOk(<%=indice%>)//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></p></TD>
                                <td class="<%=clase%>" align="center" title='<%=Singleton.getInstance().getOpDescripcion(operador)%>'><font class="texto2"><%=operador%></font></td>
                                <td class="<%=clase%>" align="center" title='<%=Singleton.getInstance().getOpDescripcion(operadorOrigen)%>'><font class="texto2"><%=operadorOrigen%></font></td>
                                <td class="<%=clase%>" align="center" title='<%=Singleton.getInstance().getTipoMDescripcion(tipoMensaje)%>'><font class="texto2"><%=tipoMensaje%></font></td>
                                <td class="<%=clase%>" align="center"><font class="texto2"><%=fechaAlta%></font></td>
                            </form>
                        </tr>
                        <%                  }
                        }   %>
                    </table>
                    </center></div></td>
                </tr>
            </table>
        </center></div>

        <div align="center"><center>
            <br>
            <table border="0">
                <FORM METHOD=POST ACTION="PrevioConsultaPorNumero" name="fback">
                    <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                    <INPUT TYPE="hidden" name="NumeroAbonado" value="<%=numeroAbonado%>">
                    <INPUT TYPE="hidden" name="NumeroAbonadoF" value="<%=numeroAbonadoF%>">
                    <INPUT TYPE="hidden" name="listarExcell" value="1">
                </FORM>
                <FORM METHOD=POST ACTION="RespuestaProceso" name="formListar">
                    <INPUT TYPE="hidden" name="listarExcell" value="">
                    <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                    <INPUT TYPE="hidden" name="NumeroAbonado" value="<%=numeroAbonado%>">
                    <INPUT TYPE="hidden" name="NumeroAbonadoF" value="<%=numeroAbonadoF%>">
                    <INPUT TYPE="hidden" name="IdProceso" value="<%=idProceso%>">
                </FORM>
                <tr>
                    <td align="center"><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
                    <td align="center"><A HREF="javascript:VerExcel();"  onMouseOver="window.status='Consulta Offline en lista Excell';return true" onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0" width="107" height="28"></A></td>
                </tr>
            </table>
        </center></div>
        <%--Nueva imagen--%>
    </td>
    <td width="10" class="Fondoverdederecha">
        &nbsp;
    </td>
</TR>
</TBODY>
</TABLE>
<jsp:include page="pie.jsp" flush="true"/>
<%--Nueva imagen--%>

</body>
</html>
<%

    } catch (Throwable t) {
        System.out.println("respuestaProceso.JSP:-------> " + t);
    } finally{

    }
%>
