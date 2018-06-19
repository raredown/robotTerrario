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
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioConsultaCPR";
       f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.mensajes.RPBeanCollection,
                 es.portanode.mensajes.RPBean"%>
<%@ page import="java.io.*"%>
  <%
  
  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("CPR");
	
    String subtitulo1=new String("Reenv&iacute;o confirmaci&oacute;n");
	//Varibles del navegador
	int Limite=10;
	String posurl = (new Integer(request.getParameter("Posicion"))).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String remitente = (String) request.getParameter("OperadorConectado");
	
	RPBeanCollection colRP = (RPBeanCollection) request.getAttribute("ColeccionMensajeRP");
	Vector vmensaje = colRP.getColeccionRP();
	int nummensaje = colRP.getNumColeccionRP();

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


                    
                    <FORM METHOD=POST ACTION="PrevioEnviarMsgCPR" name="theForm">
                    <INPUT TYPE="hidden" name="Operador" value=0>
                    <INPUT TYPE="hidden" name="NumProceso" value="">
                    <INPUT TYPE="hidden" name="NumSubProceso" value="">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name=Posicion value="<%=posurl%>">
                    </FORM>
                    <table border="0" width="100%">
                    <tr>
                      <td width="100%" align="center" class="texto2">
                        <table border="0" width="95%">
                          <tr>
                            <td align="center" class="texto2" width="80%">

                            </td>
                            <td align="right">
                                <A HREF="#" onClick="javascript:Navegar(<%=posActual%>);" onMouseOver="window.status='Recargar';return true;" onMouseOut="window.status=' '"><img src="images/recargar.gif" border="0" alt="Recargar"></A>
                            </td>
                          </tr>
                        </table>
                     </td>
                    </tr>
                    <FORM METHOD=POST name="form1">
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
                            <td class="bgCabeceraFila" align="center" >Operador destino</td>
                            <td class="bgCabeceraFila" align="center" >Tipo Mensaje</td>
                            <td class="bgCabeceraFila" align="center" >N&uacute;m. proceso</td>
                            <td class="bgCabeceraFila" align="center" >N&uacute;m. proceso cancelado</td>
                        </tr>
                    <%
                        int fin;
                        String clase="";
                        if (nummensaje < inici+Limite) fin = nummensaje;
                        else fin = inici+Limite;
                        for (int i=inici; i<fin; i++)
                        {
                             int index = i-inici;
                             RPBean mensajerp = (RPBean) vmensaje.elementAt(i);

                             String CodigoOperador = mensajerp.getCodigoOperador();
                            String descripcionOperador = mensajerp.getDesOperador();
                            if (descripcionOperador.length()>50)
                            {
                                descripcionOperador = descripcionOperador.substring(0,50);
                            }
                            String IdProceso = mensajerp.getIdProceso();
                            String IdSubProceso = mensajerp.getIdSubProceso();
                            String tipoMensaje = mensajerp.getMensajeOrigen();
                            if((i%2)==0)
                                clase="";
                            else
                                clase="bgFila";
                    %>
                                <tr>
                                   <td class="<%=clase%>"><p><input type="radio" name="radio"
                                        value="<%=CodigoOperador%>+<%=IdProceso%>+<%=IdSubProceso%>+<%=remitente%>"
                                        onClick="check=<%=index%>"></p>
                            <!-- Operador+Idproceso+Idproceso+remitente -->
                                    </td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=descripcionOperador%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=tipoMensaje%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=IdProceso%></font></td>
                                    <td class="<%=clase%>" align="center"><font class="texto2"><%=IdSubProceso%></font></td>
                                </tr>
                    <%
                        }
                    %>

                                </FORM>
                            </table>
                            </center></div></td>
                        </tr>
                    </table>

                    <div align="center"><center>

	                    <jsp:include page="/NavegadorJSP" flush="true">
	                        <jsp:param name="Limit" value="<%=Limite%>" />
	                        <jsp:param name="Total" value="<%=nummensaje%>" />
	                        <jsp:param name="ActualLink" value="<%=posActual%>" />
	                        <jsp:param name="DirectURL" value="javascript:Navegar(" />
	                    </jsp:include>


                        <br>
                        <table border="0" height='10%' cellpadding='0' cellspacing='0' width="100%">
                        <tr>
                          <td align="center">
                        <%
                            if (nummensaje==0){
                        %>

                                <A HREF="javascript:/*'*/void(alert('No hay ningún mensaje RP'))" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                        <%
                            }
                            else{
                        %>

                                <A HREF="javascript:Carga()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                        <%
                            }
                        %>

                            <A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
                        </tr>
                        </table>
                      </center>
                    </div>


                    </center></div>
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
</body>

</html>
