<%@ page import="es.portanode.util.Singleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
       function abreAyuda()
		{
			open("Ayuda.html", "util", "toolbar=no,directories=no,location=no,status=yes,scrollbars=yes,resizable=yes,copyhistory=no,width=595,height=532");
		}

	   function CargarDatos(){
           	var f = document.subeFichero;
			if(f.fichero.value == "")
				alert("Seleccione un fichero del que obtener los datos");
			else{
			  f.submit();
			}
			return;
		}


//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.util.comunidades.ProvinciaBeanCollection,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.util.comunidades.ProvinciaBean,
                 es.portanode.util.operadores.OperadorBean,
                 es.portanode.BDR.NRNBean"%>
<%@ page import="java.io.*"%>
  <%
  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("NB"); 
	
    String subtitulo1=new String("Carga fichero notificaci&oacute;n de baja");
	String remitente = (String) request.getAttribute("OperadorConectado");
	
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Carga fichero <%=tipoMDescripcion %></DIV>

                <FORM METHOD=POST ACTION="MenuRolReceptor.jsp" name="fback">
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <INPUT TYPE="hidden" name="Posicion" value="1">
                    <INPUT TYPE="hidden" name="repetido" value="0">
                    <INPUT TYPE="hidden" name="repetido2" value="0">
                </FORM>


                <div align="center">
                <table border="0" cellspacing="5">
                <tr>
                    <td colspan="2">
                        <table width="80%" align="center">
                            <tr>
                                <td align="center" colspan="3">
                                    <table width="100%">
                                        <tr>
                                          <td align="center" class="texto5"><b>Cargar Datos de Fichero</b></td>
                                          <td align="center"><a href="BajasPendientes" ><font class="texto2">Ver bajas pendientes</font></a></td>
                                        </tr>
                                    </table>
                            </tr>
                            <tr>
                                <td align="center">
                                  <form action="UploadFichero" name="subeFichero" method="post" enctype='multipart/form-data'>
                    					<INPUT TYPE="hidden" name="tipoMensaje" value="NB">
                                  		<input name="fichero" type="file" size="50">
                                  		<a  href="javascript:CargarDatos()"><img src="images/cargar.gif" border="0"></a>
                                  </form>
                                </td>
                            </tr>
                        </table>
                        <hr>
                    </td>
                </tr>
                </table>
               </div>
                    <div align="center">
                    <table border="0">
                        <tr>
                            <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"/></A></td>
                        </tr>
                    </table>
                    </div>
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