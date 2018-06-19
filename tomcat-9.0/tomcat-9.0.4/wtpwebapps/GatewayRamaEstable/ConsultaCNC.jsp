<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var check = 99;
function asignar(num){
     f1 = document.theForm;
     f2 = document.form1;
   var mystr;
   var namehid;
   var separator= "+";
   if (f2.seleccion.value == "1"){
      mystr = f2.radio[num].value;
   }
   else{
     mystr = f2.radio.value;
   }

   arrayStr = mystr.split(separator);
   namehid =f1.elements[0].name;

    if (namehid.search("session") != -1){
	     for (i=0; i < (arrayStr.length); i++)
	         f1.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < (arrayStr.length); i++)
        	 f1.elements[i].value = arrayStr[i];
    }
}

function Carga(){
      f1 = document.theForm;
      f2 = document.form1;
         if (check=="99"){
            alert("Ha de escoger una fila");
            return;
         }
     asignar(check);
     f1.submit();
}

function Navegar(nPagina){
       f = document.form1;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaCNC";
       f.submit();
}

function buscarPorRango(tipo){
    var num = document.form1.numeroA.value;
    var idproces = document.form1.idProceso.value;
    var nif_cif = document.form1.nif_cif.value;
    var f = document.form1;
    var f2 = document.theForm;
    if (tipo==1)
        if (num=="")
           alert("Debe rellenar el numero de abonado");
        else{
         f.numeroA.value = num;
         f.idProceso.value = "";
         f.nif_cif.value = "";
         f.tipoBusqueda.value="1";
         f2.tipoBusqueda.value="1";
         Navegar(1);
        }
    else if (tipo==2)
        if (idproces=="")
           alert("Debe rellenar el Id de proceso");
        else{
         f.numeroA.value = "";
         f.idProceso.value = idproces;
         f.nif_cif.value = "";
         f.tipoBusqueda.value="2";
         f2.tipoBusqueda.value="2";
         Navegar(1);
        }
    else if (tipo==4)
        if (nif_cif=="")
           alert("Debe rellenar el DNI/CIF/NIE");
        else{
         f.numeroA.value = "";
         f.idProceso.value = "";
         f.nif_cif.value = nif_cif;
         f.tipoBusqueda.value="4";
         f2.tipoBusqueda.value="4";
         Navegar(1);
        }
    else if (tipo==3){
         f.numeroA.value = "";
         f.idProceso.value = "";
         f.nif_cif.value = "";
         f.tipoBusqueda.value="3";
         f2.tipoBusqueda.value="3";
         Navegar(1);
        }
}

function Abrir_ventana(NIR,NFR){
		var opciones="toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=192,height=215,focus=true,Titlebar=no";
		window.open("PopUpJSP?NIR="+NIR+"&NFR="+NFR,"Rangos",opciones);
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.mensajes.SPBeanCollection,
                 es.portanode.mensajes.SPBean,
                 es.portanode.procesos.ProcesoNumeracion"%>
<%@ page import="java.io.*"%>
  <%

  	  Singleton sing = Singleton.getInstance();
	  String tipoMDescripcion = sing.getTipoMDescripcion("CNC");

      String numero = request.getParameter("numeroA");
      if(numero==null) numero = "";
      String identificadorProceso = request.getParameter("idProceso");
      if(identificadorProceso==null) identificadorProceso = "";
      String nifCif = request.getParameter("nif_cif");
      if(nifCif==null) nifCif = "";
      String tipoBusca = request.getParameter("tipoBusqueda");
      if(tipoBusca==null) tipoBusca = "";
    String subtitulo1=new String("Cancelaci&oacute;n Cambio Operador");
    String primera = request.getParameter("primera");



	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
    int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String remitente = (String) request.getAttribute("OperadorConectado");
    String origen = (String) request.getParameter("origen");
    if(origen==null) origen="MenuPrincipal";

    SPBeanCollection colSP = null;
    Vector vmensaje = null;
    int nummensaje = 0;


        colSP = (SPBeanCollection) request.getAttribute("ColeccionMensajeSP");
        if(colSP!=null){
            vmensaje = colSP.getColeccionSP();
            nummensaje = colSP.getNumColeccionSP();
        }


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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta <%=tipoMDescripcion%>&nbsp;</DIV>

                <FORM METHOD=POST ACTION="<%=origen%>" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM METHOD="post" ACTION="PrevioEnviarMsgCNC" NAME="theForm">
                <INPUT TYPE="hidden" name=Operador value="0">
                <INPUT TYPE="hidden" name=NProceso value="00000000000000000000">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="numeroA" value="<%=numero%>">
                <INPUT TYPE="hidden" name="idProceso" value="<%=identificadorProceso%>">
                <INPUT TYPE="hidden" name="nif_cif" value="<%=nifCif%>">
                <INPUT TYPE="hidden" name="origen" value="<%=origen%>">
                <input type="hidden" name="tipoBusqueda" value="<%=tipoBusca%>">
                <input type="hidden" name="Posicion" value="<%=posurl%>">
                <input type="hidden" name="primera" value="NO">
                </FORM>
                <table border="0" width="100%">
                <FORM METHOD=POST NAME="form1">
                    <INPUT TYPE="hidden" name=OperadorConectado value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="inicioRangoF1" value="<%=numero%>">
                    <INPUT TYPE="hidden" name="idProcesoF1" value="<%=identificadorProceso%>">
                    <INPUT TYPE="hidden" name="origen" value="<%=origen%>">
                    <input type="hidden" name="tipoBusqueda" value="<%=tipoBusca%>">
                    <INPUT TYPE="hidden" name=Posicion value="<%=posurl%>">
                    <tr>
                      <td width="100%">
                        <table  width="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td valign="bottom" align="center">
                            </td>
                            <td>
                              <table align="center" border="0" cellpadding="0" cellspacing="5">

                                <tr>
                                      <td class="texto2" colspan="2" align="right" width="50%">
                                        DNI/CIF/NIE:&nbsp;
                                        <input name="nif_cif" id="nif_cif" type="text" maxlength="15" value="<%=nifCif%>" style="width: 145px">
                                      </td>
                                      <td class="texto2" colspan="3" align="left" valign="center">
                                        <A HREF="javascript:buscarPorRango(4)//'" onMouseOver="window.status='Buscar';return true;" onMouseOver="window.status=' '"><img src="images/buscar.gif" border="0" width="107" height="28"></A>
                                      </td>

                                  </tr>
                                <tr>
                                  <td class="texto2">
                                    Numero Abonado:&nbsp;
                                    <input name="numeroA" id="numeroA" type="text" maxlength="15" value="<%=numero%>" style="width: 125px">
                                  </td>
                                  <td width="50" align="center">
                                    <A HREF="javascript:buscarPorRango(1)//'" onMouseOver="window.status='Buscar';return true;" onMouseOver="window.status=' '"><img src="images/buscar.gif" border="0" width="107" height="28"></A>
                                  </td>
                                  <td class="texto2" width="30%">
                                    Id. Proceso:&nbsp;
                                    <input name="idProceso" id="idProceso" type="text" maxlength="20" value="<%=identificadorProceso%>" style="width: 150px">
                                  </td>
                                  <td width="75" align="center">
                                    <A HREF="javascript:buscarPorRango(2)//'" onMouseOver="window.status='Buscar';return true;" onMouseOver="window.status=' '"><img src="images/buscar.gif" border="0" width="107" height="28"></A>
                                  </td>
                                  <td align="center" class="texto2">
                                     <A HREF="javascript:buscarPorRango(3)//'" onMouseOver="window.status='Buscar';return true;" onMouseOver="window.status=' '">Ver todas</a>
                                  </td>

                                </tr>
                              </table>
                        </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                            <tr>
                                    <td width="100%"><div align="center"><center><table
                                     border="1" class="tablas">
                                        <tr>

                            <%	if ((nummensaje-inici) > 1){
                            %>
                                <INPUT TYPE="hidden" name=seleccion value="1">
                            <%	}else{
                            %>
                                <INPUT TYPE="hidden" name=seleccion value="0">
                            <%	}
                            %>
                                       <td class="bgCabeceraFila">&nbsp;</td>
                                       <td align="center" class="bgCabeceraFila">Operador destino</td>
                                       <td align="center" class="bgCabeceraFila">N&uacute;m. proceso</td>
                                       <td align="center" class="bgCabeceraFila">Fecha inicio ventana</td>
                                       <td align="center" class="bgCabeceraFila">Hora inicio ventana</td>
                                       <td align="center" class="bgCabeceraFila">N&uacute;m. orden</td>
                                       <td align="center" class="bgCabeceraFila">NIF/CIF</td>
                                       <td align="center" class="bgCabeceraFila">N&uacute;mero inicial</td>
                                       <td align="center" class="bgCabeceraFila">N&uacute;mero final</td>
                                      </tr>
                                    <tr>
                    <%
                        if( vmensaje!=null){
                            String clase="";
                            int fin;
                            if (nummensaje < inici+Limite) fin = nummensaje;
                            else fin = inici+Limite;
                            for (int i=inici; i<fin; i++)
                            {
                                int index = i-inici;
                                SPBean mensajesp = (SPBean) vmensaje.elementAt(i);

                                String CodigoOperador = mensajesp.getCodigoOperador();
                                String descripcionOperador = mensajesp.getDescripcionOperador();
                                if (descripcionOperador.equals(""))
                                    descripcionOperador = "&nbsp;";
                                if (descripcionOperador.length()>50)
                                {
                                    descripcionOperador = descripcionOperador.substring(0,50);
                                }
                                String IdP = mensajesp.getIdProceso();
                                String OrdenPeticion = mensajesp.getOrdenPeticion();
                                String NifCif = mensajesp.getNifCif();

                                // ** CAMBIO NUEVA ESPECIFICACION
                                Vector rangosNumeracion = mensajesp.getRangosNumeracion();

                                String NumInicialRango = mensajesp.getNumInicialRango(); //Coge el número inicial del primero de los rangos
                                if (NumInicialRango.equals("null"))
                                    NumInicialRango = "&nbsp;";
                                String NumFinalRango = mensajesp.getNumFinalRango(); //Coge el número final del primero de los rangos
                                if (NumFinalRango.equals("null"))
                                    NumFinalRango = "&nbsp;";
                                String FechaInicio = mensajesp.getFechaInicio();
                                /* FechaInicio = FechaInicio.substring(6,8)+"/"+FechaInicio.substring(4,6)+"/"+FechaInicio.substring(0,4); */
                                if(FechaInicio == null || "null".equals(FechaInicio) || "".equals(FechaInicio)) {
                                	FechaInicio = "&nbsp;";
                                } else {
                                	FechaInicio = FechaInicio.substring(6,8)+"/"+FechaInicio.substring(4,6)+"/"+FechaInicio.substring(0,4);
                                }

                                String HoraInicio = mensajesp.getHoraInicio();
                                /* HoraInicio = HoraInicio.substring(0,2)+":"+HoraInicio.substring(2,4)+":"+HoraInicio.substring(4,6); */
                                if(HoraInicio == null || "null".equals(HoraInicio) || "".equals(HoraInicio)) {
                                	HoraInicio = "&nbsp;";
                                } else {
                                	HoraInicio = HoraInicio.substring(0,2)+":"+HoraInicio.substring(2,4)+":"+HoraInicio.substring(4,6);
                                }

                                if((i%2)==0)
                                    clase="";
                                else
                                    clase="bgFila";


                    %>
                                    <td><p><input type="radio" name="radio" value="<%=CodigoOperador%>+<%=IdP%>+<%=remitente%>"
                                        onClick="check=<%=index%>"></p></td>
                                     <!-- Operador+Idproceso -->
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2> <%=descripcionOperador%></font></td>
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=IdP%></font></td>
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=FechaInicio%></font></td>
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=HoraInicio%></font></td>
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2>&nbsp;<%=OrdenPeticion%></font></td>
                                            <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=NifCif%></font></td>
                                            <%
                                                if (rangosNumeracion.size()>0)
                                                {
                                                    Vector m_NIR = new Vector();
                                                    Vector m_NFR = new Vector();
                                                    for (int cont=0; cont< rangosNumeracion.size(); cont++)
                                                    {
                                                        ProcesoNumeracion tmp = (ProcesoNumeracion)rangosNumeracion.elementAt(cont);
                                                        m_NIR.add(tmp.getNumInicialRango());
                                                        m_NFR.add(tmp.getNumFinalRango());
                                                    }

                                            %>
                                            <td align="center" class="<%=clase%>">
                                               <a href="javascript:Abrir_ventana(<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'"><font class="textoEnlace" size=2><%=NumInicialRango%></font></a>
                                            </td>
                                            <td align="center" class="<%=clase%>">
                                               <a href="javascript:Abrir_ventana(<%=m_NIR.toString() %>,<%=m_NFR.toString() %>)//'"><font class="textoEnlace" size=2><%=NumFinalRango%></font></a>
                                            </td>
                                            <%}else{%>
                                            <td align="center" class="<%=clase%>">
                                               &nbsp;
                                            </td>
                                            <td align="center" class="<%=clase%>">
                                               &nbsp;
                                            </td>
                                            <%}%>
                      </tr>
                            <%
                                }
                        }
                            %>
                                    </table>
                        </center></div></td>
                    </TR>
                    </FORM>
                </table>

                <!--
                    Calling Navegador.jsp
                -->
                    <jsp:include page="/NavegadorJSP" flush="true">
                        <jsp:param name="Limit" value="<%=Limite%>" />
                        <jsp:param name="Total" value="<%=nummensaje%>" />
                        <jsp:param name="ActualLink" value="<%=posActual%>" />
                        <jsp:param name="DirectURL" value="javascript:Navegar(" />
                    </jsp:include>

               <div align="center" valign="top"><center>
                    <br><br><br>
                    <table border="0" cellpadding='0' cellspacing='0' width="100%">
                      <tr>
                          <td align="center">
                        <% 	if (nummensaje==0){
                        %>

                                <A HREF="javascript:/*'*/void(alert('No hay ning&uacute;n mensaje CNC'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                        <%
                            }
                            else{
                        %>
                                    <A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;

                        <%
                            }
                        %>

                            <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A>
                          </td>
                        </tr>
                    </table>
                </center>
               </div>

                <%--Nueva imagen--%>
                             </td>
                             <td width="10" class="Fondoverdederecha">
                                &nbsp;
                             </td>
                          </TR>
                        </TBODY>
                    </TABLE>
                <%--Nueva imagen--%>
         <jsp:include page="pie.jsp" flush="true"/>
       </BODY>
</html>