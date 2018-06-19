<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
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
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaCNM";
       f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.MNBeanCollection,
                 es.portanode.mensajes.MNBean,
                 es.portanode.util.FechaInterna"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("CNM"); 
	
    String subtitulo1=new String("Cancelaci&oacute;n mensaje de modificaci&oacute;n de NRN");
	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String remitente = (String) request.getAttribute("OperadorConectado");
	MNBeanCollection colMN = (MNBeanCollection) request.getAttribute("ColeccionMensajeMN");
	Vector vmensaje = colMN.getColeccionMN();
	int nummensaje = colMN.getNumColeccionMN();

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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta <%=tipoMDescripcion %>&nbsp;</DIV>

                <FORM METHOD=POST ACTION="MenuRolReceptor.jsp" name="fback">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM METHOD=POST ACTION="PrevioEnviarMsgCNM" name="theForm">
                    <INPUT TYPE="hidden" name="Operador" value=0>
                    <INPUT TYPE="hidden" name="NumProceso" value="">
                    <INPUT TYPE="hidden" name=OperadorConectado value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name=Posicion value="<%=posurl%>">
                </FORM>
                <FORM METHOD=POST ACTION="PrevioConsultaCNM" name="recargar">
                    <INPUT TYPE="hidden" name=OperadorConectado value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name=Posicion value="<%=posurl%>">
                </FORM>
                <table border="0" width="100%">
                    <tr>
                      <td>
                        <table border="0" width="95%">
                          <tr>
                           <td align="center" class="texto2" width="80%">

                            </td>
                            <td align="right">
                                <A HREF="#" onClick="javascript:document.recargar.submit();" onMouseOver="window.status='Recargar';return true;" onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                    <FORM METHOD=POST name="form1">
                        <td width="100%"><div align="center"><center>
                         <table border="1" class="tablas">
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
                        <td align="center" class="bgCabeceraFila">NRN</td>
                        <td align="center" class="bgCabeceraFila">N&uacute;mero inicial</td>
                        <td align="center" class="bgCabeceraFila">N&uacute;mero final</td>
                    </tr>
                <%
                    String clase="";
                    int fin;
                    if (nummensaje < inici+Limite) fin = nummensaje;
                    else fin = inici+Limite;
                    for (int i=inici; i<fin; i++)
                    {
                         int index = i-inici;
                         MNBean mensajemn = (MNBean) vmensaje.elementAt(i);

                         String CodigoOperador = mensajemn.GetCodigoOperador();
                        String descripcionOperador = mensajemn.GetDescripcionOperador();
                        if (descripcionOperador.length()>50)
                        {
                            descripcionOperador = descripcionOperador.substring(0,50);
                        }
                         String IdProceso = mensajemn.GetIdProceso();
                         String FechaInicio = FechaInterna.ConvertToFechaExterna(mensajemn.GetFechaInicio());
                         if (FechaInicio.equals(""))
                             FechaInicio = "&nbsp;";
                         String hora1 = mensajemn.GetHoraInicio();
                         String HoraInicio = hora1.substring(0,2)+":"+hora1.substring(2,4)+":"+hora1.substring(4,6);
                         if (HoraInicio.equals(""))
                             HoraInicio = "&nbsp;";
                         String NRN = mensajemn.GetNRN();
                         if (NRN.equals(""))
                             NRN = "&nbsp;";
                         String NumInicialRango = mensajemn.GetNumInicialRango();
                         if (NumInicialRango.equals(""))
                             NumInicialRango = "&nbsp;";
                         String NumFinalRango = mensajemn.GetNumFinalRango();
                         if (NumFinalRango.equals(""))
                             NumFinalRango = "&nbsp;";
                         if((i%2)==0)
                            clase="";
                         else
                            clase="bgFila";
                %>
                            <tr>
                        <td><p><input type="radio" name="radio"
                        value="<%=CodigoOperador%>+<%=IdProceso%>+<%=remitente%>" onClick="check=<%=index%>"></p>
                        <!-- Operador+Idproceso -->
                                </td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=descripcionOperador%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=IdProceso%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=FechaInicio%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=HoraInicio%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=NRN%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=NumInicialRango%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=NumFinalRango%></font></td>
                            </tr>
                <%
                    }
                %>

                            </FORM>
                        </table>
                        </center></div></td>
                    </tr>
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

                <div align="center"><center>
                    <br><br><br>
                    <table border="0" cellpadding='0' cellspacing='0' width="100%">
                       <tr>
                        <% 	if (nummensaje==0){
                    %>

                            <td align="center"><A HREF="javascript:/*'*/void(alert('No hay ningún mensaje CNM'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                                <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A>
                            </td>
                    <%
                        }
                        else{
                    %>
                            <td align="center"><A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                                <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A>
                            </td>
                    <%
                        }
                    %>
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
                </BODY>
<%--Nueva imagen--%>
       <jsp:include page="pie.jsp" flush="true"/>
</html>
