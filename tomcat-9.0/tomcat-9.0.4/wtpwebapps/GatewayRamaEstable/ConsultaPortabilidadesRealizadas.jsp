<%@page import="java.util.ArrayList"%>
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

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.listarExcel.value = '0';
       f.submit();
}

function Buscar(){
	var f = document.theForm;
    f.listarExcel.value = '0';
    f.submit();
}

function lanzaExcel(){
	var f = document.theForm;
    var f1 = document.formRadios;
    if (f1.tipoExcelF1[0].checked){
    	 f.tipoExcel.value = 'total';
    }else{
    	f.tipoExcel.value = 'actual';
     }
    f.listarExcel.value = '1';
    f.submit();
    info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
}

function Abrir_ventana(indice,NRN,NIR,NFR){

    var elementoNRN = document.getElementById("cadenaRango"+indice);
    var nrns = elementoNRN.value;
    var nrns2 = "";
    var longi = nrns.length - 1;
    for (var k = 1 ; k < longi; k++) {
        nrns2 = nrns2 + nrns.charAt(k);
    }


	var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=232,height=215,focus=true,Titlebar=no";
	window.open("PopUpJSP?NRN="+nrns2+"&NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.List,es.portanode.util.TipoMensajeBean,es.portanode.util.Singleton,es.portanode.consultas.SentenciaAccesoBean,es.portanode.mensajes.RangoNumeracionBean,es.portanode.consultas.SentenciaAccesoMensaje,es.portanode.procesos.ProcesoNumeracion,es.portanode.consultas.PortabilidadRealizadaBean,es.portanode.consultas.PortabilidadRealizadaRangoBean,es.portanode.consultas.PortabilidadRealizadaDAO"%>

<%
	try {

		List<PortabilidadRealizadaBean> vResultados = (List<PortabilidadRealizadaBean>) request
				.getAttribute("listaResultados");
		String iniRangoFecha = (String) request.getAttribute("iniFechaRango") == null ? "" : (String) request
				.getAttribute("iniFechaRango");
		String finRangoFecha = (String) request.getAttribute("finFechaRango") == null ? "" : (String) request
				.getAttribute("finFechaRango");
		String rol = (String) request.getAttribute("rol") == null ? "" : (String) request.getAttribute("rol");
		int numPortabilidades = vResultados != null ? vResultados.size() : 0;
		int Limite = 10;
		String posurl = (new Integer(request.getParameter("Posicion"))).toString();
		int posActual = (new Integer(posurl)).intValue();
		int inici = (posActual - 1) * Limite;
%>
<%@ page import="java.io.*"%>

  <%
  	String subtitulo1 = "Consulta de portabilidades realizadas";
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
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta de portabilidades realizadas&nbsp;</DIV>

                 <div align="center"><center>
                   <br>
                   <br>
                    <table border="0">
                     <FORM METHOD=POST ACTION="PrevioConsultaPortabilidades" name="theForm">
                       	<INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
					    <input type="hidden" name="tipoExcel">
                        <INPUT TYPE="hidden" name="listarExcel" value="0">
                     <tr>
                      <td>
                        <font class="texto2">Buscar Portabilidades entre </font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="iniFechaRango" value="<%=iniRangoFecha%>" readonly>
                        <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                        <font class="texto2">&nbsp;y&nbsp;</font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="finFechaRango" value="<%=finRangoFecha%>" readonly>
                        <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>

                        <font class="texto2">Rol:</font>
                        <select class="inputText" name="rol">
                              <%
                              	if (rol != null && rol.equals("R")) {
                              %>
                                    <option value="R" selected>Receptor</option>
                              <%
                              	} else {
                              %>
                                    <option value="R">Receptor</option>
                              <%
                              	}
                              		if (rol != null && rol.equals("D")) {
                              %>
                                    <option value="D" selected>Donante</option>
                              <%
                              	} else {
                              %>
                                    <option value="D">Donante</option>
                              <%
                              	}
                              		if (rol != null && rol.equals("A")) {
                              %>
                                    <option value="A" selected>Ambos</option>
                              <%
                              	} else {
                              %>
                                    <option value="A">Ambos</option>
                              <%
                              	}
                              %>
                        </select>

                      </td>
                      <td>
                        <a href="javascript:Buscar()//'" onMouseOver="window.status='Realizar búsqueda'" onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
                      </td>
                     </tr>
                     </FORM>
                    </table>
                    
                    <%
                                        	if (vResultados != null && !vResultados.isEmpty()) {
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
                    
                    <table border="0" width="100%">
                    	<tr><td width="20">&nbsp;</td></tr>
                        <tr>
                            <td width="100%"><div align="center"><center><table
                             border="1" class="tablas">
                                <tr>
                                    <td class="bgCabeceraFila" align="center" >Id. proceso</td>
                                    <td class="bgCabeceraFila" align="center" >Inicio Rango</td>
                                    <td class="bgCabeceraFila" align="center" >Final Rango</td>
                                    <td class="bgCabeceraFila" align="center" >NRN</td>
                                    <td class="bgCabeceraFila" align="center" >Ventana Cambio</td>
                                    <td class="bgCabeceraFila" align="center" >Op. Donante</td>
                                    <td class="bgCabeceraFila" align="center" >Op. Receptor</td>
                                    <td class="bgCabeceraFila" align="center" >Tipo Portabilidad</td>

                                </tr>
                                  <%
                                  	if (vResultados != null) {
                                  			int fin;
                                  			String clase = "";
                                  			if (numPortabilidades < inici + Limite)
                                  				fin = numPortabilidades;
                                  			else
                                  				fin = inici + Limite;
                                  			int j = 1;
                                  			for (int i = inici; i < fin && i < vResultados.size(); i++) {
                                  				String claseRango = "texto2";
                                  				PortabilidadRealizadaBean info = vResultados.get(i);
                                  				List<PortabilidadRealizadaRangoBean> rangos = info.getRangos();
                                  				int indice = j;
                                  				j++;
                                  				if ((i % 2) == 0) {
                                  					clase = "";
                                  				} else {
                                  					clase = "bgFila";
                                  				}
                                  %>
                                  
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getIdProceso()%></font></td>
                                    
                                  <%
                                  				if (rangos.size() > 1) {
													
									               	List<String> m_NRN = new ArrayList<String>();
									               	List<String> m_NIR = new ArrayList<String>();
									               	List<String> m_NFR = new ArrayList<String>();
									                                    		
									 				for (PortabilidadRealizadaRangoBean rango : rangos) {
									                    m_NRN.add(rango.getNrn());
									                    m_NIR.add(rango.getInicioRango());
									                    m_NFR.add(rango.getFinalRango());
									                }
								  %>

				                    <input type="hidden" name="cadenaRango<%=i%>" value="<%=m_NRN.toString()%>" >
                                    <td class="<%=clase%>" align="center"><a href="javascript:Abrir_ventana(<%=i%>,<%=m_NRN.toString()%>, <%=m_NIR.toString()%>,<%=m_NFR.toString()%>)" onMouseOver="window.status='Rangos';return true" onclick="window.status='Rangos';return true" onMouseOut="window.status=' '"><font class="textoEnlaceRango"><%=rangos.get(0).getInicioRango()%></font></a></td>
                                    <td class="<%=clase%>" align="center"><a href="javascript:Abrir_ventana(<%=i%>,<%=m_NRN.toString()%>, <%=m_NIR.toString()%>,<%=m_NFR.toString()%>)" onMouseOver="window.status='Rangos';return true" onclick="window.status='Rangos';return true" onMouseOut="window.status=' '"><font class="textoEnlaceRango"><%=rangos.get(0).getFinalRango()%></font></a></td>
                                    <td class="<%=clase%>" align="center"><a href="javascript:Abrir_ventana(<%=i%>,<%=m_NRN.toString()%>, <%=m_NIR.toString()%>,<%=m_NFR.toString()%>)" onMouseOver="window.status='Rangos';return true" onclick="window.status='Rangos';return true" onMouseOut="window.status=' '"><font class="textoEnlaceRango"><%=rangos.get(0).getNrn()%></font></a></td>
									
								  <%
                                  				} else {
                                  %>

                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangos.get(0).getInicioRango()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangos.get(0).getFinalRango()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=rangos.get(0).getNrn()%></font></td>
                                  
                                  <%
                                  				}
                                  %>

                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=info.getInicioVentana().toString()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2" title="<%=Singleton.getInstance().getOpDescripcion(info.getDonante())%>"><%=info.getDonante()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2" title="<%=Singleton.getInstance().getOpDescripcion(info.getReceptor())%>"><%=info.getReceptor()%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2" title="<%=Singleton.getInstance().getTipoPortabilidadDescripcion(info.getTipoPortabilidad())%>"><%=info.getTipoPortabilidad()%></font></td>

                                </tr>
                    					<%
                    						}
                    							}
                    					%>
                            </table>
                            </center></div></td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                        	<td>
									<!--		Calling Navegador.jsp			--> 
									<jsp:include
										page="/NavegadorJSP" flush="true">
										<jsp:param name="Limit" value="<%=Limite%>" />
										<jsp:param name="Total" value="<%=numPortabilidades%>" />
										<jsp:param name="ActualLink" value="<%=posActual%>" />
										<jsp:param name="DirectURL" value="javascript:Navegar(" />
									</jsp:include>
							</td>
                        </tr>
                        <%
                        	if (vResultados != null && !vResultados.isEmpty()) {
                        %>
                        <tr>

                        <td colspan=5>
                        <tr>
                         	<td align="center">
                            	<br>
                            	<A HREF="javascript:lanzaExcel();"  onMouseOver="window.status='Consulta Offline en lista Excell';return true" onMouseOut="window.status=' '">
                            		<img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0" width="107" height="28"></A>
							</td>
                        </tr>
                        </td>

                       </tr>
						<%
							}
						%>
                    </table>
                    </center></div>
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
   setPath('<%=request.getContextPath()%>');
   var calendario1 = new calendar1(document.theForm.iniFechaRango);
   var calendario2 = new calendar1(document.theForm.finFechaRango);
 </script>

   </body>
</html>
<%
	} catch (Throwable t) {
		System.out.println("ConsultaPortabilidadesRealizadas.JSP:-------> " + t);
	} finally {

	}
%>