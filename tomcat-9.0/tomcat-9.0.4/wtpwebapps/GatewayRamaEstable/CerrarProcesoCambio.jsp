<HTML>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<SCRIPT LANGUAGE="JavaScript">
<!--

function TodoOk(){

     f = document.theForm;
     IdProceso=document.theForm.IdProceso.value;



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
             f.submit();
       else
             alert ("El proceso debe ser de tipo 01");

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
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" >


<%@ page import="java.util.Vector"%>
<%@ page import="java.io.*"%>

  <%
    System.out.println("Estoy en la insercion de la cabecera");
    String subtitulo1 = new String(" Cerrar Proceso Cambio");
    String operador = (String) request.getParameter("OperadorConectado");
	
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Id. Proceso&nbsp;</DIV>

               <FORM ACTION="MenuFuncionesEspeciales.jsp" method="POST"  name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                </FORM>

                <form action="MostrarProcesoACerrarJSP" method="POST" name="theForm">
                <input type="hidden" name="Descripcion">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                    <div align="center"><center>
                        <table border="0" cellspacing="5" width="95%">
                        <tr>
                            <td width="150" align="center">
                                <font class="texto2">Id del proceso a cerrar:&nbsp;</font>
                            </td>
                            <td class="text">
                                <input type="text" class="inputText" class="inputText" size="20" maxlength="20" name="IdProceso" value="">
                            </td>
                        </tr>

                    </table>
                    </center></div>
                    <INPUT TYPE="hidden" name="Observaciones" value="Proceso Cerrado Por el Administrador">

                <P>
                    <div align="center"><center>
                    <table border="0">
                      <tr>
                         <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Aceptar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>
                         <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>

                        </tr>
                    </table>
                    </center></div>

                </form>
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
