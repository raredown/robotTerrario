<%@ page import="es.portanode.util.Singleton"%>
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
    if (Obligatorio) {

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
  // All characters  of the input string are digits
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
  else
     return true;
}
function RangoOk(Campo1,Campo2){
	var err = 0;
	var num1,num2;
	if (!NumberOk(Campo1,true)){		// lo hago principal, si OK pasamos al siguiente
		err = 1;
	}else{
		if (!NumberOk(Campo2,false)){	// lo mismo, si vale hago lo siguiente.
			err = 1;
		}else{							//como los dos valen, continuo....
			if ((Campo1.value == "")&&(Campo2.value != "")){
				Campo1.focus();
				alert("No es posible que "+Campo1.name+" esté en blanco cuando "+Campo2.name+" tiene valor");
				Campo1.select();
				err = 1;
			}
			if ((Campo1.value != "")&&(Campo2.value == "")){
				err = 0;
				num1 = parseInt(Campo1.value,10);
				Campo2.value = Campo1.value;
			}
			if ((Campo1.value != "")&&(Campo2.value != "")){
				num1 = parseInt(Campo1.value,10);
				num2 = parseInt(Campo2.value,10);
				if (num1 > num2){
					Campo1.focus();
					alert("El rango es incorrecto");
					Campo1.select();
					err = 1;
				}
				else err = 0;
			}
		}
	}
	if (err == 1){
	return false;
	}
	else return true;
}

function Combos(Campo,remitente){
     escogido = Campo.options.selectedIndex;
     if (remitente.value == Campo.options[escogido].value){
        alert("El remitente y el destinatario del mensaje no puede ser el mismo");
        return false;
     }
     return true;
}

function TodoOk(){
    f = document.theForm;
    if (!Combos(f.Destinatario,f.OperadorConectado))
       return;
    if (!RangoOk(f.Rango1,f.Rango2))
       return;
    f.submit();
}

//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.util.operadores.OperadorBean"%>
<%@ page import="java.io.*"%>
  <%
  	Singleton sing = Singleton.getInstance();
	String tipoMDescripcion = sing.getTipoMDescripcion("NB"); 
	
    String subtitulo1=new String("Creaci&oacute;n mensaje de baja de abonado con numeraci&oacute;n portada");
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

                <FORM METHOD=POST ACTION="MenuRolReceptor.jsp" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="EnviarMsgNb" method=POST name="theForm">


                    <div align="center"><center><table width="100%" border="0" cellspacing="5">
                        <tr>
                            <td colspan="1"><font class="texto2">Remitente </font></td>
                            <td>
                                  <font class="texto"><%=remitente%>-<%=DescripcionRemitente%></font>
                                  <input type="hidden" name="OperadorConectado" value="<%=remitente%>"></input>
                                  <input type="hidden" name="OperadorConexion" value="<%=imagen%>"></input>
                            </td>
                        </tr>
                        <tr>
                            <td><font class="texto2">Destinatario/Donante inicial </font>
                            <td colspan="3"><select class="inputText" name="Destinatario">

                            <% 	for (int i=0; i<numoperadores; i++){
                                     OperadorBean oper= (OperadorBean) vops.elementAt(i);
                                     String codigo = oper.getCodigo();
                                 String descripcion = oper.getDescripcion();

                                 if(!codigo.equals("00000")){
                        %>
                                        <option value="<%=codigo%>"><%=descripcion%>-<%=codigo%></option>
                            <%
                                    }
                                }
                            %>

                            </select></td>
                        </tr>

                        <tr>
                            <td colspan="1"><font class="texto2">Observaciones </font></td>
                            <td colspan="3"><input type="text" class="inputText" class="inputText" size="65" maxlength="80" name="Observaciones"></td>
                        </tr>
                        <tr>
                            <td ><font class="texto2">N&uacute;mero inicial del rango </font></td>
                            <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango1"></td>
                            <td ><font class="texto2">N&uacute;mero final del rango </font></td>
                            <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango2"></td>
                        </tr>
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
</body>
</html>
