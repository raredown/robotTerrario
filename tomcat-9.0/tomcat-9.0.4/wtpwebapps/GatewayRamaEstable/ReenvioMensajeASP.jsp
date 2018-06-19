<html>
<head>
<title>Operador</title>
<script language="JavaScript" src="js/util.js"></script>
<script language="JavaScript" src="js/calendar1.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<SCRIPT LANGUAGE="JavaScript">
<!--


//Se llama cuando se modifica el combo de Tipo de portabilidad
function compruebaNumeroRangos(){
  f = document.theForm;
  var retorno;
  if(f.TipoPortabilidad.value=='04'){
     if(f.num_rangos.value!="1"){
       alert('Con "Números Inteligentes" solo pude enviarse un rango' );
       f.num_rangos.value="2";
       retorno=1;
     }else retorno =0;
  }else retorno=0;
  return retorno;
}

//Deshabilita las casillas de introduccion de NRNs
function bloqueaRangos(){
    f = document.theForm;
    var opcion=f.TipoPortabilidad.value;
    if(opcion=="02" || opcion=="03"){
       var valor="";
       var lista = document.getElementById('cuerpoTablaRelacion').getElementsByTagName('select');
       valor=lista[0].value;
       for (i = 1;  i < lista.length;  i++){
            lista[i].value=valor;
            lista[i].disabled=true;
       }
  }
}

//Habilita las casillas de introduccion de NRNs
function desbloqueaRangos(){
   var valor="";
   var lista = document.getElementById('cuerpoTablaRelacion').getElementsByTagName('select');
   valor=lista[0].value;
   for (i = 0;  i < lista.length;  i++){
        lista[i].value=valor;
        lista[i].disabled=false;
   }
}


//Se llama cuando se modifica el combo de Tipo de portabilidad
function compruebaTipoPortabilidad(){
  f = document.theForm;
  var retorno;
  var lista = document.getElementById('cuerpoTablaRelacion').getElementsByTagName('select');

  if(f.TipoPortabilidad.value=='01'){
     if(f.NumCompleta.checked){
         alert('Con "Acceso individual" el flag  "Portar numeración asociada a número de cabecera" no puede ir activado');
         f.NumCompleta.checked=false;
         retorno=1;
     }else retorno=0;
     f.NumCompleta.disabled=true;
     desbloqueaRangos();
  }
  if(f.TipoPortabilidad.value=='02') {
        retorno=0;
        f.NumCompleta.disabled=false;
        bloqueaRangos();
  }
  if(f.TipoPortabilidad.value=='03'){
    retorno=0;
    f.NumCompleta.disabled=false;
    bloqueaRangos();
  }
  if(f.TipoPortabilidad.value=='04'){
     if(f.NumCompleta.checked){
         alert('Con "Números Inteligentes " el flag  "Portar numeración asociada a número de cabecera" no puede ir activado');
         f.NumCompleta.checked=false;
         retorno=1;
     }else retorno=0;
     f.NumCompleta.disabled=true;
     if(f.num_rangos.value!="1"){
       alert('Con "Números Inteligentes" solo pude enviarse un rango' );
       f.num_rangos.value="1";
       sumarFilas();
       retorno=1;
     }
  }

 return retorno;

}//fin de compruebaTipoPortabilidad



function EsNumberOk(Campo,Obligatorio){
        if (Campo.value == '') {
        if (Obligatorio) {

        Campo.focus();
        alert("Introduzca un valor "+Campo.name);
        Campo.select();
        return false;
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
        return false;
        }

        return true;
}

function EsRangoOk(Campo1,Campo2){
        var err = 0;
        var num1,num2;
        if (!EsNumberOk(Campo1,true))     return false;
        if (!EsNumberOk(Campo2,true))     return false;
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
        if (Campo1.value.length!=9){
            Campo1.focus();
            alert("Los números de teléfono deben tener 9 dígitos");
            Campo1.select();
            return false;
        }
        if (Campo2.value.length!=9){
            Campo2.focus();
            alert("Los números de teléfono deben tener 9 dígitos");
            Campo2.select();
            return false;
        }
        num1 = parseInt(Campo1.value,10);
        num2 = parseInt(Campo2.value,10);
        if (num1 != num2 ){
        if (num1 > num2){

        Campo1.focus();
        alert("El rango es incorrecto");
        Campo1.select();
        err = 1;
        }
        if ((num2 - num1 + 1) > 5000){  // Validacion introducida por Alberto Elias
        alert("El rango introducido es mayor de 5000");
        err = 1;

        }
        }
        else err = 0;
        }
        if (err == 1){
        return false;
        }
        else
        return true;
}


function ValidarRangos(f){

            // Rangos
            var rangos = document.getElementsByName("NumInicialRango");
            var rangosf = document.getElementsByName("NumFinalRango");
            for(var count=0; count<rangos.length;count++)
            {

                if ((rangos[count].value == "") || (rangosf[count].value == ""))
                {
                	alert("Los campos correspondientes a los rangos de numeración no pueden ir en blanco.");
                    return false;
                }
                if (!EsRangoOk(rangos[count],rangosf[count]))
                    return false;

            }
            return true;
}

function TodoOk(num){

     f = document.theForm;

     if (num == 1){

        if (!FechaOk(f.FechaInicial,true))
           return;
        if (!CompruebaHora(f.Hor,f.Min,f.Seg))
           {return ;}
        else
          {f.HoraInicial.value = f.Hor.value + ":" + f.Min.value + ":" + f.Seg.value;}

       	if (!ValidarRangos(f))
           	return;

        }
     if (num == 2){
        document.theForm.action='DenegarMsgSP';
     }
     f.HoraInicial.value="";
     if((f.FechaInicial.value=="") && (f.Hor.value=="") && (f.Min.value=="") && (f.Seg.value=="") ){
        f.HoraInicial.value="";
     }else{
           if (!FechaOk(f.FechaInicial,false))
              return;
           if (!CompruebaHora(f.Hor,f.Min,f.Seg))
               {return ;}
       else
          {f.HoraInicial.value = f.Hor.value + ":" + f.Min.value + ":" + f.Seg.value;}
     }
     f.submit();
}


//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<%@ page import="es.portanode.util.PersonaContactoBean,
                 es.portanode.mensajes.MensajeSP,
                 es.portanode.mensajes.MensajeSPNumeracion,
                 es.portanode.util.FechaInterna,
                 es.portanode.BDR.NRNBeanCollecion"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
try{
	System.out.println("1");
    String numFormulario = (String) request.getAttribute("numFormulario");
    String remitente = (String) request.getAttribute("Remitente");
    PersonaContactoBean pContacto = (PersonaContactoBean) request.getAttribute("PersonaContacto");
    MensajeSP mensaje = (MensajeSP)request.getAttribute("MensajeSP");
    String fechaInicial = (String) request.getAttribute("FechaInicial");
    String horaInicial = (String)request.getAttribute("HoraInicial");
    Vector vdescripciones = (Vector) request.getAttribute("SelectDescripciones");
	String idProceso = mensaje.getIdProceso();
	String mensajeNif = mensaje.getNIF();
	String mensajeNombre = mensaje.getNombre();
	String mensajeDireccion = mensaje.getDireccion();
	String mensajeLocalidad = mensaje.getLocalidad();
	String mensajeProvincia = mensaje.getProvincia();
	String mensajeFechaInterna = mensaje.getFechaCambio();
	String mensajeFecha = FechaInterna.ConvertToFechaExterna(mensajeFechaInterna);
	String hora1 = mensaje.getHoraCambio();
	/*Adecuacion 5*/
	String ActivarFecha = (String)request.getAttribute("ActivarFecha");
	boolean actFecha = false;
	if(ActivarFecha.equals("true")){
		actFecha = true;
	}else{
		actFecha = false;
	}
	System.out.println("2");
	/*Fin adecuacion 5*/
  
	String horaMensaje = "";
	String h="";
	String m="";
	String s="";
	if(hora1.length()>=6){
      h= hora1.substring(0,2);
      m= hora1.substring(2,4);
      s= hora1.substring(4,6);
      h=h.trim();
      m=m.trim();
      s=s.trim();
      horaMensaje = h +":"+ m+":"+s;
  	}
	System.out.println("3");
    /*NUEVA ESPECIFICACION */
  NRNBeanCollecion nrns = new NRNBeanCollecion(null,remitente, remitente);
  int numNrns = nrns.getNumeroNRNs();
  Vector vnrn = nrns.getNRNs(0,numNrns);
  /*****************/
  String mensajeTipoPortabilidad = mensaje.getTipoPortabilidad();
  String mensajeOpReceptor = mensaje.getOpReceptor();
  String idInterno = mensaje.getIdInterno();
  Vector rangos = mensaje.getRangosNumeracion();
  System.out.println("3.1");
  String personaNombre = pContacto.getContacto();
  String personaEmail = pContacto.getEmailContacto();
  String personaFax = pContacto.getFaxContacto();
  String personaTel = pContacto.getTfnoContacto();  
  System.out.println("3.2");
        System.out.println("4");      
  String flagNumCompleta = mensaje.getFlagNumCompleta();
  String flagUll = mensaje.getFlagULL();
  String idUll = mensaje.getIdSolicitudULL();
  String adUll = mensaje.getNumAdminULL();
  
  String filtro = request.getParameter("filtroULL");
  if(filtro==null) filtro = "TODOS";
  String subtitulo1 = new String("Aceptaci&oacute;n de una solicitud de cambio");
  System.out.println("5");
%>

<%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var tabla="<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0'>";
      document.write(tabla);
      </script>
        <TBODY>
        <TR>
          <td width="10" class="Fondoverdederecha">&nbsp;
             
          </td>
          <TD vAlign=top width="180" class="celdalineaderecha">
            <%@include file="menu.jsp"%>
          </TD><!-- InstanceBeginEditable name="contenido" -->
          <TD class=Titulo vAlign=top align=middle background="images/fondocentro.gif">
             <br>
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos aceptación de una solicitud de cambio</DIV>



		<div align="center"><center>
		<FORM METHOD=POST ACTION="PrevioConsultaSP" name="fback">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
		<INPUT TYPE="hidden" name="Posicion" value="1">
        <INPUT TYPE="hidden" name="opcionMenu" value="1">
		</FORM>
		<FORM METHOD=POST ACTION="ResponderMsgSP" name="theForm">
		<input type="hidden" name="idInternoMensajeErroneo" value="<c:out value="${idInternoMensajeErroneo }"/>">
		<INPUT TYPE="hidden" name="Remitente" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="IdInterno" value="<%=idInterno%>">
		<INPUT TYPE="hidden" name="DescCausaDenegacion">
		<INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
		<INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
		<INPUT TYPE="hidden" name="filtroULL" value="<%=filtro%>">
        <INPUT TYPE="hidden" name="opcionMenu" value="1">
        <table border="0" width="90%">
        <tr>
		        <td align="left" class="texto2">&gt; <font class="texto6"> Identificador de Proceso</font>&nbsp;&nbsp;&nbsp;&nbsp;<%=idProceso%>
		     
		    	</td>
		    </tr></table>
		<table border="0" width="90%">
	
		    <tr>
		        <td colspan="8" align="left" class="texto2"><br> > <font class="texto6"> Datos abonado</font></td>
		    </tr>
		    <tr>
		        <td><font class="texto2">NIF/CIF:</font></td>
		        <td ><font class="texto"><%=mensajeNif%></font><INPUT TYPE="hidden" name="NIF" value="<%=mensajeNif%>"></td>
		        <td width="17%">&nbsp;</td>
		        <td width="9%"><font class="texto2">Nombre:</font></td>
		        <td width="6%" colspan="3"><font class="texto"><%=mensajeNombre%></font><INPUT TYPE="hidden" name="Nombre" value="<%=mensajeNombre%>"></td>

		    </tr>
		    <TR>
		      <TD><font class="texto2">Dirección:</font></TD>
		      <TD><font class="texto"><%=mensajeDireccion%></font><INPUT TYPE="hidden" name="Direccion" value="<%=mensajeDireccion%>"></TD>
		      <TD></TD>
		      <TD><font class="texto2">Localidad:</font></TD>
		      <TD colspan="2"><font class="texto"><%=mensajeLocalidad%></font><INPUT TYPE="hidden" name="Localidad" value="<%=mensajeLocalidad%>"></TD>
		      <TD width="17%"></TD>
		      <TD width="9%"><font class="texto2">Provincia:</font></TD>
		      <TD><font class="texto"><%=mensajeProvincia%></font><INPUT TYPE="hidden" name="Provincia" value="Castellón"></TD>
		    </TR>
		    <tr>
		        <td colspan="8" align="left" class="texto2"><br> > <font class="texto6"> Datos solicitud</font></td>
		    </tr>
		    <tr>
                <td><font class="texto2">Fecha ventana preferida:</font></td>
		        <td><font class="texto"><%=mensajeFecha%></font><INPUT TYPE="hidden" name="FechaPreferida" value="<%=mensajeFecha%>"></td>
		        <td><font class="texto2">&nbsp;&nbsp;Tipo de portabilidad:</font></td>
		        <td><font class="texto"><%=mensajeTipoPortabilidad%></font><INPUT TYPE="hidden" name="TipoPorta" value="<%=mensajeTipoPortabilidad%>"></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">Operador receptor:</font></td>
		        <td><font class="texto"><%=mensajeOpReceptor%></font><INPUT TYPE="hidden" name="Receptor" value="<%=mensajeOpReceptor%>"></td>
		        <td>&nbsp;</td>
		    </tr>
		    <tr>
		    <TD colspan="8"><font class="texto2">Portar numeración asociada a número de cabecera:</font>
		    &nbsp;
		<%
		    if (flagNumCompleta.equals("1"))
		        {
		%>
		
				<input type="checkbox" name="flag_num_completa" value="<%=flagNumCompleta%>" disabled checked>
		
		<%
		    }
		    else
		        {
		%>
				<input type="checkbox" name="flag_num_completa" value="<%=flagNumCompleta%>" disabled>
		
		<%
		    }
		%>
			</TD>
		    <TD width="1%">&nbsp;</TD>
		    <TD width="1%">&nbsp;</TD>
		    <TD width="2%">&nbsp;</TD>
		    </tr>
            <tr>
              <td colspan="8">
                <%
                    if ((flagUll!= null) && (flagUll.equals("1")))
                    {
                %>
                <br>
                <TABLE border="0">
                  <TR>
                    <td class="texto2" rowspan="2">
                        Flag de solicitud ULL:
                        &nbsp;<input type="checkbox" name="flag_num_completa"  checked value="<=%flagULL%>" disabled>&nbsp;&nbsp;	</td>
                    <TD class="texto2">Nº Orden Administrativo ULL:</TD>
                    <TD class="texto"><%=adUll%></TD>
                </TR>
                <tr>
                    <TD class="texto2">Identificador del proceso ULL:</TD>
                    <TD class="texto"><%=idUll%></TD>
                </tr>
                </TABLE>
                <%
                    }else{}
                %>
              </td>
            </tr>
            <tr>
		        <td colspan="8" align="left"> <font class="texto5"> <br>> </font> <font class="texto6"> Datos persona contacto</font></td>
		    </tr>
            <tr>
		        <td><font class="texto2">Persona contacto:</font></td>
		        <td><font class="texto"><%=personaNombre%></font><INPUT TYPE="hidden" name="PersonaContacto" value="<%=personaNombre%>"></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">E-mail:</font></td>
		        <td colspan="4"><font class="texto"><%=personaEmail%></font><INPUT TYPE="hidden" name="Email" value="<%=personaEmail%>"></td>
		    </tr>
		    <tr>
		        <td><font class="texto2">Teléfono:</font></td>
		        <td><font class="texto"><%=personaTel%></font></td>
		        <td>&nbsp;</td>
		        <td><font class="texto2">Fax:</font></td>
		        <td colspan="4"><font class="texto"><%=personaFax%></font></td>
		    </tr>
            <tr>
		        <td colspan="8" align="left" class="texto5"> <br>> <font class="texto6"> Rangos numeración</font><br><br></td>
		    </tr>
            <TR>
		    <TD align="center" class="bgCabeceraFila">Núm. inicial rango</TD>
		    <TD align="center" class="bgCabeceraFila">&nbsp;</TD>
		    <TD align="center" class="bgCabeceraFila">Núm. final rango</TD>
		    <TD align="center" class="bgCabeceraFila">&nbsp;</TD>
		    <TD align="center" colspan="4" class="bgCabeceraFila">NRN</TD>
		  </TR>
		<%
            String clase="";
            for (int i=0; i< rangos.size(); i++)
            {   if((i%2)==0)
                clase="";
            else
                clase="bgFila";
		            %>
		            <tr>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=(((MensajeSPNumeracion)rangos.elementAt(i)).getNumInicialRango()).trim()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19"><font class="texto"><%=(((MensajeSPNumeracion)rangos.elementAt(i)).getNumFinalRango()).trim()%></font></td>
		                <TD class="<%=clase%>" align="center">&nbsp;</TD>
		                <td class="<%=clase%>" align="center" height="19" colspan="4"><font class="texto"><%=(((MensajeSPNumeracion)rangos.elementAt(i)).getNRN()).trim()%></font></td>
		            </tr>
		            <%
		        }
		%>

		</table>
		</center></div>

		<p>&nbsp;</p>
<!-- Adecuacion 5 -->
		<% if (actFecha) {%><font size=2><strong>Datos mensaje a enviar para aceptar<BR><br></strong></font> <%}
		else {%><font class="texto2" alingn="center">*La fecha de ventana de cambio no puede modificarse ya que se encuentra en un
                periodo comprendido entre 5 días hábiles y 30 días naturales desde el envío de la solicitud de
                portabilidad</font>
		<%} %>
		<div align="center"><center>
		<table border="0">

		<tr></tr>
		 <tr>
		   <% if (actFecha) {%>
		   <!--  Añadimos comprobante de modificación de fecha -->
		   	<input type="hidden" name="modFecha" value="true"/>

		   <td><font class="texto2">Fecha inicio ventana </font><input type="text" class="inputText" maxlength="10" size="10" name="FechaInicial" value="<%=mensajeFecha%>" ReadOnly>
               <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
		   </td>
		   <td>&nbsp;&nbsp;<td>
		   <td class="texto2">
                  Hora inicio ventana
                 <input type="text" class="inputText" size="2" maxlength="2"  name="Hor" onFocus="this.form.Hor.select()" value="<%=h%>" > :
                 <input type="text" class="inputText" size="2" maxlength="2"  name="Min" onFocus="this.form.Min.select()" value="<%=m%>" > :
                 <input type="text" class="inputText" size="2" maxlength="2"  name="Seg" onFocus="this.form.Seg.select()" value="<%=s%>" >
                 <input type="hidden" name="HoraInicial" value="<%=horaMensaje%>">
            </td>
		 <%
		   }else{ %>
	   		<td><font class="texto2">Fecha inicio ventana </font><input type="text" class="inputText" maxlength="10" size="10" name="FechaInicial" value="<%=mensajeFecha%>" ReadOnly>
		   </td>
		   <td>&nbsp;&nbsp;<td>
		   <td class="texto2">
                  Hora inicio ventana
                 <input type="text" class="inputText" size="2" readonly="readonly" maxlength="2"  name="Hor" onFocus="this.form.Hor.select()" value="<%=h%>" > :
                 <input type="text" class="inputText" size="2" readonly="readonly" maxlength="2"  name="Min" onFocus="this.form.Min.select()" value="<%=m%>" > :
                 <input type="text" class="inputText" size="2" readonly="readonly" maxlength="2"  name="Seg" onFocus="this.form.Seg.select()" value="<%=s%>" >
                 <input type="hidden" name="HoraInicial" value="<%=horaMensaje%>">
            </td>
<!-- Fin Adecuacion 5 -->   
	   <%}

		    if (flagNumCompleta.equals("1"))
		    {
		%>
		   <td>&nbsp;</td>
		   <td class="texto2">N&uacute;mero de rangos a portar
		                  <select class="inputText" name="num_rangos" onChange="sumarFilas();">
		<% 
		        int iniCount = rangos.size();
		        int valor = 0;
			for (int rangoSelect=iniCount; rangoSelect < 71; rangoSelect++)
					  {
		%>
		        <option value="<%=rangoSelect%>"><%=rangoSelect%></option>
		<% 
					}
			}
		%>
							      
		   </select></td>
		 </tr>
		</table></center></div>
		<%
		    if (flagNumCompleta.equals("1"))
		    {
		%>
		 <br>
		 <TABLE border="0">
		  <TR>
		   
		    <TD align="center"><FONT class="texto2"><STRONG>Núm. inicial rango</STRONG></FONT></TD>
		     <TD align="center"><FONT class="texto2"><STRONG>Núm. final rango</STRONG></FONT></TD>
		     <TD align="center"><FONT class="texto2"><STRONG>NRN</STRONG></FONT></TD>
		   </TR>
		 
		 
		  <c:forEach items="${mensajeSP.rangosNumeracion}" var="rango">
		  <TR>
		  <td>
		        <input type="text" class="inputText" class="inputText" size="15"  name="NumInicialRangoSP" value="<c:out value="${rango.numInicialRango }"/>" readOnly>
		    </td>
		    <td>
			<input type="text" class="inputText" class="inputText" size="15"  name="NumFinalRangoSP" value="<c:out value="${rango.numFinalRango }"/>" readOnly>
		    </td>
		    <td> 
		        <input type="text" class="inputText" class="inputText" size="8"  name="NRNSP" value="<c:out value="${rango.NRN }"/>" readOnly>
		    </td>
		</tr>
		  </c:forEach>
		  
		  	
		  	<tr>
           <TBODY id=cuerpoTablaRelacion >
		   </tbody>
			</tr>
		      
		</TABLE>
		
		 <%
		 	 }
		 %>
		</FORM>
		<div align="center"><center>
		<table border="0">
		    <tr>
		        <td><A HREF="javascript:TodoOk(1)//'" onMouseOver="window.status='Responder';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" border="0" width="107" height="28"></A></td>
     		    <td><A HREF="javascript:void(history.back())//'"><img src="images/Back.jpg" width="107" border="0" height="28"></A></td>
		    </tr>
		</table>
		</center></div>

              <%--Nueva imagen--%>
              </td>
             <td width="10" class="Fondoverdederecha">&nbsp;
                
             </td>
          </TR>
        </TBODY>
    </TABLE>
<jsp:include page="pie.jsp" flush="true"/>



</body>
<script>
var numfilasRelacion=0;
var form=document.theForm;

function  sumaRelacion()	{

		var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");
	
		var fila = document.createElement("tr");
		var celda1 = document.createElement("td");
		var celda2 = document.createElement("td");
		var celda3 = document.createElement("td");


    numfilasRelacion=miTablaRelacion.getElementsByTagName("tr").length + 1 ;
    
   celda1.innerHTML = "<input name='NumInicialRango' class='inputText' type='text' id='inicioRango' size='15'  maxlength='15' >";
    celda2.innerHTML = "<input name='NumFinalRango' class='inputText' type='text' id='finalRango' size='15'  maxlength='15' >";
    celda3.innerHTML = "<input type='text' size='8' class='inputText' name='NRN' value='<%= ((MensajeSPNumeracion)rangos.elementAt(0)).getNRN()%>' readOnly>";

		fila.appendChild(celda1);
		fila.appendChild(celda2);
		fila.appendChild(celda3);

		miTablaRelacion.appendChild(fila);

}

function restarFilas(rangos) {
	var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");	
	var i = numfilasRelacion-1;
	do{
	    miTablaRelacion.deleteRow(i);
	    numfilasRelacion--;
	    i--;
	  }
	while (miTablaRelacion.rows.length != rangos)
}

function sumarFilas(){
	var numfilas=numfilasRelacion;
	var rangos=	form.num_rangos.options[form.num_rangos.options.selectedIndex].value;

	if (rangos > <%=rangos.size()%>)
	{
	if(rangos>numfilas){
	
		for(var i=0;i<rangos-numfilas-<%=rangos.size()%>;i++){
			sumaRelacion();
		}
		
	}else {
		restarFilas(rangos-<%=rangos.size()%>);
	}
	}
	else
	{
            restarFilas(0);
	}
}



  </script>
 <script language="JavaScript">
   setPath('<%= request.getContextPath() %>');
   var calendario1 = new calendar1(document.theForm.FechaInicial);
 </script>
 <%
}catch(Exception e){
	e.printStackTrace();
}
 %>
</html>