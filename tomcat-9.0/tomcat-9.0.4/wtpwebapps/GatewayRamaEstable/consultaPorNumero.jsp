<html>
<head>
    <title>Operador</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
    <!--

    function VerExcel() {

        var f = document.theForm;
        f.listarExcell.value="1";
        var f1 = document.formRadios;
        if (f1.tipoExcelF1[0].checked){
        	 f.tipoExcel.value = 'total';
        }else{
        	f.tipoExcel.value = 'actual';
         }
        f.submit();
        info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
    }

    function Navegar(nPagina){
        f = document.theForm;
        f.listarExcell.value="";
        f.Posicion.value = nPagina;
        f.action="PrevioConsultaPorNumero";
        f.submit();
    }

    function Buscar(num){
        var f=document.theForm;
        f.listarExcell.value="";
        var contiene=compruebaPatronNumero(f);
        if (f.NumeroAbonado.value == ""){
            alert("Debe introducir datos en el campo Rango Inicial");
            f.NumeroAbonado.focus();
            return;
        }
        if ((f.NumeroAbonadoF.value == "")&&(contiene == "no")){
            f.NumeroAbonadoF.value=f.NumeroAbonado.value;
        }
        if ((f.NumeroAbonadoF.value != "")&&(contiene == "si")){
            f.NumeroAbonadoF.value="";
        }

        theForm.submit();
    }

    function compruebaPatronNumero(f){
        var numPat=/^[0-9]+%$/;
        var text=f.NumeroAbonado.value;
        var result=text.match(numPat);
        if (result==null)
        {
            f.contiene.value="no";
            return "no";
        }else{
            f.contiene.value="si";
            return "si";
        }
    }


    function TodoOk(num){
        dameFormulario(num).submit();
    }

    //-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.ArrayList,
                 es.portanode.procesos.ProcesoAbiertoBean,
                 es.portanode.util.operadores.OperadorBean,
                 es.portanode.util.operadores.OperadorBeanCollection"%>
<%@ page import="java.util.Vector"%>
<%
    try{
        String contiene=(String)request.getAttribute("contiene");
        
        ArrayList vProcesos = (ArrayList) request.getAttribute("listaProcesos");
        String numeroAbonado = (String)request.getAttribute("NumeroAbonado");
        String numeroAbonadoF = (String)request.getAttribute("NumeroAbonadoF");
        String operadorDonante = (String) request.getAttribute("operador");
        String grupoSelected = (String)request.getSession().getAttribute("grupoActivo");

        if ((numeroAbonado==null) || ("".equals(numeroAbonado)))
            numeroAbonado="";
        int nummensaje = vProcesos!=null?vProcesos.size():0;
        int Limite =10;
        String posurl = (new Integer(request.getParameter("Posicion"))).toString();

        Vector selectOperadores = (Vector) request.getAttribute("selectOperadores");
        int numoperadores = selectOperadores.size();

        int posActual = (new Integer(posurl)).intValue();
        int inici = (posActual-1)*Limite;
        String cadenaPaginacion = "";


%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>

<%
    String subtitulo1="Consulta por número";

%>
<%@include file="cabeceraLogo.jsp"%>
<script language="JavaScript">
    var tabla="<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>";
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
        <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta por número&nbsp;</DIV>

        <div align="center"><center>
            <br>
            <br>
            <table border="0">
                <FORM METHOD=POST ACTION="PrevioConsultaPorNumero" name="theForm">
                    <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                    <INPUT TYPE="hidden" name="listarExcell" value="">
                    <INPUT TYPE="hidden" name="contiene" value="<%=contiene%>">
                    <input type="hidden" name="cadenaPaginacion">
                    <input type="hidden" name="tipoExcel">
                    <tr>
                        <td>
                            <font class="texto2">Rango Inicial:</font><input type="text" class="inputText" size="15" maxlength="15" name="NumeroAbonado" value="<%=numeroAbonado%>">
                            &nbsp;&nbsp;
                            <font class="texto2">Rango Final:</font><input type="text" class="inputText" size="15" maxlength="15" name="NumeroAbonadoF" value="<%=numeroAbonadoF%>">
                       </td>
                    </tr>
                    <tr>
                        <td>
                        <font class="texto2">Op. donante:</font>
							<%
								if(grupoSelected.equals("03")){
							%>
								<select class="inputText" name="operador" size="1">
                    				<option value="*" selected>TODOS</option>
                    			</select>
							<%
			                    }else{			                    	
                   			%>
		                    		<select class="inputText" name="operador">
		                    			<option value="*" selected>TODOS</option>
					                    <%
					                    for (int i=0; i<selectOperadores.size(); i++)	{
					                    	OperadorBean oper = (OperadorBean) selectOperadores.elementAt(i);
					                        String codigo = oper.getCodigo();
					                        String descripcion = oper.getDescripcion();
					                    	if(operadorDonante.equals(oper.getCodigo())){
					                    %>
					                       		<option value="<%=codigo%>" selected><%=descripcion%>-<%=codigo%></option>
					                    <%
					                   		 }else{
					                    %>
					                    		<option value="<%=codigo%>"><%=descripcion%>-<%=codigo%></option>
		                    			<%
					                    	}
					                    }
			                    		%>
		                    </select>
		                    <%
			                    }
                   			%>
		                </td>
		            </tr>
		            <tr>
		            	<td align="center">
                            <a href="javascript:Buscar()//'" onMouseOver="window.status='Realizar búsqueda';return true" onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
                        </td>
                    </tr>
                </FORM>
            </table>
            <table border="0" width="100%">
            			<%
                            if (vProcesos!=null && vProcesos.size() > 0) {
                        %>

                        <tr><td colspan="100%">
                                <form name="formRadios">
                                <table align="center">
    								<tr>
    									<td class="texto"><input type="radio" name="tipoExcelF1"  value="total"> Vista total</td>
    									<td class="texto"><input type="radio" name="tipoExcelF1" value="actual" checked> Vista actual</td>
    								</tr>
   								 </table>
   								 </form>
   								 </td>
   						 </tr>

                        <%} %>
                <tr>
                    <td width="100%"><div align="center"><center><table
                            border="1" class="tablas">
                        <tr>
                            <td class="bgCabeceraFila">&nbsp;</td>
                            <td class="bgCabeceraFila" align="center" >Operador</td>
                            <td class="bgCabeceraFila" align="center" >Id. proceso</td>
                            <td class="bgCabeceraFila" align="center" >Id. proceso ref.</td>
                            <td class="bgCabeceraFila" align="center" >Estado</td>
                            <td class="bgCabeceraFila" align="center" >Op. Donante</td>
                            <td class="bgCabeceraFila" align="center" >Tipo Proceso</td>                           
                        </tr>
                        <%							
                            if(vProcesos!=null )
                            {                            	
                                int fin;
                                String clase="";
                                if (nummensaje < inici+Limite) fin = nummensaje;
                                else fin = inici+Limite;
                                int j=1;
                                for(int i=inici;i<fin;i++){
                                    ProcesoAbiertoBean proceso = (ProcesoAbiertoBean) vProcesos.get(i);
                                    String idProceso = proceso.getIdProceso();
                                    String idProcesoRef = proceso.getIdProcesoReferencia();
                                    if (idProcesoRef == null)
                                        idProcesoRef = "&nbsp;";
                                    String operador = proceso.getOperador();
                                    if (operador == null)
                                        operador = "&nbsp;";
                                    String status = proceso.getStatus();

                                    String opDonante = proceso.getOpDonante();
                                    if (opDonante == null)
                                    	opDonante = "&nbsp;";

                                    String tipoProceso = proceso.getTipo();
                                    if (tipoProceso == null)
                                    	tipoProceso = "&nbsp;";

                                    cadenaPaginacion = cadenaPaginacion + idProceso + "-" + idProcesoRef +
                                    "-" + operador + "-" + status + "-" + opDonante + "-" +
                                    idProceso.substring(13, 15) ;
                                   
                                    int indice = j;
                                    j++;
                                    if((i%2)==0)
                                        clase="";
                                    else
                                        clase="bgFila";
                        %>
                        <form action="RespuestaProceso" method=post name="form<%=indice%>">
                            <INPUT TYPE="hidden" name="IdProceso" value="<%=idProceso%>">
                            <INPUT TYPE="hidden" name="NumeroAbonado" value="<%=numeroAbonado%>">
                            <INPUT TYPE="hidden" name="NumeroAbonadoF" value="<%=numeroAbonadoF%>">
                            <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                            <INPUT TYPE="hidden" name="listarExcell" value="">
                            <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                            <INPUT TYPE="hidden" name="contiene" value="<%=contiene%>">
                            <TD class="<%=clase%>"><p><a href="javascript:TodoOk(<%=indice%>)//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></p></TD>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=operador%></font></td>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=idProceso%></font></td>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=idProcesoRef%></font></td>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=status%></font></td>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=opDonante%></font></td>
                            <td class="<%=clase%>" align="center"><font class="texto2"><%=idProceso.substring(13, 15)%></font></td>
                            
                        </form>
                        </tr>
                        <%                  }
                        }   %>
                        <script>document.theForm.cadenaPaginacion.value ='<%=cadenaPaginacion%>'</script>
                    </table>
                    </center></div></td>
                </tr>
                <tr>

                    <td colspan=5>
                <tr>
                    <td align="center">
                        <br>
                        <FORM METHOD=POST ACTION="MenuPrincipalJSP" name="fback">
                            <INPUT TYPE="hidden" name="OperadorConectado" value="<%=imagen%>">
                            <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                            <INPUT TYPE="hidden" name="Posicion" value="1">
                            <INPUT TYPE="hidden" name="listarExcell" value="1">
                        </FORM>
                        <A HREF="javascript:document.fback.submit()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A>
                        <%
                            if (vProcesos!=null && vProcesos.size() > 0) {
                        %>
                        <A HREF="javascript:VerExcel()"  onMouseOver="window.status='Consulta Offline en lista Excell';return true" onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0" width="107" height="28"></A>
                        <%}%>
                    </td>
                </tr>
                </td>

                </tr>
            </table>
        </center></div>
        <!--		Calling Navegador.jsp			-->
        <jsp:include page="/NavegadorJSP" flush="true">
            <jsp:param name="Limit" value="<%=Limite%>" />
            <jsp:param name="Total" value="<%=nummensaje%>" />
            <jsp:param name="ActualLink" value="<%=posActual%>" />
            <jsp:param name="DirectURL" value="javascript:Navegar(" />
        </jsp:include>
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
        System.out.println("ConsultaPornumero.JSP:-------> " + t);
    } finally{

    }
%>
