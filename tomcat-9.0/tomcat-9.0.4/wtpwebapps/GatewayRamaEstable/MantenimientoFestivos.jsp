<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
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
       f.action="PrevioMantenimientoFestivo";
       f.submit();
}

//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.FestivoCollectionUtil,
                 es.portanode.util.FestivoUtil"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1 = new String("Mantenimiento de festivos");

	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("operadorConectado");
  String descOperador = (String) request.getAttribute("descOperador");	
  FestivoCollectionUtil festivos = (FestivoCollectionUtil) request.getAttribute("festivos");
  Vector vfestivos= festivos.getFestivos();
	int numfilas = festivos.getNumeroFestivos();        
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos festivos</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM ACTION="MantenimientoFestivo" method="POST" NAME="theForm">
                <INPUT TYPE="hidden" name="ComunidadAutonoma">
                <INPUT TYPE="hidden" name="Fiesta">
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
                            <td width="30%" align="center" class="bgCabeceraFila">&nbsp;Fiesta&nbsp;</td>
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
                        FestivoUtil fest = (FestivoUtil) vfestivos.elementAt(i);
                        String coda = fest.getFestivoCodigoCA();
                        String fecha = fest.getFestivoFecha ();
                        if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";

                %>
                            <tr>
                                <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=coda%>+<%=fecha%>+<%=operadorActual%>" onClick="check=<%=index%>"></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                                <td align="center" class="<%=clase%>"><font class="texto2"><%=fecha%></font></td>
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

                </body>
                <body >
                <div align="center"><center>
                <table border="0">
                 <tr>
                <%
                      if (numfilas==0){
                %>
                   <td><A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A></td>

                  <td><A HREF="javascript:/*'*/void(alert('No hay rangos de numeracion a modificar'))" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <%
                      }
                      else{
                %>
                  <td><A HREF="javascript:Carga(1)//'" onMouseOver="window.status='Altas';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" border="0" width="107" height="28"></A></td>
                  <td><A HREF="javascript:Carga(3)//'" onMouseOver="window.status='Bajas';return true" onMouseOut="window.status=' '"><img src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <%
                      }
                %>
                <td><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
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
