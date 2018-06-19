<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<script language="JavaScript">
var check = 99;
	/*function asignar(num){
	    f = document.formularioDatos;
	   var mystr;
	   var namehid;
	   var separator= "+";
	   if (f.seleccion.value == "1"){
	      mystr = f.radio[num].value;
	   }
	   else{
	     mystr = f.radio.value;
	   }

	   arrayStr = mystr.split(separator);
	   namehid =f.elements[0].name;

	    if (namehid.search("session") != -1){
		     for (i=0; i < (arrayStr.length); i++)
		         f.elements[i+1].value = arrayStr[i];
	    }
	    else{
		     for (i=0; i < (arrayStr.length); i++)
	        	 f.elements[i].value = arrayStr[i];
	    }
	}*/

	function Carga(){
	      f = document.formularioDatos;

	      f.action="EnviarMsgXNB";
	         if (check=="99"){
	            alert("Ha de escoger una fila");
	            return;
	         }
		  f.submit();
		 /*asignar(check);
	         f.submit();*/
	}

	
	function Navegar(nPagina){
	       f = document.formularioDatos;
	       f.Posicion.value = nPagina;
	       f.action="PrevioCancelacionBaja";
	       f.submit();
	}

	function buscar(tipo){
	    var idProceso = document.formularioDatos.idProceso.value;
	    var rInicial = document.formularioDatos.numeroA.value;
	    var rFinal = document.formularioDatos.numeroB.value;
	    if (tipo==2){
	        if (idProceso==""){
	           alert("Debe introducir un Identificador de Proceso");
	        }else{
	         f = document.formularioDatos;
	         f.idProceso.value = idProceso;
	         f.numeroA.value = "";
	         f.numeroB.value="";
	         f.tipoBusqueda.value="2";
	         Navegar(1);
	        }
	    }else if (tipo==1){
	        if (rInicial==""){
	           alert("Debe introducir un Rango Inicial");
	        }else{
	           	f = document.formularioDatos;
	         	f.idProceso.value = "";
	         	f.numeroA.value=rInicial;
	         	f.numeroB.value=rFinal;
	         	f.tipoBusqueda.value="1";
	         	Navegar(1);
	        }
	    }else if(tipo==3){
		    f = document.formularioDatos;
		    f.idProceso.value="";
		    f.numeroA.value="";
		    f.numeroB.value="";
		    f.tipoBusqueda.value="3";
		    Navegar(1); 
	    }
	}
	
	</script>
	<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
		<%@ page import="java.util.Vector,
                 es.portanode.mensajes.NBBeanCollection,
                 es.portanode.mensajes.NBBean"%>
	<%@ page import="java.io.*"%>
	
	<%
	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("XNB"); 
	
	String subtitulo1 = new String("Cancelación proceso baja");
	//String primera = request.getParameter("primera");
	String identificadorProceso = request.getParameter("idProceso");
	
	//Variables del navegador
	int Limite = 10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
 	String origen = "MenuRolReceptorJSP";
 	
 	String remitente = (String)request.getAttribute("OperadorConectado");
 	NBBeanCollection colNB = null;
 	Vector vmensaje = null;
 	int nummensaje = 0;
 	
 	//if(primera==null){
 		colNB = (NBBeanCollection)request.getAttribute("ColeccionMensajeNB");
 		if(colNB!=null){
 			vmensaje = colNB.getColeccionNB();
 			nummensaje = colNB.getNumColeccionNB();
 		}
 	//}
 	
 	String tipoBusqueda = (String) request.getAttribute("tipoBusqueda");
	
	%>

 

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
          			<br><div align="left" class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta de procesos de <%=tipoMDescripcion %></div>
					<table align="center" border="0" width="100%">
						<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td width="100%">
									<tr>
										<td></td>
										<td>
											<table align="center" border="0" cellpadding="0" cellspacing="5">
												<tr>
													<td colspan="0" align="center" class="texto2"></td>
												</tr>
												<tr>
													<td colspan="3" align="center" class="texto2">&nbsp;</td>
												</tr>       
												<FORM METHOD=POST ACTION="<%=origen%>" name="fback">
                									<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                									<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
               									 	<INPUT TYPE="hidden" name="Posicion" value="1">
                								</FORM>        							
												<form method="POST" action="PrevioCancelacionBaja" name="formularioDatos">
													<input type="hidden" name="tipoBusqueda" value="<%=tipoBusqueda%>">
													<input type="hidden" name="Posicion" value="<%=posurl%>">
													<input type="hidden" name="OperadorConectado" value="<%=remitente %>">
												<tr>
													<td class="texto2">
														Identificador proceso: &nbsp;
														<input name="idProceso" id="idProceso" type="text" maxlength="20" style=" width : 180px;">
													</td>
													<td align="center">
														<a href="javascript:buscar(2)//'"><img src="images/buscar.gif" border="0" width="107" heigth="28"></a>
													</td>
												</tr>
												<tr>
													<td class="texto2">
														Rango Inicial: &nbsp;
														<input name="numeroA" id="numeroA" type="text" maxlength="15" style="width=125px">
													</td>
													<td class="texto2">
														Rango Final: &nbsp;
														<input name="numeroB" id="numeroB" type="text" maxlength="15" style="width=125px">
													</td>
													<td>
														<a href="javascript:buscar(1)//'"><img src="images/buscar.gif" border="0" width="107" heigth="28"></a>
													</td>
												</tr>
												<tr>
													<td colspan="2"></td>
													<td class="texto2"><A href="javascript:buscar(3)//'">Ver todos los procesos</A></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<div align="center">
												<center>
													<table border="1" class="tablas" width="75%">
														<tr>
														
															<td class="bgCabeceraFila">&nbsp;</td>
															<td align="center" class="bgCabeceraFila">Donante Inicial</td>
															<td align="center" class="bgCabeceraFila">Id Proceso</td>
															<td align="center" class="bgCabeceraFila">Fecha Limite</td>
															<td align="center" class="bgCabeceraFila">Inicio Rango</td>
															<td align="center" class="bgCabeceraFila">Final Rango</td>
														</tr>
														<tr>
														
														<%
														
														if(vmensaje!=null){
															String clase="";
															int fin;
															if(nummensaje<inici+Limite)fin=nummensaje;
															else fin=inici+Limite;
															for(int i=inici;i<fin;i++){
																int index = i-inici;
																NBBean mensajenb = (NBBean)vmensaje.elementAt(i);
																String idInterno = mensajenb.getIdInterno();
																String donanteInicial = mensajenb.getDonanteInicial();
																String idProceso = mensajenb.getIdProceso();
																String fechaLimite = mensajenb.getFechaLimite();
																String inicioRango = mensajenb.getInicioRango();
																String finalRango = mensajenb.getFinalRango();
																//String destinatario = mensajenb.getDestinatario();
																//String receptorFinal = mensajenb.getReceptorFinal();
																
																if((i%2)==0){
																	clase="";	
																}else{
																	clase="bgFila";
																}
														%>
														
															<td><p><input type="radio" name="radio" value="<%=idProceso%>|<%=donanteInicial%>" onClick="check=<%=index%>"></p></td>
															<td align="center" class="<%=clase%>"><font class="texto2" size="2"><%=donanteInicial%></font></td>
															<td align="center" class="<%=clase%>"><font class="texto2" size="2"><%=idProceso%></font></td>
															<td align="center" class="<%=clase%>"><font class="texto2" size="2"><%=fechaLimite %></font></td>
															<td align="center" class="<%=clase%>"><font class="texto2" size="2"><%=inicioRango%></font></td>
															<td align="center" class="<%=clase%>"><font class="texto2" size="2"><%=finalRango%></font></td>
														</tr>
														<%}}
														%>
													</table>
												</center>
												</form>
											</div>
											<%
                    //if(primera==null){
                %>

                    <jsp:include page="/NavegadorJSP" flush="true">
                        <jsp:param name="Limit" value="<%=Limite%>" />
                        <jsp:param name="Total" value="<%=nummensaje%>" />
                        <jsp:param name="ActualLink" value="<%=posActual%>" />
                        <jsp:param name="DirectURL" value="javascript:Navegar(" />
                    </jsp:include>
                <%
                    //}
                %>

               <div align="center" valign="top"><center>
                    <br><br><br>
                    <table border="0" cellpadding='0' cellspacing='0' width="100%">
                      <tr>
                          <td align="center">
                    <%
                        //if(primera==null){
                    %>
                        <% 	if (nummensaje==0){
                        %>

                                <A HREF="javascript:/*'*/void(alert('No se ha seleccionado ningún proceso'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                        <%
                            }
                            else{
                        %>
                                    <A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;

                        <%
                            }
                        //}
                    %>

                            <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A>
                          </td>
                        </tr>
                    </table>
                </center>
               </div>

                <%--Nueva imagen--%>
                             </td>

                          </TR>
                        </TBODY>
                    </TABLE>
                <%--Nueva imagen--%>
         <jsp:include page="pie.jsp" flush="true"/>
										</td>
										
									</tr>
									
								</table>
          </table>
          
          </td>
                                       <td width="10" class="Fondoverdederecha">
                                &nbsp;
                             </td>
          </TR>
          </TBODY>
          </table>

              
              
 


                    

                     
                      

               

             
       </BODY>
</html>