<%try {%>
<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<%@ page import="java.io.*,es.portanode.util.historicoUsuario.HistoricoAccionesBean,
		java.util.Vector,es.portanode.ficheros.Excell,es.portanode.util.html.SesionConectada" %>
<%@ page import="es.portanode.util.operadores.OperadorBean" %>


<%
    String subtitulo1 = "Consulta de Usuarios";
    String ordenar = (String) request.getAttribute("Ordenar") == null ? "TSA" : (String) request.getAttribute("Ordenar");
    String limite = (String) request.getAttribute("Limite") == null ? "10" : (String) request.getAttribute("Limite");
    String tipoConsulta = ("-1".equals((String) request.getAttribute("TipoConsulta"))) ? "1" : (String) request.getAttribute("TipoConsulta");
    String id_proceso = (String) request.getAttribute("Identificador") == null ? "" : (String) request.getAttribute("Identificador");
    String fechaInicial = (String) request.getAttribute("FechaInicial") == null ? "" : (String) request.getAttribute("FechaInicial");
    String fechaFinal = (String) request.getAttribute("FechaFinal") == null ? "" : (String) request.getAttribute("FechaFinal");
    String usuario = (String) request.getAttribute("Usuario") == null ? "" : (String) request.getAttribute("Usuario");
    String total = (String) request.getAttribute("Total") == null ? "0" : (String) request.getAttribute("Total");
    String pagina = (String) request.getAttribute("Posicion");
    Vector vProcesos = (Vector) request.getAttribute("ListaProcesos");
    String cadenaProcesos = "";
%>

<SCRIPT LANGUAGE="JavaScript">

    function VerExcel() {

        var f = document.formExcel;
        f.submit();
        info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
    }

    function ajustarTamanioIFrame(idProceso, nMensajes) {

        if (idProceso != null && nMensajes != 0) {
            var celda = document.getElementById(idProceso + "P");
            celda.height = 41 * nMensajes;
        }
    }



    function Navegar(nPagina) {
        f = document.theForm;
        f.Posicion.value = nPagina;
        f.action = "PrevioConsultaUsuario";
        f.submit();
    }



    function Buscar() {
        f = document.theForm;
        f.action = "PrevioConsultaUsuario";
        f.Total.value = "0";
        f.Posicion.value = "1";
        if (tipoConsulta == "1") {
            if (f.Identificador.value == "") {
                alert("Debe introducir un identificador de proceso");
                f.Identificador.focus();
                return;
            }
        }
        if (tipoConsulta == "2") {
            if (f.Usuario.value == "") {
                alert("Debe introducir un identificador de usuario");
                f.Usuario.focus();
                return;
            }
        }
        if (tipoConsulta == "3") {
            if ((f.FechaInicial.value == "") || (f.FechaFinal.value == "")) {
                alert("Debe introducir un rango de fechas");
                return;
            }
        }
        f.submit();
    }


    function TodoOk(num) {
        var f = dameFormulario(num);
        var opciones = 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=192,height=215,focus=true,Titlebar=no';
        var x = window.open('blanco.jsp', 'detalle', opciones);
        x.focus();
        x.resizeTo(500, 490);
        f.target = 'detalle';
        f.submit();
    }


    var tipoConsulta = "<%=tipoConsulta%>";
    function CambiarConsulta(obj) {
        if (tipoConsulta != obj.value) {
            if (obj.value == 1) {
                show('TablaProceso');
                hide('TablaUsuario');
                hide('TablaFecha');
                tipoConsulta = obj.value;
            }
            if (obj.value == 2) {
                hide('TablaProceso');
                show('TablaUsuario');
                hide('TablaFecha');
                tipoConsulta = obj.value;
            }
            if (obj.value == 3) {
                hide('TablaProceso');
                hide('TablaUsuario');
                show('TablaFecha');
                tipoConsulta = obj.value;
            }
        }
    }


    mostrar = new Image();
    mostrar.src = "images/mostrar.gif";
    ocultar = new Image();
    ocultar.src = "images/ocultar.gif";

    function mostrarOcultar(imagen, num, id)
    {
        if (imagen.name == "ocultar") {
            imagen.src = mostrar.src;
            imagen.name = "mostrar";
        }
        else {
            imagen.src = ocultar.src;
            imagen.name = "ocultar";
        }
        mostrarAlt(imagen);
        showhide(id);
        dameFormulario(num).submit();
    }

    function mostrarAlt(imagen) {
        if (imagen.name == "ocultar")
            imagen.alt = "Pulse para Ocultar...";

        else
            imagen.alt = "Pulse para Mostrar...";
    }

    function ordenarDatos(tipo) {

        f = document.theForm;
        f.Ordenar.value = tipo;
        f.action = "PrevioConsultaUsuario";
        f.submit();

    }


    function generarExcel() {
        f = document.formExcel;
        f.submit();
    }

</SCRIPT>

<body leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">

<%@ include file="cabeceraLogo.jsp" %>
<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>
<TBODY>
<TR>
<td width="10" class="Fondoverdederecha">&nbsp;

</td>
<TD vAlign="top" width="180" class="celdalineaderecha">
    <%@ include file="menu.jsp" %>
</TD><!-- InstanceBeginEditable name="contenido" -->
<TD class="Titulo" vAlign="top" align="middle" background="images/fondocentro.gif">
<br>

<DIV align="left" class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta de Usuarios</DIV>

<form action="" method="post" name="theForm" class="texto2">
    <input type="hidden" name="Ordenar" value="<%=ordenar%>">
    <input type="hidden" name="Total" value="<%=total%>">
    <input type="hidden" name="Posicion" value="<%=pagina%>">

    <table width="90%" border="0" align="center" cellspacing="4">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td width="20%" valign="top">
                <table width="100%">
                    <tr>
                        <td><label>
                            <input type="radio" name="TipoConsulta" value="1" <%if (tipoConsulta.equals("1")) {%> checked<%}%>
                                   onClick="CambiarConsulta(this)">
                            <font class="texto2">Por Proceso</font></label></td>
                    </tr>
                    <tr>
                        <td><label>
                            <input type="radio" name="TipoConsulta" value="2" <%if (tipoConsulta.equals("2")) {%> checked<%}%>
                                   onClick="CambiarConsulta(this)">
                            <font class="texto2">Por Usuario</font></label></td>
                    </tr>
                    <tr>
                        <td><label>
                            <input type="radio" name="TipoConsulta" value="3" <%if (tipoConsulta.equals("3")) {%> checked<%}%>
                                   onClick="CambiarConsulta(this)">
                            <font class="texto2">Por Fecha</font></label></td>
                    </tr>
                    <tr><td height="1" background="images/separador.gif"></td></tr>
                    <tr><td class="texto2" height="30">
                        L&iacute;mite: &nbsp;&nbsp; <select name="Limite" class="pie">
                        <option value="10" <%if (limite.equals("10")) {%> selected<%}%>>10</option>
                        <option value="20" <%if (limite.equals("20")) {%> selected<%}%>>20</option>
                        <option value="30" <%if (limite.equals("30")) {%> selected<%}%>>30</option>
                        <option value="40" <%if (limite.equals("40")) {%> selected<%}%>>40</option>
                        <option value="50" <%if (limite.equals("50")) {%> selected<%}%>>50</option>

                    </select>
                    </td></tr>
                </table>
            </td>
            <td valign="top">
                <table width="100%" border="0">
                    <tr>
                        <td align="right" colspan="5">
                            <A HREF="#" onClick="Navegar(<%=pagina%>);" onMouseOver="window.status='Recargar';return true;"
                               onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0"
                                   id="TablaProceso" <%if (!tipoConsulta.equals("1")) {%>
                                   style="display:none"<%}%> cellpadding="4">
                                <tr>
                                    <td colspan="2" class="cabeceratabla" height="20">
                                        Procesos&nbsp;</td>
                                </tr>
                                <tr align="center">
                                    <td align="right"><font class="texto2">Identificador :</font></td>
                                    <td align="left">
                                        <input name="Identificador" value="<%=id_proceso%>" type="text" class="inputText" size="22"
                                               maxlength="20">
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table width="100%" border="0"
                                   id="TablaUsuario" <%if (!tipoConsulta.equals("2")) {%>
                                   style="display:none"<%}%> cellpadding="4">
                                <tr>
                                    <td colspan="2" class="cabeceratabla" height="20">Usuario&nbsp;</td>
                                </tr>
                                <tr align="center">
                                    <td align="right"><font class="texto2">Usuario :</font></td>
                                    <td align="left">
                                        <input name="Usuario" value="<%=usuario%>" type="text" class="inputText" size="12"
                                               maxlength="10">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0"
                                   id="TablaFecha" <%if (!tipoConsulta.equals("3")) {%>
                                   style="display:none"<%}%> cellpadding="4">
                                <tr>
                                    <td colspan="4" class="cabeceratabla" height="20">Fechas&nbsp;</td>
                                </tr>
                                <tr align="center">
                                    <td align="right"><font class="texto2">Fecha Inicial :</font></td>
                                    <td align="left">
                                        <input name="FechaInicial" type="text" class="inputText" value="<%=fechaInicial%>" size="15"
                                               readonly="readonly" maxlength="10">
                                        <a href="javascript:calendario1.popup();"><img id="cal1" src="images/calendar/cal.gif" width="16"
                                                                                       height="16" border="0"
                                                                                       alt="Calendario"></a>
                                    </td>
                                    <td align="right"><font class="texto2">Fecha Final :</font></td>
                                    <td align="left">
                                        <input name="FechaFinal" type="text" value="<%=fechaFinal%>" class="inputText" size="15"
                                               readonly="readonly" maxlength="10">
                                        <a href="javascript:calendario2.popup();"><img id="cal2" src="images/calendar/cal.gif" width="16"
                                                                                       height="16" border="0"
                                                                                       alt="Calendario"></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</form>

<center>
    <A HREF="javascript:Buscar()" onMouseOver="window.status='Realizar búsqueda';return true;"
       onMouseOut="window.status=' '"><img src="images/buscar.gif" width="107" height="28" onClick="" border="0"></a>
</center>
<br>
<table width="98%" border="1" align="center" class="tablas">
    <tr>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por Usuario Ascendente" onclick="ordenarDatos('UA')">
            &nbsp; &nbsp; Id. Usuario &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Usuario Descendente"
                 onclick="ordenarDatos('UD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por IdProceso Ascendente" onclick="ordenarDatos('IDA')">
            &nbsp; &nbsp; Id. Proceso &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por IdProceso Descendente"
                 onclick="ordenarDatos('IDD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por Fecha Ascendente" onclick="ordenarDatos('TSA')">
            &nbsp; &nbsp; Fecha &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Fecha Descendente" onclick="ordenarDatos('TSD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            &nbsp; &nbsp; Acci&oacute;n &nbsp; &nbsp;
        </td>
        <td class="bgCabeceraFila" align="center">
            &nbsp; &nbsp; Observaciones &nbsp; &nbsp;
        </td>
    </tr>
    <!-- Listamos todos los procesos -->
    <%
        int j = 1;
        String clase = "";
        if (vProcesos != null) {
            for (int i = 0; i < vProcesos.size(); i++) {
                HistoricoAccionesBean hab = (HistoricoAccionesBean) vProcesos.get(i);
                cadenaProcesos = cadenaProcesos + hab.getUserid() + "-"
                        + hab.getIdProceso() + "-" + hab.getTmstamp() + "-"
                        + hab.getDescripcion() + "-" + hab.getObservaciones()
                        + "-" +	((i == vProcesos.size() - 1) ? "" : "&");
                int indice = j;
                j++;
                if ((i % 2) == 0)
                    clase = "";
                else
                    clase = "bgFila";
    %>
    <tr>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=hab.getUserid()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=hab.getIdProceso()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=hab.getTmstamp()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=hab.getDescripcion()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=hab.getObservaciones()%></font></td>
    </tr>
    <%
            }
        }
    %>
</table>
<jsp:include page="/NavegadorJSP" flush="true">
    <jsp:param name="Limit" value="<%=limite%>"/>
    <jsp:param name="Total" value="<%=total%>"/>
    <jsp:param name="ActualLink" value="<%=pagina%>"/>
    <jsp:param name="DirectURL" value="javascript:Navegar("/>
</jsp:include>
<%--Nueva imagen--%>
<%
    if (vProcesos!=null && vProcesos.size() > 0) {
%>
<center>
    <A HREF="javascript:VerExcel();" onMouseOver="window.status='Consulta Offline en lista Excell';return true"
       onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif"
                                           border="0"></A>
</center>
<%}%>
</td>
<td width="10" class="Fondoverdederecha">&nbsp;

</td>
</TR>

<form action="GenerarExcelSimple" method=post name="formExcel">
    <INPUT TYPE="hidden" name="cadenaProcesos" value="<%=cadenaProcesos%>">
    <INPUT TYPE="hidden" name="consulta" value="usuario">
</form>

</TBODY>
</TABLE>
<jsp:include page="pie.jsp" flush="true"/>
<%--Nueva imagen--%>
</body>
<!--Scripts para los calendarios-->
<script language="JavaScript">
    setPath('<%=request.getContextPath()%>');
    var calendario1 = new calendar1(document.theForm.FechaInicial);
    var calendario2 = new calendar1(document.theForm.FechaFinal);
</script>


</html>
<%
    } catch (Exception e) {
        System.out.println("Error en Consulta.jsp--->" + e);
    }
%>