<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var check = 99;
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
	         f1.elements[i+1].value = arrayStr[i];}
    }
    else{
	     for (i=0; i < arrayStr.length; i++){
        	 f1.elements[i].value = arrayStr[i];}
    }
}
function Carga(num){
      f1 = document.theForm;
      f2 = document.form1;
      f1.Servlet.value = num;
      if (num == 1){
         f1.submit();
         return;
      }
      else{
         if (check == "99"){
            alert("Ha de escoger una fila");
            return;
         }
         else{
            asignar(check);
            f1.submit();
         }
      }
}

function Navegar(nPagina){
       f = document.theForm;
       f.Posicion.value = nPagina;
       f.action="PrevioMantenimientoContacto";
       f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.PersonaContactoBeanCollection,
                 es.portanode.util.PersonaContactoBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Mantenimiento de persona de contacto");

//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	String operadorActual = (String) request.getAttribute("operadorConectado");
	String descOperador = (String) request.getAttribute("DescripcionOperador");
    PersonaContactoBeanCollection colcontactos=(PersonaContactoBeanCollection)request.getAttribute("personascontacto");
	Vector vcontactos = colcontactos.getColeccionPersonaContacto();
	int numfilas = colcontactos.getNumColeccionPersonaContacto();

%>
<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 194;
var tabla="<table width='100%' height='50%' border='0' cellpadding='0' cellspacing='0'>";
document.write(tabla);
      </script>
    <table width='100%' height='90%' border='0' cellpadding='0' cellspacing='0'>
        <TR>
          <td width="10" class="Fondoverdederecha">
             &nbsp;
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Personas de contacto</DIV>

            <div align="center"><center>
            <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
            <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
            <INPUT TYPE="hidden" name="Posicion" value="1">
            </FORM>

            <FORM ACTION="MantenimientoPersonaContacto" METHOD="POST" NAME="theForm">
                  <INPUT TYPE="hidden" name="IdContacto">
                  <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operadorActual%>">
                  <INPUT TYPE="hidden" name="Tipomensaje">
                  <INPUT TYPE="hidden" name="Servlet">
                  <INPUT TYPE="hidden" name="Posicion" value="1">
            </FORM>
            <table border="0" width="100%">
              <tr>
                <td align="center"><div align="center"><center>
                  <table  border="1" class="tablas" >
                 <FORM METHOD=POST NAME="form1">
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
                    <td align="center" class="bgCabeceraFila">Mensaje</td>
                    <td align="center" class="bgCabeceraFila">Persona de Contacto</td>
                    <td align="center" class="bgCabeceraFila">Telefono</td>
                    <td align="center" class="bgCabeceraFila">Fax</td>
                    <td align="center" class="bgCabeceraFila">e-mail</td>
                  </tr>
            <% int fin;
               if (numfilas < inici+Limite){
                   fin = numfilas;
               }
               else{
                  fin = inici+Limite;
               }
               System.err.print(fin);
               String clase="";
                for (int i=inici; i<fin; i++){
                    int index = i-inici;
                    PersonaContactoBean contacto = (PersonaContactoBean) vcontactos.elementAt(i);
                    String idContacto = contacto.getIdContacto();
                    System.err.print(idContacto);
                    String codigoOperador = contacto.getOperador();
                    String tipoMensaje = contacto.getTipoMensaje();
                    String mostratipoMensaje = "";
                    if (tipoMensaje.equals("DFCTO"))
                        mostratipoMensaje = "Defecto";
                    else
                        mostratipoMensaje = tipoMensaje;
                    System.err.print(tipoMensaje);
                    String personaContacto = contacto.getContacto();
                    String Telefono = contacto.getTfnoContacto();
                    String Fax = contacto.getFaxContacto ();
                    String emailContacto = contacto.getEmailContacto();
                    if((i%2)==0)
                        clase="";
                    else
                        clase="bgFila";
            %>
                  <tr>
                    <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=idContacto%>+<%=codigoOperador%>+<%=tipoMensaje%>" onClick="check=<%=index%>"></td>
                    <td align="center" class="<%=clase%>"><font class="texto2"><%=descOperador%></font></td>
                    <td class="<%=clase%>"><font class="texto2"><%=mostratipoMensaje%></font></td>
                    <td class="<%=clase%>"><font class="texto2"><%=personaContacto%></font></td>
                    <td class="<%=clase%>"><font class="texto2"><%=Telefono%></font></td>
                    <td class="<%=clase%>"><font class="texto2"><%=Fax%></font></td>
                    <td class="<%=clase%>"><font class="texto2"><%=emailContacto%></font></td>
                  </tr>
            <%
                 }
            %>
                  </FORM>
                </table>
                </center></div></td>
              </tr>
            </table>
            </center></div>
            <div align="center"><center>
            <!--
                Calling Navegador.jsp
            -->
            <jsp:include page="/NavegadorJSP" flush="true">
                <jsp:param name="Limit" value="<%=Limite%>" />
                <jsp:param name="Total" value="<%=numfilas%>" />
                <jsp:param name="ActualLink" value="<%=posActual%>" />
                <jsp:param name="DirectURL" value="javascript:Navegar(" />
            </jsp:include>
            </center></div>

             <div align="center" valign="top">
             <table border="0" cellpadding='0' cellspacing='0' width="100%" height="20%">
               <tr valign="bottom">
<%
                   if (numfilas==0){
%>

             <td height="20%" align="center"><a href="javascript:Carga(1)//'" onMouseOver="window.status='Alta Carga';return true;" onMouseOver="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
             <a href="javascript:/*'*/alert('No hay personas de contacto a modificar')" onMouseOver="window.status='Modificación Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
             <a href="javascript:/*'*/alert('No hay personas de contacto a modificar')" onMouseOver="window.status='Baja Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
<%
                     }
                     else{
%>
                 <td align="center"><a href="javascript:Carga(1)//'" onMouseOver="window.status='Alta Carga';return true;" onMouseOver="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
                <a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificación Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a>&nbsp;&nbsp;
                <a href="javascript:Carga(3)//'" onMouseOver="window.status='Baja Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>

<%
                   }
%>
             </tr>
             <tr valign="top">
               <td align="center"><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
             </tr>
             </table>
             </div>

            <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>


          </TR>
    </TABLE>
</body>
<jsp:include page="pie.jsp" flush="true"/>
</html>



