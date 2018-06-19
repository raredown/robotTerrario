<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
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
  if ((Campo.name == "NRN")&&(Campo.value.length != 6)){

     Campo.focus();
     alert("El campo " + Campo.name+ " ha tener seis cifras");
     Campo.select();
     return false;
  }
  return true;
}


function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
      if (!NumberOk(Campo1,true))
         return false;
      if (!NumberOk(Campo2,false))
         return false;
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
      if (err == 1){
         return false;
      }
      else
         return true;
}
function TodoOk(){
    f = document.theForm;
    if (!RangoOk(f.Rango1,f.Rango2))
       return;
     if((f.Fecha.value=="") || (f.HorCambio.value=="") || (f.MinCambio.value=="") || (f.SegCambio.value=="") ){
       alert("Debe rellenar todos los campos correspondientes a la fecha y hora de ventana de cambio.");
       return;
    }else{
         if (!FechaOk(f.Fecha,false))
             return;
         if (!CompruebaHora(f.HorCambio,f.MinCambio,f.SegCambio))
           {return ;}
         else
           {f.Hora.value = f.HorCambio.value + ":" + f.MinCambio.value + ":" + f.SegCambio.value;}
    }
    f.submit();
}
//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.BDR.NRNBean"%>
<%@ page import="java.io.*"%>
  <%
    String subtitulo1=new String("Creaci&oacute;n mensaje de modificaci&oacute;n de NRN");
  	 String remitente = (String) request.getParameter("OperadorConectado");
	 String DescripcionRemitente = (String) request.getAttribute("DescripcionRemitente");
	 OperadorBeanCollection ops = (OperadorBeanCollection) request.getAttribute("SelectOperadores");
     String tmp_nrn = (String)request.getAttribute("NRN")==null?"":(String)request.getAttribute("NRN");
     String numIniRango = (String)request.getAttribute("NumeroInicial")==null?"":(String)request.getAttribute("NumeroInicial");
     String numFinRango = (String)request.getAttribute("NumeroFinal")==null?"":(String)request.getAttribute("NumeroFinal");
     String observaciones = (String) request.getAttribute("Observaciones")==null?"":(String) request.getAttribute("Observaciones");
	 Vector vops = ops.GetSelectOperadores();
	 int numoperadores = ops.GetNumSelectOperadores();
	 NRNBeanCollecion nrns = new NRNBeanCollecion(null,remitente, remitente);
     int numNrns = nrns.getNumeroNRNs();
     Vector vnrn = nrns.getNRNs(0,numNrns);

     String h="";
     String m="";
     String s="";
     String hora  = (String) request.getParameter("Hora") ==null?"":request.getParameter("Hora");
     String fecha = (String) request.getAttribute("Fecha")==null?"":request.getParameter("Fecha");
     if(!hora.equals("") && hora.length()>=6 ){
      h= hora.substring(0,2);
      m= hora.substring(2,4);
      s= hora.substring(4,6);
      h=h.trim();
      m=m.trim();
      s=s.trim();
     }

     if(!fecha.equals("") && fecha.length()>=8 ){
       fecha = fecha.substring(6,8) + "/" +  fecha.substring(4,6) + "/" + fecha.substring(0,4);
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Envia MN</DIV>

                <FORM METHOD=POST ACTION="MenuRolReceptor.jsp" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <form action="EnviarMsgMn" method=POST name="theForm">
                <table width="95%" border="0" cellspacing="5">
                   <TR>
                      <TD><font class="texto2"> Remitente: </font></TD>
                      <TD colspan="4">
                          <font class="texto"><%=remitente%>: <%=DescripcionRemitente%></font>
                              <input type="hidden" name="OperadorConectado" value="<%=remitente%>"></input>
                              <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">

                      </TD>
                   </TR>

                   <TR>
                      <TD><font class="texto2">Destinatario: </font></TD>
                      <TD colspan="4">
                          <font class="texto">00000: Entidad de Referencia </font>
                              <input type="hidden" name="Destinatario" value="00000"></input>
                      </TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">Observaciones: </font></TD>
                      <TD colspan="3"><input type="text" class="inputText" class="inputText" size="70" maxlength="80" name="T2" value="<%=observaciones%>"></TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">N&uacute;mero inicial del rango: </font></TD>
                      <TD colspan="1"><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango1" value="<%=numIniRango%>"></TD>
                      <TD><font class="texto2">N&uacute;mero final del rango: </font></TD>
                      <TD colspan="1"><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Rango2" value="<%=numFinRango%>"></TD>
                    </tr>
                    <tr>
                      <TD><font class="texto2">Fecha inicio ventana: </font></TD>
                      <TD><input type="text" class="inputText" class="inputText" size="10" maxlength="10" name="Fecha" value=<%=fecha%> >
                          <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                      </TD>

                       <td class="texto2" colspan="1"><br>Hora inicio ventana :  </td>
                       <td class="texto2" colspan="1">
                        <input type="text" class="inputText" size="2" maxlength="2"  name="HorCambio" onFocus="this.form.HorCambio.select()" value=<%=h%>> :
                        <input type="text" class="inputText" size="2" maxlength="2"  name="MinCambio" onFocus="this.form.MinCambio.select()" value=<%=m%>> :
                        <input type="text" class="inputText" size="2" maxlength="2"  name="SegCambio" onFocus="this.form.SegCambio.select()" value=<%=s%>>
                        <input type="hidden" name="Hora" value=<%=hora%> >
                        </td>

                    </tr>
                    <tr>
                      <td><font class="texto2">NRN: </font></TD><TD>
                      <select class="inputText" name="NRN">
                        <%
                        for (int i=0; i<numNrns; i++)
                        {
                          NRNBean nrn= (NRNBean) vnrn.elementAt(i);
                          String strNrn = nrn.getNrn();
                          if(tmp_nrn.equals(strNrn)){
                        %>
                            <option value="<%=strNrn%>" selected><%=strNrn%> </option>
                        <% }else{%>
                            <option value="<%=strNrn%>"><%=strNrn%> </option>
                           <% }
                        }
                        %>

                      </select></td>
                      <TD></TD>
                    </tr>
                </table>
                <BR>
                <div align="center"><center><table border="0">
                        <tr>
                            <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><IMG src="images/Respue6.jpg" width="107" height="28" border="0"></A></td>

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
       var calendario1 = new calendar1(document.theForm.Fecha);
</script>
</body>
</html>
