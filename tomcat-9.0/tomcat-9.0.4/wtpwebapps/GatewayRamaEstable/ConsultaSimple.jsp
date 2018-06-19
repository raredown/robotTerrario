<%try {%>
<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<%@ page import="java.io.*,es.portanode.util.ProcesoSimpleBean,java.util.Vector,es.portanode.ficheros.Excell,es.portanode.util.html.SesionConectada" %>
<%@ page import="es.portanode.util.operadores.OperadorBean" %>


<%
    String subtitulo1 = "Consulta Simple";
    String contiene = (String) request.getAttribute("contiene");
    String ordenar = (String) request.getAttribute("Ordenar") == null ? "IDA" : (String) request.getAttribute("Ordenar");
    String limite = (String) request.getAttribute("Limite") == null ? "10" : (String) request.getAttribute("Limite");
    String tipoConsulta = ("-1".equals((String) request.getAttribute("TipoConsulta"))) ? "1" : (String) request.getAttribute("TipoConsulta");
    String id_proceso = (String) request.getAttribute("Identificador") == null ? "" : (String) request.getAttribute("Identificador");
    String fechaInicial = (String) request.getAttribute("FechaInicial") == null ? "" : (String) request.getAttribute("FechaInicial");
    String fechaFinal = (String) request.getAttribute("FechaFinal") == null ? "" : (String) request.getAttribute("FechaFinal");
    String numInicial = (String) request.getAttribute("NumInicial") == null ? "" : (String) request.getAttribute("NumInicial");
    String numFinal = (String) request.getAttribute("NumFinal") == null ? "" : (String) request.getAttribute("NumFinal");
    String total = (String) request.getAttribute("Total") == null ? "0" : (String) request.getAttribute("Total");
    String pagina = (String) request.getAttribute("Posicion");
    Vector vProcesos = (Vector) request.getAttribute("ListaProcesos");
    Vector vectorProcesos = (Vector) request.getAttribute("vectorProcesos");
    String cadenaProcesos = "";
    String cadenaTotalProcesos = "";
%>

<SCRIPT LANGUAGE="JavaScript">

    function compruebaPatronNumero(f) {
        var numPat = /^[0-9]+%$/;
        var text = f.NumInicial.value;
        var result = text.match(numPat);
        if (result == null)
        {
            f.contiene.value = "no";
            return "false";
        } else {
            f.contiene.value = "si";
            return "true";
        }
    }

    function VerExcel() {

        var f = document.formExcel;
        var f1 = document.formRadios;
        if (f1.tipoExcelF1[0].checked){
        	 f.tipoExcel.value = 'total';
        }else{
        	f.tipoExcel.value = 'actual';
         }
        f.submit();
        info('El fichero excel se est� generando, por favor espere', 'Proceso en curso');
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
        f.action = "PrevioConsultaSimple";
        f.submit();
    }



    function Buscar() {
        f = document.theForm;
        var contiene = compruebaPatronNumero(f);
        f.action = "PrevioConsultaSimple";
        f.Total.value = "0";
        f.Posicion.value = "1";
        if (tipoConsulta == "2") {
            if (f.NumInicial.value == "") {
                alert("Debe introducir datos en el campo Rango Inicial");
                f.NumInicial.focus();
                return;
            }
            if ((f.NumFinal.value == "") && (contiene == "false")) {
                f.NumFinal.value = f.NumInicial.value;
            }
            if ((f.NumFinal.value != "") && (contiene == "true")) {
                f.NumFinal.value = "";
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
                hide('TablaNumeracion');
                hide('TablaFecha');
                tipoConsulta = obj.value;
            }
            if (obj.value == 2) {
                hide('TablaProceso');
                show('TablaNumeracion');
                hide('TablaFecha');
                tipoConsulta = obj.value;
            }
            if (obj.value == 3) {
                hide('TablaProceso');
                hide('TablaNumeracion');
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
        f.action = "PrevioConsultaSimple";
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

<DIV align="left" class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta Simple</DIV>

<form action="" method="post" name="theForm" class="texto2">
    <input type="hidden" name="Ordenar" value="<%=ordenar%>">
    <input type="hidden" name="Total" value="<%=total%>">
    <input type="hidden" name="Posicion" value="<%=pagina%>">
    <input type="hidden" name="contiene" value="<%=contiene%>">

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
                            <font class="texto2">Por Numeraci&oacute;n</font></label></td>
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
                                   id="TablaNumeracion" <%if (!tipoConsulta.equals("2")) {%>
                                   style="display:none"<%}%> cellpadding="4">
                                <tr>
                                    <td colspan="4" class="cabeceratabla" height="20">Numeraci&oacute;n&nbsp;</td>
                                </tr>
                                <tr align="center">
                                    <td align="right"><font class="texto2">Num Inicial : </font></td>
                                    <td align="left">
                                        <input type="text" name="NumInicial" value="<%=numInicial%>" class="inputText" size="21"
                                               maxlength="15">
                                    </td>
                                    <td align="right"><font class="texto2">Num Final : </font></td>
                                    <td align="left">
                                        <input type="text" name="NumFinal" value="<%=numFinal%>" class="inputText" size="21" maxlength="15">
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
    <A HREF="javascript:Buscar()" onMouseOver="window.status='Realizar b�squeda';return true;"
       onMouseOut="window.status=' '"><img src="images/buscar.gif" width="107" height="28" onClick="" border="0"></a>
</center>
<br>

<%
    if (vProcesos!=null && vProcesos.size() > 0) {
%>

	<form name="formRadios">
 <table>
    	<tr align="center">
    		<td class="texto"><input type="radio" name="tipoExcelF1"  value="total"> Vista total</td>
    		<td class="texto"><input type="radio" name="tipoExcelF1" value="actual" checked> Vista actual</td>
    	</tr>
    </table>
    </form>

<%

    }

%>

<table width="98%" border="1" align="center" class="tablas">
    <tr>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por IdProceso Ascendente" onclick="ordenarDatos('IDA')">
            &nbsp; &nbsp; Id. proceso &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por IdProceso Descendente"
                 onclick="ordenarDatos('IDD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por Fecha Ascendente" onclick="ordenarDatos('FA')">
            &nbsp; &nbsp; Fecha Inicio &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Fecha Descendente" onclick="ordenarDatos('FD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por Inicio Rango Ascendente" onclick="ordenarDatos('IRA')">
            &nbsp; &nbsp; Inicio Rango &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Inicio Rango Descendente" onclick="ordenarDatos('IRD')">
        </td>
        <td class="bgCabeceraFila" align="center">
            <img src="images/ascen.gif" border="0" alt="Ordenar por Final Rango Ascendente" onclick="ordenarDatos('FRA')">
            &nbsp; &nbsp; Final Rango &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Final Rango Descendente" onclick="ordenarDatos('FRD')">
        </td>
    </tr>
    <!-- Listamos todos los procesos -->
    <%
    
    if(vectorProcesos!=null){
    	for(int k=0;k<vectorProcesos.size();k++){
        	ProcesoSimpleBean psbt = (ProcesoSimpleBean) vectorProcesos.get(k);
        	cadenaTotalProcesos = cadenaTotalProcesos + psbt.getIdProceso() + "-" + psbt.getFechaInicio() + "-" + psbt.getInicioRango() + "-" + psbt.getFinalRango() + "-" + ((k == vectorProcesos.size() - 1) ? "" : "&");
        }
    }
    
    
        int j = 1;
        String clase = "";
        if (vProcesos != null) {
            for (int i = 0; i < vProcesos.size(); i++) {
                ProcesoSimpleBean psb = (ProcesoSimpleBean) vProcesos
                        .get(i);
                cadenaProcesos = cadenaProcesos + psb.getIdProceso()
                        + "-" + psb.getFechaInicio() + "-"
                        + psb.getInicioRango() + "-" + psb.getFinalRango() + "-"
                        + ((i == vProcesos.size() - 1) ? "" : "&");
                int indice = j;
                j++;
                if ((i % 2) == 0)
                    clase = "";
                else
                    clase = "bgFila";
    %>
    <tr>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=psb.getIdProceso()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=psb.getFechaInicio()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=psb.getInicioRango()%></font></td>
        <td class="<%=clase%>" align="center"><font class="texto2"><%=psb.getFinalRango()%></font></td>
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
   <form action="GenerarExcelSimple" method=post name="formExcel">
    <INPUT TYPE="hidden" name="cadenaProcesos" value="<%=cadenaProcesos%>">
    <INPUT TYPE="hidden" name="consulta" value="simple">
    <input type="hidden" name="cadenaTotalProcesos" value="<%=cadenaTotalProcesos%>">
    <input type="hidden" name="tipoExcel">
    <table>
    	<tr>
    		<td><A HREF="javascript:VerExcel();" onMouseOver="window.status='Consulta Offline en lista Excell';return true"
       onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif"
                                           border="0"></A></td>
    	</tr>
    </table>
</form>
</center>
<%}%>
</td>
<td width="10" class="Fondoverdederecha">&nbsp;

</td>
</TR>

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