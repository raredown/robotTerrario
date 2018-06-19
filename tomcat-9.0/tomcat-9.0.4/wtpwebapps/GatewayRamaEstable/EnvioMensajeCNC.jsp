<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--
function SelectOk(Campo,f){
    var seleccion,totalopt
         totalopt = Campo.length;
         for (i = 0;  i < totalopt; i++){
             if (Campo.options[i].selected)
               break
         }
         seleccion = Campo.options[i].text;
         if (seleccion == ""){

            Campo.focus();
            alert("No puede hacer una selección vacía en " + Campo.name );
            Campo.select();
            return false;
         }
         else{
            f.Descripcion.value = Campo.options[i].text;

            return true;
         }
}







function TodoOk(){
     f = document.theForm;
     if (!SelectOk(f.Causa,f))
     return;
     f.submit();

}







function TodoOkNueva(){
     f = document.formNuevo;



     IdProceso=document.formNuevo.IdProceso.value;




     if ( IdProceso != "" ) {
       if(IsDigit(IdProceso) == false) {
	   alert("Sólo estan permitidos números para el campo id de proceso");
	   return;

       }
       if(IdProceso.length < 20) {
	   alert("El campo id de proceso debe contener 20 caracteres");
	   return;

       }

       if ( IdProceso.substring(15,13)=='01')
          {
            if (!SelectOk(f.Causa,f))
            return;
            f.submit();
       }else {
             alert ("El proceso debe ser de tipo 01");
       }
     }else{
        alert ("El campo id de proceso debe contener caracteres");
        return;
     }





}

function IsDigit(cadena){
 var CadenaNumeros = "0123456789";
 var caracter;
 var contador=0;

 for(var i=0; i < cadena.length; i++) {
   caracter = cadena.substring(i, i+1);
   if(CadenaNumeros.indexOf(caracter) != -1)
     contador++;
 }

 if (contador == cadena.length)
   return true;
 else
   return false;


 }
//-->
</SCRIPT>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<!--****************************
	****************************     Part of calling Cabecera.jsp
	****************************-->
<%@ page import="java.util.Vector,
                 es.portanode.util.html.SelectOptionBean"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1=new String("Cancelaci&oacute;n mensaje de cambio de operador");

	System.err.println("EnvioMensajeCNC.JSP : -inicio-");

	String OperadorRemitente 	= (String) request.getParameter("OperadorConectado");
	String descripcionOperador = (String) request.getAttribute("DescripcionOperador");	
	String OperadorDestinatario	= new String("00000");
	String IdProceso 		= (String) request.getAttribute("IdProceso");	
	Vector descripciones 		= (Vector) request.getAttribute("SelectDescripciones");
    String origen = request.getParameter("origen");
     if(origen==null) origen = "MenuPrincipal";
     String filtroULL = request.getParameter("filtroULL");
    if(filtroULL==null) filtroULL = "";
    String inicioRango = request.getParameter("inicioRango");
    if(inicioRango==null) inicioRango = "";
    String finRango = request.getParameter("finRango");
    if(finRango==null) finRango = "";
    String paginaAnterior="PrevioConsultaCNC";
    String numero = request.getParameter("numeroA");
    if(numero==null) numero = "";
    String identificadorProceso = request.getParameter("idProceso");
    if(identificadorProceso==null) identificadorProceso = "";
    if(origen.equals("MenuFuncionesEspeciales.jsp")){
        paginaAnterior="MenuFuncionesEspeciales.jsp";
    }
    String tipoBusqueda = request.getParameter("tipoBusqueda");
    String posicion = request.getParameter("Posicion");
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia CNC</DIV>

                <FORM METHOD=POST ACTION="<%=paginaAnterior%>" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="origen" value="<%=origen%>">
                <INPUT TYPE="hidden" name="filtroULL" value="<%=filtroULL%>">
                <INPUT TYPE="hidden" name="numeroA" value="<%=numero%>">
                <INPUT TYPE="hidden" name="idProceso" value="<%=identificadorProceso%>">
                <INPUT TYPE="hidden" name="tipoBusqueda" value="<%=tipoBusqueda%>">
                <input type="hidden" name="primera" value="NO">
                <input type="hidden" name="Posicion" value="<%=posicion%>">
                </FORM>

                <% String proceso=IdProceso;

                  if (!proceso.equals("0"))
                   {
                 %>
                   <form action="EnviarMsgCNC" method="POST" name="theForm" >
                    <INPUT TYPE="hidden" name="origen" value="<%=origen%>">
                    <INPUT TYPE="hidden" name="filtroULL" value="<%=filtroULL%>">
                   <input type="hidden" name="Descripcion">

                    <div align="center"><center>
                    <table border="0" cellspacing="5">
                        <tr>
                            <td colspan="3">
                                <font class="texto2">Operador&nbsp;remitente: </font>
                                <font class="texto"><%=OperadorRemitente%>-<%=descripcionOperador%></font>
                                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                            </td>
                            <td colspan="3">
                                <font class="texto2">Operador destinatario: &nbsp;</font>
                                <font class="texto"><%=OperadorDestinatario%>-Entidad de Referencia</font>
                                <INPUT TYPE="hidden" name="Destinatario" value="<%=OperadorDestinatario%>">
                                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">

                                <font class="texto2">N&uacute;mero identificaci&oacute;n&nbsp;proceso:&nbsp;</font>
                                <font class="texto"><%=IdProceso%></font>
                                <INPUT TYPE="hidden" name="IdProceso" value="<%=IdProceso%>">&nbsp;&nbsp;
                                 </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <font class="texto2">Observaciones: </font>
                                <input type="text" class="inputText" class="inputText" size="65" maxlength="80" name="Observaciones">
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <font class="texto2">C&oacute;digo&nbsp;causa&nbsp;cancelaci&oacute;n:
                                <select class="inputText" name="Causa">
                    <%
                        int tam = descripciones.size();
                        for (int i=1 ; i<tam ; i++){
                            SelectOptionBean des= (SelectOptionBean) descripciones.elementAt(i);
                    %>
                            <option <%=des.seleccionado%> value="<%= des.valor%>" ><%=des.nombre%></option>			<%
                        }
                    %>
                        </SELECT>
                            </font>
                       </td>
                        </tr>
                    </table>
                    </center></div>
                <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                         <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                         <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                      </tr>
                    </table>
                    </center></div>
                </form>
                <%
                }else{
                 %>

                <form action="ValidarProcesoJSP" method="POST" name="formNuevo" >
                <input type="hidden" name="Descripcion">

                    <div align="center"><center>
                    <table border="0" cellspacing="5">
                        <tr>
                            <td colspan="3">
                                <font class="texto2">Operador&nbsp;remitente: </font>
                                <font class="texto"><%=OperadorRemitente%>-<%=descripcionOperador%></font>
                                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=OperadorRemitente%>">
                                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                            </td>
                            <td colspan="3">
                                <font class="texto2">Operador destinatario: &nbsp;</font>
                                <font class="texto"><%=OperadorDestinatario%>-Entidad de Referencia</font>
                                <INPUT TYPE="hidden" name="Destinatario" value="<%=OperadorDestinatario%>">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">

                                <font class="texto2">N&uacute;mero identificaci&oacute;n&nbsp;proceso:&nbsp;</font>
                                <input type="text" class="inputText" class="inputText" size="20" maxlength="20" name="IdProceso">
                                 </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <font class="texto2">Observaciones </font>
                                <input type="text" class="inputText" class="inputText" size="65" maxlength="80" name="Observaciones">
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">
                                <font class="texto2">C&oacute;digo&nbsp;causa&nbsp;cancelaci&oacute;n
                                <select class="inputText" name="Causa">
                    <%
                        int tam = descripciones.size();
                        for (int i=1 ; i<tam ; i++){
                            SelectOptionBean des= (SelectOptionBean) descripciones.elementAt(i);
                    %>
                            <option <%=des.seleccionado%> value="<%= des.valor%>" ><%=des.nombre%></option>			<%
                        }
                    %>
                        </SELECT>
                            </font>
                       </td>
                        </tr>
                    </table>
                    </center></div>
                <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                         <td><A HREF="javascript:TodoOkNueva()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                         <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>
                </form>

                 <%
                 }
                 %>
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
