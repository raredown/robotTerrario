<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=iso-8859-1">
	<TITLE>Test de Conectividad con BBDD</TITLE>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<BODY>
<%@ page import = "java.lang.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>

<%
DataSource ds = null;
Connection con = null;
Statement stm = null;
ResultSet rs =null;
String query = null;
try{
   %>INICIAMOS CONTEXTO CORRESPONDIENTE A CMT<BR><%
   InitialContext ctx = new InitialContext();
   %>CONTEXTO CMT INICIALIZADO<BR><%
   %>INICIALIZANDO DATASOURCE PARA CMT-20<BR><%
   ds = (DataSource) ctx.lookup("jdbc/tkcDS");
   %>DATASOURCE CMT INICIALIZADO<BR><%
   con=ds.getConnection();	
   %>OBTENIDA CONEXCION CON CMT<BR><%
   stm = con.createStatement();
   %>STATEMENT CREADO<BR><%
   query = "select * from tab";
   %>EJECUTANDO QUERY<BR><%
   rs = stm.executeQuery(query);
   %>OBTENIENDO RESULTADOS<BR><%
   while (rs.next()){
	   %><%=rs.getString("TNAME")%><BR><%
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
                    	    con.close();
                    	    con=null;
                    	}
            	} catch (Exception e) {
           	            System.err.println("Error al cerrar Conexion: "+e);
            	}
   }
%>
</BODY>
</HTML>