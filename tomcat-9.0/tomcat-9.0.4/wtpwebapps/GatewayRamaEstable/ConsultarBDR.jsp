<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">


function ComparaFechas(Campo1,Campo2){

    var dia1,dia2
    var mes1,mes2
    var anno1,anno2
    var error = 0

    if (!FechaOk(Campo1,false)||!FechaOk(Campo2,false)){

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
    alert("Sólo escribir números en " + Campo.name);
    Campo.select();
    return (false);
  }
  if (((Campo.name == "NRN1")||(Campo.name == "NRN2"))&&(Campo.value.length != 6)){

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
      if (!NumberOk(Campo1,false))
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

      }
      if (err == 1){
         return false;
      }
      else
         return true;
}

function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
       if (Obligatorio) {

          window.scrollTo(0,0);
          Campo.focus();
          alert("Introduzca una cadena de caracteres en" + Campo.name);
          Campo.select();
          return (false);
       }
       else return true;
    }
  var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,. -";
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
     alert("No escribir números ni letras con acento en " +Campo.name);
     Campo.select();
     return false;
  }
  return true;
}

function TodoOk(texto){
    var err = 0;
       f = document.theForm;
       if (!FechaOk(f.Fecha,false))
          return;
       if (!RangoOk(f.Rango1,f.Rango2))
          return;
       if (!RangoOk(f.NRN1,f.NRN2))
          return;
       if (!ComparaFechas(f.FechaModificacionInicial,f.FechaModificacionFinal))
          return;
       alert("Se mostraran como maximo "+texto+" filas");
       f.submit();
}

function ValorCombo(Campo){
   var valor = 0;
     for (i=0; i<Campo.length; i++){
         if (Campo.options[i].selected){
            valor = Campo.options[i].value;
              break;
         }
     }
     return valor;
}

function ComboValor(Campo,elem){
     var valor = 0;
     valor = elem.value;
     for (i=0; i<Campo.length; i++){
         if (Campo.options[i].value == valor){
            Campo.options[i].selected= true;
              break;
         }
     }
}


function Inicio(){
      f = document.theForm;
      f1 = document.form1;

      f1.FechaIni.value = f.Fecha.value;
      f1.Rng1.value = f.Rango1.value;
      f1.Rng2.value = f.Rango2.value;
      f1.NRN1.value = f.NRN1.value;
      f1.NRN2.value = f.NRN2.value;
      f1.EstadoIni.value = ValorCombo(f.Estado);
      f1.DonteIni.value = ValorCombo(f.Donante);
      f1.RecpIni.value = ValorCombo(f.Receptor);
      f1.IniDonteIni.value = ValorCombo(f.Donanteini);
}

function Navegar(nPagina){
       f = document.theForm;
       f1 = document.form1;

       f.Fecha.value = f1.FechaIni.value;
       f.Rango1.value = f1.Rng1.value;
       f.Rango2.value = f1.Rng2.value;
       f.NRN1.value = f1.NRN1.value;
       f.NRN2.value = f1.NRN2.value;
       ComboValor(f.Estado,f1.EstadoIni);
       ComboValor(f.Donante,f1.DonteIni);
       ComboValor(f.Receptor,f1.RecpIni);
       ComboValor(f.Donanteini,f1.IniDonteIni);
       f.Posicion.value = nPagina;
       f.action="ConsultarBDR";
       f.submit();
}


</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0" onLoad="Inicio()">

<%@ page import="java.util.Vector,
                 es.portanode.util.operadores.OperadorBean,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.BDR.StatusNumeracionBean,
                 es.portanode.BDR.StatusNumeracionBeanCollection,
                 es.portanode.consultas.SentenciasAccesoBDR,
                 es.portanode.consultas.SentenciaAccesoBDR,
                 onsultarBDR.FechaInterna"%>
<%@ page import="java.io.*"%>
  <!-- Insercion de Cabecera -->
  <%
    System.out.println("Logo: ");
    String subtitulo1 = "Consulta Base de Datos de Referencia";
	//Varibles del navegador
	int Limite=10;
	String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------
	OperadorBeanCollection ops = (OperadorBeanCollection) request.getAttribute("SelectOperadores");
	Vector vops = ops.GetSelectOperadores();
	int numoperadores = ops.GetNumSelectOperadores();

	StatusNumeracionBeanCollection estados = (StatusNumeracionBeanCollection) request.getAttribute("SelectEstados");
	int numestados = estados.GetNumeroEstadosNumeracion();
	Vector vestados = estados.GetEstadosNumeracion(0,numestados);

	SentenciasAccesoBDR consulta = (SentenciasAccesoBDR) request.getAttribute("Consultas");
	int numconsultas = consulta.getNumeroConsultasBDR();
	Vector vconsul = null;
	if (numconsultas == 0){
           vconsul = new Vector();
	}
	vconsul = consulta.getConsultasBDR(inici,Limite);
	String estado = (String) request.getAttribute("Estado");
	String fecha = (String) request.getAttribute("Fecha");
	String donante = (String) request.getAttribute("Donante");
	String receptor = (String) request.getAttribute("Receptor");
	String donanteini = (String) request.getAttribute("Donanteini");
	String rango1 = (String) request.getAttribute("Rango1");
	String rango2 = (String) request.getAttribute("Rango2");
	String nrn1 = (String) request.getAttribute("NRN1");
	String nrn2 = (String) request.getAttribute("NRN2");
	String fechaModIni = (String) request.getAttribute("FechaIni");
        String fechaModFin = (String) request.getAttribute("FechaFin");
	String maxRows = (String) request.getAttribute("maxRows");
	System.out.println("maxRows: "+maxRows);
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta BDR</DIV>

                <div align="center"><center>
                <form name="form1" method="POST">
                <INPUT TYPE="hidden" name="EstadoIni">
                <INPUT TYPE="hidden" name="FechaIni">
                <INPUT TYPE="hidden" name="DonteIni">
                <INPUT TYPE="hidden" name="RecpIni">
                <INPUT TYPE="hidden" name="IniDonteIni">
                <INPUT TYPE="hidden" name="Rng1">
                <INPUT TYPE="hidden" name="Rng2">
                <INPUT TYPE="hidden" name="NRN1">
                <INPUT TYPE="hidden" name="NRN2">
                </form>

                 <table border="0" cellspacing="0" cellpadding="0" width="95%">
                   <FORM ACTION="ConsultarBDR" METHOD=POST NAME="theForm">
                   <INPUT TYPE="HIDDEN" NAME=Posicion VALUE="1">
                   <INPUT TYPE="hidden" NAME="Primera" VALUE="1">
                    <tr>
                       <td><table width="100%">
                       <tr>
                        <td><font class="texto2" size=2>Estado: </font><small></td>
                        <td><small><select class="inputText" name="Estado">
                <% 	if (estado.compareTo("*")==0){
                %>
                    <option selected value="*">TODOS
                <%	}
                    else{
                %>
                    <option value="*">TODOS
                <%	}
                    for( int i=0; i<numestados; i++){

                        StatusNumeracionBean est = (StatusNumeracionBean) vestados.elementAt(i);
                        String codigo = est.GetCodigo();
                        String descripcion = est.GetDescripcion();
                        if(codigo.equals(estado)){
                %>
                                   <option value="<%=codigo%>" selected><%=descripcion%>
                <%		}else{
                %>
                                   <option value="<%=codigo%>"><%=descripcion%>
                <%		}
                    }
                %>
                        </select></small></td>
                        <td align="right"><font class="texto2" size=2>Fecha ventana: </font></td>
                        <td><small><input type="text" class="inputText" class="inputText" size="11" maxlength="10" name="Fecha" value=<%=fecha%>></small>
                            <a href="javascript:calendario3.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                        </td>
                       </tr>
                       </table></td>
                    </tr>
                    <tr>
                       <td><table width="100%">
                       <tr>
                        <td><font class="texto2" size=2>Operador donante:</font></td>
                        <td colspan="2"><small><select class="inputText" name="Donante">
                <% 	if (donante.compareTo("*")==0){
                %>
                    <option selected value="*">TODOS
                <%	}
                    else{
                %>
                    <option value="*">TODOS
                <%	}
                    for( int i=0; i< numoperadores; i++){

                        OperadorBean op = (OperadorBean) vops.elementAt(i);
                        String codigo = op.getCodigo();
                        String descripcion = op.getDescripcion();
                        if(!codigo.equals("00000")){
                            if (codigo.equals(donante)){
                %>
                                      <option selected value="<%=codigo%>"><%=descripcion%>
                <%			}else{
                %>
                                      <option value="<%=codigo%>"><%=descripcion%>
                <%			}
                        }
                    }
                %>
                    </select></small></td>
                    </tr>
                    <tr>
                        <td><font class="texto2" size=2>Operador receptor:</font></td>
                        <td colspan="2"><small><select class="inputText" name="Receptor">
                <% 	if (receptor.compareTo("*")==0){
                %>	<option selected value="*">TODOS
                <%	}
                    else{
                %> 	<option value="*">TODOS
                <%	}
                    for( int i=0; i< numoperadores; i++){
                        OperadorBean op = (OperadorBean) vops.elementAt(i);
                        String codigo = op.getCodigo();
                        String descripcion = op.getDescripcion();
                        if(!codigo.equals("00000")){
                            if (codigo.equals(receptor)){
                %>     <option selected value="<%=codigo%>"><%=descripcion%>
                <%			}else{
                %>     <option value="<%=codigo%>"><%=descripcion%>
                <%			}
                        }
                    }
                %>
                    </select></small></td>
                    </tr>
                    <tr>
                      <td><font class="texto2" size=2>Operador donante inicial: </font></td>
                        <td colspan="2"><small><select class="inputText" name="Donanteini">
                <% 	if (donanteini.compareTo("*")==0){
                %>	<option selected value="*">TODOS
                <%	}
                    else{
                %>	<option value="*">TODOS
                <%	}
                    for( int i=0; i< numoperadores; i++){
                        OperadorBean op = (OperadorBean) vops.elementAt(i);
                        String codigo = op.getCodigo();
                        String descripcion = op.getDescripcion();
                        if(!codigo.equals("00000")){
                            if (codigo.equals(donanteini)){
                %>      <option selected value="<%=codigo%>"><%=descripcion%>
                <%			}else{
                %>      <option value="<%=codigo%>"><%=descripcion%>
                <%			}
                        }
                    }
                %>   </select></small></td>
                   </tr>
                   </table></td>
                </tr>
                <tr>
                  <td><table width="100%">
                     <tr>
                       <td><font class="texto2" size=2>Rango números inicial: </font></td>
                       <td><small><input type="text" class="inputText" class="inputText" size="16" maxlength="15" name="Rango1" value=<%=rango1%>></small></td>
                       <td></td>
                       <td width="20%"><font class="texto2" size=2>Rango números final: </font></td>
                       <td><small><input type="text" class="inputText" class="inputText" size="16"  maxlength="15" name="Rango2" value=<%=rango2%>></small></td>
                       </tr>
                       <tr>
                        <td><font class="texto2" size=2>Rango NRN inicial: </font></td>
                        <td><small><input type="text" class="inputText" class="inputText" size="7"  maxlength="6" name="NRN1" value=<%=nrn1%>></small></td>
                        <td></td>
                        <td><font class="texto2" size=2>Rango NRN final: </font></td>
                        <td><small><input type="text" class="inputText" class="inputText" size="7" maxlength="6" name="NRN2" value=<%=nrn2%>></small></td>
                       </tr>
                        <tr>
                         <td><small><font class="texto2" size=2>Fecha Modificacion: </font></small></td>
                         <td><small><font class="texto2" size=2>Desde </font><% if (("".equals(fechaModIni))||(fechaModFin.equals("*"))){ %><input type="text" class="inputText" class="inputText" NAME="FechaModificacionInicial" size="11" maxlength="10"><% }else{ %><input type="text" class="inputText" class="inputText" NAME="FechaModificacionInicial" size="11" maxlength="10" value="<%=fechaModIni%>"><% }  %></small>
                             <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                         </td>
                         <td><small><font class="texto2" size=2>Hasta </font><% if (("".equals(fechaModFin))||(fechaModFin.equals("*"))){ %><input type="text" class="inputText" class="inputText" NAME="FechaModificacionFinal" size="11" maxlength="10"><% }else{ %><input type="text" class="inputText" class="inputText" NAME="FechaModificacionFinal" size="11" maxlength="10" value="<%=fechaModFin%>"><% } %></small>
                             <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                         </td>
                       </tr>
                      </tr>
                      </td></table>
                </FORM>
                </table>
                </center></div>
                <%/*
                if (numconsultas > 0) {
                */%>
                <h5>Resultado consulta</h5>
                <div align="center"><center>
                <table border="0" width="100%">
                    <tr>
                     <td width="100%"><div align="center"><center>
                      <table  border="1" class="tablas">
                      <tr>
                        <td class="bgCabeceraFila" align="center" >Núm abonado</td>
                        <td class="bgCabeceraFila" align="center" >Ult. op. donante</td>
                        <td class="bgCabeceraFila" align="center" >Op. receptor</td>
                        <td class="bgCabeceraFila" align="center" >Op. donante inicial</td>
                        <td class="bgCabeceraFila" align="center" >NRN act.</td>
                        <td class="bgCabeceraFila" align="center" >NRN ant.</td>
                      <tr>
                      <tr>
                        <td class="bgCabeceraFila" colspan=6>
                        <table border=1 width="100%">
                        <tr>
                        <td class="bgCabeceraFila" width="4%"></td>
                        <td class="bgCabeceraFila" align="center"  width="20%">Info tarifaria</td>
                        <td class="bgCabeceraFila" align="center"  width="8%">Último proceso</td>
                        <td class="bgCabeceraFila" align="center"  width="20%">Fecha últ. proceso</td>
                        <td class="bgCabeceraFila" align="center"  width="10%">Fecha ini. ventana</td>
                        <td class="bgCabeceraFila" align="center"  width="10%">Hora ini. ventana</td>
                        <td class="bgCabeceraFila" align="center"  width="15%">Duración ventana</td>
                        <td class="bgCabeceraFila" align="center"  width="8%">Estado del número</td>
                        </tr>
                        </table></td>
                     </tr>
                <%
                //}  
                    String clase = "";
                    for (int i=0; i<vconsul.size(); i++){
                        SentenciaAccesoBDR consul = (SentenciaAccesoBDR) vconsul.elementAt(i);
                        String nrnActual = consul.getNrnActual();
                        if (nrnActual == null) nrnActual = "&nbsp;";
                        String nrnAnterior = consul.getNrnAnterior();
                        if (nrnAnterior == null) nrnAnterior = "&nbsp;";
                        String infoTar = consul.getInfoTarifaria();
                        if (infoTar == null) infoTar = "&nbsp;";
                        String ultProceso = consul.getUltimoProceso();
                        if (ultProceso == null) ultProceso = "&nbsp;";
                        String iniVentana = consul.getFechaInicioVentana();
                        if (iniVentana == null) iniVentana = "&nbsp;";
                        String horaVentana = consul.getHoraInicioVentana();
                        if (horaVentana == null) horaVentana = "&nbsp;";
                        else{
                            String aux= horaVentana.substring(0,2);
                            String aux2 = horaVentana.substring(2,4);
                            horaVentana = aux + ":" + aux2;
                        }
                        String duracionVentana = consul.getDuracionVentana();
                        if (duracionVentana == null) duracionVentana = "&nbsp;";
                        if((i%2)==0)
                          clase="";
                        else
                          clase="bgFila";
                %>
                  <tr>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=consul.getNumeroAbonado()%></font></td>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=consul.getDescripcionUltimoDonante()%></font></td>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=consul.getDescripcionReceptor()%></font></td>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=consul.getDescripcionDonanteInicial()%></font></td>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=nrnActual%></font></td>
                    <td align="center" class="<%=clase%>"><font class="texto" size=2><%=nrnAnterior%></font></td>
                  </tr>
                  <tr>
                    <td colspan=6>
                    <table border=1 width="100%">
                    <tr>
                      <td width="4%" class="<%=clase%>"></td>
                      <td align="center" width="20%" class="<%=clase%>"><font class="texto" size=2><%=infoTar%></font></td>
                      <td align="center" width="8%" class="<%=clase%>"><font class="texto" size=2><%=ultProceso%></font></td>
                      <td align="center" width="20%" class="<%=clase%>"><font class="texto" size=2><%=FechaInterna.ConvertToFechaExterna(consul.getFechaUltimoProceso())%></font></td>
                      <td align="center" width="10%" class="<%=clase%>"><font class="texto" size=2><%=FechaInterna.ConvertToFechaExterna(iniVentana)%></font></td>
                      <td align="center" width="10%" class="<%=clase%>"><font class="texto" size=2><%=horaVentana%></font></td>
                      <td align="center" width="15%" class="<%=clase%>"><font class="texto" size=2><%=duracionVentana%></font></td>
                      <td align="center" width="8%" class="<%=clase%>"><font class="texto" size=2><%=consul.getEstadoNumero()%></font></td>
                    </tr>
                    </table></td>
                <%
                    }
                %>
                </table>
                </center></div></td>
                </tr>
                </table>
                <!--
                    Calling Navegador.jsp
                -->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numconsultas%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>

                </center></div>
                 <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">
                &nbsp;
             </td>
          </TR>
        </TBODY>
    </TABLE>
       <%--Nueva imagen--%>
       <script language="JavaScript">
       setPath('<%= request.getContextPath() %>');
       var calendario1 = new calendar1(document.theForm.FechaModificacionInicial);
       var calendario2 = new calendar1(document.theForm.FechaModificacionFinal);
       var calendario3 = new calendar1(document.theForm.Fecha);
     </script>
                </body>
                <body>
                <div align="center"><center>
                <table border="0" width="100%" cellpadding='0' cellspacing='0'>
                    <tr>
                        <td width="10" class="Fondoverdederecha">
                           &nbsp;
                        </td>
                        <TD vAlign=top width="180" class="celdalineaderecha">
                           &nbsp;
                        </TD>
                        <td align="center"><br>
                           <A HREF="javascript:TodoOk(<%=maxRows%>)//'" onMouseOver="window.status='Ejecutar consulta';return true" onMouseOut="window.status=' '"><img src="images/Consul5.jpg" border="0" width="107" height="28"></A></td>
                        <td width="10" class="Fondoverdederecha">
                          &nbsp;
                        </td>

                    </tr>
                </table>
                </center></div>
                </body>
    <jsp:include page="pie.jsp" flush="true"/>
    <%--Nueva imagen--%>
</html>
