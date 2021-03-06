<%try {%>
<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<%@ page import="java.io.*,
                 es.portanode.util.ProcesosBean,
                 java.util.Vector,
                 es.portanode.ficheros.Excell,
                 es.portanode.util.html.SesionConectada" %>
<%@ page import="es.portanode.util.operadores.OperadorBean" %>


<%
    String subtitulo1 = "Consulta Procesos";
    String contiene = (String) request.getAttribute("contiene");
    String rol = (String) request.getAttribute("Rol") == null ? "T" : (String) request.getAttribute("Rol");
    String ordenar = (String) request.getAttribute("Ordenar") == null ? "IDA" : (String) request.getAttribute("Ordenar");
    String limite = (String) request.getAttribute("Limite") == null ? "10" : (String) request.getAttribute("Limite");
    String tipoConsulta = ("-1".equals((String) request.getAttribute("TipoConsulta"))) ? "1" : (String) request.getAttribute("TipoConsulta");
    String buscaProceso = ("-1".equals((String) request.getAttribute("BuscaProceso"))) ? "1" : (String) request.getAttribute("BuscaProceso");
    String id_proceso = (String) request.getAttribute("Identificador") == null ? "" : (String) request.getAttribute("Identificador");
    String fechaInicial = (String) request.getAttribute("FechaInicial") == null ? "" : (String) request.getAttribute("FechaInicial");
    String fechaFinal = (String) request.getAttribute("FechaFinal") == null ? "" : (String) request.getAttribute("FechaFinal");
    String numInicial = (String) request.getAttribute("NumInicial") == null ? "" : (String) request.getAttribute("NumInicial");
    String numFinal = (String) request.getAttribute("NumFinal") == null ? "" : (String) request.getAttribute("NumFinal");
    String codigoOp = (String) request.getAttribute("CodigoOperador") == null ? "" : (String) request.getAttribute("CodigoOperador");
    String rolOp = ("".equals((String) request.getAttribute("RolOperador"))) ? "D" : (String) request.getAttribute("RolOperador");
    String rolNIF = ("".equals((String) request.getAttribute("RolNIF"))) ? "D" : (String) request.getAttribute("RolNIF");
    String fechaInicialOp = (String) request.getAttribute("FechaInicialOp") == null ? "" : (String) request.getAttribute("FechaInicialOp");
    String fechaFinalOp = (String) request.getAttribute("FechaFinalOp") == null ? "" : (String) request.getAttribute("FechaFinalOp");
    String NIF = (String) request.getAttribute("NIF") == null ? "" : (String) request.getAttribute("NIF");
    String total = (String) request.getAttribute("Total") == null ? "0" : (String) request.getAttribute("Total");
    String pagina = (String) request.getAttribute("Posicion");
    Vector vProcesos = (Vector) request.getAttribute("ListaProcesos");
    Vector vOperadores = (Vector) request.getAttribute("ListaOperadores");
    Vector vectorProcesos = (Vector) request.getAttribute("vectorProcesos");
    System.out.println("buscaProceso en jsp-------->" + buscaProceso);
    String cadenaProcesos = "";
    String cadenaTotalProcesos = "";

    String fechaVCOP = (String) request.getAttribute("FechaVCOP") == null ? "" : (String) request.getAttribute("FechaVCOP");
    String fechaVCNIF = (String) request.getAttribute("FechaVCNIF") == null ? "" : (String) request.getAttribute("FechaVCNIF");

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
//     info('El fichero excel se est� generando, por favor espere', 'Proceso en curso');
}

function ocultarExcel(){
    var excel=document.getElementById("excel");
    excel.style.visibility="hidden";
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
    f.action = "ConsultaTotal";
    f.submit();
}

function detectarEnter(e) {
	var ieKey=event.keyCode;
    if(ieKey==13)
    Buscar();
}


function Buscar() {
    f = document.theForm;
    var contiene = compruebaPatronNumero(f);
    f.action = "ConsultaTotal";
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
        if ((f.FechaInicialOp.value == "") || (f.FechaFinalOp.value == "")) {
            alert("Debe introducir un rango de fechas");
            return;
        }
    }
    if (tipoConsulta == "4") {
        if (f.NIF.value == "") {
            alert("Debe introducir un NIF/CIF");
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
            hide('TablaOperador');
            hide('TablaNIF');
            show('ComboRol');
            tipoConsulta = obj.value;
        }
        if (obj.value == 2) {
            hide('TablaProceso');
            show('TablaNumeracion');
            hide('TablaOperador');
            hide('TablaNIF');
            show('ComboRol');
            tipoConsulta = obj.value;
        }
        if (obj.value == 3) {
            hide('TablaProceso');
            hide('TablaNumeracion');
            show('TablaOperador');
            hide('TablaNIF');
            hide('ComboRol');
            tipoConsulta = obj.value;
        }
        if (obj.value == 4) {
            hide('TablaProceso');
            hide('TablaNumeracion');
            hide('TablaOperador');
            show('TablaNIF');
            hide('ComboRol');
            tipoConsulta = obj.value;
        }
    }

}

var bproceso = "<%=buscaProceso%>";
function CambiaBusquedaProceso(obj) {

    f = document.theForm;
    if (obj.value != bproceso) {
        bproceso = obj.value;
        if (bproceso == "1") {
            f.Identificador.disabled = false;
        }
        else f.Identificador.disabled = true;

        showhide('cal1');
        f.FechaInicial.value = "";
        f.FechaFinal.value = "";
        showhide('cal2');

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
    f.action = "ConsultaTotal";
    f.submit();

}

function desplegarTodos(img) {
    var esconder = "";
    if (img.name == "ocultarTodas") {
        img.src = mostrar.src;
        img.name = "mostrarTodas";
        img.alt = "Pulse para Mostrar...";
        esconder = "hide";
    } else {
        img.src = ocultar.src;
        img.name = "ocultarTodas";
        img.alt = "Pulse para Ocultar...";
        esconder = "show";
    }
    for (i = 0; i < document.images.length; i++)
    {
        imagen = document.images[i];
        if ((imagen.name == "ocultar") || (imagen.name == "mostrar")) {
            if (img.name == "mostrarTodas") {
                imagen.src = mostrar.src;
                imagen.name = "mostrar";
            } else {
                imagen.src = ocultar.src;
                imagen.name = "ocultar";
            }
        }
        mostrarAlt(imagen);
    }
<%if(vProcesos!=null){
  for(int i=0; i<vProcesos.size(); i++){
    ProcesosBean pBs = (ProcesosBean) vProcesos.get(i);
    String id=pBs.getID_PROCESO()+"P";
%>
    if (esconder == "show")
        show('<%=id%>');
    else
        hide('<%=id%>');
    dameFormulario('<%=(i+1)%>').submit();
<%}
}%>
}
//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ include file="cabeceraLogo.jsp" %>
<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>
<TBODY>
<TR>
<td width="10" class="Fondoverdederecha">&nbsp;

</td>
<TD vAlign=top width="180" class="celdalineaderecha">
    <%@ include file="menu.jsp" %>
</TD><!-- InstanceBeginEditable name="contenido" -->
<TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
<br>

<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta
    Procesos</DIV>

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
                <input type="radio" name="TipoConsulta" value="1" <%if(tipoConsulta.equals("1")){%> checked<%}%>
                       onClick="CambiarConsulta(this)">
                <font class="texto2">Por Proceso</font></label></td>
        </tr>
        <tr>
            <td><label>
                <input type="radio" name="TipoConsulta" value="2" <%if(tipoConsulta.equals("2")){%> checked<%}%>
                       onClick="CambiarConsulta(this)">
                <font class="texto2">Por Numeraci�n</font></label></td>
        </tr>
        <tr>
            <td><label>
                <input type="radio" name="TipoConsulta" value="3" <%if(tipoConsulta.equals("3")){%> checked<%}%>
                       onClick="CambiarConsulta(this)">
                <font class="texto2">Por Operador</font></label></td>
        </tr>
        <tr>
            <td><label>
                <input type="radio" name="TipoConsulta" value="4" <%if(tipoConsulta.equals("4")){%> checked<%}%>
                       onClick="CambiarConsulta(this)">
                <font class="texto2">Por NIF/CIF</font></label></td>
        </tr>
        <tr><td height="1" background="images/separador.gif"></td></tr>
        <tr><td class="texto2" height="30">
            <table id='ComboRol' <% if (tipoConsulta.equals("3") || tipoConsulta.equals("4")) {%> style="display:none" <% } %>>
                <tr>
                    <td><label><font class="texto2">Rol: &nbsp;&nbsp;</font></label></td>
                    <td>
                        <select name="Rol" class="pie">
                            <option value="D" <%if (rol.equals("D")) {%> selected<%}%>>
                                Donante</option>
                            <option value="R" <%if (rol.equals("R")) {%> selected<%}%>>
                                Receptor</option>
                            <option value="O" <%if (rol.equals("O")) {%> selected<%}%>>
                                Otro</option>
                            <option value="T" <%if (rol.equals("T")) {%> selected<%}%>>
                                Todos</option>
                        </select>
                    </td>
                </tr>
            </table>
        </td></tr>
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
                <td colspan="5" class="cabeceratabla" height="20">
                    Procesos&nbsp;</td>
            </tr>
            <tr>
                <td width="7%">
                    <input type="radio" name="BuscaProceso" value="1" <%if(buscaProceso.equals("1")){%> checked<%}%>
                           onClick="CambiaBusquedaProceso(this)">
                </td>
                <td width="21%"><font class="texto2">Identificador :</font></td>
                <td width="26%">
                    <input name="Identificador" value="<%=id_proceso%>" type="text" class="inputText" size="22"
                           maxlength="20" onKeyUp="detectarEnter(this)">
                </td>
                <td width="17%">&nbsp;</td>
                <td width="29%">&nbsp;</td>
            </tr>
            <tr>
                <td width="7%">
                    <input type="radio" name="BuscaProceso" <%if(buscaProceso.equals("2")){%> checked<%}%>
                           onClick="CambiaBusquedaProceso(this)" value="2">
                </td>
                <td><font class="texto2">Fecha Inicial :</font></td>
                <td>
                    <input name="FechaInicial" type="text" class="inputText" value="<%=fechaInicial%>" size="15"
                           readonly="readonly" maxlength="10">
                    <a href="javascript:calendario1.popup();"><img id="cal1" src="images/calendar/cal.gif" width="16"
                                                                   height="16" border="0"
                                                                   alt="Calendario" <%if(buscaProceso.equals("1")){%>
                                                                   style="display:none"<%}%>></a>
                </td>
                <td><font class="texto2">Fecha Final :</font></td>
                <td>
                    <input name="FechaFinal" type="text" value="<%=fechaFinal%>" class="inputText" size="15"
                           readonly="readonly" maxlength="10">
                    <a href="javascript:calendario2.popup();"><img id="cal2" src="images/calendar/cal.gif" width="16"
                                                                   height="16" border="0"
                                                                   alt="Calendario" <%if(buscaProceso.equals("1")){%>
                                                                   style="display:none"<%}%>></a>
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
            <tr>
                <td width="17%"><font class="texto2">Num Inicial : </font></td>
                <td width="30%">
                    <input type="text" name="NumInicial" value="<%=numInicial%>" class="inputText" size="21"
                           maxlength="15" onKeyUp="detectarEnter(this)">
                </td>
                <td width="14%"><font class="texto2">Num Final : </font></td>
                <td width="31%">
                    <input type="text" name="NumFinal" value="<%=numFinal%>" class="inputText" size="21" maxlength="15" onKeyUp="detectarEnter(this)">
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td>
        <table width="100%" border="0"
               id="TablaOperador" <%if (!tipoConsulta.equals("3")) {%>
               style="display:none"<%}%> cellpadding="4">
            <tr>
                <td colspan="2" class="cabeceratabla" height="20">
                    Operador&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="texto2" align="center">Operador:&nbsp;
                    <select name="CodigoOperador" class="pie">
                        <%
                            for (int i = 0; i < vOperadores.size(); i++) {
                                OperadorBean operador = (OperadorBean) vOperadores.get(i);
                                if (!operador.getCodigo().equals(operadorSesion)) {
                        %>
                        <option value="<%=operador.getCodigo()%>" <%if (codigoOp.equals(operador.getCodigo())) {%> selected <%}%>><%=operador.getDescripcion()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table width="100%" border="0">
                        <tr>
                            <td align="right"><font class="texto2">Fecha Inicial:&nbsp;</font></td>
                            <td align="left">
                                <input name="FechaInicialOp" type="text" class="inputText" value="<%=fechaInicialOp%>" size="15"
                                       readonly="readonly" maxlength="10">
                                <a href="javascript:calendario3.popup();"><img id="cal3" src="images/calendar/cal.gif" width="16"
                                                                               height="16" border="0" alt="Calendario"></a>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><font class="texto2">Fecha Final:&nbsp;</font></td>
                            <td align="left">
                                <input name="FechaFinalOp" type="text" value="<%=fechaFinalOp%>" class="inputText" size="15"
                                       readonly="readonly" maxlength="10">
                                <a href="javascript:calendario4.popup();"><img id="cal4" src="images/calendar/cal.gif" width="16"
                                                                               height="16" border="0" alt="Calendario"></a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center">
                    <table width="100%" border="0">
                        <tr>
                            <td class="texto2">
                                <input type="radio" name="RolOperador" value="D" <%if (rolOp.equals("D")) {%> checked <%}%>>Rol Donante
                            </td>
                        </tr>
                        <tr>
                            <td class="texto2">
                                <input type="radio" name="RolOperador" value="R" <%if (rolOp.equals("R")) {%> checked <%}%>>Rol Receptor
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

			<tr>
				<td align="right"><font class="texto2">Ventana de Cambio (opcional):&nbsp;</font></td>
                <td align="left">
                	<input name="FechaVCOP" type="text" value="<%=fechaVCOP%>" class="inputText" size="15"
                  		readonly="readonly" maxlength="10">
                    <a href="javascript:calendario5.popup();"><img id="cal5" src="images/calendar/cal.gif" width="16"
                     												height="16" border="0" alt="Calendario"></a>
                </td>
			</tr>
        </table>
    </td>
</tr>
    <tr>
        <td>
            <table width="100%" border="0"
                   id="TablaNIF" <%if (!tipoConsulta.equals("4")) {%>
                   style="display:none"<%}%> cellpadding="4">
                <tr>
                    <td colspan="2" class="cabeceratabla" height="20">NIF/CIF&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <font class="texto2">NIF/CIF:&nbsp;</font>
                        <input name="NIF" type="text" class="inputText" value="<%=NIF%>" size="15" maxlength="15" onKeyUp="detectarEnter(this)"/>
                    </td>
                    <td align="center">
                        <table width="100%" border="0">
                            <tr>
                                <td class="texto2">
                                    <input type="radio" name="RolNIF" value="D" <%if (rolNIF.equals("D")) {%>
                                           checked <%}%>>Rol Donante
                                </td>
                            </tr>
                            <tr>
                                <td class="texto2">
                                    <input type="radio" name="RolNIF" value="R" <%if (rolNIF.equals("R")) {%>
                                           checked <%}%>>Rol Receptor
                                </td>
                            </tr>
                            <tr>
                                <td class="texto2">
                                    <input type="radio" name="RolNIF" value="T" <%if (rolNIF.equals("T")) {%>
                                           checked <%}%>>Ambos Roles
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
				<tr>
					<td align="right"><font class="texto2">Ventana de Cambio (opcional):&nbsp;</font></td>
                    <td align="left">
                        <input name="FechaVCNIF" type="text" class="inputText" value="<%=fechaVCNIF%>" size="15"
                               readonly="readonly" maxlength="10">
                        <a href="javascript:calendario6.popup();"><img id="cal6" src="images/calendar/cal.gif" width="16"
                                                                       height="16" border="0" alt="Calendario"></a>
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
        <td class="bgCabeceraFila">
            <img align="middle" onclick="javascript:desplegarTodos(this)" name="mostrarTodas" border="0" height="13"
                 width="14" src="images/mostrar.gif"/>
            T
        </td>
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
            <img src="images/ascen.gif" border="0" alt="Ordenar por Estado Ascendente" onclick="ordenarDatos('EA')">
            &nbsp; &nbsp; Estado &nbsp; &nbsp;
            <img src="images/descen.gif" border="0" alt="Ordenar por Estado Descendente" onclick="ordenarDatos('ED')">
        </td>
    </tr>
    <!-- Listamos todos los procesos -->
    <%
    	
    if(vectorProcesos!=null){
    	for(int k=0;k<vectorProcesos.size();k++){
        	ProcesosBean pbt = (ProcesosBean) vectorProcesos.get(k);
        	cadenaTotalProcesos = cadenaTotalProcesos + pbt.getID_PROCESO() + "-" + pbt.getFECHA_INICIO() + "-" + pbt.getESTADO() + ((k == vectorProcesos.size() - 1) ? "" : "&");
        }
    }
    	
        int j = 1;
        String clase = "";
        if (vProcesos != null) {
        	
            for (int i = 0; i < vProcesos.size(); i++) {
                ProcesosBean pB = (ProcesosBean) vProcesos.get(i);
                cadenaProcesos = cadenaProcesos + pB.getID_PROCESO() + "-" + pB.getFECHA_INICIO() + "-" + pB.getESTADO() + ((i == vProcesos.size() - 1) ? "" : "&");
                int indice = j;
                j++;
                if ((i % 2) == 0)
                    clase = "";
                else
                    clase = "bgFila";
    %>
    <tr>
        <form action="DetalleProceso" target="iframe<%=(pB.getID_PROCESO())%>" method=post name="form<%=indice%>">
            <INPUT TYPE="hidden" name="idProceso" value="<%=pB.getID_PROCESO()%>">
            <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
            <td class="<%=clase%>" align="center">
                <img align="middle" name="mostrar"
                     onclick="mostrarOcultar(this,<%=indice%>,'<%=pB.getID_PROCESO()+"P"%>');" border="0" height="13"
                     width="14" src="images/mostrar.gif" onMouseOver="mostrarAlt(this)"/>
            </td>
            <td class="<%=clase%>" align="center"><font class="texto2"><%=pB.getID_PROCESO()%></font>
            </td>
            <td class="<%=clase%>" align="center"><font class="texto2"><%=pB.getFECHA_INICIO()%></font>
            </td>
            <td class="<%=clase%>" align="center"><font class="texto2"><%=pB.getESTADO()%></font></td>
        </form>

    </tr>
    <tr style="display:none" height="10" id="<%=pB.getID_PROCESO()+"P"%>">
        <td colspan='4'>
            <iframe width="100%" height="100%" id="iframe<%=(pB.getID_PROCESO())%>"
                    name="iframe<%=(pB.getID_PROCESO())%>" src="DetalleProcesoJSP" frameborder="0"
                    allowTransparency="true"></iframe>
        </td>
    </tr>
    <%}
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
    <form action="GenerarExcelTotal" method=post name="formExcel">
    <INPUT TYPE="hidden" name="cadenaProcesos" value="<%=cadenaProcesos%>">
    <input type="hidden" name="cadenaTotalProcesos" value="<%=cadenaTotalProcesos%>">
    <input type="hidden" name="historico" value="0">
    <input type="hidden" name="tipoExcel">
    <input type="hidden" name="operador" value="0">
    <table>
    	<tr>
    		<td><A HREF="javascript:VerExcel()" onMouseOver="window.status='Consulta Offline en lista Excell';return true"
       onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif"
                                           border="0"></A></td>
    	</tr>
    </table>
	<center>
	</center>
</form>
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
    setPath('<%= request.getContextPath() %>');
    var calendario1 = new calendar1(document.theForm.FechaInicial);
    var calendario2 = new calendar1(document.theForm.FechaFinal);
    var calendario3 = new calendar1(document.theForm.FechaInicialOp);
    var calendario4 = new calendar1(document.theForm.FechaFinalOp);
    var calendario5 = new calendar1(document.theForm.FechaVCOP);
    var calendario6 = new calendar1(document.theForm.FechaVCNIF);
</script>


</html>
<%} catch (Exception e) {
    System.out.println("Error en Consulta.jsp--->" + e);
}   %>