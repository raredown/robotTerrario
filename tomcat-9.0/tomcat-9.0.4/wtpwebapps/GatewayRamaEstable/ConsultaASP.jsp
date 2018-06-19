<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js">
</script><link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<%
	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("ASP"); 

	String remitente = (String) request.getAttribute("Remitente");
	Vector vmensaje = (Vector) request.getAttribute("MensajesPendientes");


    int Limite =10;
    String posurl = (new Integer(request.getParameter("Posicion"))).toString();
	int posActual = (new Integer(posurl)).intValue();


    // Voy a inicializar los límites para la paginación
    int numVisibles = 0; // Número de elementos que van a ser visibles (mensajes que no vienen de proceso 12
    int contPaginas = 0; // Contador de páginas
    int inici = 0;  // Posición inicial a mostrar (primer elemento a mostrar en el listado)
    MensajesPendientes.MensajePendienteASP mensaje = null;
    if (vmensaje != null)
    {
        for (int k=0;k<vmensaje.size();k++)
        {
            //System.out.println ("k="+k);
            mensaje = (MensajesPendientes.MensajePendienteASP) vmensaje.elementAt(k);
            if ( mensaje.getULL() && mensaje.getIdProceso().substring(13,15).equals("12")  )
            {

            }
            else
            {
                numVisibles++;
                if (k % Limite == 0)
                {
                    contPaginas++;
                    //System.out.println ("New pagina "+contPaginas+":::: posActual="+posActual);
                    if (contPaginas == posActual)
                    {
                        inici = k;
                        //System.out.println ("inici "+inici);
                    }
                }
            }
        }
    }

    posurl = String.valueOf(inici);

    int nummensaje = vmensaje.size();


 	//int inici = (posActual-1)*Limite;
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
function Multiple(nPagina){

	      var err = 0;
      var str
      var total = <%=(vmensaje.size())+1%>;
      var aux1 = nPagina * 10;
      if (total >= aux1 )
      {
            total = 11
      }
      else
      {
           var aux2 = nPagina - 1;
           total = total - (aux2 * 10);
      }

     d = document;
     f = document.theForm;

     for (j=1; j < total; j++)
    {
        if (dameCampo('choose',j) != null && dameCampo('choose',j).checked){
        	if(((dameCampo('IdProceso',j).value).substring(18,20))==12){
        		alert("Proceso 12 no permite enviar confirmación de portabilidad");
        		return;
        	}
           f.elegidos.value+=dameCampo('IdProceso',j).value+"+";
           f.IdInternoElegidos.value+=dameCampo('IdInterno',j).value+"+";        }
    }
    if (err == 0)
    {
       if (f.elegidos.value == "")
       {
          alert("Ha de escoger un mensaje a responder");
          return;
       }
       f.submit();
    }
    else return;
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaASP";
       f.submit();
}

function TodoOk(num){
     dameFormulario(num).submit();
}

function Abrir_ventana(NIR,NFR){
		var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=192,height=215,focus=true,Titlebar=no";
		window.open("PopUpJSP?NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}


//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.MensajesPendientes,
                 es.portanode.util.FechaInterna,
                 es.portanode.mensajes.MensajeNumeracion,
                 java.util.Enumeration"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
     

    String filtro = (String) request.getParameter("filtroULL");
    if(filtro == null){
        filtro = "";
    }
    if (filtro.equals("")) filtro="TODOS";
    String subtitulo1 = new String("Confirmaci&oacute;n (CP) de solicitud de cambio");
  %>
<%@include file="cabeceraLogo.jsp"%>

      <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
        <TBODY>
        <TR>
          <td width="10" class="Fondoverdederecha">&nbsp;
             
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta <%=tipoMDescripcion%>&nbsp;</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="ResponderMsgASPMultiple" name="theForm">
                <INPUT TYPE="hidden" name="elegidos" value="">
                <INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="IdInternoElegidos" value="">
                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
                </FORM>
                <table border="0" width="100%">
                <tr>
        	      <td width="100%" align="center" class="texto2">
            		<table border="0" width="95%">
                      <tr>
                        <td align="center" class="texto2">
                            Criterio de consulta de mensajes:
                            <select id="filtro" class="inputText" onChange="document.theForm.filtroULL.value=this.value;javascript:Navegar(1);">
                            <option value="TODOS" <% if (filtro.equals("TODOS")){%> selected <%}%>>TODOS</option>
                            <option value="ULL_SI" <% if (filtro.equals("ULL_SI")){%> selected <%}%>>ULL AUTO SI</option>
                            <option value="ULL_NO" <% if (filtro.equals("ULL_NO")){%> selected <%}%>>ULL AUTO NO</option>
                            </select>
                        </td>
                        <td align="right">
                            <!--<A HREF="#" onClick="document.theForm.filtroULL.value=this.value;javascript:Navegar(<%=posActual%>);" onMouseOver="window.status='Recargar';return true;" onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>-->
                            <A HREF="#" onClick="javascript:Navegar(<%=posActual%>);" onMouseOver="window.status='Recargar';return true;" onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>
                        </td>
                      </tr>
                    </table>
        		 </td>
    		    </tr>
                    <tr>
        	      <td width="100%" align="center" class="texto2">&nbsp;
            		
        		 </td>
    		    </tr>
                    <tr>
                        <td width="100%"><div align="center"><center>
                          <table border="1" class="tablas">
                            <tr>
                                <TD class="bgCabeceraFila"></TD>
                                <td class="bgCabeceraFila">&nbsp;</td>
                                <td align="center" class="bgCabeceraFila">Operador origen</td>
                                <td align="center" class="bgCabeceraFila">N&uacute;m. proceso</td>
                                <td align="center" class="bgCabeceraFila">N&uacute;m. solicitud</td>
                                <td align="center" class="bgCabeceraFila">Fecha preferida</td>
                                <td align="center" class="bgCabeceraFila">Hora preferida</td>
                                <td align="center" class="bgCabeceraFila">N&uacute;mero inicial</td>
                                <td align="center" class="bgCabeceraFila">N&uacute;mero final</td>
                                <td align="center" class="bgCabeceraFila">ULL</td>
                            </tr>

                            <%
                                    //System.out.println ("-----------------------------------");
                                    //System.out.println ("Numero de mensajes:"+nummensaje);
                                    //System.out.println ("Numero de mensajes visibles:"+numVisibles);
                                    //System.out.println ("-----------------------------------");
                                    String clase="";
                                    int fin;
                                    if (nummensaje < inici+Limite) fin = nummensaje;
                                    else fin = inici+Limite;
                                    //System.out.println ("inici:"+inici);
                                    //System.out.println ("fin:"+fin);
                                    int j=1;
                                    // CMC
                                    int contadorMensaje = 0;
                                    int posicion = inici;
                                    //for(int i=inici;i<fin;i++)
                                    while (posicion < nummensaje && contadorMensaje < Limite)
                                    {
                                        //System.out.println ("posicion:"+posicion);

                                        mensaje = (MensajesPendientes.MensajePendienteASP) vmensaje.elementAt(posicion);
                                        String numSolicitud = mensaje.getNumSolicitud();
                                        if (numSolicitud == null)
                                            numSolicitud = "&nbsp;";
                                        String fecha="";
                                        String fecha1 = mensaje.getFecha();
                                        if (fecha1 == null)
                                            fecha = "&nbsp;";
                                        else fecha=FechaInterna.ConvertToFechaExterna(fecha1);
                                        String hora = "";
                                        String hora1 = mensaje.getHora();
                                        if (hora1 == null)
                                            hora = "&nbsp;";
                                        else  hora = hora1.substring(0,2)+":"+hora1.substring(2,4)+":"+hora1.substring(4,6);

                                        //CAMBIO NUEVA ESPECIFICACION.
                                        Vector rangosNumeracion = mensaje.getRangosNumeracion();
                                        String numInicial = mensaje.getNumInicial();
                                        if (numInicial == null)
                                            numInicial = "&nbsp;";
                                        String numFinal = mensaje.getNumFinal();
                                        if (numFinal == null)
                                            numFinal = "&nbsp;";

                                        String IdProceso = mensaje.getIdProceso();
                                        String IdInterno = mensaje.getIdInterno();
                                        String opOrigen = mensaje.getOpOrigen();
                                        String descripcionOperador = mensaje.getDescOpOrigen();
                                        if (descripcionOperador.length()>50)
                                        {
                                            descripcionOperador = descripcionOperador.substring(0,50);
                                        }
                                        boolean esULL = mensaje.getULL();
                                        //System.out.println ("Mensajes:"+contadorMensaje);
                                        //System.out.println ("mensaje.getULL():"+mensaje.getULL());
                                        //System.out.println ("esULL:"+esULL);
                                        //System.out.println ("Mensaje:"+mensaje.getIdProceso());
                                        //System.out.println ("12:"+mensaje.getIdProceso().substring(13,15).equals("12"));
                                         %>
                            <%
                                        if ( esULL && mensaje.getIdProceso().substring(13,15).equals("12")  )
                                        {
                                        }
                                        else
                                        {
                                            posurl= String.valueOf(posicion);

                                            //System.out.println ("--PINTO--"+posurl);
                                            contadorMensaje++;
                                            String sEsULL ="";
                                            if(esULL) sEsULL = "SI"; else sEsULL="NO";
                                            int indice = j;
                                            j++;
                                            if((contadorMensaje%2)==0)
                                                clase="";
                                            else
                                                clase="bgFila";

                                               %>
                                            <form action="RespuestaASP" method=post name="form<%=indice%>">
                                             <INPUT TYPE="hidden" name="IdProceso<%=indice%>" value="<%=remitente%><%=IdProceso%>">
                                             <INPUT TYPE="hidden" name="Remitente<%=indice%>" value="<%=remitente%>">
                                             <INPUT TYPE="hidden" name="IdInterno<%=indice%>" value="<%=IdInterno%>">
                                             <INPUT TYPE="hidden" name="Indice" value="<%=indice%>">
                                             <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                                             <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                                             <INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">

                                                <TD class="<%=clase%>"><p><a href="javascript:TodoOk(<%=indice%>)//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></p></TD>
                                                <td class="<%=clase%>"><INPUT type="checkbox" name="choose<%=indice%>" value="Si"></td>
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=descripcionOperador%></font></td>
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=IdProceso%></font></td>
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=numSolicitud%></font></td>
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=fecha%></font></td>
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=hora%></font></td>
                                                <%
                                                //Parte para mostrar los rangos asociados a la numeracion
                                                if (rangosNumeracion.size()>0)
                                                {
                                                    Vector m_NIR = new Vector();
                                                    Vector m_NFR = new Vector();
                                                    for (int cont=0; cont< rangosNumeracion.size(); cont++)
                                                    {
                                                        MensajeNumeracion tmp = (MensajeNumeracion)rangosNumeracion.elementAt(cont);
                                                        m_NIR.add(tmp.getNumInicialRango());
                                                        m_NFR.add(tmp.getNumFinalRango());
                                                    }
                                                %>
                                                <td class="<%=clase%>" align="center">

                                                   <a href="javascript:Abrir_ventana(<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'"><font class="textoEnlace" size=2><%=numInicial%></font></a>

                                                </td>
                                                <td class="<%=clase%>" align="center">
                                                   <a href="javascript:Abrir_ventana(<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'"><font class="textoEnlace" size=2><%=numFinal%></font></a>
                                                </td>
                                                <input TYPE="hidden" name="NIR" value="<%=m_NIR.toString() %>">
                                                <input TYPE="hidden" name="NFR" value="<%=m_NFR.toString() %>">
                                                <input TYPE="hidden" name="FLAG_NUM_COMPLETA" value="<%=mensaje.getFlagNumCompleta() %>">
                                                <td class="<%=clase%>" align="center"><font class="texto2" size=2><%=sEsULL%></font></td>



                                <%
                                                }else{
                                %>
                                                <td class="<%=clase%>">&nbsp;</td>
                                <%
                                                }
                                %>

                                            </form>
                                            </tr>
                                <%


                                        }
                                        posicion++;
                                        //System.out.println ("----------");
                                  }  // FOR
                                 %>
                        </table>
                        </center>
                      </div>
                     </td>
                    </tr>
                </table>
                </center></div>
                <div align="center"><center>
                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numVisibles%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>
                </center>
               </div>
               <div align="center">
                <center>
                <br><br><br>
                <table border="0" cellpadding='0' cellspacing='0' width="100%">
                <FORM METHOD=POST ACTION="MenuRolReceptor.jsp" name="fback">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <%  if (nummensaje ==0){
                %>
                    <tr>

                       <td align="center"><A HREF="javascript:/*'*/void(alert('No hay ningun mensaje a responder'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                           <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>

                    </tr>
                <% }
                   else {
                %>
                    <tr>

                        <td align="center"><A HREF="javascript:Multiple(<%=posActual%>)//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                            <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>

                    </tr>
                <% }
                %>
                </table>
                </center></div>
             <%--Nueva imagen--%>
             </td>
             <td width="10" class="Fondoverdederecha">&nbsp;
                
             </td>
          </TR>
        </TBODY>
      </table>
   <%--Nueva imagen--%>
          <jsp:include page="pie.jsp" flush="true"/>
</body>
</html>