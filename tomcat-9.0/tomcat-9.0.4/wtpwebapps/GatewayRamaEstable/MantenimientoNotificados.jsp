<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var check=99;
function asignar(num){
     f1 = document.theForm;
     f2 = document.form1;
   var mystr;
   var separator= "+";
     if (f2.seleccion.value == 1){
        mystr = f2.radio[num].value;
     }
     else{
         mystr = f2.radio.value;
     }
     arrayStr = mystr.split(separator);
    namehid =f1.elements[0].name;
    if (namehid.search("session") != -1){
	     for (i=0; i < arrayStr.length; i++)
	         f1.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < arrayStr.length; i++)
        	 f1.elements[i].value = arrayStr[i];
    }
}

function Carga(num){
      f1 = document.theForm;
      f2 = document.form1;
      f1.Servlet.value=num;
      if (num == 1){
         f1.submit();
         return;
      }
      if (check == "99"){
            alert("Ha de escoger una fila");
            return;
      }
      else{
         asignar(check);
         if (num == 2){
            f1.submit();
         }
         if (num == 3){
            f1.submit();
         }
      }
}

function TodoOk(){
    var err = 0;
       f = document.consultaForm;
       f.submit();
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioMantenimientoNotificacion";
       f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.planificador.NotificacionBeanCollection,
                 es.portanode.util.TipoMensajeBeanCollection,
                 es.portanode.util.TipoMensajeBean,
                 es.portanode.planificador.NotificacionBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Mantenimiento de notificaciones de llegada de mensajes");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("OperadorConectado");
	String descOperador = (String) request.getAttribute("DescripcionOperador");


	NotificacionBeanCollection notis = (NotificacionBeanCollection) request.getAttribute("Notificaciones");
	Vector vnotis = notis.getNotificaciones(inici,Limite);
	int numnotis = notis.getNumeroNotificaciones();
	
	String mensajeselec = (String) request.getAttribute("MensajeSelec");
	TipoMensajeBeanCollection tiposmen = (TipoMensajeBeanCollection) request.getAttribute("TiposMensaje");
	int ntipos = tiposmen.GetNumeroTiposMensaje();
	Vector vtipos = tiposmen.GetTiposMensaje (0,ntipos);
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='50%' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Mantenimiento notificados</DIV>

                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                </FORM>
                <FORM METHOD=POST ACTION="PrevioMantenimientoNotificacion" name="consultaForm">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Primera" value="1">
                  <table border="0" >
                  <tr>
                  <td><font class="texto2" >Tipo Mensaje: </font>
                  &nbsp;<select class="inputText"  name="MensajeSelec">
                <%	if (mensajeselec.equals("*")) {	%>
                    <option selected value="*">TODOS
                <%	}else{	%>
                    <option value="*">TODOS

                <%	}
                    for (int i=0; i<ntipos; i++){
                        TipoMensajeBean men = (TipoMensajeBean)vtipos.elementAt(i);
                        String codigomensaje = men.GetCodigo();
                        if (codigomensaje.compareTo(mensajeselec)==0){
                %>
                    <option selected value="<%=codigomensaje%>"><%=codigomensaje%>
                <%		}
                        else{
                %>
                    <option value="<%=codigomensaje%>"><%=codigomensaje%>
                <%		}
                    }	%>
                    </select>
                    </td>
                    </tr>


                </FORM>
                <FORM action="MantenimientoNotificacion" METHOD=POST NAME="theForm">
                <INPUT TYPE="hidden" name="IdNotificacion" value="0">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Mensaje" value="0">
                <INPUT TYPE="hidden" name="MensajeSelec" value="<%=mensajeselec%>">
                <INPUT TYPE="hidden" name="Nombre" value="0">
                <INPUT TYPE="hidden" name="Email" value="0">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="Servlet">
                <INPUT TYPE="hidden" name="Primera" value="1">
                </FORM>
                <tr>
                  <td>
                  <br>
                <table border="0" width="100%">
                <FORM METHOD=POST NAME="form1">
                  <tr>
                        <td align="center"><div align="center"><center>
                        <table  border="1" class="tablas" >
                         <tr>
                            <td class="bgCabeceraFila">&nbsp;</td>
                            <td align="center" class="bgCabeceraFila">Operador Conectado</td>
                            <td align="center" class="bgCabeceraFila">Mensaje</td>
                            <td align="center" class="bgCabeceraFila">Nombre notificado</td>
                            <td align="center" class="bgCabeceraFila">e-mail</td>
                       </tr>
                <% 	if (numnotis >= 1){
                       if ((numnotis-inici) > 1)
                       {
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="1">
                <%	   }else{
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="0">
                <%	   }
                       String clase="";
                       for (int i=0; i<vnotis.size(); i++)
                       {
                        NotificacionBean item = (NotificacionBean) vnotis.elementAt(i);
                        String idNotificacion = item.getIdNotificacion();
                        String operador = item.getCodigo();
                        String mensaje = item.getTipoMensaje();
                        String nombre = item.getNombre();
                        String email = item.getEmail();
                         if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";
                %>
                            <tr>
                                <td align="center" class="<%=clase%>"><input type="radio" name="radio"
                value="<%=idNotificacion%>+<%=operador%>+<%=mensaje%>+<%=mensajeselec%>+<%=nombre%>+<%=email%>" onClick="check=<%=i%>"></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                                <td class="<%=clase%>"><font class="texto2"><%=mensaje%></font></td>
                                <td class="<%=clase%>"><font class="texto2"><%=nombre%></font></td>
                                <td class="<%=clase%>"><font class="texto2"><%=email%></font></td>
                            </tr>
                <%
                       }
                    }
                %>
                        </table>
                        </center></div></td>
                    </tr>
                </FORM>
                </table>
                </td>
                </tr>
                </table>
                
                <div align="center"><center>
                
                <!--
                    Calling Navegador.jsp
                -->


                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numnotis%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>
            </center></div>


                 <%--Nueva imagen--%>
                 
				<div align="center"><center>
				  <table border="0" width="100%" height='10%' cellpadding='0' cellspacing='0'>
				   <tr>
				     <td align="center">
				     	<A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Ejecutar consulta';return true" onMouseOut="window.status=' '"><img src="images/Consul5.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
				       <A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
				       <%
				        if (numnotis==0){
				        %>
				       <A HREF="javascript:/*'*/void(alert('No hay ninguna notificación a modificar'))"
				       onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img
				       src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
				       <A HREF="javascript:/*'*/void(alert('No hay ninguna notificación para dar de baja'))"
				       onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img
				       src="images/Manten3.jpg" border="0" width="107" height="28"></A>
				<%
				        }
				        else{
				%>
				        <a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificaciones';return true"
				        onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
				        <a href="javascript:Carga(3)//'" onMouseOver="window.status='Bajas';return true"
				        onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a>
				<%
				        }
				%>
				     </td>
				   </tr>
				   <tr>
				     <td align="center" valign="top"><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
				   </tr>
				  </table>
				  </center>
				</div>                 
                 
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>

</body>
<jsp:include page="pie.jsp" flush="true"/>
</html>