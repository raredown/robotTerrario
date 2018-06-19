<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

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
         f1=document.formError;
	 f1.submit();
       }   
       
      
}

//-->
</SCRIPT>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"  >

<%@ page import="java.sql.*,
                 es.portanode.util.Padre" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.*" %>


  <%
    String subtitulo1=new String("Cancelación mensaje de cambio de operador");
    String mensaje = new String("CNC");
    String subtitulo2=new String("Informaci&oacute;n");
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
          <TD vAlign=top width="180" >
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Validar Proceso </DIV>





		<%
		        String OperadorConectado = (String) request.getParameter("OperadorConectado");
		        String Destinatario = (String) request.getParameter("Destinatario");
		        String IdProceso = (String) request.getParameter("IdProceso");
		        String Observaciones = (String) request.getParameter("Observaciones");
		        String Causa = (String) request.getParameter("Causa");
		        String Descripcion = (String) request.getParameter("Descripcion");
			
		%>
		<form action="PrevioEnviarMsgCNC" method="POST" name="formError" >
		<INPUT TYPE="hidden" name="NProceso" value="0">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorConectado%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		</form>
		
		<form action="EnviarMsgCNC" method="POST" name="theForm" >
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorConectado%>">
		<INPUT TYPE="hidden" name="Destinatario" value="<%=Destinatario%>">
		<INPUT TYPE="hidden" name="IdProceso" value="<%=IdProceso%>">
		<INPUT TYPE="hidden" name="Observaciones" value="<%=Observaciones%>">
		<INPUT TYPE="hidden" name="Causa" value="<%=Causa%>">
		<INPUT TYPE="hidden" name="Descripcion" value="<%=Descripcion%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<%
		 
		  String validacion ="NO";                  
		                    
		                        
		   String sql="";
		   Connection con=null;
		   Statement stm = null;
		   ResultSet rs=null;
		   ResultSet rs2=null;
		   
		   try{
		 
		
		          con = Padre.getConnection();
		          stm = con.createStatement();       
		                      
		           sql="select * from proceso_abierto where id_proceso='"+ IdProceso +"' and operador='"+ OperadorConectado + "'";            
		            
		           rs=stm.executeQuery(sql);
		             
		           if (rs.next())
		              {              
		/*                 sql = "SELECT cm.operador_destino, cm.id_proceso, cm.tipo_mensaje, pa.status, pa.operador "+
		                       "FROM cabecera_mensaje cm, proceso_abierto pa  WHERE "+
		                       "(cm.operador_destino='" + OperadorConectado + "' or  cm.operador_origen='" + OperadorConectado + "' ) and cm.id_proceso='" + IdProceso + "' and cm.tipo_mensaje='ASP' and pa.id_proceso='" + IdProceso + "' and pa.operador='" + OperadorConectado + "' and pa.status<>'CERRADO'" ;
		*/
		                 sql = "SELECT cm.operador_destino, cm.id_proceso, cm.tipo_mensaje, pa.status, pa.operador "+
		                       "FROM cabecera_mensaje cm, proceso_abierto pa  WHERE "+
		                       "(cm.operador_destino='" + OperadorConectado + "' or  cm.operador_origen='" + OperadorConectado + "' ) and cm.id_proceso='" + IdProceso + "' and pa.id_proceso='" + IdProceso + "' and pa.operador='" + OperadorConectado + "'";
		
		
		
		                       
		    
		                        rs2=stm.executeQuery(sql);
		   
		   	                
		                        if (rs2.next())
		   
		                         {
				             
				         %>  
		
		
		 <table border="0" cellspacing="5">        
		 <tr>
		            <td colspan="6">
		                                 
		            	<font class="texto2">Número identificación&nbsp;proceso:&nbsp;</font>
		                <font class="texto"><%=IdProceso%></font>
		            </td>
		</tr>
		<tr>
		          <td colspan="6">
		            	<font class="texto2">STATUS:&nbsp;<%=rs2.getString(4)%></font>
		            	
		          </td>
		</tr>
		</table>
		
		
		
		<div align="center"><center>
		    <table border="0">
		      <tr>
		         <td><A HREF="javascript:TodoOk('aceptar')//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>
		         
		            <td><A HREF="javascript:TodoOk('cancelar')//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
		          
		        </tr>
		    </table>
		    </center></div>
		
		
		
				  <%
				         }
				         else{
				  %>
		
		
		     <div align="center"><center>
		    <table border="0" cellspacing="5">        
		        
		        
		            	
		       
		        <tr>
		            <td colspan="6">
		            	<font class="texto2">El proceso <%=IdProceso%> No se puede cancelar; No reune condiciones:&nbsp;</font>
		            	
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
				  %>  
		                    
		   <%
		      }
		      else
		      {
		   %> 
		   
		    <div align="center"><center>
		    <table border="0" cellspacing="5">        
		        
		        
		            	
		       
		        <tr>
		            <td colspan="6">
		            	<font class="texto2">El proceso <%=IdProceso%> No exite como proceso lanzado;</font>
		            	
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




    