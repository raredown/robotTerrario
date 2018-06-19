<HTML>
<head>
 <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
 <script language="JavaScript" src="js/util.js"></script>
</head>

<!--
********************************************************************************************************
  Attributes
	Mensaje -> Result of the last operation.
	Pagina -> Link for the next page.
********************************************************************************************************
-->

<!--
****************************     Part of the import libraries.    *************************************
-->
<!--
****************************     Part of the global vars.    *************************************
-->
<%@ page import="java.util.Vector,
                 es.portanode.util.Padre"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
 <% 
      String mensaje="";
	  String pagina="ConsultaOperadoresERJSP";
	  String subtitulo1 = "baja Operador ER";
	  String operador  = (String) request.getParameter("OperadorConectado");	 

      String Codigo = (String) request.getParameter("Codigo");
      String Descripcion = (String) request.getParameter("Descripcion");
      String Licencia = (String) request.getParameter("Licencia");
      String Comunidad = (String) request.getParameter("Comunidad");
%>

  <BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

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
               <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Baja operador ER</DIV>

                 <form name="formu" action="<%=pagina%>" method="POST">
                 <input type="HIDDEN" name="OperadorConectado" value="<%=operador%>">
                 <input type="HIDDEN" name="OperadorConexion" value="<%=operador%>">
                 <input type="HIDDEN" name="Posicion" value="1">
                 <input type="HIDDEN" name="Primera" value="0">

                 <%
                   String sql="";

                           Connection con=null;
                           Statement stm = null;
                           ResultSet rs=null;
                           int Resultado;


                           try{

                             con = Padre.getConnection();
                             con.setAutoCommit(false);
                             stm = con.createStatement();

                             sql="delete from   operador where codigo ='" + Codigo + "'";

                             Resultado=stm.executeUpdate(sql);

                             if (Resultado > 0 ) {
                                 con.commit();
                                 mensaje ="EL OPERADOR HA SIDO DADO DE BAJA";
                                 Singleton.getInstance ( ).refresh();
                                 }
                             else
                               {
                                 mensaje ="ERROR AL DAR DE BAJA  EL OPERADOR";
                               }
                   }catch(Exception e){
                        System.out.println("Error al obtener los datos: "+e);
                        mensaje="Exception al dar de baja al  Operador: " + e;
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
                                            mensaje="Exception al Cerrar Conexion: " + e;
                                }
                   }


                %>

                   <CENTER>
                     <br><br><br>
                      <table border="1" class="tablas" width="40%">
                       <tr>
                         <td class="bgCabeceraFila" align="center">
                            Resultado de la operación
                         </td>
                       </tr>
                       <tr>
                         <td class="bgFila">
                           <font class="texto"><%=mensaje%></font>
                         </td>
                       </tr>
                      </table>
                    </CENTER>
                    <br><br>
                    <CENTER>
                     <a href="javascript:void(document.formu.submit())//'" onMouseOver="window.status='Aceptar';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" width="107" height="28" border="0" alt="Baja operador ER"></a>
                    </CENTER>

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
