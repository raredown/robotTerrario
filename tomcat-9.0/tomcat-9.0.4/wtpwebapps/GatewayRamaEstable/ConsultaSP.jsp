<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<meta HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.MensajesPendientes,
                 es.portanode.util.FechaInterna,
                 es.portanode.mensajes.MensajeNumeracion"%>
<%@ page import="java.io.*"%>
<%
	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("SP");

    String remitente = (String) request.getAttribute("Remitente");
    String opcionMenu = (String) request.getAttribute("opcionMenu");
	Vector vmensaje = (Vector) request.getAttribute("MensajesPendientes");

   // Vector vexpiracionMensajes = (Vector)request.getAttribute("expiracionMensajesPendientes");

	int nummensaje = vmensaje.size();
	int Limite =10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
    String filtro = (String) request.getParameter("filtroULL");
    if(filtro == null){
        filtro = "";
    }
    String tipoOrdenacion = (String) request.getAttribute("tipoOrdenacion");

    String num_inicio = (String) request.getAttribute("numIni");
    if (num_inicio == null)
    {
        num_inicio = "";
    }
    String num_final   = (String) request.getAttribute("numFin");
     if (num_final == null)
    {
        num_final = "";
    }

    /*String subtitulo1="";
    if("1".equals(opcionMenu))
     subtitulo1 = new String("Aceptaci&oacute;n de una solicitud de cambio");
    else
     subtitulo1 = new String("Denegaci&oacute;n de una solicitud de cambio");*/

     String subtitulo1="";
     if("1".equals(opcionMenu))
      subtitulo1 = new String("Aceptaci&oacute;n/Denegaci&oacute;n de una solicitud de cambio");
     /* else
      subtitulo1 = new String("Denegaci&oacute;n de una solicitud de cambio"); */
  %>
<SCRIPT LANGUAGE="JavaScript">
<!--

function Limpiar(){
    f = document.theForm;
    f.elegidos.value="";
    f.IdInternoElegidos.value="";
    f.FechaElegidos.value="";
    f.HoraElegidos.value="";
}

function TodoOk(num, opcionMenu){
	var formulario = dameFormulario(num);

	if(opcionMenu == "1"){
		if(formulario.FLAG_ES_ULL.value == "1" &&
				formulario.ID_SOLICITUD_ULL.value == "AAAAAAAAAAAAAAAAAAAAA" &&
				formulario.NUM_ADMIN_ULL.value == "88888888888888"){
			alert("No puede aceptar solicitudes de tipo consulta");
			return;
		}
	}

	formulario.accionSolicitud.value = opcionMenu;
	dameFormulario(num).submit();
}

function NavegarAnt(nPagina)
{
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaSP";
       f.submit();
}
function Navegar(nPagina){


       f = document.theForm;
       f.Posicion.value = nPagina;

       var num1 = f.filtroNumIni.value;
       var num2 = f.filtroNumFin.value;

       var error = comprobarNumeracion(num1,num2);

       if (!error)
       {
           f.filtroULL.value=f.filtro.value;
           f.action="PrevioConsultaSP";
           f.ordenar.value = "<%=tipoOrdenacion%>";

           f.submit();
      }
      else
      {
            alert('Número inicial y Número final deben estar formados por dígitos');
      }


}

function Abrir_ventanaAnt(NRN,NIR,NFR){
		var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
		window.open("PopUpJSP?NRN="+NRN+"&NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

function Abrir_ventana(indice,NRN,NIR,NFR){

        var f = dameFormulario(indice);
        var aux = f.NRNCadena.value;

		var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
		window.open("PopUpJSP?NRN="+aux+"&NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

function comprobarNumeracion(num1,num2)
{
    var error = false;
   var i = 0;
   while (!error && i < num1.length)
   {
      if (no_digito(num1.charAt(i)))
      {
        error = true;
      }
      else
      {
        i++;
      }
   }
   i = 0;
   while (!error && i < num2.length)
   {
      if (no_digito(num2.charAt(i)))
      {
         error = true;
      }
      else
      {
        i++;
      }
   }
   return error;
}
function Buscar()
{
   f = document.theForm;
   var num1 = f.filtroNumIni.value;
   var num2 = f.filtroNumFin.value;

   var error = comprobarNumeracion(num1,num2);

   if (!error)
   {
       f.action="PrevioConsultaSP";
       f.ordenar.value = "<%=tipoOrdenacion%>";

       f.submit();
   }
   else
    {
        alert('Número inicial y Número final deben estar formados por dígitos');
    }

}

function no_digito(cadena)
{
   var digitos="0123456789%"
   var k = 0;
   var validos = true;
   var valido = true;
   while(validos && k < cadena.length)
   {
        valido = false;
        var j = 0;
        while (!valido && j < digitos.length)
        {
            if ( cadena.charAt(k) == digitos.charAt(j) )
            {
                valido = true;
            }
            j++;
        }
        if (!valido)
        {
           validos = false;
        }
        k++;

   }
   if (!validos)
   {
        no_digitos = true;
   }
   else
   {
        no_digitos = false;
   }

   return no_digitos;

}

function ordenarDatos(tipo)
{
    f = document.theForm;
    f.action="PrevioConsultaSP";
	f.ordenar.value = tipo;

    var num1 = f.filtroNumIni.value;
    var num2 = f.filtroNumFin.value;

    var error = comprobarNumeracion(num1,num2);

    if (!error)
    {
	    f.submit();
    }
    else
    {
        alert('Número inicial y Número final deben estar formados por dígitos');
    }
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">


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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta <%=tipoMDescripcion %></DIV>


                <div align="center"><center>
                <table border="0" width="100%">
                <tr>
            	<td width="100%" align="center">
            	<FORM METHOD=POST name="theForm">
                    <INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
                    <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" NAME="opcionMenu" VALUE="<%=opcionMenu%>">
                    <INPUT TYPE="hidden" NAME="ordenar" VALUE="<%=tipoOrdenacion%>">
                    <input type="hidden" name="accionSolicitud">

                <table border="0" width="95%">
                      <tr>
                      <td align="center" class="texto2">
                           <table><tr>
                               <td>
                                   <table>
                                   <tr><td colspan='2'>&nbsp;</td></tr>
                                   <tr>
                                      <td><font class="texto2">Número inicial:</font></td>
                                      <td><INPUT TYPE="text" class="inputText" name="filtroNumIni" value="<%=num_inicio%>"></td>
                                   </tr>
                                   <tr>
                                       <td><font class="texto2">Número final:</font></td>
                                       <td><INPUT TYPE="text" class="inputText" name="filtroNumFin" value="<%=num_final%>" ></td>
                                    </tr>
                                  </table>
                              </td>
                              <td valig="center">
                                <a href="javascript:Buscar()//'" onMouseOver="window.status='Realizar búsqueda';return true" onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
                              </td>

                          </tr></table>
                      </td>

                      <td align="center" class="texto2">
                            <font class="texto2">Criterio de consulta de mensajes:</font>
                            <select class="inputText" id="filtro" onChange="document.theForm.filtroULL.value=this.value;javascript:Navegar(1);">
                                <option value="TODOS" <% if (filtro.equals("TODOS")){%> selected <%}%>>TODOS</option>
                                <option value="ULL_SI" <% if (filtro.equals("ULL_SI")){%> selected <%}%>>ULL SI</option>
                                <option value="ULL_NO" <% if (filtro.equals("ULL_NO")){%> selected <%}%>>ULL NO</option>
                            </select>
                        </td>
                        <td align="right">
                            <A HREF="#" onClick="document.theForm.filtroULL.value=this.value;javascript:Navegar(<%=posActual%>);" onMouseOver="window.status='Recargar';return true;" onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>
                        </td>
                      </tr>
                    </table>
                  </FORM>
            	</td>
        		</tr>

				<tr><td height="20">&nbsp;</td></tr>
                <tr>
                <td width="100%"><div align="center"><center>
                  <table  border="1" class="tablas" >

                          <tr>

                            <TD class="bgCabeceraFila"></TD>
                            <td align="center" class="bgCabeceraFila">
                               <img src="images/ascen.gif" border="0" alt="Ordenar por IdProceso Ascendente" onclick="ordenarDatos('IDA')">
                               &nbsp;&nbsp;
                               <img src="images/descen.gif" border="0" alt="Ordenar por IdProceso Descendente" onclick="ordenarDatos('IDD')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                               <img src="images/ascen.gif" border="0" alt="Ordenar por Operador Origen Ascendente" onclick="ordenarDatos('OOA')">
                                &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Operador Origen Descendente" onclick="ordenarDatos('OOD')">
                            </td>

                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Nombre Ascendente" onclick="ordenarDatos('NOA')">
                                &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Nombre Descendente" onclick="ordenarDatos('NOD')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Tipo Portabilidad Ascendente" onclick="ordenarDatos('TPA')">
                                &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Tipo Portabilidad Descendente" onclick="ordenarDatos('TPD')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Fecha Ventana Ascendente" onclick="ordenarDatos('FVA')">
                               &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Fecha Ventana Descendente" onclick="ordenarDatos('FVD')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Hora Ventana Ascendente" onclick="ordenarDatos('HOA')">
                               &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Hora Ventana Descendente" onclick="ordenarDatos('HOD')">
                            </td>
                            <td align="center" class="bgCabeceraFila" COLSPAN="2">
                                <!--img src="images/ascen.gif" border="0" alt="Ordenar por Número Inicial Ascendente" onclick="ordenarDatos('NIA')"-->
                               &nbsp;&nbsp;
                                <!--img src="images/descen.gif" border="0" alt="Ordenar por Número Inicial Descendente" onclick="ordenarDatos('NID')"-->
                            <!--/td>
                            <td align="center" class="bgCabeceraFila">
                                <!--img src="images/ascen.gif" border="0" alt="Ordenar por Número Final Ascendente" onclick="ordenarDatos('NFA')"-->
                              &nbsp;&nbsp;
                                <!--img src="images/descen.gif" border="0" alt="Ordenar por Número Final Descendente" onclick="ordenarDatos('NFD')"-->
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <!--img src="images/ascen.gif" border="0" alt="Ordenar por NRN Ascendente" onclick="ordenarDatos('NRA')"-->
                               &nbsp;&nbsp;
                                <!--img src="images/descen.gif" border="0" alt="Ordenar por NRN Descendente" onclick="ordenarDatos('NRD')"-->
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por ULL Ascendente" onclick="ordenarDatos('ULA')">
                               &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por ULL Descendente" onclick="ordenarDatos('ULD')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Fecha de Expiración Ascendente" onclick="ordenarDatos('FEA')">
                               &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Fecha de Expiración Descendente" onclick="ordenarDatos('FED')">
                            </td>
                            <td align="center" class="bgCabeceraFila">
                                <img src="images/ascen.gif" border="0" alt="Ordenar por Fecha de llegada Ascendente" onclick="ordenarDatos('FLA')">
                               &nbsp;&nbsp;
                                <img src="images/descen.gif" border="0" alt="Ordenar por Fecha de llegada Descendente" onclick="ordenarDatos('FLD')">
                            </td>
                          </tr>

                           <tr><td colspan="13"></td></tr>

                          <tr>
                            <TD class="bgCabeceraFila"></TD>
                            <td align="center" class="bgCabeceraFila">
                               Id. Proceso
                            </td>
                            <td align="center" class="bgCabeceraFila">
                               Op. origen
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                              Nombre o Raz&oacute;n Social
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                              Tipo de portabilidad
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                             Fecha inicio ventana
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                             Hora inicio ventana
                            </td>
                            <td align="center" class="bgCabeceraFila">
                              N&uacute;mero inicial
                            </td>
                            <td align="center" class="bgCabeceraFila">
                              N&uacute;mero final
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                              NRN
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                             &nbsp;&nbsp;&nbsp;ULL&nbsp;&nbsp;&nbsp;
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                              Expiraci&oacute;n
                            </td>
                            <TD align="center" class="bgCabeceraFila">
                              Llegada
                            </td>
                          </tr>


                     <%
                    String clase="";
                    int fin;
                    System.out.println("nummensaje "+nummensaje+" inici "+inici+" Limite "+Limite);
                    if (nummensaje < inici+Limite)
                    {
                        fin = nummensaje;
                    }
                    else
                    {
                        fin = inici+Limite;
                    }
                    System.out.println("inici "+inici+" fin "+fin);
                    int j=1;
                    for(int i=inici;i<fin;i++){
                        MensajesPendientes.MensajePendienteSP mensaje = (MensajesPendientes.MensajePendienteSP) vmensaje.elementAt(i);
                        String nif = mensaje.getNif();
                        String nombre = mensaje.getAbonado();
                        String fecha1 = mensaje.getFecha();
                        String fecha = FechaInterna.ConvertToFechaExterna(fecha1);

                        //CAMBIO NUEVA ESPECIFICACION

                        Vector rangosNumeracion = mensaje.getRangosNumeracion();
                        String flagNumCompleta = mensaje.getFlagNumCompleta();
                        String numInicial = mensaje.getNumInicial();
                        String numFinal = mensaje.getNumFinal();
                        String nrn = mensaje.getNrn();

                        String portabilidad = mensaje.getTipoPortabilidad();
                        /* String descTipoPortabilidad = "";
                        if (portabilidad.equals("01")) {
                      	  descTipoPortabilidad = "Acceso individual";
                        } else if (portabilidad.equals("02") || portabilidad.equals("03")) {
                      	  descTipoPortabilidad = "Accesos m&uacute;ltiples";
                        } else if (portabilidad.equals("04")) {
                      	  descTipoPortabilidad = "N&uacute;meros inteligentes";
                        } */

                        String IdProceso = mensaje.getIdProceso();
                        String IdInterno = mensaje.getIdInterno();
                        String hora1 = mensaje.getHora();
                        String hora ="";
                        if((!"".equals(hora1))&&(hora1!=null))
                           hora = hora1.substring(0,2)+":"+hora1.substring(2,4)+":"+hora1.substring(4,6);
                        String opOrigen = mensaje.getOpOrigen();
                        String descripcionOperador = mensaje.getDescOpOrigen();
                        if (descripcionOperador.length()>50)
                        {
                            descripcionOperador = descripcionOperador.substring(0,50);
                        }

                        boolean esULL = mensaje.getULL();
                        String sEsULL ="";
                        if(esULL) sEsULL = "SI"; else sEsULL="NO";

                        String llegada = mensaje.getLlegada();
                        String expiracion = mensaje.getExpiracion();
                        if (expiracion.equals("0"))
                            expiracion="";


                        int indice = j;
                        j++;
                        if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";

                            %>
                            <tr>
                       <FORM action="RespuestaSP" method=POST name="form<%=indice%>">
                           <INPUT TYPE="hidden" name="IdProceso" value="<%=remitente%><%=IdProceso%>">
                           <INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
                           <INPUT TYPE="hidden" name="IdInterno" value="<%=IdInterno%>">
                           <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                           <INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
                           <INPUT TYPE="hidden" name="opcionMenu" value="<%=opcionMenu%>">
                           <INPUT TYPE="hidden" name="numFormulario" value="<%=indice%>">
                           <%-- <TD class="<%=clase%>"><p><a href="javascript:TodoOk(<%=indice%>)//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></p></TD> --%>

                           <input type="hidden" name="accionSolicitud">

                          	<TD class="<%=clase%>">
								<a href="javascript:TodoOk(<%=indice%>,'1')//'"
                           				onMouseOver="window.status='Aceptaci&oacute;n de solicitud de cambio';return true" onMouseOut="window.status=' '">
                           			<img src="images/veer.gif" alt="Aceptaci&oacute;n de solicitud de cambio" border="0">
                           		</a>
                       		    <br/>
                           		<a href="javascript:TodoOk(<%=indice%>,'2')//'"
                           				onMouseOver="window.status='Denegaci&oacute;n de solicitud de cambio';return true" onMouseOut="window.status=' '">
                           			<img src="images/delete.gif" alt="Denegaci&oacute;n de solicitud de cambio" border="0">
                           		</a>
                           	</TD>

                           <td class="<%=clase%>" align="center"><font class="texto2" size="1"><%=IdProceso%></font></td>
                           <td class="<%=clase%>" align="center"><font class="texto2" size="1"><%=descripcionOperador%></font></td>
                           <!--<td class="<%=clase%>" align="center"><font class="texto2" size="1"><%=nif%></font></td>-->
                           <td class="<%=clase%>"><font class="texto2" size="1"><%=nombre%></FONT></TD>
                           <%-- <td class="<%=clase%>" align="center" title="<%=descTipoPortabilidad%>"><font class="texto2" size="1"><%=portabilidad%></font></td> --%>
                           <td class="<%=clase%>" align="center"><font class="texto2" size="1"><%=portabilidad%></font></td>
                           <TD class="<%=clase%>"><font class="texto2" size="1"><%=fecha%></font></TD>
                           <TD class="<%=clase%>"><font class="texto2" size="1"><%=hora%></font></TD>
                           <%//Parte utilizada para mostrar todos los rangos asociados al mensaje SP
                             Vector m_NRN = new Vector();
                             Vector m_NIR = new Vector();
                             Vector m_NFR = new Vector();
                             String NRNS  = "";
                             boolean variosRangos = false;
                             if (rangosNumeracion.size()>0)
                             {

                                for (int b=0; b< rangosNumeracion.size(); b++)
                                 {
                                     MensajeNumeracion tmp = (MensajeNumeracion)rangosNumeracion.elementAt(b);
                                     m_NRN.add(tmp.getNRN());
                                     m_NIR.add(tmp.getNumInicialRango());
                                     m_NFR.add(tmp.getNumFinalRango());

                                    String aux1 = (String)tmp.getNRN();
                                     if (b != 0)
                                    {
                                        NRNS = NRNS + ","+ aux1;
                                    }
                                    else
                                     {
                                         NRNS = aux1;
                                     }
                                }
                                if (rangosNumeracion.size() > 1)
                                {
                                    variosRangos = true;
                                }
                             }
                            %>
                           <td class="<%=clase%>" align="center" COLSPAN="2">
                                 <a href="javascript:Abrir_ventana(<%=indice%>,<%=m_NRN.toString() %>,<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'">
                                  <font class="textoEnlace" size="1"><%=numInicial%></font>
                                 </a>
                           <!--/td>
                           <td class="<=clase%>" align="center"-->
                                 <BR>
                                 <a href="javascript:Abrir_ventana(<%=indice%>,<%=m_NRN.toString() %>,<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'">
                                  <font class="textoEnlace" size="1"><%=numFinal%></font>
                                 </a>

                           </td>
                           <td class="<%=clase%>" align="center"><font class="texto2" size="1"><%=nrn%></font></td>
                           <TD class="<%=clase%>"><small><font class="texto2" size="1">&nbsp;<%=sEsULL%>&nbsp;</font></small></TD>
                           <TD class="<%=clase%>"><small><font class="texto2" size="1"><%=expiracion%></font></small></TD>
                           <TD class="<%=clase%>"><small><font class="texto2" size="1"><%=llegada%></font></small></TD>
                           <input TYPE="hidden" name="NRN" value="<%=m_NRN.toString() %>">
                            <input TYPE="hidden" name="NIR" value="<%=m_NIR.toString() %>">
                            <input TYPE="hidden" name="NFR" value="<%=m_NFR.toString() %>">

                            <input TYPE="hidden" name="NRNCadena" value="<%=NRNS%>">

                            <input TYPE="hidden" name="FLAG_NUM_COMPLETA" value="<%=mensaje.getFlagNumCompleta() %>">
                            <input TYPE="hidden" name="FLAG_ES_ULL" value="<%=mensaje.getFlagUll() %>">
          					<input TYPE="hidden" name="ID_SOLICITUD_ULL" value="<%=mensaje.getIdUll() %>">
            				<input TYPE="hidden" name="NUM_ADMIN_ULL" value="<%=mensaje.getNumAdminUll() %>">
                            </FORM>
                             </tr>
                      <%
                     }//fin del for
                      %>


                        </table>
                        </td>
                        </tr>
                      </table>
                <!-- 	Calling Navegador.jsp	-->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=nummensaje%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>

                </center></div>
                <FORM METHOD=POST ACTION="MenuRolDonante.jsp" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <div align="center"><center>
                <table border="0">
                <tr>

                <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
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
   </body>
</html>