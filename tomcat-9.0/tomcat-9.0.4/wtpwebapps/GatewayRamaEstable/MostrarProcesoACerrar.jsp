<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--

function TodoOk(accion){

     if ( accion=='aceptar' )
       {
         f = document.theForm;
          f.submit();
       }
       else
       {
         f1=document.volver;
	 f1.submit();
       }



}

function Enviar(){

}
//-->
</SCRIPT>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"  >

<!-- Insercion de Cabecera -->
  <%
    System.out.println("Estoy en la insercion de la cabecera");
    
    String subtitulo1 = new String(" Cerrar Proceso Cambio");

        String operador = (String) request.getParameter("OperadorConectado");
	
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 211;
      var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos del proceso</DIV>

                <form action="CerrarProcesoCambioJSP" method="POST" name="volver">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                </form>
                <form action="EjecutarCerrarProcesoJSP" method="POST" name="theForm">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <%@ page import="java.sql.*,
                                 es.portanode.util.Padre" %>
                <%@ page import="java.lang.*" %>
                <%@ page import="javax.naming.*" %>
                <%@ page import="javax.sql.*" %>
                <%@ page import="javax.servlet.*" %>


                <%

                String sql="";

                Connection con=null;
                Statement stm = null;
                ResultSet rs=null;


                try{

                   con = Padre.getConnection();
                   stm = con.createStatement();
                   String IdProceso=request.getParameter("IdProceso");
                   if ( IdProceso==null )
                        IdProceso="";




                   sql="select * from proceso_abierto where id_proceso='"+ IdProceso +"' and operador='"+ operador + "'";




                   rs=stm.executeQuery(sql);

                   String id_proceso_referencia="";
                   String inicio_rango="";
                   String final_rango="";
                   String id_ultimo_mensaje="";
                   String status="";

                   String id_mensaje_erroneo="";
                   String tipo_mensaje_erroneo="";

                   String result ="";


                   if (rs.next())

                   {
                        id_proceso_referencia=rs.getString("ID_PROCESO_REFERENCIA");
                            if(id_proceso_referencia==null)id_proceso_referencia="";
                                inicio_rango=rs.getString("INICIO_RANGO");
                                final_rango=rs.getString("FINAL_RANGO");
                                id_ultimo_mensaje=rs.getString("ID_ULTIMO_MENSAJE");
                                status=rs.getString("STATUS");

                                id_mensaje_erroneo=rs.getString("ID_MENSAJE_ERRONEO");
                                    if(id_mensaje_erroneo==null)id_mensaje_erroneo="";
                                tipo_mensaje_erroneo=rs.getString("TIPO_MENSAJE_ERRONEO");
                                    if(tipo_mensaje_erroneo==null)tipo_mensaje_erroneo="";


                               if (!status.equals("CERRADO"))
                               {
                    %>

                  <div align="center"><center>
                  <table border="0" cellspacing="5">

                      <tr>
                          <td colspan="6">
                                <font class="texto2">ID_PROCESO:&nbsp;<%=IdProceso%></font>
                            <INPUT TYPE="hidden" size="20" maxlength="20" name="IdProceso" value="<%=IdProceso%>">
                          </td>
                      </tr>



                      <tr>
                          <td colspan="6">
                                <font class="texto2">INICIO_RANGO:&nbsp;<%=inicio_rango%></font>
                            <INPUT TYPE="hidden" size="20" maxlength="20" name="INICIO_RANGO" value="<%=inicio_rango%>">
                          </td>
                      </tr>

                      <tr>
                          <td colspan="6">
                                <font class="texto2">FINAL_RANGO:&nbsp;<%=final_rango%></font>
                                <INPUT TYPE="hidden"  size="20" maxlength="20" name="FINAL_RANGO" value="<%=final_rango%>">
                          </td>
                      </tr>

                      <tr>
                          <td colspan="6">
                                <font class="texto2">ID_ULTIMO_MENSAJE:&nbsp;<%=id_ultimo_mensaje%></font>
                                <INPUT TYPE="hidden"  size="20" maxlength="20" name="ID_ULTIMO_MENSAJE" value="<%=id_ultimo_mensaje%>">
                          </td>
                      </tr>

                      <tr>
                          <td colspan="6">
                                <font class="texto2">STATUS:&nbsp;<%=status%></font>
                                <INPUT TYPE="hidden"  size="20" maxlength="20" name="STATUS" value="<%=status%>">
                          </td>
                      </tr>


                    </table>
                    </center></div>

                    <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                         <td><A HREF="javascript:TodoOk('aceptar')//'" onMouseOver="window.status='Aceptar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                            <td><A HREF="javascript:TodoOk('cancelar')//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>

                    <%
                               }else
                               {

                    %>

                     <div align="center"><center>
                    <table border="0" cellspacing="5">




                        <tr>
                            <td colspan="6">
                                <font class="texto2">El proceso <%=IdProceso%> ya estaba cerrado:&nbsp;</font>

                            </td>
                        </tr>


                    </table>
                    </center></div>
                <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                          <td><A HREF="javascript:TodoOk('cancelar')//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>

                <%
                               }


                   }else //if (rs.next())
                   {

                 %>
                       <div align="center"><center>
                    <table border="0" cellspacing="5">




                        <tr>
                            <td colspan="6">
                                <font class="texto2">El proceso <%=IdProceso%> no existe:&nbsp;</font>

                            </td>
                        </tr>


                    </table>
                    </center></div>

                    <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                          <td><A HREF="javascript:TodoOk('cancelar')//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>



                 <%
                   }

                  }catch(Exception e){
                        System.out.println("Error al obtener los datos: "+e);
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
