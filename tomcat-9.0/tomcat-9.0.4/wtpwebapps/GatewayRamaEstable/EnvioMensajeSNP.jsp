<%@ page import="es.portanode.util.Singleton"%>
<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var tipoAdquisicion = 99;

function ComparaFechas(Campo1,Campo2){

    var dia1,dia2
    var mes1,mes2
    var anno1,anno2
    var error = 0

    if (!FechaOk(Campo1,true)||!FechaOk(Campo2,true)){

       return false;
    }
    else{
       dia1 = Campo1.value.substr(0,2);
       dia2 = Campo2.value.substr(0,2);
       mes1 = Campo1.value.substr(3,2);
       mes2 = Campo2.value.substr(3,2);
       anno1 = Campo1.value.substr(6,4);
       anno2 = Campo2.value.substr(6,4);
       if (anno1 > anno2) error = 1;
       if (anno1 < anno2) error = 0;
       if (anno1 == anno2){
          if (mes1 > mes2) error = 1;
          if (mes1 < mes2) error = 0;
          if (mes1 == mes2){
             if (dia1 > dia2) error = 1;
             if (dia1 < dia2) error = 0;
          }
       }
    }
    if (error == 1){

       Campo1.focus();
       alert("El rango de fechas es incorrecta. La fecha de inicio ha de ser anterior a la final");
       Campo1.select();
       return false;
    }
    else
       return true;
}

function ValorRadio(){
	   var encontrado = false;
	     f= document.theForm;
	     for (i=0; i < f.radio.length; i++){
	         if (f.radio[i].checked){
	             tipo = f.radio[i].value;
	             encontrado = true;
	              break;
	         }
	     }
	     if (!encontrado){
	        alert("Ha de escoger un tipo de adquisición (Total, por fechas o por números)");
	        return 11;
	     }
	     return tipo;
	}

function TodoOk(){
    f = document.theForm;
    tipo = ValorRadio();
    if (tipo == 0){
       var incorrecto = (f.Rango1.value != "" || f.Rango2.value != "");
       incorrecto = (incorrecto ||(f.FechaInicial.value != "" ||f.FechaFinal.value!= ""));
       if (incorrecto){
               alert(" Los campos de texto de fechas y números deben estar en blanco")  ;
               f.Rango1.value = "";
               f.Rango2.value = "";
               f.FechaInicial.value = "";
               f.FechaFinal.value = "";
               return;
        }
        f.submit();
    }
    if (tipo == 1){
	 if (!ComparaFechas(f.FechaInicial,f.FechaFinal))
          return;
       if (f.Rango1.value != "" || f.Rango2.value != ""){
          alert("Los campos de números deben estar en blanco");
          f.Rango1.value = "";
          f.Rango2.value = "";
          return;
       }
       f.submit();
    }
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBeanCollection"%>
<%@ page import="java.io.*"%>
  <%

  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("SNP");
	
    String subtitulo1=new String("Adquisici&oacute;n de conocimiento de numeraci&oacute;n portada");

	   String remitente = (String) request.getParameter("OperadorConectado");
	   String DescripcionRemitente = (String) request.getAttribute("DescripcionRemitente");
	   OperadorBeanCollection ops = (OperadorBeanCollection) request.getAttribute("SelectOperadores");
	   Vector vops = ops.GetSelectOperadores();
	   int numoperadores = ops.GetNumSelectOperadores();
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia <%=tipoMDescripcion %></DIV>

                <FORM METHOD=POST ACTION="MenuOtrosMensajes.jsp" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">

                </FORM>
                <form action="EnviarMsgSNP" method=POST name="theForm">
                <INPUT TYPE="hidden" name="Rango1" value="">
                <INPUT TYPE="hidden" name="Rango2" value="">
                    <div align="center"><center><table border="0" cellspacing="5">
                        <tr>
                            <td><font class="texto2">Operador&nbsp;remitente: </font></td>
                            <td>
                                  <font class="texto"><%=remitente%>-<%=DescripcionRemitente%></font>
                                  <input type="hidden" name="OperadorConectado" value="<%=remitente%>">
                                  <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"></input>
                        </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Operador destinatario: &nbsp;</font></td>
                            <td><font class="texto">00000-Entidad de Referencia </font></td>
                            <input type="hidden" name="Destinatario" value="00000"></input>
                        </tr>
                        <tr>
                            <td><font class="texto2">Observaciones: </font></td>
                         <td colspan="3"><input type="text" class="inputText" class="inputText" size="50" maxlength="80" name="Observaciones"></td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Tipo de adquisici&oacute;n:&nbsp;</font></td>
                         <td><INPUT type="radio" checked name="radio" value="0"><font class="texto2">Total</font></td>
                            <td></td>
                         <td>
                      </td>
                        </tr>
                                                <tr>
                            <td></td>
                         <td><INPUT type="radio" name="radio" value="1"><font class="texto2"> Por fechas</font></td>
                            <td><font class="texto2"> Fecha inicial:</font></td>
                         <td><input type="text" class="inputText" class="inputText" ReadOnly size="10" maxlength="10" name="FechaInicial">
                             <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                         </td>
                        </tr>
                        <tr>
                            <td></td>
                         <td></td>
                            <td><font class="texto2"> Fecha final:</font></td>
                         <td><input type="text" class="inputText" class="inputText" ReadOnly size="10" maxlength="10" name="FechaFinal">
                             <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                         </td>
                        </tr>
                        <tr>
                        </table>
                <BR>
                    </center></div><div align="center"><center><table border="0">
                        <tr>
                            <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" border="0" width="107" height="28" border="0"></A></td>

                            <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"></A></td>
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
<script language="JavaScript">
       setPath('<%= request.getContextPath() %>');
       var calendario1 = new calendar1(document.theForm.FechaInicial);
       var calendario2 = new calendar1(document.theForm.FechaFinal);
</script>
</body>
</html>
