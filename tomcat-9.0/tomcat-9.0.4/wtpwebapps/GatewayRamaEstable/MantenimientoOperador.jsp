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
         return
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
       f.action="PrevioMantenimientoOperador";
       f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.operadores.OperadorMultipleBeanCollection,
                 es.portanode.util.operadores.OperadorMultipleBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  
  <%
    String subtitulo1 = new String("Mantenimiento de operadores");
	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("OperadorConectado");
	OperadorMultipleBeanCollection multi = (OperadorMultipleBeanCollection) request.getAttribute("MultiOperadores");
	int nummulti = multi.getNumero();
	int tam = Limite;
	if((inici+Limite) > nummulti) tam = nummulti - inici;
	Vector vmulti = new Vector();
	try 
	{
	vmulti = multi.getMultiOperador(inici,tam);
	}catch(Exception ignore){
		vmulti = new Vector();
		tam = 0;
	}
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos operador:</DIV>

                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <FORM action="MantenimientoOperador" method="POST" NAME="theForm">
                <INPUT TYPE="hidden" name=Operador value="0">
                <INPUT TYPE="hidden" name=Nombre value="0">
                <INPUT TYPE="hidden" name=Estado value="0">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=operadorActual%>">
                <INPUT TYPE="hidden" name=Posicion value="1">
                <INPUT TYPE="hidden" name="Servlet">

                </FORM>
                <table border="0" width="95%">
                <FORM method="POST" name="form1">
                  <tr>
                    <td align="center">
                      <div align="center"><center>
                      <table  border="1" class="tablas" >
                        <tr>
                          <td class="bgCabeceraFila">&nbsp;</td>
                          <td width="20%" align="center" class="bgCabeceraFila">Operador Conectado</td>
                          <td width="40%" align="center" class="bgCabeceraFila">Nombre</td>
                          <td align="center" class="bgCabeceraFila">Estado</td>
                        </tr>

                <% 	if (nummulti >= 1){
                       if (tam > 1)
                       {
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="1">
                <%	   }else{
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="0">
                <%	   }
                      String clase="";
                      for (int i=0; i<vmulti.size(); i++){
                        OperadorMultipleBean item = (OperadorMultipleBean) vmulti.elementAt(i);
                        String codigo = item.getCodigo();
                        String nombre = item.getNombre();
                        String estado = item.getEstado();
                        String strestado="";
                        if (item.estaActivado()) strestado = "Activado";
                        else strestado = "Desactivado";
                        if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";

                %>
                      <tr>
                        <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=codigo%>+<%=nombre%>+<%=estado%>" onClick="check=<%=i%>"></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=codigo%></font></td>
                        <td class="<%=clase%>"><font class="texto2"><%=nombre%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=strestado%></font></td>
                      </tr>
                <%	   }
                    }
                %>
                </FORM>
                </table>
                <!--
                    Calling Navegador.jsp
                -->




                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=nummulti%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>



                    </center></div></td>
                  </tr>
                </table>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td><a href="javascript:Carga(1)//'" onMouseOver="window.status='Alta Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a><td>

                <%
                    if (nummulti==0){
                %>
                  <td><A HREF="javascript:/*'*/void(alert('No hay ningun operador a modificar'))"
                   onMouseOver="window.status='Modificar Operador';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten2.jpg" border="0" width="107" height="28"></A></td>
                   <td><A HREF="javascript:/*'*/void(alert('No hay ningun operador para dar de baja'))"
                   onMouseOver="window.status='Baja Operador';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <%
                        }
                        else{
                %>
                <td><a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificar Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                <td><a href="javascript:Carga(3)//'" onMouseOver="window.status='Baja Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                </tr>
                <%
                        }
                %>
                </table>
                <P>
                <table border=0>
                </tr>
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



