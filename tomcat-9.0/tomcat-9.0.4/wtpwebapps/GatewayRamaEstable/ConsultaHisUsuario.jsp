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

    var f = document.theForm;
    f.listarExcell.value="1";
    f.submit();
    info('El fichero excel se está generando, por favor espere', 'Proceso en curso');
}

function Navegar(nPagina){
       f = document.theForm;
       f.listarExcell.value="";
       f.Posicion.value = nPagina;
       f.action="ConsultaHisUsuario";
       f.submit();
}

function Buscar(num){
     var f=document.theForm;
     f.listarExcell.value="";
     if (num==1)
        if (f.userID.value==""){
           alert("Debe rellenar el numero de abonado");
           f.userID.focus();
        }
        else{
         f.userID.value = f.userID.value;
         f.iniFechaRango.value = "";
         f.finFechaRango.value = "";
         f.tipoBusqueda.value="1";
        }
    else if (num==2)
        if (f.iniFechaRango.value=="" || f.finFechaRango.value=="")
           alert("Debe rellenar la Fecha Inicial y Final");
        else{
         f.userID.value = "";
         f.iniFechaRango.value = f.iniFechaRango.value;
         f.finFechaRango.value = f.finFechaRango.value;
         f.tipoBusqueda.value="2";
        }

     theForm.submit();
}


function TodoOk(num){
   dameFormulario(num).submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.ArrayList,
                 es.portanode.procesos.ProcesoAbiertoBean"%>
<%@ page import="java.util.Vector"%>
<%
  try{

    String ruta=(String)request.getAttribute("rutaExcell");
    if(ruta==null) ruta="javascript:alert('Debe realizar una busqueda antes.')";
    if(ruta.equals("")) ruta="javascript:alert('Debe realizar una busqueda antes.')";

    String tipoBusca = request.getParameter("tipoBusqueda");
    ArrayList vProcesos = (ArrayList) request.getAttribute("listaProcesos");
    String userid = (String)request.getAttribute("userid");
    String fechaInicial = (String)request.getAttribute("FechaInicial")!=null?(String)request.getAttribute("FechaInicial"):"";
    String fechaFinal = (String)request.getAttribute("FechaFinal")!=null?(String)request.getAttribute("FechaFinal"):"";

    int nummensaje = vProcesos!=null?vProcesos.size():0;
	int Limite =10;
	String posurl = (new Integer(request.getParameter("Posicion"))).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;

%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
<%@ page import="es.portanode.util.historicoUsuario.HistoricoAccionesBean"%>

  <%
    String subtitulo1="Consulta Histórico Usuario";

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
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta Histórico Usuario&nbsp;</DIV>

                 <div align="center"><center>
                   <br>
                   <br>
                    <table border="0">
                     <FORM METHOD=POST ACTION="ConsultaHisUsuario" name="theForm">
                       <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                       <INPUT TYPE="hidden" name="listarExcell" value="1">
                       <input type="hidden" name="tipoBusqueda" value="<%=tipoBusca%>">

                     <tr>
                          <td class="texto2" colspan="2" align="right" width="50%">
                            <font class="texto2">Id. Usuario: &nbsp;</font><input type="text" class="inputText" size="15" maxlength="15" name="userID" value="<%=userid%>">

                          </td>
                          <td class="texto2" colspan="3" align="left" valign="center">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:Buscar(1)//'" onMouseOver="window.status='Realizar búsqueda';return true" onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
                          </td>

                       </tr>
                      <tr>
                      <td colspan="5" valign="center" align="center">
                        <font class="texto2">Fecha Inicio </font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="iniFechaRango" value="<%=fechaInicial%>" readonly>
                        <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                        <font class="texto2">Fecha Fin </font>
                        <input type="text" class="inputText" size="15" maxlength="15" name="finFechaRango" value="<%=fechaFinal%>" readonly>
                        <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                      </td>
                      <td>
                        <a href="javascript:Buscar(2)//'" onMouseOver="window.status='Realizar búsqueda';return true" onMouseOut="window.status=' '"><img src="images/buscar.gif" alt="Buscar" border="0"></a>
                      </td>
                        </tr>
                     </FORM>
                    </table>
                    <table border="0" width="100%">
                        <tr>
                            <td width="100%"><div align="center"><center><table
                             border="1" class="tablas">
                                <tr>

                                    <td class="bgCabeceraFila" align="center" >Id. Usuario</td>
                                    <td class="bgCabeceraFila" align="center" >Id. Proceso</td>
                                    <td class="bgCabeceraFila" align="center" >Acción</td>
                                    <td class="bgCabeceraFila" align="center" >TimeStamp</td>
                                    <td class="bgCabeceraFila" align="center" >Observaciones</td>

                                </tr>
                                  <%
                                      if(vProcesos!=null)
                                      {
                                          int fin;
                                          String clase="";
                                          if (nummensaje < inici+Limite) fin = nummensaje;
                                          else fin = inici+Limite;
                                          int j=1;
                                          for(int i=inici;i<fin;i++){
                                              HistoricoAccionesBean proceso = (HistoricoAccionesBean) vProcesos.get(i);
                                              String userID = proceso.getUserid();
                                              String descripcion = proceso.getDescripcion();
                                              String tmstamp = proceso.getTmstamp();
                                              String observaciones = proceso.getObservaciones();
                                              String obsMostrar="";
                                              if (observaciones.length()<=25)
                                                   obsMostrar=observaciones;
                                              else
                                                   obsMostrar=observaciones.substring(0,20)+" ...";

                                              String idProceso = proceso.getIdProceso();
                                              int indice = j;
                                              j++;
                                              if((i%2)==0)
                                                  clase="";
                                              else
                                                  clase="bgFila";
                                   %>
                                  <form action="RespuestaProceso" method=post name="form<%=indice%>">
                                   <INPUT TYPE="hidden" name="userid" value="<%=userid%>">
                                   <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>">
                                   <INPUT TYPE="hidden" name="listarExcell" value="">
                                   <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">


                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=userID%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=idProceso%></font></td>
                                    <td class="<%=clase%>" align="center" width="150"><font class="texto2"><%=descripcion%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=tmstamp%></font></td>
                                    <td class="<%=clase%>" align="center" width="150"><font class="texto2" title="<%=observaciones%>"><%=obsMostrar%></font></td>

                                 </form>
                                </tr>
                    <%                  }
                                      }    %>
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
                            <A HREF="javascript:VerExcel()"  onMouseOver="window.status='Consulta Offline en lista Excell';return true" onMouseOut="window.status=' '"><img alt="Consulta Offline en Lista Excell" src="images/excell.gif" border="0" width="107" height="28"></A>
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
        System.out.println("ConsultaHisUsuario.JSP:-------> " + t);
    } finally{

    }
%>
