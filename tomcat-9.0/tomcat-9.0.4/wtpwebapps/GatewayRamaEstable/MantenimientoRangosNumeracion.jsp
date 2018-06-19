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
       f.action="PrevioMantenimientoRangoNumeracion";
       f.submit();
}

//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.mensajes.RangosNumeracionBeanCollection,
                 es.portanode.mensajes.RangoNumeracionBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Mantenimiento de rangos de numeraci&oacute;n");
    String subtitulo2 = new String("Rangos de numeraci&oacute;n");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("operadorConectado");
    String descOperador = (String) request.getAttribute("descOperador");
    RangosNumeracionBeanCollection rangosNumeracion = (RangosNumeracionBeanCollection) request.getAttribute("rangosNumeracion");
	Vector vrangosnumeracion = rangosNumeracion.getRangosNumeracion();
	int numfilas = rangosNumeracion.getNumRangosNumeracion();        
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='50%' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Rangos Numeración</DIV>

<div align="center"><center>
<FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
<INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
<INPUT TYPE="hidden" name="Posicion" value="1">
</FORM>
<FORM ACTION="MantenimientoRangoNumeracion" method="POST" NAME="theForm">
<INPUT TYPE="hidden" name="IdRango">
<INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
<INPUT TYPE="hidden" name="Servlet">
<INPUT TYPE="hidden" name="Posicion" value="1">
</FORM>
<table border="0" width="100%">
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
            <td align="center" class="bgCabeceraFila">Operador Conectado</td>
            <td width="30%" align="center" class="bgCabeceraFila">&nbsp;Inicio Rango&nbsp;</td>
            <td width="30%" align="center" class="bgCabeceraFila">&nbsp;Final Rango&nbsp;</td>
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
        RangoNumeracionBean rango = (RangoNumeracionBean) vrangosnumeracion.elementAt(i);
        String idRango = rango.getIdInterno();
        String operador = rango.getOperador();
        String rangoInicial = rango.getInicioRango();
        String rangoFinal = rango.getFinalRango();
        if((i%2)==0)
            clase="";
        else
            clase="bgFila";
%>
            <tr>
                <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=idRango%>+<%=operador%>" onClick="check=<%=index%>"></td>
                <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                <td align="center" class="<%=clase%>"><font class="texto2"><%=rangoInicial%></font></td>
                <td align="center" class="<%=clase%>"><font class="texto2"><%=rangoFinal%></font></td>
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
<%
      if (numfilas==0){
%>
 <tr>
     <td align="center"><A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
     <A HREF="javascript:/*'*/void(alert('No hay rangos de numeracion a modificar'))" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img
        src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
     <A HREF="javascript:/*'*/void(alert('No hay rangos de numeracion a modificar'))" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
</tr>
<%
      }
      else{
%>
 <tr>
  <td align="center"><A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
      <A HREF="javascript:Carga(2)//'" onMouseOver="window.status='Modificaciones';return true" onMouseOut="window.status=' '"><img src="images/Manten2.jpg" border="0" width="107" height="28"></A>&nbsp;&nbsp;
      <A HREF="javascript:Carga(3)//'" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
 </tr>
<%
      }
%>
<tr>
     <td vAlign="top" align="center"><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
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
