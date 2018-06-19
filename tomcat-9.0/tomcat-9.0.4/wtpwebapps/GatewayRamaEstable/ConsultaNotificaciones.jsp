<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--
var Tiempo;
check=9999;

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action = "ConsultaNotificacionesJSP";
       f.submit();
}

function mensaje(){

      Tiempo=setTimeout("cargar();",180000);
      }

function cargar(){

       document.theForm.action="ConsultaNotificacionesJSP";
      document.theForm.submit();
      }






function Detalle(nombre,asunto){

         // Cambiamos '||' por '<br>'
         var nombre = new String(document.theForm.elements[nombre].value);
         var asunto = new String(document.theForm.elements[asunto].value);
         var nl = "\n";
         var nombreR;
         var asuntoR;
         var finRNombre = false;
         while(!finRNombre){
         	nombreR = nombre.replace(nl,"<br/>");
         	if (nombreR == nombre) finRNombre=true;
         	nombre = nombreR;
         }

         var finRAsunto = false;
         while(!finRAsunto){
         	asuntoR = asunto.replace(nl,"<br/>");
         	if (asuntoR == asunto) finRAsunto=true;
         	asunto = asuntoR;
         }


         document.theForm2.valordetalle.value=nombre;
         document.theForm2.valorasunto.value=asunto;
         window.open("Detalle.html","Detalle","toolbar=0,scrollbars=yes,resizable=yes,width=500,height=300");
}










//-->
</SCRIPT>
<BODY onLoad="mensaje();" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >


<%@ page import="es.portanode.util.Padre,
                 es.portanode.util.ParametroBean, es.portanode.util.ParametroBeanCollection"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>


  <%

    String subtitulo1 = new String(" Consulta Notificaciones");
    String maxRows="100";

	int Limite =10;
	int numprocesos=0;
	//String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	String posurl = request.getParameter("Posicion");
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;

    String operador = (String) request.getParameter("OperadorConexion");
    String fechaActual = (String) request.getParameter("Fecha");
    Object [] listaPar = new Object[3];
    Integer[] listaTipo = new Integer[3];
%>


<%@include file="cabeceraLogo.jsp"%>
      <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta Notificaciones&nbsp;</DIV>

                  <div align="center"><center>
                  <br><br>
                    <table align="center" border="0" width="500">
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
                         <tr>
                           <td>
                            <FORM ACTION="javascript:void(null)" METHOD=post name="theForm">
                                <input type="hidden" name="Descripcion">
                                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                                <INPUT TYPE="hidden" name="Fecha" value="<%=fechaActual%>">
                                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>" >
                                <INPUT TYPE="hidden" NAME="Primera" VALUE="1">
                              <div align="center"><center>
                                  <table align="center"  border="1" class="tablas" >
                                   <tr>
                                       <td class="bgCabeceraFila">&nbsp;</td>
                                       <td width="200" align="center" class="bgCabeceraFila"><small>Fecha de Notificacion</small></td>
                                       <td width="300" align="center" class="bgCabeceraFila"><small>Asunto</small></td>

                                   </tr>

                       <%
                           String sql="";
                           String clase="";

                           Connection con=null;
                           PreparedStatement stm = null;
                           ResultSet rs=null;
                           ResultSet rs2=null;

                           try{

                               con = Padre.getConnection();
                               Long inicio = System.currentTimeMillis();
                               ParametroBean diaspb = new ParametroBean ( null , "CONF",ParametroBeanCollection.CLAVE_DIAS_A_NOTIFICAR);
                			   String diasConsulta = diaspb.getValor();

                               sql="select count(*) from notificaciones where FECHA_NOTIFICACION >= to_date(?,'dd/mm/yyyy') - to_number( ? ) and codigo= ? ";

                               int dias=Integer.parseInt(diasConsulta) ;
                               listaPar[0]=(fechaActual);
                       		   listaTipo[0]=(Types.VARCHAR);
                       		   listaPar[1]=(diasConsulta);
                       		   listaTipo[1]=(Types.VARCHAR);
                       		   listaPar[2]=(operador);
                       		   listaTipo[2]=(Types.VARCHAR);
                               numprocesos =Padre.selectInt(null,sql,listaPar, listaTipo);

                               int fin;
                               int fin2;
                               int fin1;
                               fin2 = inici + Limite;
                               if (fin2 < Limite)
                                   fin1=1;
                               else
                                    fin1=inici;


                               sql="select * from(" +
                                   "select a.*, ROWNUM AS R from " +
                                   " (select id_notificacion, to_char(fecha_notificacion,'yyyy/mm/dd hh24:mi:ss') as fecha," +
                                   "texto_mensaje, subject, nombre, codigo from notificaciones " +
			                       "where fecha_notificacion >= to_date(?,'dd/mm/yyyy hh24:mi:ss') - to_number( ? ) " +
                                   "and codigo= ?  order by fecha_notificacion desc) a " +
			                       "where ROWNUM<= ? ) " +
                                   "where R> ? " ;
                               stm = con.prepareStatement(sql);
                               stm.setString(1, fechaActual+ " 00:00:00");
                   			   stm.setInt(2, dias);
                   			   stm.setString(3, operador);
                   			   stm.setInt(4, fin2);
                   			   stm.setInt(5, fin1);

                               String idNotificacion="";
                               String fechaNotificacion="";
                               String contenidoMensaje="";
                               String destinatario="";
                               String motivoMensaje="";

                               rs2=stm.executeQuery();

                               int index = 999;
                               int i=0;
                               while(rs2.next())
                               {

                                   if (index==999)
                                       index=0;

                                   idNotificacion=rs2.getString("id_notificacion");
                                   fechaNotificacion= rs2.getString("fecha");
                                   fechaNotificacion=fechaNotificacion.substring(8,10)+ "/" + fechaNotificacion.substring(5,7)+ "/" + fechaNotificacion.substring(0,5) + " " +  fechaNotificacion.substring(11,19);
                                   contenidoMensaje=rs2.getString("texto_mensaje");
                                   motivoMensaje=rs2.getString("subject");
                                   if((i%2)==0)
                                       clase="";
                                   else
                                       clase="bgFila";
                                   i++;

                %>
                 <tr>
                          <input type="hidden" name="valor<%=index%>" value="<%=contenidoMensaje%>">
                          <input type="hidden" name="asunto<%=index%>" value="<%=motivoMensaje%>">
                          <TD class="<%=clase%>"><a href="javascript:Detalle('valor<%=index%>','asunto<%=index%>')//'" onMouseOver="window.status='Ver Detalle';return true" onMouseOut="window.status=' '"><img src="images/veer.gif" alt="Ver Detalle" border="0"></a></TD>
                          <td class="<%=clase%>" width="200" align="center"><font class="texto2"><small><%=fechaNotificacion%></small></font></td>
                          <td class="<%=clase%>" width="500" align="center"><font class="texto2"><small><%=motivoMensaje%></small></font></td>

                  </tr>
                <%
                    index ++;

                      }
                            Long finalmT = System.currentTimeMillis();
               				System.out.println("Tiempo final de consulta: "+(finalmT-inicio) );
                   }catch(Exception e){
                        System.out.println("Error al obtener los datos: "+e);
                           }finally {
                               try {
                                   if (rs != null){
                                       rs.close();
                                       rs=null;
                                   }
                                   if (rs2 != null){
                                       rs2.close();
                                       rs2=null;
                                   }

                                   if (stm != null){
                                       stm.close();
                                       stm=null;
                                   }

                                   if (con != null){
                                       if(!con.isClosed())
                                           /* con.close(); */
                                           Padre.closeConnection(con);
                                       con=null;
                                   }
                               } catch (Exception e) {
                                   System.err.println("Error al cerrar Conexion: "+e);
                               }
                           }


                %>
                    </table>
                   </center></div>
                   </form>
                  </td>
                </tr>
                <tr>
                    <td align="center">
                      <!--		Calling Navegador.jsp			-->

                        <jsp:include page="/NavegadorJSP" flush="true">
                            <jsp:param name="Limit" value="<%=Limite%>" />
                            <jsp:param name="Total" value="<%=numprocesos%>" />
                            <jsp:param name="ActualLink" value="<%=posActual%>" />
                            <jsp:param name="DirectURL" value="javascript:Navegar(" />
                        </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                      <BR>
                      <BR>
                      <BR>
                      <FORM METHOD=POST ACTION="MenuPrincipalJSP" name="fback">
                        <INPUT TYPE="hidden" name="OperadorConectado" value="<%=imagen%>">
                        <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                        <INPUT TYPE="hidden" name="Posicion" value="1">
                      </FORM>
                      <A HREF="javascript:document.fback.submit()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
                    </td>
                </tr>
                </table>
                <form ACTION="javascript:void(null)" METHOD=post name="theForm2">
                <INPUT TYPE="hidden" name="valordetalle" value="">
                <INPUT TYPE="hidden" name="valorasunto" value="">
                </form>
                </center></div>



              <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>

</body>
</HTML>
