<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--

function TodoOk(){


         f = document.theForm;
          f.submit();

}


//-->
</SCRIPT>

<%@ page import="java.util.*,
                 es.portanode.util.Padre,
                 es.portanode.util.Calendario,
                 es.portanode.procesos.PadreProceso"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.rmi.RemoteException"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.*" %>

<%
    String operador = (String) request.getParameter("OperadorConectado");
    String id_ultimo_mensaje = (String) request.getParameter("ID_ULTIMO_MENSAJE");
    String IdProceso=request.getParameter("IdProceso");

    String InicioRango=request.getParameter("INICIO_RANGO");
    String FinalRango=request.getParameter("FINAL_RANGO");
    String status=request.getParameter("STATUS");
%>



<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >

  <%
    System.out.println("Estoy en la insercion de la cabecera");

    String subtitulo1 = new String(" Cerrar Proceso Cambio");

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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Alta operador ER</DIV>

                <form action="PrevioMenuMantenimientoSistema" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <%

                Connection con=null;
                Statement stm = null;
                Statement stm1 = null;
                ResultSet rs=null;

                try{
                   con=Padre.getConnection();
                   con.setAutoCommit(false);
                   //stm = con.createStatement();
                   //stm1 = con.createStatement();

                   String sql="";
                   int resultado=0;
                   stm = con.createStatement();


                   if (status.startsWith("ENVIE SP"))
                   {
                      sql="delete  alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and id_alarma !='A22' and id_alarma !='A21'";
                      resultado=stm.executeUpdate(sql);

                      sql=sql="Select clave_primaria, operador, id_proceso, id_proceso_referencia, id_alarma, expiracion, mensaje_previo from alarma where id_alarma='A22' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                      rs=stm.executeQuery(sql);
                       if (rs.next())
                       {

                          sql="delete  alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and  id_alarma ='A21'";
                          resultado=stm.executeUpdate(sql);
                          sql="update alarma set expiracion=sysdate  where id_alarma='A22' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                          resultado=stm.executeUpdate(sql);
                       }
                       else
                       {
                          sql=sql="Select clave_primaria, operador, id_proceso, id_proceso_referencia, id_alarma, expiracion, mensaje_previo from alarma where id_alarma='A21' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                          rs=stm.executeQuery(sql);

                          if (rs.next())
                          {

                             sql="delete  alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and  id_alarma ='A22'";
                             sql="update alarma set expiracion=sysdate  where id_alarma='A21' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                             resultado=stm.executeUpdate(sql);
                          }
                           else
                          {
                             String ALARMA_A22 = "A22";
                             Calendario fhoy=new Calendario();
                             PadreProceso.grabarAlarma(con,operador,IdProceso,"",ALARMA_A22,id_ultimo_mensaje,fhoy,0);
                          }
                     }

                   }
                   else if(status.startsWith("SP PEND"))
                   {
                      sql="delete  alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and id_alarma !='A02'";
                      resultado=stm.executeUpdate(sql);

                       sql=sql="Select clave_primaria, operador, id_proceso, id_proceso_referencia, id_alarma, expiracion, mensaje_previo from alarma where id_alarma='A02' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                      rs=stm.executeQuery(sql);

                       if (rs.next())
                       {
                          sql="update alarma set expiracion=sysdate  where id_alarma='A02' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                          resultado=stm.executeUpdate(sql);
                       }
                       else
                       {
                             String ALARMA_A02 = "A02";
                             Calendario fhoy=new Calendario();
                             PadreProceso.grabarAlarma(con,operador,IdProceso,"",ALARMA_A02,id_ultimo_mensaje,fhoy,0);
                       }
                   }
                   else if(status.startsWith("ASP PEND"))
                   {
                      sql="delete alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and id_alarma !='A04'";
                      resultado=stm.executeUpdate(sql);

                       sql=sql="Select clave_primaria, operador, id_proceso, id_proceso_referencia, id_alarma, expiracion, mensaje_previo from alarma where id_alarma='A04' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                       rs=stm.executeQuery(sql);

                       if (rs.next())
                       {
                          sql="update alarma set expiracion=sysdate  where id_alarma='A04' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                          resultado=stm.executeUpdate(sql);
                       }
                       else
                       {
                             String ALARMA_A04 = "A04";
                             Calendario fhoy=new Calendario();
                             PadreProceso.grabarAlarma(con,operador,IdProceso,"",ALARMA_A04,id_ultimo_mensaje,fhoy,0);
                       }
                   }
                   else if(status.startsWith("ESP.CP") || status.startsWith("ESP.STP") )
                   {

                      sql="delete  alarma where id_proceso='" + IdProceso + "' and operador='" + operador + "' and id_alarma !='A10'";
                      resultado=stm.executeUpdate(sql);

                       sql=sql="Select clave_primaria, operador, id_proceso, id_proceso_referencia, id_alarma, expiracion, mensaje_previo from alarma where id_alarma='A10' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                       rs=stm.executeQuery(sql);

                       if (rs.next())
                       {
                          sql="update alarma set expiracion=sysdate  where id_alarma='A10' and operador='" + operador + "' and id_proceso='" + IdProceso + "'";
                          resultado=stm.executeUpdate(sql);
                       }
                       else
                       {
                             String ALARMA_A10 = "A10";
                             Calendario fhoy=new Calendario();
                             PadreProceso.grabarAlarma(con,operador,IdProceso,"",ALARMA_A10,id_ultimo_mensaje,fhoy,0);
                      }
                   }

                 if(status.startsWith("ENVIE SP") || status.startsWith("SP PEND") || status.startsWith("ASP PEND") || status.startsWith("ESP.CP") || status.startsWith("ESP.STP"))

                  {
                     con.commit();

                  %>

                  <input type="hidden" name="Descripcion">

                    <div align="center"><center>
                    <table border="0" cellspacing="5">

                        <tr>
                            <td colspan="6">
                                <font class="texto2">El proceso se ha Cerrado Correctamente:&nbsp;</font>

                            </td>
                        </tr>

                    </table>
                    </center></div>

                    <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                         <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Aceptar';return true" onMouseOut="window.status=' '"><IMG src="images/Aceptar.jpg" border="0" width="107" height="28" border="0"></A></td>


                        </tr>
                    </table>
                    </center></div>

                   <%
                   }

                   else

                   {%>

                     <div align="center"><center>
                    <table border="0" cellspacing="5">



                        <tr>
                            <td colspan="6">
                                <font class="texto2">El proceso esta en un estado inconsistente;</font>

                            </td>
                        </tr>


                    </table>
                    </center></div>

                    <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                          <td><A HREF="javascript:TodoOk()//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>

                    <%
                    }
                    %>

                  <%

                  }catch(Exception e){
                        System.out.println("Error al obtener los datos: "+e);
                  %>
                    <div align="center"><center>
                    <table border="0" cellspacing="5">

                        <tr>
                            <td colspan="6">
                                <font class="texto2">Error al acceder a la base de datos&nbsp;</font>

                            </td>
                        </tr>

                    </table>
                    </center></div>
                <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                          <td><A HREF="javascript:TodoOk()//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>


                  <%

                   }finally {

                        try {

                                      if (rs != null){
                                        rs.close();
                                        rs=null;
                                        }
                                      if (stm != null){
                                          stm.close();
                                          stm=null;
                                        }
                                        if (con != null){
                                            if(!con.isClosed())
                                               con.close();
                                            con=null;
                                        }
                                } catch (Exception e) {
                                        System.err.println("Error al cerrar Conexion: "+e);
                                }
                   }

                %>
                </form>
            <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>    
</BODY>
</HTML>
