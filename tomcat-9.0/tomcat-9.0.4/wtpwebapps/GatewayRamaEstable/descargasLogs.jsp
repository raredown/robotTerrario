<%@ page import="java.util.*,
                 es.portanode.util.Padre"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.text.*"%>

<%@ page import="java.sql.*"%>


<%@page contentType="text/html"%>
<html>
<head>
<!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Descarga Logs de Aplicaci&oacute;n.");

Connection con = null;
Statement stm = null;
ResultSet rs = null;
String ruta = "";
String rutaLogs= "";
try{
    con = Padre.getConnection();
    stm = con.createStatement();
    String query = "SELECT VALOR FROM PARAMETRO WHERE CLAVE ='LOG DIR'";
    rs = stm.executeQuery(query);
    if (rs.next()){
        ruta = rs.getString("VALOR");
        System.out.println("desacargasLogs.jsp--->RUTA DE ACCESO A LOS LOGS APLICACION: " + ruta);
    }else{
        System.out.println("desacargasLogs.jsp--->ERROR AL INTENTAR UBICAR LA RUTA LOGS EN BBDD.");
    }
}catch(Exception ex){
    System.out.println("desacargasLogs.jsp--->ERROR AL INTENTAR UBICAR LA RUTA LOGS EN BBDD: " + ex);
}finally{
    try{
        if (rs != null){
            try{
                rs.close();
                rs = null;
            }catch(Exception exRs){}
        }
        if (stm != null){
            try{
                stm.close();
                stm = null;
            }catch(Exception exStm){}
        }
        if (con!= null){
            if(!con.isClosed()){
                con.close();
                con = null;
            }
        }
    } catch (Exception ec) {
        System.out.println("descargasLogs.jsp--->Error en el cierre conexion BBDD: " + ec);
    }
}

String rutaBase = ruta;
StringTokenizer cortaruta=new StringTokenizer(ruta,"/");
int separadores=0;
int separadores1=0;
separadores1 =cortaruta.countTokens()+3;
separadores =cortaruta.countTokens()+2;
String rutaPORTANODE=ruta + "/Adquisicion/*.*|cut -f "+ separadores1 +" -d/";
ruta = ruta + "/*.*|cut -f "+ separadores +" -d/";
String StrLogs = "";
Vector vectorLogs = new Vector();
Vector vectorLogsOperador = new Vector();
String ls_str;
String ls_str1;
String ls_strPORTANODE;
separadores=separadores+1;

System.out.println("-----"+ruta);
String comando = "ls " + ruta + " > " + rutaBase + "/archivos.txt";
String comandoPORTANODE = "ls " + rutaPORTANODE + " > " + rutaBase + "/Adquisicion/archivos.txt";
String [] comandos = {
        "sh",
        "-c",
        comando
};
String [] comandosPORTANODE = {
        "sh",
        "-c",
        comandoPORTANODE
};


Process ls_proc = Runtime.getRuntime().exec(comandos, null);
Process ls_procPORTANODE = Runtime.getRuntime().exec(comandosPORTANODE, null);
ls_proc.waitFor();
ls_procPORTANODE.waitFor();

File fListado = null;
File fListadoPORTANODE = null;
FileReader fr = null;
FileReader frPORTANODE = null;
StringBuffer sb = new StringBuffer();
StringBuffer sbPORTANODE = new StringBuffer();

try{
        int ch;


        fListado = new File(rutaBase + "/archivos.txt");
        fr = new FileReader(fListado);
        ch = fr.read();
        while (ch != -1){
            if (ch == 10){
            	vectorLogs.addElement(sb.toString());
            	sb.delete(0,sb.length());
            }
            else
            {
            	sb.append((char)ch);
            }
            ch = fr.read();
        }

        fListadoPORTANODE = new File(rutaBase + "/Adquisicion/archivos.txt");
        frPORTANODE = new FileReader(fListadoPORTANODE);
        ch = frPORTANODE.read();
        while (ch != -1){
            if (ch == 10){
            	vectorLogsOperador.addElement(sbPORTANODE.toString());
            	sbPORTANODE.delete(0,sbPORTANODE.length());
            }
            else
            {
            	sbPORTANODE.append((char)ch);
            }
            ch = frPORTANODE.read();
        }
}
catch(Exception e){
        System.out.println("desacargasLogs.jsp--->Error en el parseo de los archivos" + e);
}

%>


<title>Descargas Logs</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function descargar(nombreSelect){

        if (nombreSelect=="logs"){
          a=document.theForm.logs.selectedIndex;
          nombreFichero=document.theForm.logs.options[a].value;
          if(nombreFichero!="-1")
            window.location="/logscontext/"+nombreFichero;
        }
        if (nombreSelect=="logsPORTANODE"){
          a=document.theForm.logsPORTANODE.selectedIndex;
          nombreFichero=document.theForm.logsPORTANODE.options[a].value;
          if(nombreFichero!="-1")
            window.location="/logscontext/Adquisicion/"+nombreFichero;
        }
}

//-->
</SCRIPT>

<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Descargas Logs</DIV>
                <br>
                <br>
                <br>
                <br>
                <DIV align="center">
                <table border=0>
                  <form method="POST"  align="center" name="theForm">
                  <tr>
                    <td colspan='2'><Font class="texto2">Seleccione un fichero:</font></td>
                  </tr>
                  <tr>
                    <td>
                      <select class="inputText" class="normal" name="logs">
                       <%
                       System.out.println("Tamaño: " + vectorLogs.size());
                       if(vectorLogs.size()>0)
                        {
                           for(int i=0;i < vectorLogs.size(); i++){ %>
                             <option value="<%=(String)vectorLogs.get(i)%>"><%=(String)vectorLogs.get(i)%></option>
                           <%}
                        }else{%>
                           <option value="-1">Ningún fichero disponible</option>
                        <%}%>
                      </select>
                    </td>
                    <td>
                      <a href="javascript:descargar('logs');" onMouseOver="window.status='Fichero de Mensajes CP ';return true" onMouseOut="window.status=' '">
                          &nbsp;<img src="images/Aceptar.jpg" border="0" width="107" height="28">
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      &nbsp;
                    </td>
                  </tr>
                  <tr>
                    <td colspan='2'><Font class="texto2"> Seleccione un fichero de logs de adquisici&oacute;n:</font></td>
                  </tr>
                  <tr>
                    <td>
                      <select class="inputText" class="normal" name="logsPORTANODE">
                       <%
                       System.out.println("Tamaño: " + vectorLogsOperador.size());
                       if(vectorLogsOperador.size()>0)
                        {
                         for(int i=0;i < vectorLogsOperador.size(); i++){ %>
                           <option value="<%=(String)vectorLogsOperador.get(i)%>"><%=(String)vectorLogsOperador.get(i)%></option>
                         <%}
                        }else{%>
                           <option value="-1">Ningún fichero disponible</option>
                        <%}%>
                      </select>
                    </td>
                    <td>
                      <a href="javascript:descargar('logsPORTANODE');" onMouseOver="window.status='Fichero de Mensajes CP ';return true" onMouseOut="window.status=' '">
                          &nbsp;<img src="images/Aceptar.jpg" border="0" width="107" height="28">
                      </a>
                    </td>
                  </tr>
                  <tr>
                     <td colspan='2' align='center'>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="2"><br/></td>
                            </tr>
                            <tr>

                                <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                            </tr>
                        </table>
                     </td>
                  </tr>
                  </form>
                <FORM ACTION="MenuPrincipalJSP" method="POST"  name="fback">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                </table>
                </DIV>
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
</html>