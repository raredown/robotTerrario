<%
	try {
%>
<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<%@ page
	import="java.io.*, es.portanode.procesos.ProcesoExpirado, java.util.Vector, es.portanode.ficheros.Excell, es.gateway.sesiones.users.vo.UserVo, es.portanode.util.html.SesionConectada, es.portanode.util.ParametroBeanCollection"%>



<%
    String subtitulo1="Consulta Procesos Expirados";
    String accion =  (String)request.getAttribute("Accion");
    if (accion == null )
        accion = "Consulta";

    if (accion.equals("Cerrar"))
        subtitulo1 = "Cerrar Procesos Expirados";

    //String contiene=(String)request.getAttribute("contiene");
    String estado     = (String)request.getAttribute("estadoPro")==null
    		? "0"
    		: (String)request.getAttribute("estadoPro");
    String tipocierre = (String)request.getAttribute("tipoCierre")==null
    		? "0"
    		: (String)request.getAttribute("tipoCierre");
    String usuario    = (String)request.getAttribute("usuarioCierre")==null
    		?"0"
    		:(String)request.getAttribute("usuarioCierre");

    String aux = (String)request.getAttribute("estadoPro");
    if (accion.equals("Cerrar") && aux == null)
        estado = "A";

    String ordenar = (String)request.getAttribute("Ordenar")==null
    		? "FD"
    		: (String)request.getAttribute("Ordenar");
    String limite = (String)request.getAttribute("Limite")==null
    		? "10"
    		: (String)request.getAttribute("Limite");

    //String tipoConsulta = ("-1".equals((String)request.getAttribute("TipoConsulta")))?"1":(String)request.getAttribute("TipoConsulta");
    String buscaProceso = ("-1".equals((String)request
    		.getAttribute("BuscaProceso")))
    		? "1"
    		: (String)request.getAttribute("BuscaProceso");

    String id_proceso   = (String)request
    		.getAttribute("Identificador")==null
    		? ""
    		: (String)request.getAttribute("Identificador");
    String fechaInicial = (String)request
    		.getAttribute("FechaInicial")==null
    		? ""
    		: (String)request.getAttribute("FechaInicial");
    String fechaFinal   = (String)request.getAttribute("FechaFinal")==null
    		? ""
    		: (String)request.getAttribute("FechaFinal");

    String total = (String)request.getAttribute("Total")==null
    		? "0"
    		: (String)request.getAttribute("Total");
    String pagina = (String)request.getAttribute("Posicion");

    Vector vProcesos = (Vector)request
    		.getAttribute("ListaProcesos");
    Vector vUsuarios = (Vector)request
    		.getAttribute("ListaUsuarios");
    Vector vectorProcesos = (Vector) request
    		.getAttribute("vectorProcesos");
    System.out.println("buscaProceso en jsp-------->"
    		+buscaProceso);
    String cadenaProcesos="";
    String cadenaTotalProcesos = "";


%>

<SCRIPT LANGUAGE="JavaScript">
<!--

function CerrarMarcados(){
    var f = document.theForm;
    var f2 = document.DetalleProceso;

    var i = 0;
    var ok = false;
    var numCheq = 0;
    var elegidos="";

    var numProc = <%=vProcesos.size()%>

    for (i=0;i<numProc;i++)
    {
        var elemento = document.getElementById("proc"+i);
        if (elemento.type=="checkbox" && elemento.checked==true)
        {
            ok=true;
            numCheq = numCheq + 1;
            elegidos=elegidos+elemento.value+"|";

        }

    }

    if (ok )
    {
        confirmar("¿Está seguro que desea cerrar los procesos marcados?","Mensaje Informativo","javascript:hazSubmit('theForm','"+numCheq+"','"+elegidos+"','"+1+"','ConsultaExpirados');","javascript:VentanaModal.cerrar();");
        /*if (confirm("¿Está seguro que desea cerrar los procesos marcados?"))
        {
            f.numeroChequeados.value=numCheq;
            f.elegidosCerrar.value=elegidos;
            f.CerrarProceso.value="1";
            f.action = "ConsultaExpirados";
            f.submit();


        } */
    }
    else if (numCheq == 0)
    {
        alert("No hay ningun proceso marcado para cerrar.");
    }

}

function hazSubmit(formulario, numCheq, elegidos, cerrarProceso, action){
    var f = document.getElementById(formulario);
    f.numeroChequeados.value=numCheq;
    f.elegidosCerrar.value=elegidos;
    f.CerrarProceso.value=cerrarProceso;
    f.action = action;
    f.submit();
}

function VerExcel(){

    var f=document.formExcel;
    var f1 = document.formRadios;
    if (f1.tipoExcelF1[0].checked){
        f.tipoExcel.value = 'total';
    }else{
        f.tipoExcel.value = 'actual';
    }
    f.submit();
    info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
}

function ajustarTamanioIFrame(idProceso,nMensajes){

    if(idProceso != null && nMensajes != 0){
        var celda = document.getElementById(idProceso+"P");
        celda.height=41*nMensajes;
    }
}



function Navegar(nPagina){
    f = document.theForm;
    f.Posicion.value = nPagina;
    f.action="ConsultaExpirados";
    f.submit();
}

function cerrarPro(idProceso,expiracion){
  confirmar("¿Está seguro que desea cerrar el proceso?","Mensaje Informativo","javascript:cerrarPro2("+idProceso,","+expiracion+");","javascript:ventanaModal.cerrar();");
}

function cerrarPro2(idProceso, expiracion)
{
    f = document.theForm;
    f.action="ConsultaExpirados";
    f.Total.value = "0";
    f.Posicion.value="1";
    f.Accion.value="Cerrar";
    f.idProcesoCerrar.value = idProceso;
    f.expProcesoCerrar.value = expiracion;
    f.CerrarProceso.value="1";
    f.submit();
}

function detectarEnter(e) {
	var ieKey=event.keyCode;
    if(ieKey==13)
    Buscar();
}

function Buscar(){
    f = document.theForm;
    f.action="ConsultaExpirados";
    f.Total.value = "0";
    f.Posicion.value="1";
    f.CerrarProceso.value="0";
    f.submit();
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



var bproceso = "<%=buscaProceso%>";
function CambiaBusquedaProceso(obj){

    f = document.theForm;
    if(obj.value != bproceso){
        bproceso = obj.value;
        if(bproceso=="1"){
            f.Identificador.disabled=false;}
        else f.Identificador.disabled=true;

        showhide('cal1');
        showhide('cajaFecha1');
        showhide('eti1');
        f.FechaInicial.value="";

        showhide('cal2');
        showhide('cajaFecha2');
        showhide('eti2');
        f.FechaFinal.value="";
    }
}
/*function CambiaBusquedaProceso(obj){

    f = document.theForm;
    if(obj.value != bproceso){
        bproceso = obj.value;
        if(bproceso=="1" || bproceso=="3"){
            f.Identificador.disabled=false;
            f.idIntegracion.disabled=false;
            hide('cal1');
            hide('cajaFecha1');
            hide('eti1');
            hide('cal2');
            hide('cajaFecha2');
            hide('eti2');

        }
        else {
        	f.Identificador.disabled=true;
        	f.idIntegracion.disabled=true;
        	show('cal1');
            show('cajaFecha1');
            show('eti1');
            f.FechaInicial.value="";

            show('cal2');
            show('cajaFecha2');
            show('eti2');
            f.FechaFinal.value="";
        }


    }
}*/

mostrar = new Image();
mostrar.src = "images/mostrar.gif";
ocultar = new Image();
ocultar.src = "images/ocultar.gif";

function mostrarOcultar(imagen,num,id)
{

    if(imagen.name=="ocultar"){
        imagen.src = mostrar.src;
        imagen.name="mostrar";
    }
    else{
        imagen.src = ocultar.src;
        imagen.name = "ocultar";
    }
    mostrarAlt(imagen);
    showhide(id);
    dameFormulario(num).submit();
}

function mostrarAlt(imagen){
    if(imagen.name=="ocultar")
        imagen.alt="Pulse para Ocultar...";

    else
        imagen.alt="Pulse para Mostrar...";
}

function deleteAlt(imagen){

    imagen.alt="Pulse para Cerrar Proceso";

}


function ordenarDatos(tipo){

    f = document.theForm;
    f.Ordenar.value = tipo;
    f.action="ConsultaExpirados";
    f.submit();

}

function desplegarTodos(img){
    var esconder="";
    if(img.name=="ocultarTodas"){
        img.src = mostrar.src;
        img.name="mostrarTodas";
        img.alt="Pulse para Mostrar...";
        esconder="hide";
    }else{
        img.src = ocultar.src;
        img.name = "ocultarTodas";
        img.alt="Pulse para Ocultar...";
        esconder="show";
    }
    for(i=0;i<document.images.length;i++)
    {
        imagen=document.images[i];
        if((imagen.name=="ocultar")||(imagen.name=="mostrar")){
            if(img.name=="mostrarTodas"){
                imagen.src = mostrar.src;
                imagen.name="mostrar";
            }else{
                imagen.src = ocultar.src;
                imagen.name = "ocultar";
            }
        }
        mostrarAlt(imagen);
    }
<%if(vProcesos!=null){
  				for(int i=0; i<vProcesos.size(); i++){
    				ProcesoExpirado pE = (ProcesoExpirado) vProcesos.get(i);
    				String id = pE.getIdProceso() + "P";%>
    if(esconder=="show")
        show('<%=id%>');
    else
        hide('<%=id%>');
    dameFormulario('<%=(i+1)%>').submit();
<%}
				}%>
}

function generarExcel(){
    f=document.formExcel;
    f.submit();
}

/*function seleccionarTodos (objeto) {
	//var valorCheck = false;
	var booleano = false;
	var i = 0;
	while (booleano == false) {
		var idProc = "proc" + i;
		if (document.getElementById(idProc) != null) {
			document.getElementById(idProc).checked = objeto.checked;
		} else {
			booleano = true;
		}
		i++;
	}
}*/

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

	<%@include file="cabeceraLogo.jsp"%>
	<table width='100%' height='90%' border='0' cellpadding='0'
		cellspacing='0'>
		<TBODY>
			<TR>
				<td width="10" class="Fondoverdederecha">&nbsp;</td>
				<TD vAlign=top width="180" class="celdalineaderecha">
					<%@include file="menu.jsp"%></TD>
				<!-- InstanceBeginEditable name="contenido" -->
				<TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
				<br>
					<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/><%=subtitulo1%></DIV>
					<form action="" method="post" name="theForm" class="texto2">
				   		<input type="hidden" name="Ordenar" value="<%=ordenar%>">
				    	<input type="hidden" name="Total" value="<%=total%>">
				    	<input type="hidden" name="Posicion" value="<%=pagina%>">
					    <input type="hidden" name="Accion" value="<%=accion%>">
					    <input type="hidden" name="idProcesoCerrar" value="">
					    <input type="hidden" name="expProcesoCerrar" value="">
					    <input type="hidden" name="CerrarProceso" value="">
					    <input type='hidden' name='elegidosCerrar' value="">
					    <input type='hidden' name='numeroChequeados' value="">

			    		<table width="90%" border="0" align="center" cellspacing="4">

	        				<tr>
	            				<td width="35%" valign="top">
	                				<table width="100%">

										<tr><td height="1" background="images/separador.gif"></td></tr>
                    					<tr>
                    						<td class="texto2" height="40">
                    							Estado del Proceso:&nbsp;&nbsp; <select name="estadoPro" class="pie">
                        						<option value="0" <%if(estado.equals("0")){%>selected<%}%>>Todos</option>
                        						<option value="A" <%if(estado.equals("A")){%>selected<%}%>>Abierto</option>
							                    <option value="P" <%if(estado.equals("P")){%>selected<%}%>>Pendiente</option>
							                    <option value="C" <%if(estado.equals("C")){%>selected<%}%>>Cerrado</option>

						                    </select>
                    						</td>
                    					</tr>
                    					<tr>
                        					<td class="texto2" height="40">
                        						Tipo de Cierre:&nbsp;&nbsp;
                        						<select name="tipoCierre" class="pie">
	                                				<option value="0" <%if(tipocierre.equals("0")){%>selected<%}%>>Todos</option>
	                                				<option value="A" <%if(tipocierre.equals("A")){%>selected<%}%>>Autom&aacute;tico</option>
	                                				<option value="M" <%if(tipocierre.equals("M")){%>selected<%}%>>Manual</option>
	                                				<option value="N" <%if(tipocierre.equals("N")){%>selected<%}%>>NOC</option>
                            					</select>
                        					</td>

					                    </tr>
                    					<tr>
                        					<td class="texto2" height="40">
                        						Usuario Cierre:&nbsp;&nbsp;
                        						<select name="usuarioCierre" class="pie">
                                					<option value="0" <%if(usuario.equals("0")){%>selected<%}%>>Todos</option>
                                					<%
                                    					int numUsuarios = vUsuarios.size();
                                    					for(int i=0;i<numUsuarios;i++){
                                        					UserVo usu = (UserVo)vUsuarios.get(i);
                                        					String idUsuario = usu.getUserId();
                                					%>
                                					<option value="<%=idUsuario%>" <%if(usuario.equals(idUsuario)){%>selected<%}%>><%=idUsuario%></option>
					                                <%
					                                    }
					                                %>
                            				</select>
                        					</td>

                    					</tr>
					                    <tr>
                    					    <td class="texto2" height="40">
                    					    	L&iacute;mite: &nbsp;&nbsp;
                    					    	<select name="Limite" class="pie">
					                                <option value="10" <%if(limite.equals("10")){%>selected<%}%>>10</option>
					                                <option value="20" <%if(limite.equals("20")){%>selected<%}%>>20</option>
					                                <option value="30" <%if(limite.equals("30")){%>selected<%}%>>30</option>
					                                <option value="40" <%if(limite.equals("40")){%>selected<%}%>>40</option>
					                                <option value="50" <%if(limite.equals("50")){%>selected<%}%>>50</option>
                            				</select>
                        					</td>
                    					</tr>
                					</table>
            					</td>
            					<td valign="top" valign="top">

                					<table width="90%" border="0">
                    					<tr>
                        					<td colspan="2">&nbsp;</td>
                    					</tr>
                    					<tr height="50">
					                        <td width="10%"  align="center"><input type="radio"
					                           	name="BuscaProceso" value="1"
					                        	<%if(buscaProceso.equals("1")){%>checked<%}%>
					                        	onClick="CambiaBusquedaProceso(this)"></td>
					                        <td width="10%" align="left"><font class="texto2">Identificador:</font></td>
					                        <!--td>&nbsp;</td-->
					                        <td width="40%" colspan="2" align="left">
					                        	<input name="Identificador" value="<%=id_proceso%>" type="text" class="inputText" size="22" maxlength="20" onKeyUp="detectarEnter(this)">
					                        </td>
					                        <td>&nbsp;</td>

					                    </tr>
					                    <%-- <tr height="50">
											<td width="10%" align="center"><input type="radio"
												name="BuscaProceso" value="3"
												<%if (buscaProceso.equals("3")) {%> checked <%}%>
												onClick="CambiaBusquedaProceso(this)"></td>
											<td width="10%" align="left"><font class="texto2">
													<%
														if (grupoResidencial.equals(grupoActivo)) {
																out.println("N&uacute;mero de solicitud :");
															}
															if (grupoEmpresa.equals(grupoActivo)) {
																out.println("Identificador de proyecto :");
															}
													%>
											</font></td>
											<td width="40%" colspan="2" align="left"><input
												name="idIntegracion" value="<%=idIntegracion%>" type="text"
												class="inputText" size="30" maxlength="29"></td>
											<td>&nbsp;</td>
										</tr> --%>
					                    <tr>
					                        <td width="11%" align="center"><input type="radio"
					                        	name="BuscaProceso" <%if(buscaProceso.equals("2")) {%>
					                        	checked<%}%> onClick="CambiaBusquedaProceso(this)"
					                        	value="2"></td>
					                        <td width="89%" colspan="4" align="left"><font class="texto2">Fecha Expiraci&oacute;n de Proceso</font></td>
					                    </tr>
					                    <tr height="25">
					                        <td width="11%"><font class="texto2" id="eti1" <%if(buscaProceso.equals("1")){%>style="display:none" <%}%> >Inicio :</font></td>
					                        <td width="39%"><input name="FechaInicial"
					                        	id="cajaFecha1" type="text" class="inputText"
					                        	value="<%=fechaInicial%>" size="15" readonly="readonly"
					                        	maxlength="10" <%if(buscaProceso.equals("1")){%>
					                        	style="display:none"<%}%>>
					                        	<a href="javascript:calendario1.popup();"><img id="cal1" src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario" <%if(buscaProceso.equals("1")){%>style="display:none" <%}%>></a>
					                        </td>
					                        <td width="11%"><font class="texto2" id="eti2" <%if(buscaProceso.equals("1")){%>style="display:none" <%}%> >Fin :</font></td>
					                        <td width="39%"><input name="FechaFinal" id="cajaFecha2"
					                        	type="text" value="<%=fechaFinal%>" class="inputText"
					                        	size="15" readonly="readonly" maxlength="10"
					                        	<%if(buscaProceso.equals("1")){%>style="display:none"
					                        	<%}%>>
					                        	<a href="javascript:calendario2.popup();">
					                        	<img id="cal2" src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario" <%if(buscaProceso.equals("1")){%>style="display:none"<%}%>></a>
					                        </td>
					                    </tr>
					                </table>
					            </td>
        					</tr>
    					</table>
    					<!--Tabla de la cabecera donde están todos los filtros de la busqueda -->

					</form>

					<center>
						<A HREF="javascript:Buscar()"
							onMouseOver="window.status='Realizar búsqueda';return true;"
							onMouseOut="window.status=' '"><img src="images/buscar.gif"
							width="107" height="28" onClick="" border="0"></a>
					</center>
					<br>
  <%
    if (vProcesos != null && vProcesos.size() > 0) {
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

					<table width="98%" border="1" align="center" class="tablas" vAling="top">
					    <tr>
					        <td class="bgCabeceraFila">
					        	<img align="middle" onclick="javascript:desplegarTodos(this)" name="mostrarTodas" border="0" height="13" width="14" src="images/mostrar.gif"/>
					         	T
					        </td>
					        <%
					            if (accion.equals("Cerrar")) {
					        %>
					        <td class="bgCabeceraFila" align="center" >
					        	<!-- <input name="todoCheckBox" type="checkbox" onclick="javascript:seleccionarTodos(this)" /> -->
								Cerrar Proceso
							</td>
					        <%
					            }
					        %>
					        <td class="bgCabeceraFila" align="center">
					        	<img src="images/ascen.gif" border="0" alt="Ordenar por IdProceso Ascendente" onclick="ordenarDatos('IDA')">
					        	&nbsp; &nbsp; Id. proceso &nbsp; &nbsp;
					        	<img src="images/descen.gif" border="0" alt="Ordenar por IdProceso Descendente" onclick="ordenarDatos('IDD')">
					        </td>
					        <td class="bgCabeceraFila" align="center">
					        	<img src="images/ascen.gif" border="0" alt="Ordenar por Fecha Ascendente" onclick="ordenarDatos('FA')">
					            &nbsp; Fecha Expiraci&oacute;n &nbsp;
					            <img src="images/descen.gif" border="0" alt="Ordenar por Fecha Descendente" onclick="ordenarDatos('FD')">
					        </td>
					        <td class="bgCabeceraFila" align="center">
					        	<img src="images/ascen.gif" border="0" alt="Ordenar por Estado Ascendente" onclick="ordenarDatos('EA')">
					            &nbsp; Estado &nbsp;
					            <img src="images/descen.gif" border="0" alt="Ordenar por Estado Descendente" onclick="ordenarDatos('ED')">
					        </td>
					        <td class="bgCabeceraFila" align="center">
					        	<img src="images/ascen.gif" border="0" alt="Ordenar por Tipo Cierre Ascendente" onclick="ordenarDatos('TA')">
					        	&nbsp; Tipo Cierre &nbsp;
					        	<img src="images/descen.gif" border="0" alt="Ordenar por Tipo Cierre Descendente" onclick="ordenarDatos('TD')">
					        </td>
					        <td class="bgCabeceraFila" align="center">
					        	<img src="images/ascen.gif" border="0" alt="Ordenar por Usuario Cierre Ascendente" onclick="ordenarDatos('UA')">
					        	&nbsp; Usuario &nbsp;
					        	<img src="images/descen.gif" border="0" alt="Ordenar por Usuario Cierre Descendente" onclick="ordenarDatos('UD')">
					        </td>
    					</tr>
    					<!-- Listamos todos los procesos -->
    					<%
					        if(vectorProcesos != null) {
            					for(int k=0;k<vectorProcesos.size();k++) {
                					ProcesoExpirado peT = (ProcesoExpirado) vectorProcesos.get(k);
                					cadenaTotalProcesos = cadenaTotalProcesos + peT.getIdProceso() + "-" + peT.getExpiracion() + "-" + peT.getEstado() /*+ "-" + ("".equals(peT.getUsuario()) ? " " : peT.getUsuario()) */ + ((k == vectorProcesos.size() - 1) ? "" : "&");
            					}
        					}

        					int j = 1;
        					String clase="";
        					if (vProcesos != null) {
            					for(int i=0; i<vProcesos.size(); i++) {
                					ProcesoExpirado pE = (ProcesoExpirado) vProcesos.get(i);
                					cadenaProcesos = cadenaProcesos + pE.getIdProceso() + "-" + pE.getExpiracion() + "-" + pE.getEstado() /* + "-" + ("".equals(pE.getUsuario()) ? " " : pE.getUsuario()) */ +((i == vProcesos.size()-1) ? "" : "&");
                					int indice = j;
                					j++;
                					if ((i % 2) == 0)
                    					clase="";
                					else
                    					clase="bgFila";
    					%>
					    <tr>
					        <form action="DetalleProceso" target="iframe<%=(pE.getIdProceso())%>" method="post" name="form<%=indice%>">
					            <INPUT TYPE="hidden" name="idProceso" value="<%=pE.getIdProceso()%>">
					            <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
					            <INPUT TYPE="hidden" name="tipoConsulta" value="Expirados">
					            <td class="<%=clase%>" align="center"><img align="middle" name="mostrar" onclick="mostrarOcultar(this,<%=indice%>,'<%=pE.getIdProceso()+"P"%>');" border="0" height="13" width="14" src="images/mostrar.gif" onMouseOver="mostrarAlt(this)" /></td>
					            <%
					                //Estamos en la opción cerrar, el proceso está abierto y no esta bloqueado con NOC
					                if (accion.equals("Cerrar") && (!pE.getEstado().equals(ParametroBeanCollection.ESTADO_EXPIRADO_CERRADO)) && !pE.getTipoCierre().equals("NOC"))
					                {
					            %>
					            <!--td class="<%=clase%>" align="center"><a href="javascript:cerrarPro('<%=pE.getIdProceso()%>','<%=pE.getExpiracion()%>');"  onMouseOut="window.status=' '"><img align="middle" name="cerrarProc" border="0" height="16"  src="images/delete.gif" onMouseOver="deleteAlt(this)" /></a></td-->
					            <td class="<%=clase%>" align="center"><input name="proc<%=i%>" type="checkbox" value="<%=pE.getIdProceso()%>"></td>
					            <%
					            	} else if (accion.equals("Cerrar")) {
					            %>
					            <td class="<%=clase%>" align="center"><input type="hidden" name="proc<%=i%>">-</td>
					            <%
					            	}
					            %>
					            <td class="<%=clase%>" align="center" ><font class="texto2"><%=pE.getIdProceso()%></font></td>
					            <td class="<%=clase%>" align="center" ><font class="texto2"><%=pE.getExpiracion()%></font></td>
					            <td class="<%=clase%>" align="center" ><font class="texto2"><%=pE.getEstado()%></font></td>
					            <td class="<%=clase%>" align="center" ><font class="texto2"><%=pE.getTipoCierre()%></font></td>
					            <td class="<%=clase%>" align="center" ><font class="texto2"><%=pE.getUsuario()%></font></td>
					        </form>

					    </tr>
					    <tr style="display:none" height="10" id="<%=pE.getIdProceso() + "P"%>">
					        <td colspan='7'>
					        <iframe width="100%" height="100%" id="iframe<%=(pE.getIdProceso())%>" name="iframe<%=(pE.getIdProceso())%>" src="DetalleProcesoJSP" frameborder="0" allowTransparency="true"></iframe>
					        </td>
					       </tr>
					    <%
					    	}
					    		}
					    %>
					</table>

					<jsp:include page="/NavegadorJSP" flush="true">
					    <jsp:param name="Limit" value="<%=limite%>" />
					    <jsp:param name="Total" value="<%=total%>" />
					    <jsp:param name="ActualLink" value="<%=pagina%>" />
					    <jsp:param name="DirectURL" value="javascript:Navegar(" />
					</jsp:include>
					<%--Nueva imagen--%>
					<center>
    					<%
        					if (accion.equals("Cerrar")) {
    					%>
    					<a href="javascript:CerrarMarcados()"
    						onMouseOver="window.status='Cerrar procesos marcados';return true"
    						onMouseOut="window.status=' '"><img src="images/Eliminar.jpg"
    						border="0"></a>
    					<%
        					}
    					%>
					</center>
					<table>
    					<tr>
    						<td align="center">
        						<%
            						if (vProcesos != null && vProcesos.size() > 0) {
        						%>
						        <form action="GenerarExcelTotal" method=post name="formExcel">
						            <INPUT TYPE="hidden" name="cadenaProcesos" value="<%=cadenaProcesos%>">
						            <input type="hidden" name="cadenaTotalProcesos" value="<%=cadenaTotalProcesos%>">
						            <!-- <input type="hidden" name="historico" value="0"> -->
						            <input type="hidden" name="tipoExcel">
						            <table>
						                <tr>
						                    <td><A HREF="javascript:VerExcel();"
						                    	onMouseOver="window.status='Consulta Offline en lista Excell';return true"
						                    	onMouseOut="window.status=' '">
						                    	<img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0"></A></td>
						                </tr>
						            </table>
						        </form>
						        <% } %>
	    					</td></tr>
					</table>
				</td>
				<td width="10" class="Fondoverdederecha">&nbsp;</td>
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
</script>


</html>
<%
	} catch (Exception e) {
    	System.out.println("Error en Consulta.jsp--->"+e);
	}
%>