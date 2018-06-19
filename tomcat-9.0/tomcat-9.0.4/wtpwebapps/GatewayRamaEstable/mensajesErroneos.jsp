<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>


<SCRIPT LANGUAGE="JavaScript">

    function Navegar(nPagina){
           f = document.theForm;
           f.numPagina.value = nPagina;
           f.accion.value = "loadTable";
           f.action="GestionarMensajesErroneos";
           f.submit();
    }

    function getRadioButtonSelected(){
		j= -1;
		i = 0;
		f = document.theForm;
		seleccion = f.codigo.length;
		if (seleccion >0)
		{
			for (i = 0; i < seleccion; i++) {
				if (f.codigo[i].checked) { j=f.codigo[i].value;break; }
			}
		}
		else
		{
			if (f.codigo.checked){
				j = f.codigo.value;
			}
		}
	return j;
	}

	function volver(){
		document.theForm.accion.value = "volver";
		document.theForm.action = "GestionarMensajesErroneos";;
		document.theForm.submit();
	}

	function eliminar(idInterno,tipo){
		document.theForm.accion.value = "eliminar";
		document.theForm.action = "GestionarMensajesErroneos";
		document.theForm.idInternoSeleccionado.value = idInterno;
		document.theForm.tipo.value = tipo;
		document.theForm.submit();
	}
	// Metodo que comprueba si la fecha pasada como parámetro es anterior a la actual
	function comprobarFechaFueraDePlazo(fechaStr){
		if (fechaStr ==''){
			return false;
		}else{
			try{
				fechaHora = fechaStr.split(" ");
				fechaCompleta = fechaHora[0];
				horaCompleta = fechaHora[1];
				diaMesAnno = fechaCompleta.split("/");
				horaMinSeg = horaCompleta.split(":");
				dia = diaMesAnno[0];
				mes = parseInt(diaMesAnno[1])-1;
				anno = diaMesAnno[2];
				hora = horaMinSeg[0];
				min = horaMinSeg[1];
				seg = horaMinSeg[2];
				dateFinPlazo = new Date(anno,mes,dia,hora,min,seg);
				dateActual = new Date();
				return (dateActual>dateFinPlazo);
			}catch(ex){
				return false;
			}
		}
	}

	function reenviar(){
		document.theForm.accion.value = "reenvia";
		document.theForm.action = "MenuReenvioMensajes";
		document.theForm.seleccionado.value = getRadioButtonSelected(); // Para saber qué estamos editando o eliminando
		valores=document.theForm.seleccionado.value.split("-");
		finPlazo=valores[3];
		subsanable = valores[2];
		envioFueraDePlazo = comprobarFechaFueraDePlazo(finPlazo);
		if (subsanable == '1' && !envioFueraDePlazo){
			document.theForm.idInternoSeleccionado.value=valores[0];
			document.theForm.tipo.value = valores[1];
			document.theForm.submit();
		}else if (envioFueraDePlazo){
			alert('Se ha superado el fin de plazo de reenvío de este mensaje. Sólo puede ser eliminado. ');
		}else{
			alert('La causa de error de este mensaje no es de tipo subsanable. Sólo puede ser eliminado. ');
		}
	}
	</script>
<%    String anterior = (String) request.getAttribute("Anterior");%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1=new String("Reenvío de mensajes");
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
               <br>
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Reenvio Mensajes</DIV>
<FORM ACTION="PrevioEnvioErroneos.do" METHOD="POST" name="fback">
                    <INPUT TYPE="hidden" name="accion" value=loadTable />
                </FORM>
                    <form action="Temporizador.do" method=POST name="theForm">
						<INPUT TYPE="hidden" name="accion" value="">
						<INPUT TYPE="hidden" name="seleccionado" value="">
						<INPUT TYPE="hidden" name="idInternoSeleccionado" value="">
						
						<INPUT TYPE="hidden" name="numPagina" value="${numPagina}">
						<input type="hidden" name="idBorrar" value="">
		                <input type="hidden" name="tipo" value="">
	                 
	                    <table border="0" width="100%">
	                        <tr>
	                            <td width="100%">
									<div align="center">
										<table border="1" class="tablas" >
						                  <tr>
						                    <td class="bgCabeceraFila">&nbsp;</td>
						                    <td align="center" class="bgCabeceraFila">Tipo de mensaje</td>
						                    <td align="center" class="bgCabeceraFila">Id Proceso</td>
						                    <td align="center" class="bgCabeceraFila">Causa Rechazo</td>
											<td align="center" class="bgCabeceraFila">Fin plazo Reenvio</td>
						                  </tr>
						                  <c:if test="${total gt 0}">
											<c:forEach items="${mensajesErroneos}" var="objeto" varStatus="index">
												<tr>
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center"><font class="texto2"><input type="radio" name="codigo" value="${objeto.idInterno}-${objeto.tipoMensaje}-${objeto.subsanable}-${objeto.finPlazoReenvio}" ></td>
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center" title="${listaTipoMensaje[index.count - 1]}"><font class="texto2"><c:out value="${objeto.tipoMensaje}"/></font></td>
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center"><font class="texto2"><c:out value="${objeto.idProceso}"/></font></td>
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center" title="${objeto.descripcionCausa}"><font class="texto2"><c:out value="${objeto.causa}"/></font></td>
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center"><font class="texto2"><c:out value="${objeto.finPlazoReenvio}"/></font></td>                                                                 
													<td class="<c:if test="${index.count % 2 == 0}">bgFila</c:if>" align="center"><a href="javascript:eliminar('<c:out value="${objeto.idInterno}"/>','<c:out value="${objeto.tipoMensaje}"/>');" onMouseOver="window.status='<fmt:message key="javascript.aceptar"/>';" onMouseOut="window.status=' '"><img src="images/delete.gif" border="0"></a></td>                                                                 
												</tr>
											</c:forEach>
										  </c:if>
					                      <c:if test="${total eq 0}">
					                        <td align="center" colspan="9">
											     <input type="hidden" name="codigo" value="" />
												<font class="texto2">
													<fmt:message key="texto.nomensajes" />
												</font>
											</td>
					                    </c:if>
					                   </table>
					               	</div>
								</td>
							</tr>
						</table>
                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="${limite}" />
                    <jsp:param name="Total" value="${total}" />
                    <jsp:param name="ActualLink" value="${numPagina}" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>						
					</form>
            &nbsp;          
         
        <!-- Los cuatro botones del final -->
		<BR>
    <table border="0" width="100%">
		<tr>
 		<c:if test="${total gt 0}">
			<td width="48%%">
				<div align="right">                    
					<a href="javascript:reenviar()" onMouseOver="window.status='<fmt:message key="javascript.aceptar"/>';return true;" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0"></a> 
				</div>
			</td>
		</c:if>
			<TD colspan="4%">&nbsp;</TD>
			<td width="48%">
				<div align="left">
					<a href="javascript:volver();" onMouseOver="window.status='<fmt:message key="javascript.consultaanb.pag_anterior"/>';return true;" onMouseOut="window.status=' '">
						<img src="images/Back.jpg" border="0" WIDTH="107" HEIGHT="28">
					</a>
				</div>
			</TD>
		</TR>
		</table>

		
 		<!-- Fin de Los cuatro botones del final -->                             

               
    <%--Nueva imagen--%>
                 <td>&nbsp;</td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>

        </TBODY>

<jsp:include page="pie.jsp" flush="true"/>
</body>
</html>