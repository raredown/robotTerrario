<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
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

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioMantenimientoCliente";
       f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.TipoClienteBeanCollection,
                 es.portanode.util.TipoClienteBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Mantenimiento de tipos de cliente");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("operadorConectado");
	String descOperador = (String) request.getAttribute("DescOperador");  	
    TipoClienteBeanCollection colTipoCliente = (TipoClienteBeanCollection) request.getAttribute("tipoCliente");
	Vector vclientes = colTipoCliente.getColeccionTipoCliente();
	int numfilas = colTipoCliente.getNumColeccionTipoCliente();
        
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos tipo cliente:</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="GeneraMantTipoCliente" method="POST" name="theForm">
                      <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                      <INPUT TYPE="hidden" name="TipoCliente">
                      <INPUT TYPE="hidden" name="Servlet">
                      <INPUT TYPE="hidden" name=Posicion value="1">
                </form>
                <table border="0" width="100%">
                <form method="POST" name="form1">
                  <tr>
                    <td align="center"><div align="center"><center>
                    <table  border="1" class="tablas" >
                <%
                    if ((numfilas - inici) > 1){
                %>
                    <INPUT TYPE="hidden" name=seleccion value="1">
                <%  }else{
                %>
                    <INPUT TYPE="hidden" name=seleccion value="0">
                <%
                    }
                %>
                      <tr>
                        <td class="bgCabeceraFila">&nbsp;</td>
                        <td align="center" class="bgCabeceraFila">Operador Conectado</td>
                        <td align="center" class="bgCabeceraFila">Cód. Cliente</td>
                        <td align="center" class="bgCabeceraFila">tipo de cliente</td>
                      </tr>
                <% int fin;
                   String clase="";
                   if (numfilas < inici+Limite)
                   fin = numfilas;
                   else
                   fin = inici+Limite;
                   System.err.print(fin);
                   for (int i=inici; i<fin; i++){
                        int index = i-inici;
                            TipoClienteBean cliente = (TipoClienteBean) vclientes.elementAt(i);
                            String codigoOperador = cliente.getCodigoOperador();
                            String tipoCliente = cliente.getTipoCliente();
                        String descripcion = cliente.getDescripcion();
                            if (descripcion==null) descripcion=" ";
                       if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";
                %>
                      <tr>
                        <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=codigoOperador%>+<%=tipoCliente%>" onClick="check=<%=index%>"></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=tipoCliente%></font></td>
                        <td class="<%=clase%>"><font class="texto2"><%=descripcion%></font></td>
                      </tr>
                <%
                       }
                %>
                    </table>
                    </center></div></td>
                  </tr>
                  </form>
                </table>
                <!--
                    Calling Navegador.jsp
                -->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numfilas%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>

                </body>
                <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>


                </center></div>
                <body >
                <div align="center"><center>
                 <table border="0">
                <%
                      if (numfilas==0){
                %>
                <tr>
                 <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                <TD vAlign=top width="180" class="celdalineaderecha">
                   &nbsp;
                </TD>
                <td><A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                <A HREF="javascript:/*'*/void(alert('No hay ningún cliente a modificar'))" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
                <A HREF="javascript:/*'*/void(alert('No hay ningún cliente para dar de baja'))" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                    </tr>
                <%
                        }
                        else{
                %>
                <tr>
                <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                <TD vAlign=top width="180" class="celdalineaderecha">
                   &nbsp;
                </TD>
                <td><a href="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
                <a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
                <a href="javascript:Carga(3)//'" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                 <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                  </tr>
                <%
                        }
                %>
                <tr>
                <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                <TD vAlign=top width="180" class="celdalineaderecha">
                   &nbsp;
                </TD>
                <td><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                 <td width="10" class="Fondoverdederecha" height='60'>
                   &nbsp;
                </td>
                </tr>
                </table>
                </center></div>
     <jsp:include page="pie.jsp" flush="true"/>
</body>
</html>
