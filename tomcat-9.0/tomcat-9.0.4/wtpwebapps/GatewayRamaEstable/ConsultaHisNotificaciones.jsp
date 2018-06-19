<HTML>
<head>
    <title>Operador</title>
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">

    function Navegar(nPagina) {
        f = document.theForm;
        f.Posicion.value = nPagina;
        f.action = "PrevioConsultaHisNotificacion";
        f.submit();
    }

    function Buscar(num) {
        theForm.submit();
    }

    function Detalle(nombre, asunto) {

        // Cambiamos '||' por '<br>'
        var nombre = new String(document.theForm.elements[nombre].value);
        var asunto = new String(document.theForm.elements[asunto].value);
        var nl = "\n";
        var nombreR;
        var asuntoR;
        var finRNombre = false;
        while (!finRNombre) {
            nombreR = nombre.replace(nl, "<br/>");
            if (nombreR == nombre) finRNombre = true;
            nombre = nombreR;
        }

        var finRAsunto = false;
        while (!finRAsunto) {
            asuntoR = asunto.replace(nl, "<br/>");
            if (asuntoR == asunto) finRAsunto = true;
            asunto = asuntoR;
        }
        document.theForm2.valordetalle.value = nombre;
        document.theForm2.valorasunto.value = asunto;
        window.open("Detalle.html", "Detalle", "toolbar=0,scrollbars=yes,resizable=yes,width=500,height=300");
    }
</SCRIPT>

<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">


<%@ page import="java.util.Vector" %>
<%@ page import="es.portanode.util.*" %>


<%
    String subtitulo1 = new String("Consulta Histórico Notificaciones");

    int Limite = 10;
    String posurl = request.getParameter("Posicion");
    int posActual = new Integer(posurl);
    int inici = (posActual - 1) * Limite;

    Vector<NotificacionesBean> vResultados = (Vector<NotificacionesBean>) request.getAttribute("listaResultados");
    String fechaInicio = (String) request.getAttribute("iniFechaRango") == null ? "" : (String) request.getAttribute("iniFechaRango");
    String fechaFin = (String) request.getAttribute("finFechaRango") == null ? "" : (String) request.getAttribute("finFechaRango");
    int numNotif = vResultados != null ? vResultados.size() : 0;

    String operador = (String) request.getParameter("OperadorConexion");
%>


<%@ include file="cabeceraLogo.jsp" %>
<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
    <tr>
        <td width="10" class="Fondoverdederecha">
            &nbsp;
        </td>
        <td vAlign=top width="180" class="celdalineaderecha">
            <%@ include file="menu.jsp" %>
        </td>
        <td class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
            <br>

            <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta Hist&oacute;rico
                Notificaciones&nbsp;</DIV>

            <div align="center">
                <center>
                    <br><br>

                    <FORM METHOD=POST ACTION="PrevioConsultaHisNotificacion" name="theForm">
                        <input type="hidden" name="Descripcion"/>
                        <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>"/>
                        <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"/>
                        <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>"/>
                        <INPUT TYPE="hidden" NAME="Primera" VALUE="1"/>

                        <table align="center" border="0">
                            <tr>
                                <td>
                                    <font class="texto2">Buscar Notificaciones entre </font>
                                    <input type="text" class="inputText" size="15" maxlength="15" name="iniFechaRango"
                                           value="<%=fechaInicio%>" readonly>
                                    <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif"
                                                                                   width="16"
                                                                                   height="16"
                                                                                   border="0" alt="Calendario"></a>
                                    <font class="texto2">y </font>
                                    <input type="text" class="inputText" size="15" maxlength="15" name="finFechaRango"
                                           value="<%=fechaFin%>"
                                           readonly>
                                    <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif"
                                                                                   width="16"
                                                                                   height="16"
                                                                                   border="0" alt="Calendario"></a>
                                </td>
                                <td>
                                    <a href="javascript:Buscar()//'"
                                       onMouseOver="window.status='Realizar búsqueda';return true"
                                       onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar"
                                                                           border="0"></a>
                                </td>
                            </tr>
                        </table>
                        <br/>

                        <table align="center" border="1" class="tablas" width="500">
                            <tr>
                                <td class="bgCabeceraFila">&nbsp;</td>
                                <td width="150" align="center" class="bgCabeceraFila">
                                    <small>Fecha de Notificacion</small>
                                </td>
                                <td width="370" align="center" class="bgCabeceraFila">
                                    <small>Asunto</small>
                                </td>
                            </tr>

                            <%
                                if (vResultados != null && numNotif != 0) {
                                    String clase = "";

                                    int fin2;
                                    int fin1;
                                    fin2 = inici + Limite;
                                    if (fin2 < Limite)
                                        fin1 = 1;
                                    else
                                        fin1 = inici;

                                    String fechaNotificacion = "";
                                    String contenidoMensaje = "";
                                    String motivoMensaje = "";

                                    int index = 999;
                                    int i = 0;
                                    for (int j = fin1; j < fin2 && j < numNotif; j++) {
                                        NotificacionesBean notif = vResultados.get(j);
                                        if (index == 999)
                                            index = 0;

                                        fechaNotificacion = notif.getFechaNotificacion().toString();
                                        //fechaNotificacion = fechaNotificacion.substring(8, 10) + "/" + fechaNotificacion.substring(5, 7) + "/" + fechaNotificacion.substring(0, 5) + " " + fechaNotificacion.substring(11, 19);
                                        contenidoMensaje = notif.getTextoMensaje();
                                        motivoMensaje = notif.getSubject();
                                        if ((i % 2) == 0)
                                            clase = "";
                                        else
                                            clase = "bgFila";
                                        i++;

                            %>
                            <tr>
                                <input type="hidden" name="valor<%=index%>" value="<%=contenidoMensaje%>">
                                <input type="hidden" name="asunto<%=index%>" value="<%=motivoMensaje%>">
                                <td class="<%=clase%>">
                                    <a href="javascript:Detalle('valor<%=index%>','asunto<%=index%>')//'"
                                       onMouseOver="window.status='Ver Detalle';return true"
                                       onMouseOut="window.status=' '">
                                        <img src="images/veer.gif" alt="Ver Detalle" border="0"/>
                                    </a>
                                </td>
                                <td class="<%=clase%>" width="150" align="center">
                                    <font class="texto2">
                                        <small><%=fechaNotificacion%>
                                        </small>
                                    </font>
                                </td>
                                <td class="<%=clase%>" width="370" align="center">
                                    <font class="texto2">
                                        <small><%=motivoMensaje%>
                                        </small>
                                    </font>
                                </td>
                            </tr>
                            <%
                                        index++;
                                    }
                                }
                            %>
                        </table>
                    </FORM>

                    <table align="center" border="0">
                        <tr>
                            <td>
                                <jsp:include page="/NavegadorJSP" flush="true">
                                    <jsp:param name="Limit" value="<%=Limite%>"/>
                                    <jsp:param name="Total" value="<%=numNotif%>"/>
                                    <jsp:param name="ActualLink" value="<%=posActual%>"/>
                                    <jsp:param name="DirectURL" value="javascript:Navegar("/>
                                </jsp:include>
                            </td>
                        </tr>
                    </table>
                    <table align="center" border="0">
                        <tr>
                            <td>
                                <BR>
                                <BR>
                                <BR>

                                <FORM METHOD=POST ACTION="MenuPrincipalJSP" name="fback">
                                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=imagen%>">
                                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                                    <INPUT TYPE="hidden" name="Posicion" value="1">
                                </FORM>
                                <A HREF="javascript:document.fback.submit()"
                                   onMouseOver="window.status='Página Anterior';return true;"
                                   onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0"
                                                                       height="28"></A>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <form ACTION="javascript:void(null)" METHOD=post name="theForm2">
                                    <INPUT TYPE="hidden" name="valordetalle" value="">
                                    <INPUT TYPE="hidden" name="valorasunto" value="">
                                </form>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </td>
        <td width="10" class="Fondoverdederecha">
            &nbsp;
        </td>
    </tr>
</table>
<jsp:include page="pie.jsp" flush="true"/>
<script language="JavaScript">
    setPath('<%= request.getContextPath() %>');
    var calendario1 = new calendar1(document.theForm.iniFechaRango);
    var calendario2 = new calendar1(document.theForm.finFechaRango);
</script>

</body>
</HTML>
