<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function NumberOk(Campo,Obligatorio){
   if (Campo.value == '') {
    if (Obligatorio){

      Campo.focus();
      alert("Introduzca un valor "+Campo.name);
      Campo.select();
      return (false);
    }
    else return true;
  }
  var checkOK = "0123456789";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  // All characters of the input string are digits
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

    Campo.focus();
    alert("Sólo puede escribir números en " + Campo.name);
    Campo.select();
    return (false);
  }
  else{
     if (Campo.value.length != 2){

        Campo.focus();
        alert("El campo "+Campo.name+" ha de tener 2 dígitos");
        Campo.select();
        return (false);
     }
     else return true;
   }
}


function DescripcionOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          Campo.focus();
          alert("Introduzca una cadena de caracteres en " + Campo.name);
          Campo.select();
          return (false);
       }
       else return true;
    }

  var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,. -1234567890";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

     Campo.focus();
     alert("Sólo se pueden introducir caracteres alfanúmericos sin acento " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          Campo.focus();
          alert("Introduzca una cadena de caracteres en" + Campo.name);
          Campo.select();
          return (false);
       }
       else return true;
    }

  var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,. -1234567890";
  var checkStr = Campo.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++){
      if (ch == checkOK.charAt(j)){
        break;
      }
    }
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {

     Campo.focus();
     alert("No escribir números ni vocales con acento en " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function TodoOk(){
      f = document.theForm;
      if (!DescripcionOk(f.Descripcion,true)){
         return;
      }
      indiceLicencia = document.theForm.comboLicencia.options.selectedIndex;
      document.theForm.Licencia.value = document.theForm.comboLicencia.options[indiceLicencia].value;
      indiceComunidad = document.theForm.comboComunidad.options.selectedIndex;
      document.theForm.Comunidad.value = document.theForm.comboComunidad.options[indiceComunidad].value;
      f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="es.portanode.util.Padre"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
  <!-- Insercion de Cabecera -->
  <%
    String subtitulo1 = new String("Modificación operador ER");

	String operador = (String) request.getParameter("OperadorConectado");
	String Codigo = (String) request.getParameter("codigo");
	String Descripcion = (String) request.getParameter("descripcion");
	String Licencia = (String) request.getParameter("licencia");
	String Comunidad = (String) request.getParameter("comunidad");
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 211;
      var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos operador ER:</DIV>

                <div align="center"><center>
                <FORM METHOD=POST ACTION="ConsultaOperadoresERJSP" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>
                <form action="EfectuarModificacionOperadorERJSP" method="POST" name=theForm >
                <INPUT type="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT type="hidden" name="OperadorConexion" value="<%=operador%>">
                <INPUT type="hidden" name="Codigo" value="<%=Codigo%>">
                <INPUT type="hidden" name="Licencia" value="">
                <INPUT type="hidden" name="Comunidad" value="">
                <table border="0" cellspacing="15">
                        <tr>
                            <td><font class="texto2">C&oacute;digo Operador ER</font></td>
                         <td><font class="texto"><%=Codigo%></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Descripci&oacute;n</font></td>
                         <td><input type="text" class="inputText" class="inputText" maxlength="80" size="50" name="Descripcion" value="<%=Descripcion%>"></td>
                        </tr>
                        <tr>
                            <%
                                    String sql="";
                                    Connection con=null;
                                    Enumeration tipoLicencia = null;
                                    Enumeration codigoComunidad = null;
                                    String licencia = null;
                                    String comunidad = null;
                                    try{
                                        sql="select CODIGO from TIPO_LICENCIA order by CODIGO asc";
                                        con = Padre.getConnection();
                                        tipoLicencia = Padre.selectEnumerationString(con,sql);
                                        sql="select CODIGO from COMUNIDAD_AUTONOMA order by CODIGO asc";
                                        codigoComunidad = Padre.selectEnumerationString(con,sql);
                                    }catch(Exception ex){
                                        System.out.println("ModificacionesOperadorER.jsp::::::Error al obtener los tipos de licencia: " + ex);
                                    }finally{
                                        try{
                                            con.close();
                                        }catch(Exception exx){
                                            System.out.println("ModificacionesOperadorER.jsp::::::Error Cerrar Conexion en tipos de licencia: " + exx);
                                        }
                                    }
                            %>
                            <td><font class="texto2">Licencia</font></td>
                         <td>
                                <select class="inputText" size="1" name="comboLicencia" value="">
                                    <%while(tipoLicencia.hasMoreElements()){
                                        licencia = (String)tipoLicencia.nextElement();
                                        if (licencia.equals(Licencia)){
                                            %><option value="<%=licencia%>" selected><%=licencia%> </option><%
                                        }else{
                                            %><option value="<%=licencia%>"><%=licencia%> </option><%
                                        }
                                    }%>
                                </select>
                             </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Comunidad</font></td>
                         <td>
                                <select class="inputText" size="1" name="comboComunidad" value="">
                                    <%while(codigoComunidad.hasMoreElements()){
                                        comunidad = (String)codigoComunidad.nextElement();
                                        if (comunidad.equals(Comunidad)){
                                            %><option value="<%=comunidad%>" selected><%=comunidad%> </option><%
                                        }else{
                                            %><option value="<%=comunidad%>"><%=comunidad%> </option><%
                                        }
                                    }%>
                                </select>
                             </td>
                        </tr>
                        </table>
                        </center></div>
                </body>
                    </center></div>
                <BR>
                    <div align="center"><center><table border="0">
                    <body >
                    <tr>
                            <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Modificar operador';return true" onMouseOut=""><IMG src="images/Manten2.jpg" border="0" width="107" height="28" border="0"></A></td>
                            <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                        </tr>
                    </table>
                    </center></div>
                </form>
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
