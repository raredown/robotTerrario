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
	     for (i=0; i < arrayStr.length; i++){
	         f1.elements[i+1].value = arrayStr[i];
	     }
    }
    else{ 
	     for (i=0; i < arrayStr.length; i++){
        	 f1.elements[i].value = arrayStr[i];
             }
    }
}

function Carga(){      
      f1 = document.theForm;
      f2 = document.form1;      
      if (check == "99"){            
            alert("Ha de escoger una fila");
            return;
      }
      else{
         asignar(check);         
         f1.submit();         
      }
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioMantenimientoTemporizador";
       f.submit();
}

//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.alarmas.ParametrizacionTemporizadores,
                 es.portanode.alarmas.ParametrizacionTemporizador"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Mantenimiento de temporizador");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("operadorConectado");
  String descOperador = (String) request.getAttribute("descOperador");	
  
  ParametrizacionTemporizadores ltemporizadores = (ParametrizacionTemporizadores) request.getAttribute("temporizadores");
	
  Vector vtemporizadores = ltemporizadores.getTemporizadoresMantenimiento();
  int numfilas = ltemporizadores.getTemporizadoresMantenimientoSize();        
%>
<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='50%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
      <table>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos temporizador:</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM ACTION="MantenimientoTemporizador" method="POST" NAME="theForm">
                <INPUT TYPE="hidden" name="CodigoTemporizador">
                <INPUT TYPE="hidden" name="InicioVigencia">
                <INPUT TYPE="hidden" name="Referencia">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <table border="0" width="95%">
                    <tr>
                      <td align="center"><div align="center"><center>
                        <table  border="1" class="tablas" >
                        <FORM method="POST" NAME="form1">
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
                            <td width="10%" align="center" class="bgCabeceraFila">Codigo</td>
                            <td width="60%" align="center" class="bgCabeceraFila">Descripcion</td>
                            <td width="10%" align="center" class="bgCabeceraFila">&nbsp;Minimo&nbsp;</td>
                            <td width="10%" align="center" class="bgCabeceraFila">&nbsp;Maximo&nbsp;</td>
                            <td width="10%" align="center" class="bgCabeceraFila">Inicio Vigencia</font></td>
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
                        ParametrizacionTemporizador temp = (ParametrizacionTemporizador) vtemporizadores.elementAt(i);
                        String codigo = temp.GetTemporizadorMantenimientoCodigo();
                        String inicioVigencia = temp.getTemporizadorMantenimientoFechaInicioValidez();
                        String descripcion = temp.GetTemporizadorMantenimientoDescripcion();
                        String minimo = temp.getTemporizadorMantenimientoDuracionMinima();
                        String maximo = temp.getTemporizadorMantenimientoDuracionMaxima();
                        String referencia = temp.getTemporizadorMantenimientoReferencia();
                        if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";

                %>
                            <tr>
                                <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=codigo%>+<%=inicioVigencia%>+<%=referencia%>" onClick="check=<%=index%>"></td>
                                <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=codigo%></font></td>
                                <td class="<%=clase%>"><font class="texto2" size=2><%=descripcion%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2" size=2>&nbsp;<%=minimo%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2" size=2>&nbsp;<%=maximo%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2" size=2><%=inicioVigencia%></font></td>
                            </tr>
                <%
                   }
                %>
                        </table>
                        </center></div></td>
                    </tr>
                </FORM>
                </table>
                </center></div>
                <!--
                    Calling Navegador.jsp
                -->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numfilas%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>


				<div align="center"><center>
				<table border="0" height='10%' cellpadding='0' cellspacing='0' width="100%">
				 <tr>
				<%
				      if (numfilas==0){
				%>       
				  <td align="center"><A HREF="javascript:/*'*/void(alert('No hay temporizadores a modificar'))" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
				<%
				      }
				      else{
				%>      
				  <td align="center"><A HREF="javascript:Carga()//'" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
				<%    
				      }
				%>
				 <A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
				</tr>
				</table>
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
</html>
