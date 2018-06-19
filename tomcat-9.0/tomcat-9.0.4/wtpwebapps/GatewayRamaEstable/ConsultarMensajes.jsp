<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--

function VerExcel() {

    var f = document.excel;
    var f1 = document.formRadios;
    if (f1.tipoExcelF1[0].checked){
    	 f.tipoExcel.value = 'total';
    }else{
    	f.tipoExcel.value = 'actual';
     }
     f.submit();
//     info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaMensaje";
       f.submit();
}

function Buscar(num){
	var f=document.theForm;

	if (f.iniFechaRango.value == "" || f.finFechaRango.value == ""){
        alert("Debe introducir un rango de fechas");
        return;
    }

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
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.util.TipoMensajeBean,
                 es.portanode.consultas.SentenciaAccesoBean,
                 es.portanode.mensajes.RangoNumeracionBean,
                 es.portanode.consultas.SentenciaAccesoMensaje,
                 es.portanode.procesos.ProcesoNumeracion,
                 es.portanode.util.operadores.OperadorBean,
                 es.portanode.util.operadores.OperadorBeanCollection"%>

<%
  try{
      Vector<SentenciaAccesoBean> vResultados = (Vector<SentenciaAccesoBean>) request.getAttribute("listaResultados");
      Vector tiposMensajes = (Vector) request.getAttribute("tiposMensajes");
      String iniRangoFecha = (String) request.getAttribute("iniFechaRango") == null ? "" : (String) request.getAttribute("iniFechaRango");
      String finRangoFecha = (String) request.getAttribute("finFechaRango") == null ? "" : (String) request.getAttribute("finFechaRango");
      String tipoMensajeStr = (String) request.getAttribute("tipoMensaje") == null ? "" : (String) request.getAttribute("tipoMensaje");
      String operador = (String) request.getAttribute("operador") == null ? "" : (String) request.getAttribute("operador");
	  String grupoSelected = (String)request.getSession().getAttribute("grupoActivo");
      String numeroTotal = (String) request.getAttribute("NumeroTotal") == null ? "" : (String) request.getAttribute("NumeroTotal");
      String cadenaPaginacion = "";
      TipoMensajeBean tipoMensaje = null;
      int nummensaje = 0;
      try { nummensaje = new Integer(numeroTotal); } catch (Exception ignore) {}
      int Limite = 10;
      String limite = (new Integer(Limite)).toString();
      String posurl = (String) request.getAttribute("Posicion");

      Vector selectOperadores = (Vector) request.getAttribute("selectOperadores");
      int numoperadores = selectOperadores.size();

%>
<%@ page import="java.io.*"%>

  <%
    String subtitulo1="Consulta de Mensajes en Procesos Abiertos";

  %>
  <%@include file="cabeceraLogo.jsp"%>
        <script language="JavaScript">
        var tabla="<table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>";
        document.write(tabla);
        </script>
          <TBODY>
          <TR>
            <td width="10" class="Fondoverdederecha">&nbsp;

            </td>
            <TD vAlign=top width="180" class="celdalineaderecha">
              <%@include file="menu.jsp"%>
            </TD><!-- InstanceBeginEditable name="contenido" -->
            <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
               <br>
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta de mensajes&nbsp;</DIV>

                 <div align="center"><center>
                   <br>
                   <br>
                    <table border="0">
                     <FORM METHOD=POST ACTION="PrevioConsultaMensaje" name="theForm">
                       <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                         <INPUT TYPE="hidden" name="Limite" value="<%=limite%>">
                         <input type="hidden" name="viejoTipoMensaje" value="<%=tipoMensajeStr%>">
                         <input type="hidden" name="viejoOperador" value="<%=operador%>">
                         <input type="hidden" name="viejaFechaIni" value="<%=iniRangoFecha%>">
                         <input type="hidden" name="viejaFechaFin" value="<%=finRangoFecha%>">
                     <tr>
                      <td>
                        <font class="texto2">Buscar Mensajes entre </font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="iniFechaRango" value="<%=iniRangoFecha%>" readonly>
                        <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                        <font class="texto2">y </font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="finFechaRango" value="<%=finRangoFecha%>" readonly>
                        <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                         <INPUT TYPE="hidden" name="listarExcell" value="1">
                      </td>
                     </tr>
                     <tr>
                      <td>
                        <font class="texto2">Tipo Mensaje:</font>
                        <select class="inputText" name="tipoMensaje">
	                        <option value="*">TODOS</option>
                            <%for(int i=0; i<tiposMensajes.size(); i++){
	                        	tipoMensaje = (TipoMensajeBean)tiposMensajes.elementAt(i);
                                if(tipoMensajeStr.equals(tipoMensaje.GetCodigo())){%>
  							       <option value="<%=tipoMensaje.GetCodigo()%>" selected><%=tipoMensaje.GetCodigo()%></option>
                                <%}else{%>
                                   <option value="<%=tipoMensaje.GetCodigo()%>"><%=tipoMensaje.GetCodigo()%></option>
                                <%}%>
  							<%}//fin del form%>
						</select>
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
					                  	if(operador.equals(oper.getCodigo())){
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
                    	<tr><td width="20">&nbsp;</td></tr>

                    	<%
                                if (nummensaje > 0) {
                            %><tr><td colspan="100%">
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

                             <%
                                 }
                             %>
                        <tr>
                            <td width="100%"><div align="center"><center><table
                             border="1" class="tablas">
                                <tr>
                                	<td class="bgCabeceraFila" align="center" >&nbsp</td>
                                    <td class="bgCabeceraFila" align="center" >Id. proceso</td>
                                    <td class="bgCabeceraFila" align="center" >Tipo Mensaje</td>
                                    <td class="bgCabeceraFila" align="center" >Inicio Rango</td>
                                    <td class="bgCabeceraFila" align="center" >Final Rango</td>
                                    <td class="bgCabeceraFila" align="center" >Fecha Alta</td>
                                    <td class="bgCabeceraFila" align="center" >Fecha Registro</td>
                                    <td class="bgCabeceraFila" align="center" >Op. Donante</td>
                                    <td class="bgCabeceraFila" align="center" >Tipo Proceso</td>

                                </tr>
                                  <%
                                       if (vResultados != null && vResultados.size() > 0) {
                                           String clase = "";
                                           int j = 1;
                                           for (SentenciaAccesoBean info : vResultados) {
                                               int indice = j;
                                               j++;
                                               if ((j % 2) == 0) {
                                                   clase = "";
                                               } else {
                                                   clase = "bgFila";
                                               }



                                               cadenaPaginacion = cadenaPaginacion + info.getIdProceso() + "-" +
                                               info.getTipoMensaje() + "-" +
                                               info.getInicioRango() + "-" +
                                               info.getFinalRango() + "-" +
                                               info.getFechaAlta() + "-" +
                                               info.getFechaRegistro() + "-" +
                                               info.getOpDonante() + "-" +
                                               info.getIdProceso().substring(13, 15) + "-" +
                                               info.getIdInterno() + "&";

                                   %>
                            <tr>
                                  <form action="obtenDetalleMensaje" method=post name="form<%=indice%>">
                                    <INPUT TYPE="hidden" name="IdInterno" value="<%=info.getIdInterno()%>">
                                    <INPUT TYPE="hidden" name="TipoMensaje" value="<%=info.getTipoMensaje()%>">
                                    <TD class="<%=clase%>"><p><a href="javascript:TodoOk(<%=indice%>)//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></p></TD>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getIdProceso()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getTipoMensaje()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getInicioRango()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getFinalRango()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getFechaAlta()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getFechaRegistro()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getOpDonante()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getIdProceso().substring(13, 15)%></font></td>
                                 </form>
                                </tr>
                    					<%}
                                        }
                                         %>
                            </table>
                            </center></div></td>
                        </tr>
                        <tr><td width="20">&nbsp;</td></tr>
                        <tr>
                            <td>
                                <jsp:include page="/NavegadorJSP" flush="true">
                                    <jsp:param name="Limit" value="<%=Limite%>" />
                                    <jsp:param name="Total" value="<%=nummensaje%>" />
                                    <jsp:param name="ActualLink" value="<%=posurl%>" />
                                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                                </jsp:include>
                            </td>
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
                            </FORM>
                             <form method=post action="GenerarExcelMensajes" name="excel">
                                 <input type="hidden" name="OperadorConectado" value="<%=imagen%>">
                                 <input type="hidden" name="OperadorConexion" value="<%=imagen%>">
                                 <input type="hidden" name="iniFechaRango" value="<%=iniRangoFecha%>">
                                 <input type="hidden" name="finFechaRango" value="<%=finRangoFecha%>">
                                 <input type="hidden" name="tipoMensaje" value="<%=tipoMensajeStr%>">
                                 <input type="hidden" name="operador" value="<%=operador%>">
                                 <input type="hidden" name="grupo" value="<%=grupoSelected%>">
                                 <input type="hidden" name="historico" value="NO">
                                 <input type="hidden" name="cadenaPaginacion" value="<%=cadenaPaginacion %>">
                                 <input type="hidden" name="tipoExcel" >

                            <A HREF="javascript:document.fback.submit()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A>

                            <%
                                if (nummensaje > 0) {
                            %>

                            <A HREF="javascript:VerExcel()//'"  onMouseOver="window.status='Consulta Offline en lista Excell';return true" onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0" width="107" height="28"></A>

                           <%} %>

                             </form>
                         </td>
                        </tr>
                        </td>

                       </tr>

                    </table>
                    </center></div>
                     <!--		Calling Navegador.jsp			-->
    <%--Nueva imagen--%>
                 </td>
             <td width="10" class="Fondoverdederecha">&nbsp;

             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>
   <%--Nueva imagen--%>

<!--Scripts para los calendarios-->
 <script language="JavaScript">
   setPath('<%= request.getContextPath() %>');
   var calendario1 = new calendar1(document.theForm.iniFechaRango);
   var calendario2 = new calendar1(document.theForm.finFechaRango);
 </script>

   </body>
</html>
<%

    } catch (Throwable t) {
        System.out.println("ConsultarMensajes.JSP:-------> " + t);
    } finally{

    }
%>