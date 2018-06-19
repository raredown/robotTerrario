<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="es.portanode.solicitudes.SolicitudPendienteBean"%>
<%@page import="es.portanode.solicitudes.SolicitudesPendientesNumeracion"%>
<%@page import="es.portanode.util.Constantes"%><html>
<head>
    <title>Operador</title>
    <script language="JavaScript" src="js/util.js"></script>
    <script language="JavaScript" src="js/calendar1.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<%@ page import="java.util.Vector,
                 es.portanode.util.comunidades.ProvinciaBeanCollection,
                 es.portanode.util.operadores.OperadorBeanCollection,
                 es.portanode.BDR.NRNBeanCollecion,
                 es.portanode.util.comunidades.ProvinciaBean,
                 es.portanode.util.operadores.OperadorBean,
                 es.portanode.BDR.NRNBean,
                 java.util.Enumeration,
                 es.portanode.util.Constantes,
                 es.portanode.util.ParametroBeanCollection,
                 java.text.SimpleDateFormat,
                 java.util.Date,
                 es.portanode.util.Calendario"%>
<%@ page import="java.io.*"%>
<%@ page import="es.portanode.util.PersonaContactoBean" %>
<%
  String p24 = "";
  if (ParametroBeanCollection.isPorta24Activo()){
      p24 = "1";
  } else {
      p24 = "0";
  }

  String TESAU = Constantes.TESAU;
    String subtitulo1=new String("Creaci&oacute;n mensaje de cambio de operador");
    //Modificación 24/05/2010, cargamos el contacto por defecto, para su
    //posible modificación en el JSP.
    PersonaContactoBean pc = (PersonaContactoBean) request.getAttribute("personaContacto");
    String remitente = (String) request.getAttribute("OperadorConectado");
    String DescripcionRemitente = (String) request.getAttribute("DescripcionRemitente");

    ProvinciaBeanCollection provincias = (ProvinciaBeanCollection) request.getAttribute("Provincias");
    Vector vprovincias = provincias.GetProvincias(0,provincias.GetNumeroProvincias());
    int numprovincias = provincias.GetNumeroProvincias();

    OperadorBeanCollection ops = (OperadorBeanCollection) request.getAttribute("SelectOperadores");
    Vector vops = ops.GetSelectOperadoresActivos();
  int numoperadores = ops.GetNumSelectOperadoresActivos();
    NRNBeanCollecion nrns = new NRNBeanCollecion(null,remitente, remitente);
    int numNrns = nrns.getNumeroNRNs();
    Vector vnrn = nrns.getNRNs(0,numNrns);

    boolean diferido = "1".equals((String)request.getAttribute("diferido"));

    String ull = (String) request.getAttribute("ULL");
    if (ull == null)
    {
        ull = "0";
    }
    // Nº Orden Administrativo ULL
    String adUll = (String) request.getAttribute("AdULL");
    if (adUll == null)
    {
        adUll = "";
    }
    // Identificador del proceso ULL
    String idUll = (String) request.getAttribute("IdULL");
    if (idUll == null)
    {
        idUll = "";
    }

    String idSolicitud = (request.getAttribute("idSolicitud") == null) ? "" : (String) request.getAttribute("idSolicitud");
    String nombreAbonado = (request.getAttribute("Nombre") == null) ? "" : (String) request.getAttribute("Nombre");
    String nif = (request.getAttribute("NIF") == null) ? "" : (String) request.getAttribute("NIF");
    String direccion = (request.getAttribute("Direccion") == null) ? "" : (String) request.getAttribute("Direccion");
    String cp = (request.getAttribute("CP") == null) ? "" : (String) request.getAttribute("CP");
    String localidad = (request.getAttribute("Localidad") == null) ? "" : (String) request.getAttribute("Localidad");
    String provincia = (request.getAttribute("Provincia") == null) ? "" : (String) request.getAttribute("Provincia");
    String destinatario = (request.getAttribute("Destinatario") == null) ? "" : (String) request.getAttribute("Destinatario");
    String observaciones = (request.getAttribute("Observaciones") == null) ? "" : (String) request.getAttribute("Observaciones");
    String tipoPortabilidad = (request.getAttribute("TipoPortabilidad") == null) ? "" : (String) request.getAttribute("TipoPortabilidad");
    boolean actCoordinada = "1".equals((String) request.getAttribute("ActCoordPE"));
    String infoTarifaria = (request.getAttribute("InfoTarif") == null) ? "No aplica" : (String) request.getAttribute("InfoTarif");
    boolean numCompleta = "1".equals((String) request.getAttribute("NumCompleta"));
    String num_rangos = (String) request.getAttribute("num_rangos");
    if (num_rangos == null || num_rangos.isEmpty()) {
      num_rangos = "1";
    }
    int numRangos = Integer.parseInt(num_rangos);

    String operRevRec = (request.getAttribute("operRevRec") == null) ? "" : (String) request.getAttribute("operRevRec");
    String operRevDon = (request.getAttribute("operRevDon") == null) ? "" : (String) request.getAttribute("operRevDon");
    String fechaSolUsuario = (request.getAttribute("fechaSolUsuario") == null) ? "" : (String) request.getAttribute("fechaSolUsuario");

    Vector<SolicitudesPendientesNumeracion> rangos = new Vector<SolicitudesPendientesNumeracion>();

    String[] tmp_nrns = request.getParameterValues("NRN");
    String[] tmp_numIniRango = request.getParameterValues("NumInicialRango");
    String[] tmp_numFinRango = request.getParameterValues("NumFinalRango");

    if (tmp_nrns != null && tmp_numIniRango != null && tmp_numFinRango != null) {
      for (int i = 0; i < numRangos; i++) {
        rangos.add(new SolicitudesPendientesNumeracion("", tmp_numIniRango[i], tmp_numFinRango[i], tmp_nrns[i]));
      }
    } else {
        rangos.add(new SolicitudesPendientesNumeracion("", "", "", ""));
    }


    SolicitudPendienteBean solBean = (SolicitudPendienteBean) request.getAttribute("solicitudPendiente");
    if (solBean != null) {
      idSolicitud = solBean.getIdSolicitud();
        nombreAbonado = solBean.getAbonado();
        nif = solBean.getNifCif();
        direccion = solBean.getDireccion();
        cp = solBean.getCodigoPostal();
        localidad = solBean.getLocalidad();
        provincia = solBean.getProvincia();
        ull = solBean.getEsULL();
        adUll = solBean.getNumAdminULL();
        idUll = solBean.getIdSolicitudULL();
        destinatario = solBean.getDestinatario();
        observaciones = solBean.getObservaciones();
        tipoPortabilidad = solBean.getTipoPortabilidad();
        actCoordinada = solBean.isCoordinada();
        infoTarifaria = solBean.getInfoTarifa().isEmpty() ? "No aplica" : solBean.getInfoTarifa() ;
        numCompleta = solBean.isNumCompleta();
        rangos = solBean.getRangosNum();
        numRangos = rangos.size();

        operRevRec = solBean.getOpeRevRec();
        operRevDon = solBean.getOpeRevDon();

        if(solBean.getFechaSolUsu() != null){
        	fechaSolUsuario = solBean.getFechaSolUsu().toString();
            fechaSolUsuario = fechaSolUsuario.substring(0, 10);
        }

        if (solBean.getNumProceso().equals(Constantes.PROCESO_12) || solBean.getNumProceso().equals(Constantes.TIPO_PROCESO_ASEGURADO)) {
          diferido = true;
        }
    }

%>

<SCRIPT LANGUAGE="JavaScript">
<!--


//Se llama cuando se modifica el combo de Tipo de portabilidad
function compruebaNumeroRangos(){
    f = document.theForm;
    var retorno;
    if(f.TipoPortabilidad.value=='04'){
        if(f.num_rangos.value!="1"){
            alert('Con "Números Inteligentes" solo puede enviarse un rango' );
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
//Tambien se usa antes de hace el submit, con el valor n=1, para habilitar todos
//los campos y asi poder recoger sus valores
function desbloqueaRangos(n){
    var valor="";
    var lista = document.getElementById('cuerpoTablaRelacion').getElementsByTagName('select');
    valor=lista[0].value;
    for (i = 0;  i < lista.length;  i++){
        lista[i].value=valor;
        lista[i].disabled=false;
    }
    if(n==1){f.NumCompleta.disabled=false;}
}


function desbloquea(n){
    var valor="";
    var lista = document.getElementById('cuerpoTablaRelacion').getElementsByTagName('select');
    for (i = 0;  i < lista.length;  i++){
        lista[i].disabled=false;
    }
    if(n==1){f.NumCompleta.disabled=false;}
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
        desbloqueaRangos(0);
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
            alert('Con "Números Inteligentes" solo puede enviarse un rango' );
            f.num_rangos.value="1";
            sumarFilas();
            retorno=1;
        }
    }

    return retorno;

}//fin de compruebaTipoPortabilidad




//Método que comprueba la Fecha
function FechaOkP(Campo,Obligatorio){
    if (Campo.value == ''){
        if ((Obligatorio)||(document.getElementById("HoraCambio").value != ''))
        {

            Campo.focus();
            alert('Introduzca la fecha en el formato : dd/mm/yyyy en el campo ' + Campo.name );
            Campo.select();
            return false;
        }
        else return true;
    }
    var checkOK = "0123456789/";
    var checkStr = Campo.value;
    var allValid = true;
    var decPoints = 0;
    var allNum = "";
    for (i = 0;  i < checkStr.length;  i++)
    {
        ch = checkStr.charAt(i);
        for (j = 0;  j < checkOK.length;  j++)
            if (ch == checkOK.charAt(j))
                break;
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
        alert('Introduzca la fecha en el formato : dd/mm/yyyy en el campo ' + Campo.name );
        Campo.select();
        return false;
    }
    var err=0;
    var a;
    var b;
    var c;
    var d;
    var e;
    var f;
    a=Campo.value;
    if (a.length < 10) err=1;
    else {
        d = a.substring(0, 2);// day
        c = a.substring(2, 3);// '/'
        b = a.substring(3, 5);// month
        e = a.substring(5, 6);// '/'
        f = a.substring(6, 10);// year
        //basic error checking
        if (b<1 || b>12) err = 1
        if (c != '/') err = 1
        if (d<1 || d>31) err = 1
        if (e != '/') err = 1
        //advanced error checking
        // months with 30 days
        if (b==4 || b==6 || b==9 || b==11){
            if (d==31) err=1
        }
        // february, leap year
        if (b==2){ //feb
            var g;
            g = parseInt(f / 4);
            if (isNaN(g)) {
                err = 1;
            }
            if (d>29) err=1
            if (d==29 && ((f/4)!=parseInt(f/4))) err=1
        }
    }
    if (err==1){

        Campo.focus();
        alert('Introduzca la fecha en el formato : dd/mm/yyyy en el campo ' + Campo.name );
        Campo.select();
        return false;
    }
    return true;
}


function NumberOk(Campo,Obligatorio){
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
    if ((Campo.name == "CP")&&(Campo.value.length != 5)){

        Campo.focus();
        alert("El campo " + Campo.name+ " ha de tener cinco cifras");
        Campo.select();
        return false;
    }
    if ((Campo.name == "NRN")&&(Campo.value.length != 6)){

        Campo.focus();
        alert("El campo " + Campo.name+ " ha de tener seis cifras");
        Campo.select();
        return false;
    }
    return true;
}

function contiene(c,s){
    var result = false;
    for (var i = 0; i < s.length; i++){
        if (c == s.charAt(i)){
            result = true;
            break;
        }
    }
    return result;
}
function allNum(s){
    var checkOK = "0123456789";
    var c;
    var result = true;
    for (var i = 0; i < s.length; i++){
        c = s.charAt(i);
        if (!(contiene(c,checkOK))){
            result = false;
            break;
        }
    }
    return result;
}

function StringOk(Campo,Obligatorio){
    if (Campo.value == "") {
        if (Obligatorio) {

            Campo.focus();
            alert("Introduzca una cadena de caracteres en " + Campo.name);
            Campo.select();
            return false;
        }
        else return true;
    }

    var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&',. -";
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
        alert("No escribir números ni vocales con acentos en " +Campo.name);
        Campo.select();
        return false;
    }
    return true;
}

function NombreOk(Campo,Obligatorio, Descripcion){
    if (Campo.value == "") {
        if (Obligatorio) {

            Campo.focus();
            alert("Introduzca una cadena de caracteres en " + Descripcion);
            Campo.select();
            return false;
        }
        else return true;
    }

    var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,.´' -/0123456789";
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
        alert("No escribir números ni vocales con acentos en " +Descripcion);
        Campo.select();
        return false;
    }
    return true;
}

function AddrOk(Campo,Obligatorio){
    if (Campo.value == "") {
        if (Obligatorio) {

            Campo.focus();
            alert("Introduzca una cadena de caracteres en " + Campo.name);
            Campo.select();
            return false;
        }
        else return true;
    }

    var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnañopqrstuvwxyz&,.ºª´' -/0123456789";
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
        alert("Los caracteres válidos para este campo son: " +checkOK);
        Campo.select();
        return false;
    }
    return true;
}

function RangoOk(Campo1,Campo2){
    var err = 0;
    var num1,num2;
    if (!NumberOk(Campo1,true))     return false;
    if (!NumberOk(Campo2,true))     return false;
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

function Combos(Campo,remitente){
    escogido = Campo.options.selectedIndex;
    if (remitente.value == Campo.options[escogido].value){
        alert("El remitente y el destinatario del mensaje no puede ser el mismo");
        return false;
    }
    return true;
}

function CpyNrn(f,nrn){
  var ret = "";
    escogido = nrn.options.selectedIndex;
    if (((f.CP.value.charAt(0)) && (f.CP.value.charAt(1))) != ((nrn.options[escogido].value.charAt(2)) && (nrn.options[escogido].value.charAt(3)))){
    ret="Es posible que el NRN no pertenezca a la Provincia citada.\n¿Desea seguir con el proceso de todos modos?";
        //if (seguir == false){
    //	alert("Por Favor, verifica el valor del NRN o del Código Postal");
      //f.nrn.focus();
      nrn.focus();
    //}
  }
  return ret;
}

function getCodigoPostal(provincia){
    codigo_postal=new Array("01","02","03","04","33","05","06","07","08","09","10","11","39","12","51","13","14","16","17","18","19","20","21","22","23","15","26","35","24","25","27","28","29","52","30","31","32","34","36","37","38","40","41","42","43","44","45","46","47","48","49","50");
    return codigo_postal[provincia-1];
}
function getRangos(provincia){
    rangos=new Array("945","967","965|966","950","984|985","920","824|924","871|971","931|932|933|934|935|936|937|938","947","927","856|956","942","964","856|956","926","957","969","872|972","858|958","949","843|943","959","974","953","881|981","941","828|928","987","873|973","982","911|912|913|914|915|916|917|918","951|952","951|952","868|968","848|948","988","979","886|986","923","822|922","921","954|955","975","877|977","978","925","960|961|962|963","983","944|946","980","876|976");
    return rangos[provincia-1];
}

function ValidaNuevaEspe(f){
            // NRN
            var nrns = document.getElementsByName("NRN");

            // Rangos
            var rangos = document.getElementsByName("NumInicialRango");
            var rangosf = document.getElementsByName("NumFinalRango");
            for(var count=0; count < nrns.length;count++)
            {

                if ((rangos[count].value == "") || (rangosf[count].value == ""))
                {
                  alert("Los campos correspondientes a los rangos de numeración no pueden ir en blanco.");
                    return "nosubmit";
                }
                if (!RangoOk(rangos[count],rangosf[count]))
                    return "nosubmit";
                 var retNrn = CpyNrn(f,nrns[count]);
                 if (retNrn!="")
                    return retNrn;
            }
            return "";
        }

function NIFOkNewConfirm(Campo,Obligatorio){
    if (Campo.value == ''){
        if (Obligatorio){
            Campo.focus();
            alert("Introduzca un valor en "+Campo.name);
            Campo.select();
            return "nosubmit";
        }
        else return "";
    }
    var letrasInicialesCIF= "ABCDEFGHKLMPQSXZ";
    var mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var LETRAS = "TRWAGMYFPDXBNJZSQVHLCKET";
    var CIFconLetra = "PQSNMKA";
    var encontrado = false;
    var checkOK = "0123456789";
    var checkStr = Campo.value;
    checkStr=checkStr.toUpperCase();
    var letra1 = checkStr.charAt(0);
    var allValid = true;
    if (!(contiene(letra1,checkOK))){
        result = "CIF";
    }else{
        result="NIF";
    }
    if (result=="NIF"){
        if (!(contiene(checkStr.charAt(checkStr.length -1),LETRAS))){
            allValid = false;
            ErrorDesc= "El campo " + Campo.name + " tiene que tener un carácter válido en la última posición.";
        }else{
            if ( !allNum (checkStr.substr (0,checkStr.length -1 ))){
                allValid = false;
                ErrorDesc= "El campo " + Campo.name + " debe ser numérico a excepción del último carácter.";
            }else{
                dValor =  checkStr.substr(0 , checkStr.length -1);
                iNumero = (dValor %  23);
                if (LETRAS.charAt(iNumero) != checkStr.charAt(checkStr.length-1)){
                    allValid = false;
                    ErrorDesc= "El campo " + Campo.name + " tiene una letra asociada incorrecta.\nLa correcta es: "+ LETRAS.charAt(iNumero);
                }
            }
        }
    }else if (checkStr.charAt(0) != "X"){
        if (!(contiene(letra1,letrasInicialesCIF))){
            allValid = false;
            ErrorDesc= "La primera letra del CIF es incorrecta";
        }
        if (!(contiene(letra1,CIFconLetra))){
            if ( !allNum (checkStr.substr(1,checkStr.length -1 ))){
                allValid = false;
                ErrorDesc= "El CIF no puede tener mas de una letra.";
            }
        }
        if (allValid)
        {
            // Eliminamos la primera letra y el dígito de control
            var Valor =  checkStr.substr(1 , checkStr.length - 2);
            // Si no son 7 dígitos añadimos ceros

            var cerosAdicionales = 7 - Valor.length;
            for ( i=0 ; i < cerosAdicionales ; i++)
            {
                Valor = "0" + Valor;
            }

            // Obtenemos el dígito de control
            var DC = checkStr.charAt(checkStr.length-1);

            // Operación con los pares
            var sumaA = Number(Valor.charAt(1)) + Number(Valor.charAt(3)) + Number(Valor.charAt(5));

            // Operación con los impares
            var sumaB = 0;
            for (i = 0 ; i < 8 ; i = i + 2){
                aux1 = String(Number(Valor.charAt(i)) * 2);
                if (aux1.length > 1)
                {
                    aux2 = Number(aux1.charAt(0)) + Number(aux1.charAt(1));
                }
                else
                {
                    aux2 = Number(aux1);
                }
                sumaB = sumaB + aux2;
            }
            // Continua el algoritmo para obtener el dígito de control
            var sumaC= String(sumaA + sumaB);

            var DCbis;
            DCbis = 10 - Number(sumaC.charAt(1));
            if (sumaC.length > 1){
                if (sumaC.charAt(1) == "0"){
                    DCbis = 10 - Number(sumaC.charAt(1));
                }else{
                    DCbis = 10 - Number(sumaC.charAt(1));
                }
            }else{
                DCbis = 10 - Number(sumaC);
            }
            if (DCbis == 10) DCbis = 0;
            if (contiene(DC,mayusculas)){
                if (DCbis != (mayusculas.indexOf(DC)+1)){
                    allValid = false;
                    ErrorDesc= "El CIF no es correcto.";
                }
            }else if (contiene(DC,checkOK)){
                if (DCbis != DC){
                    allValid = false;
                    ErrorDesc= "El CIF no es correcto.";
                }
            }else{
                allValid = false;
                ErrorDesc= "El CIF no es correcto.";
            }
        }
    }else if (checkStr.charAt(0) == "X"){
        if (!(contiene(checkStr.charAt(checkStr.length -1),LETRAS))){
            allValid = false;
            ErrorDesc= "El campo " + Campo.name + " tiene que tener un carácter válido en la última posición.";
        }else{
            if ( !allNum (checkStr.substr (1,checkStr.length -2 ))){
                allValid = false;
                ErrorDesc= "El campo " + Campo.name + " debe ser numérico a excepción de la X y el último carácter.";
            }else{
                dValor =  checkStr.substr(1 , checkStr.length -2);
                iNumero = (dValor %  23);
                if (LETRAS.charAt(iNumero) != checkStr.charAt(checkStr.length-1)){
                    allValid = false;
                    ErrorDesc= "El campo " + Campo.name + " tiene una letra asociada incorrecta.\nLa correcta es: "+ LETRAS.charAt(iNumero);
                }
            }
        }
    }else{
        allValid = false;
        ErrorDesc= "El campo "+Campo.name+" es incorrecto.\nNo se ha detectado NIF/CIF/Tarj. Residencia.";
    }
    if (!allValid)
        return "El formato del campo " + Campo.name + " no parece ser correcto.\n"+ErrorDesc+"\n";
    else return "";
}


function TodoOk(TESAU){

  var p24 = document.getElementById("p24");

    f = document.theForm;
    var numRangos = document.getElementById("num_rangos");
    var tipoPortab = document.getElementById("TipoPortabilidad");
  var rangoIni = document.getElementById("inicioRango");
    var rangoFin = document.getElementById("finalRango");
    var escogido = f.Destinatario.options.selectedIndex;
  var opDonante = f.Destinatario.options[escogido].value;

  var idSolicitudULL = document.getElementById("IdULL");
  var numAdmULL = document.getElementById("AdULL");


  if (document.getElementById('ULL').checked && tipoPortab.value=='04'){
	alert("Con acceso mayorista activo no se pueden incluir '\u0022N\u00fameros Inteligentes\u0022'");
    return;
   }

    if (tipoPortab.value=='04'){
      if (numRangos.value!='1'){
        alert("Sólo se admite un rango en el caso de acceso básico RDSI");
            return;
      }else{
        if (rangoIni.value!=rangoFin.value){
          alert('Con "Números Inteligentes" el "Número inicial del rango" debe ser igual al "Número final del rango"');
                return;
        }
      }
    }

    if (!NombreOk(f.Nombre,true, "Nombre"))
        return;
    if (!AddrOk(f.Direccion,true))
        return;
    if (!NumberOk(f.CP,true))
        return;
    if (!StringOk(f.Localidad,true))
        return;

    f.HoraCambio.value="";
    if((f.FechaCambio.value=="") && (f.HorCambio.value=="") && (f.MinCambio.value=="") && (f.SegCambio.value=="") ){
        f.HoraCambio.value="";
    }else{
        if (!FechaOkP(f.FechaCambio,false))
            return;
        if (!CompruebaHora(f.HorCambio,f.MinCambio,f.SegCambio))
        {return ;}
        else
        {f.HoraCambio.value = f.HorCambio.value + ":" + f.MinCambio.value + ":" + f.SegCambio.value;}
    }

    if(p24.value == "0") {
      if (!Combos(f.Destinatario,f.OperadorConectado))
           return;
    }

    if (f.InfoTarif.value == ""){
        f.InfoTarif.focus();
        alert("Se ha de introducir una cadena en el campo "+f.InfoTarif.name);
        f.InfoTarif.select();
        return;
    }

    if(p24.value == "0") {
      if(document.getElementById('ULL').checked)
    {
      if (!validarAdULL())
          return;
        if (!validarIdULL())
            return;
    }
    }

    //Nuevo cambio para modificación de los datos de contacto.
    if (!NombreOk(f.nombreContacto,true, "nombre persona contacto"))
        return;
    if (!validarEmail(f.emailContacto,true))
        return;
    if (!NumberOk(f.telefContacto,true))
        return;
    if (!NumberOk(f.faxContacto,true))
        return;

    if(p24.value == '1') {
        if (!portabilidad24Ok(f,p24,TESAU))
      return;
        f.action = "EnviarMsgSP24";
    }

    var ret1 = NIFOkNewConfirm(f.NIF,true);
    var ret2 = ValidaNuevaEspe(f);

    if(ret1!=""||ret2!=""){
        if(ret1!="nosubmit"&&ret2!="nosubmit")
        confirmar(ret1+ret2,"Mensaje Confirmacion","javascript:hazSubmit('theForm');","javascript:VentanaModal.cerrar();");
    }else{

        // Antes de enviar colocamos el campo select de los nrns a enable, para que se
        // puedan capturar sus valores

        desbloquea(1);
        f.submit();
    }
}

/**
 *
 * @returns {Boolean}
 */
function isOperadorDonanteTelefonica() {

	return document.getElementById('Destinatario').value == '00001';
}

/**
* Valida identificador proceso.
**/
function validarIdULL(){
	var nombreTagIdentificadorProceso = 'IdULL';
  	var identificadorProceso = document.getElementById(nombreTagIdentificadorProceso);
    if (identificadorProceso.value == ""){
        alert("Debe rellenar el N\u00famero de identificador acceso mayorista.");
        identificadorProceso.focus();
        return false;
    } else if (identificadorProceso.value.length == 18) {
		identificadorProceso.value = identificadorProceso.value + "   ";
	} else if (identificadorProceso.value.length != 21) {
		identificadorProceso.focus();
		alert("El n\u00famero identificador acceso mayorista debe tener 21 car\u00e1cteres alfanum\u00e9ricos o 18 c\u00e1racteres alfanum\u00e9ricos con 3 espacios en blanco a la derecha.");
		return false;
	}
	return true;
}

/**
* Valida numero administrativo.
*/
function validarAdULL(){
	var nombreTagNumeroAdministrativo = 'AdULL';
	var numeroAdministrativo = document.getElementById(nombreTagNumeroAdministrativo);
	if (numeroAdministrativo.value == ""){
        alert("Debe rellenar el n\u00famero administrativo de acceso mayorista.");
        numeroAdministrativo.focus();
        return false;
    } else if (numeroAdministrativo.value.length == 12) {
		numeroAdministrativo.value = numeroAdministrativo.value + "   ";
	} else if (numeroAdministrativo.value.length != 14) {
		numeroAdministrativo.focus();
		alert("El n\u00famero administrativo debe tener una longitud de 12 o 14 caracteres para Acceso mayorista activo y traspasos de bucle entre terceros.");
		return false;
	}
	return true;
}


/**
 * Valida los campos ULL
 */
function validaULL(diferido) {
	var ullChecked = document.getElementById('ULL').checked;
	if (ullChecked) {
		if (isOperadorDonanteTelefonica()) {
			return validaULLOperDonTelefonica();
		} else {
			return validaULLOperDonNoTelefonica(diferido);
		}
	}
	return true;
}


/**
 * Valida los campos ULL cuando el operador donante no es telef&oacute;nica
 */
function validaULLOperDonNoTelefonica(diferido) {
	var numeroAdministrativo = document.getElementById('AdULL');
	var numeroAdministrativoFicticio = "88888888888888";
	var identificadorProceso = document.getElementById('IdULL');
	var identificadorProcesoFicticio = "AAAAAAAAAAAAAAAAAAAAA";

	// Proceso Básico
	if (diferido != 1) {
		if (identificadorProceso.value != identificadorProcesoFicticio
				|| numeroAdministrativo.value != numeroAdministrativoFicticio) {
			alert("Para el proceso b\u00e1sico con acceso mayorista activo s\u00f3lo se pueden enviar solicitudes de tipo 'Consulta administrativo'.");
			identificadorProceso.focus();
			return false;
		}
	}
	// Proceso Asegurado
	else {
		if (identificadorProceso.value == identificadorProcesoFicticio
				&& numeroAdministrativo.value == numeroAdministrativoFicticio) {
			alert("Para el proceso asegurado con acceso mayorista activo s\u00f3lo no se pueden enviar solicitudes de tipo 'Consulta administrativo'.");
			return false;
		} else {
			// Validar los valores
			if (!validarIdULL()) {
				return false;
			}
			if (!validarAdULL()) {
				return false;
			}
		}
	}
	return true;
}

/**
 * Valida los campos ULL cuando el operador donante es telef&oacute;nica
 */
function validaULLOperDonTelefonica() {
	var adUll = document.getElementById('AdULL');
	var idUll = document.getElementById('IdULL');
	if (idUll.value == "") {
		idUll.focus();
		alert("Se debe de indicar el Id acceso mayorista para Acceso mayorista activo y donante telef\u00f3nica");
		return false;
	}
	if (idUll.value.length == 18) {
		idUll.value = idUll.value + "   ";
	} else if (idUll.value.length != 21) {
		idUll.focus();
		alert("El Id acceso mayorista debe tener una longitud de 18 o 21 caracteres para Acceso mayorista activo y donante telef\u00f3nica");
		return false;
	}
	if (idUll.value == "AAAAAAAAAAAAAAAAAAAAA"
			&& adUll.value == "88888888888888") {
		idUll.focus();
		alert("No puede contener valores ficticios en los campos Id acceso mayorista"
				+ " y en N\u00famero administrativo de acceso");
		return false;
	}
	return true;
}


/**
 *
 */
function compruebaRevenDonProcBasico(diferido) {
	if (diferido != 1) {
		var revendedorDonante = document.getElementById('revendedorDonante');
		if (revendedorDonante.value != "") {
			revendedorDonante.focus();
			alert("El operador donante revendedor no puede venir informado para el proceso b\u00e1sico");
			return false;
		}
	}
	return true;
}


function portabilidad24Ok(f,p24,TESAU) {

  	if(f.fechaSolUsuario.value == "") {
    	alert("Introduzca una fecha SP del Usuario");
    	return false;
  	}
  	var ull = f.ULL;
  	var adUll = f.AdULL;
  	var idUll = f.IdULL;
  	var nNRN = document.getElementsByName("NRN");
  	var diferido = document.getElementById("diferido");
	var operadorCon = f.OperadorConectado.value;
	var posOp = operadorCon.length - 1;
	for (posOp; posOp > 0; posOp--) {
		if (operadorCon.charAt(posOp) == '0') {
			posOp++;
			break;
		}
	}
	var codOp = operadorCon.substring(posOp, operadorCon.length);

	if (diferido.value == "1"
        && ((f.FechaCambio.value=="") || (f.HorCambio.value==""))) {
      alert("La fecha de ventana de cambio es obligatoria para solicitudes de portabilidad de proceso Asegurado.");
      return false;
	}

    if(operadorCon == f.Destinatario.value) {
	    if(f.operRevRec.value == "" && f.operRevDon.value == "") {
	      f.operRevRec.focus();
	      alert("Se debe indicar al menos revendedor receptor o revendedor donante");
	      return false;
	    }
	}

  if (!validaULL(diferido.value)){
  	return false;
  }

  if (!compruebaRevenDonProcBasico(diferido.value)){
  	return false;
  }

  if(f.TipoPortabilidad.value=="04"){
      var nIRango = document.getElementsByName("NumInicialRango");
       var nFRango = document.getElementsByName("NumFinalRango");
       if(!((nIRango[0].value.substring(0,2) == "70" || nIRango[0].value.substring(0,2) == "80" || nIRango[0].value.substring(0,2) == "90")
       && (nFRango[0].value.substring(0,2) == "70" || nFRango[0].value.substring(0,2) == "80" || nFRango[0].value.substring(0,2) == "90"))) {
         alert('La numeración para "Números Inteligentes" tiene que ser del tipo (70X-80X-90X)');
         return false;
       }
       if(nIRango[0].value != nFRango[0].value) {
         alert('Con "Números Inteligentes", Inicio de rango y final de rango deben coincidir');
         return false;
       }
       if(codOp.length == 2) {
      if ('00' != nNRN[0].value.substring(2,4)) {
        alert("Error de validación del NRN");
        return false;
      }
      } else if(codOp.length == 3) {
        if ('00' != nNRN[0].value.substring(3,5)) {
          alert("Error de validación del NRN");
          return false;
        }
      }
    }

    if(codOp.length == 2) {
      if (codOp != nNRN[0].value.substring(0,2)) {
        alert("Error de validación del NRN");
        return false;
      }
    } else if(codOp.length == 3) {
      if (codOp != nNRN[0].value.substring(0,3)) {
        alert("Error de validación del NRN");
        return false;
      }
    }

  return true;
}

function hazSubmit(formulario){
  var f = document.getElementById(formulario);
  desbloquea(1);
  f.submit();
}

//////////////////////////////////////////////////////////////////////


function validarNumeros(Id)
{
    var checkOK = "0123456789";
    valor = document.getElementById(Id).value;
    for (i = 0;  i < valor.length ;  i++)
    {
        ch = valor.charAt(i);
        for (j = 0;  j < checkOK.length;  j++)
            if (ch == checkOK.charAt(j))
                break;
        if (j == checkOK.length)
        {
            alert("El campos no puede contener caracteres no numéricos.");
            document.getElementById(Id).focus();
            return false;
        }
    }
    return true;
}


function habilitarULL()
{
    if(document.getElementById('ULL').checked)
    {
        document.getElementById('AdULL').disabled=false;
        document.getElementById('IdULL').disabled=false;
        document.getElementById('ULL').value="1";
    }
    else  if ( document.getElementById('IdULL').value != ""  || document.getElementById('AdULL').value != "")
    {
        /* alert("Si el flag ULL está desactivado, los campos AdULL e IdULL deben ser vacíos"); */
      alert("Si el flag Acceso mayorista está desactivado, los campos Nº Orden Administrativo e Id acceso mayorista deben ser vacíos");

    }
    else
    {
        document.getElementById('AdULL').disabled=true;
        document.getElementById('IdULL').disabled=true;
        document.getElementById('ULL').value="0";
    }
}

function comprobarFlagUll () {
  f = document.theForm;
  var diferido = document.getElementById("diferido");

  /* if (f.PrBasico.checked == true) { */
  /* if(diferido.value == "false") { */
	 if(diferido.value != "1") {
    //if (f.ULL.value == "1") {
   	if (f.ULL.checked) {
        f.AdULL.value = "88888888888888";
        f.IdULL.value = "AAAAAAAAAAAAAAAAAAAAA";
      } else {
        f.AdULL.value = "";
        f.IdULL.value = "";
      }
  } else {
    f.AdULL.value = "";
    f.IdULL.value = "";
    return;
  }
}

mostrar = new Image();
mostrar.src = "images/mostrar.gif";
ocultar = new Image();
ocultar.src = "images/ocultar.gif";

function mostrarOcultar(imagen)
{
    if (imagen.name == "ocultar") {
        imagen.src = mostrar.src;
        imagen.name = "mostrar";
    }
    else {
        imagen.src = ocultar.src;
        imagen.name = "ocultar";
    }
    mostrarAlt(imagen);
    showhide('filaContacto1');
    showhide('filaContacto2');
}

function mostrarAlt(imagen) {
    if (imagen.name == "ocultar")
        imagen.alt = "Pulse para Ocultar...";

    else
        imagen.alt = "Pulse para Mostrar...";
}

//-->
</SCRIPT>

<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">



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
<DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>

  <%

  if (ParametroBeanCollection.isPorta24Activo()){
      p24 = "1";
  } else {
      p24 = "0";
  }

  if(p24.equals("0")){
    if (diferido) {
  %>
      Envia SP (Batch - Proceso 12)
  <%
    } else {
  %>
      Envia SP (Online - Proceso 01)
  <%
    }
  }else{
    if (diferido) {
  %>
      Envia SP (Batch - Proceso 16)
  <%
    } else {
  %>
      Envia SP (Online - Proceso 15)
  <%
    }
  }
  %>
</DIV>

<FORM METHOD=POST ACTION="MenuRolReceptorJSP" name="fback">
    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
    <INPUT TYPE="hidden" name="Posicion" value="1">
    <INPUT TYPE="hidden" name="repetido" value="0">
    <INPUT TYPE="hidden" name="repetido2" value="0">
    <INPUT TYPE="hidden" name="fechaHoraEnvio" value="1970/1/1 00:00">
</FORM>
<div align="center">
    <form action="EnviarMsgSP" method="POST" name="theForm">
        <input type="hidden" id="diferido" name="diferido" value="<c:out value="${diferido }"/>">
      <INPUT TYPE="hidden" name="idSolicitud" value="<%=idSolicitud%>">
        <table border="0" cellspacing="5">
          <tr>
              <td colspan="6" align="center">
                    <table  border="0" class="tablas" cellspacing="0" cellpadding="2">
                        <tr>
                            <th colspan="2" class="bordecelda"><font class="texto2">Datos abonado</font></th>
                        </tr>
                        <tr>
                            <td class="celdaabajolados"><font class="texto2">Nombre: </font>
                                <input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="Nombre" value="<%=nombreAbonado%>"> </td>
                            <td class="celdaabajolados"><font class="texto2">NIF/CIF: </font>
                                <input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="NIF" value="<%=nif%>"></td>
                        </tr>
                        <tr>
                            <td class="celdaabajolados"><font class="texto2">Direcci&oacute;n: </font>
                                <input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="Direccion" value="<%=direccion%>">
                            </td>
                            <td class="celdaabajolados"><font class="texto2">C.P.: </font>
                                <input type="text" class="inputText" class="inputText" size="5" maxlength="5" name="CP" value="<%=cp%>"> </td>
                        </tr>
                        <tr>
                            <td class="celdaabajolados"><font class="texto2">Localidad: </font>
                                <input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="Localidad" value="<%=localidad%>">
                            </td>
                            <td class="celdaabajolados"><font class="texto2">Provincia: </font>
                                <select class="inputText" size="1" name="Provincia">
                                    <%
                                        for (int i=0; i<numprovincias; i++)
                                        {
                                            ProvinciaBean prov= (ProvinciaBean) vprovincias.elementAt(i);
                                            String codigo = prov.GetCodigo();
                                            String nombre = prov.GetNombre();
                                        if (codigo.equals(provincia)) {
                                    %>
                                    <option value="<%=codigo%>" selected="selected"><%=nombre%></option>
                                    <%
                                        } else {
                                     %>
                                    <option value="<%=codigo%>"><%=nombre%></option>
                                     <%
                                        }
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                       </table>
					</td>
				</tr>
                        <tr>
                            <!-- <td><br><font class="texto2">Fecha cambio preferida: </font>
                                <input type="text" class="inputText" class="inputText" size="10" maxlength="10"  name="FechaCambio" readonly>
                                <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                            </td>
                            <td class="texto2"><br>Hora cambio preferida:
                                <input type="text" class="inputText" size="2" maxlength="2"  name="HorCambio" onFocus="this.form.HorCambio.select()"> :
                                <input type="text" class="inputText" size="2" maxlength="2"  name="MinCambio" onFocus="this.form.MinCambio.select()"> :
                                <input type="text" class="inputText" size="2" maxlength="2"  name="SegCambio" onFocus="this.form.SegCambio.select()">
                                <input type="hidden" name="HoraCambio" id="HoraCambio" value="">
                            </td> -->
                            <td colspan="4">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      	<%
                        	if (p24.equals("1")){
                      	%>
                        <tr>
                                  <td><br><font class="texto2">Fecha ventana: </font>
                                    <input type="text" class="inputText" class="inputText" size="10" maxlength="10"  name="FechaCambio" readonly>
                                    <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                                    </td>
                                  <td class="texto2"><br>Hora ventana:
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="HorCambio" onFocus="this.form.HorCambio.select()"> :
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="MinCambio" onFocus="this.form.MinCambio.select()"> :
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="SegCambio" onFocus="this.form.SegCambio.select()">
                                    <input type="hidden" name="HoraCambio" id="HoraCambio" value="">
                                  </td>
                                  <td><br><font class="texto2">Fecha SP del usuario: </font>
                                    <input type="text" class="inputText" class="inputText" size="10" maxlength="10"  name="fechaSolUsuario" readonly value="<%=fechaSolUsuario%>">
                                    <a href="javascript:calendario2.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                                </td>
                              </tr>
                          <%
                            } else {
                           %>
                             <tr>
                                  <td><br><font class="texto2">Fecha ventana: </font>
                                    <input type="text" class="inputText" class="inputText" size="10" maxlength="10"  name="FechaCambio" readonly>
                                    <a href="javascript:calendario1.popup();"><img src="images/calendar/cal.gif" width="16" height="16" border="0" alt="Calendario"></a>
                                    </td>
                                  <td class="texto2"><br>Hora ventana:
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="HorCambio" onFocus="this.form.HorCambio.select()"> :
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="MinCambio" onFocus="this.form.MinCambio.select()"> :
                                    <input type="text" class="inputText" size="2" maxlength="2"  name="SegCambio" onFocus="this.form.SegCambio.select()">
                                    <input type="hidden" name="HoraCambio" id="HoraCambio" value="">
                                  </td>
                              </tr>
                          <% }%>
                          </table>
                      </td>
                   </tr>

            <tr>
                <td colspan="4">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <%-- <%
                                if ((ull!= null && ull.equals("1")) || diferido)
                                {
                            %>
                            <td><font class="texto2">ULL </font><input type="checkbox" name="ULL" id="ULL"  checked onChange="habilitarULL();" <% if (diferido) { %> disabled="disabled" <% } %>></td>
                            <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14"></td>
                            <td><font class="texto2">Identificador de Proceso ULL</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21"></td>
                            <%
                            }
                            else
                            {
                            %>
                            <td><font class="texto2">ULL </font><input type="checkbox" name="ULL" id="ULL"  onChange="habilitarULL();"></td>
                            <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14" disabled></td>
                            <td><font class="texto2">Identificador de Proceso ULL</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21" disabled></td>
                            <%
                                }
                            %> --%>
                      <%
                            if (p24.equals("1")){
                            	if (ull!= null && ull.equals("1")){
                       %>
                         		<td><font class="texto2">Acceso mayorista </font>
                                <%-- <input type="checkbox" name="ULL" id="ULL" onChange="habilitarULL();" <% if (diferido) { %> disabled="disabled" <% } %>> --%>
                                <input type="checkbox" name="ULL" id="ULL" checked onChange="habilitarULL();">
                                </td>
                                <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14"></td>
                                <td><font class="texto2">Id acceso mayorista</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21"></td>
                      <%
                              	}else{
                      %>
                      			<td><font class="texto2">Acceso mayorista </font>
                                <%-- <input type="checkbox" name="ULL" id="ULL" onChange="habilitarULL();" <% if (diferido) { %> disabled="disabled" <% } %>> --%>
                                <input type="checkbox" name="ULL" id="ULL"  onChange="habilitarULL();">
                                </td>
                                <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14" disabled></td>
                                <td><font class="texto2">Id acceso mayorista</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21" disabled></td>
                      <%
                              	}
                        	} else {
                          		if ((ull!= null && ull.equals("1")) || diferido){
                      %>
                         	  <td><font class="texto2">ULL </font><input type="checkbox" name="ULL" id="ULL" checked onChange="habilitarULL();" <% if (diferido) { %> disabled="disabled" <% } %>></td>
                              <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14"></td>
                              <td><font class="texto2">Identificador de Proceso ULL</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21"></td>
                      <%
                              	}else{
                      %>
                              <td><font class="texto2">ULL </font><input type="checkbox" name="ULL" id="ULL"  onChange="habilitarULL();"></td>
                              <td><font class="texto2">N&ordm; Orden Administrativo</font> <input name="AdULL" id="AdULL" value="<%=adUll%>" type="text" size="14" maxlength="14" disabled></td>
                              <td><font class="texto2">Identificador de Proceso ULL</font> <input name="IdULL" id="IdULL" value="<%=idUll%>" type="text" size="21" maxlength="21" disabled></td>
                      <%
                      			}
                      		}
                      %>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="97"><font class="texto2">Remitente: </font></td>
                <td width="538"><font class="texto"><%=DescripcionRemitente%>-<%=remitente%></font>
                    <INPUT TYPE="hidden" name="OperadorConectado" value="<%=remitente%>">
                    <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>"> <INPUT TYPE="hidden" name="DescripcionRemitente" value="<%=DescripcionRemitente%>">
                    <INPUT TYPE="hidden" name="p24" id="p24" value="<%=p24%>">
                </td>
            </tr>
            <tr>
                <td><font class="texto2">Destinatario: </font></td>
                <td colspan="3">
                    <select class="inputText" name="Destinatario" >
                    <%
                    for (int i=0; i<numoperadores; i++)	{
                      OperadorBean oper= (OperadorBean) vops.elementAt(i);
                        String codigo = oper.getCodigo();
                        String descripcion = oper.getDescripcion();
                        if (!codigo.equals("00000")){
                          if (codigo.equals(destinatario)) {
                    %>
                        <option value="<%=codigo%>" selected="selected"><%=descripcion%>-<%=codigo%></option>
                    <%
                          } else {
                    %>
                        <option value="<%=codigo%>"><%=descripcion%>-<%=codigo%></option>
                    <%
                          }
                      }
                    }
                    %>
                    </select>
                </td>
            </tr>
            <%
            if (p24.equals("1")){
            %>
            <tr>
        		<td colspan="1"><font class="texto2">Revendedor receptor: </font></td>
           		<td colspan="5"><input type="text" class="inputText" class="inputText" size="80" maxlength="80" name="operRevRec" value="<%=operRevRec%>"></td>
		   	</tr>
		    <tr>
        		<td colspan="1"><font class="texto2">Revendedor donante: </font></td>
          		<td colspan="5"><input type="text" class="inputText" class="inputText" size="80" maxlength="80" id="revendedorDonante" name="operRevDon" value="<%=operRevDon%>"></td>
      		</tr>
     		<%
        	}
      		%>
            <tr>
                <td colspan="1"><font class="texto2">Observaciones: </font></td>
                <td colspan="5"><input type="text" class="inputText" class="inputText" size="80" maxlength="80" name="Observaciones" value="<%=observaciones%>"></td>
            </tr>
            <tr>
                <td colspan="6">
                    <table width="100%">
                        <tr>
                            <td><font class="texto2">Tipo de portabilidad: </font></td>
                            <td class="text"><select class="inputText"  name="TipoPortabilidad" id="TipoPortabilidad" onChange="compruebaTipoPortabilidad()">
                                <option value="01" <% if (tipoPortabilidad.equals("01")) {%> selected="selected" <%}%>>Acceso individual</option>
                                <option value="03" <% if (tipoPortabilidad.equals("03")) {%> selected="selected" <%}%>>Accesos m&uacute;ltiples</option>
                                <option value="04" <% if (tipoPortabilidad.equals("04")) {%> selected="selected" <%}%>>N&uacute;meros inteligentes</option>
                            </select>
                            </td>
                            <td><font class="texto2">Actuaci&oacute;n coordinada en planta externa: </font>
                                <input type="checkbox" name="ActCoordPE" <% if (actCoordinada) {%> checked="checked"" <% } %>>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="6"> <font class="texto2">Informaci&oacute;n tarifaria: </font>
                    <input type="text" class="inputText" class="inputText" size="65" maxlength="80" name="InfoTarif" value="<%=infoTarifaria%>"> </td>
            </tr>
            <tr>
                <td colspan="6" align="left">
                    <table border="0" cellspacing="0" cellpadding="2">
                        <tr>
                           <td>
                              <font class="texto2">Datos Persona Contacto</font>
                               <img align="middle" name="ocultar" onclick="mostrarOcultar(this);" border="0" height="13"
                               width="14" src="images/ocultar.gif" onMouseOver="mostrarAlt(this)"/>
                           </td>
                        </tr>
                        <tr id="filaContacto1" style="visibility:visible;">
                            <td><font class="texto2">Nombre Contacto: </font>
                                <input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="nombreContacto" value="<%=pc.getContacto()%>"> </td>
                            <td><font class="texto2">Email Contacto: </font>
                                <input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="emailContacto" value="<%=pc.getEmailContacto()%>"></td>
                        </tr>
                        <tr id="filaContacto2" style="visibility:visible;">
                            <td><font class="texto2">Tel&eacute;fono Contacto: </font>
                                <input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="telefContacto" value="<%=pc.getTfnoContacto()%>">
                            </td>
                            <td><font class="texto2">Fax Contacto: </font>
                                <input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="faxContacto" value="<%=pc.getFaxContacto()%>"> </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table width="100%" border="0">
                        <tr>
                            <td><font class="texto2">Portar numeraci&oacute;n asociada a n&uacute;mero de cabecera:</font>
                                <input type="checkbox" name="NumCompleta" <% if (!tipoPortabilidad.equals("03")) {%> disabled <%}%> onChange="compruebaTipoPortabilidad();" <% if (numCompleta) {%> checked="checked"" <%}%>></td>
                            <td><font class="texto2">N&uacute;mero de rangos a portar:</font>
                                <select class="inputText" name="num_rangos" id="num_rangos" onChange="sumarFilas();">
                          <%
                                for (int count = 1; count < 71; count++) {
                                  if (count == numRangos) {
                                 %>
                                    <option value="<%=count%>" selected="selected"><%=count%></option>
                                <%
                                  } else {
                                %>
                                    <option value="<%=count%>"><%=count%></option>
                                <%
                                  }
                                }
                                %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <table  border="1" class="tablas"  width="100%">
                        <tr  width="90%" align="center">
                            <th  align="center" class="bgCabeceraFila">Número inicial del rango</th>
                            <th  align="center" class="bgCabeceraFila">Número final del rango</th>
                            <th align="center" class="bgCabeceraFila">NRN</th >
                        </tr>
                        <TBODY id=cuerpoTablaRelacion >
                        <%

                        for (SolicitudesPendientesNumeracion numBean : rangos) {

                        %>
                        <tr width="90%">
                            <td align="center"><input type="text" class="inputText"  size="15" maxlength="15" name="NumInicialRango" id="inicioRango" value="<%=numBean.getInicioRango()%>"></td>
                            <td align="center"><input type="text" class="inputText"  size="15" maxlength="15" name="NumFinalRango" id="finalRango" value="<%=numBean.getFinalRango()%>"></td>
                            <td align="center">
                                <select class="inputText" name="NRN" id="nrn" onChange="bloqueaRangos();">
                                <%

                                    for (int i=0; i<numNrns; i++){
                                        NRNBean nrn= (NRNBean) vnrn.elementAt(i);
                                        String strNrn = nrn.getNrn();
                                        if (strNrn.equals(numBean.getNRN())) {

                                %>
                                    <option selected="selected" value="<%=strNrn%>"><%=strNrn%> </option>
                                <%

                                        } else {

                %>
                                    <option value="<%=strNrn%>"><%=strNrn%> </option>
                <%
                                        }
                                  }

                                %>
                                </select>
                            </td>
                        </tr>
                        <%

                        }

                        %>
                        </TBODY>
                    </table>
                </td>
            </tr>
        </table>
        <BR>
    </form>
</div>
<div align="center">
    <table border="0">
        <tr>
            <!-- <td><A HREF="javascript:TodoOk()//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"/></A></td> -->
            <%if (!ParametroBeanCollection.isPorta24Activo() && ParametroBeanCollection.isInhabilitaSolPortaActivo()) {%>
            	        <td><A HREF="javascript:alert('El envío de solicitudes está desactivado')//'" disabled = "disabled" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"/></A></td>
            <%} else {%>
                        <td><A HREF="javascript:TodoOk('<%=TESAU%>')//'" onMouseOver="window.status='Enviar';return true" onMouseOut="window.status=' '"><img src="images/Respue6.jpg" border="0" width="107" height="28"/></A></td>
            <%}%>
            <td><A HREF="javascript:history.back()" onMouseOver="window.status='Página Anterior';return true;" onMouseOut="window.status=' '"><img src="images/Back.jpg" border="0" width="107"  height="28"/></A></td>
        </tr>
    </table>
</div>
<!--script para tabla de numeracion-->
<script>
    <!--
    var numfilasRelacion=1;
    var form=document.theForm;
    var valorNRN="";

    function  sumaRelacion()	{

        var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");

        var fila = document.createElement("tr");
        var celda1 = document.createElement("td");
        var celda2 = document.createElement("td");
        var celda3 = document.createElement("td");


        numfilasRelacion=miTablaRelacion.getElementsByTagName("tr").length + 1 ;

        celda1.innerHTML = "<CENTER><input name='NumInicialRango' type='text' class='inputText' id='inicioRango' size='15'  maxlength='15'></CENTER>";
        celda2.innerHTML = "<CENTER><input name='NumFinalRango' type='text'  class='inputText'  id='finalRango' size='15'  maxlength='15'></CENTER>";
    <%
      StringBuffer tmpNrn = new StringBuffer("<CENTER><select class='inputText' name='NRN' id='nrn'>");

      for (int i=0;i<numNrns; i++) {
          NRNBean nrn= (NRNBean) vnrn.elementAt(i);
          String strNrn = nrn.getNrn();
          tmpNrn.append("<option value='"+strNrn+"'>"+strNrn+" </option>");
      }
      tmpNrn.append("</select></CENTER>");
    %>
        celda3.innerHTML = "<%=tmpNrn%>";

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
            numfilasRelacion=numfilasRelacion-1;
            i=i-1;
        }
        while (miTablaRelacion.rows.length != rangos)
    }

    function sumarFilas(){

        var miTablaRelacion = document.getElementById("cuerpoTablaRelacion");
        numfilasRelacion = miTablaRelacion.getElementsByTagName("tr").length ;

        var ok=compruebaNumeroRangos();
        var numfilas = numfilasRelacion;
        var rangos=	form.num_rangos.options[form.num_rangos.options.selectedIndex].value;

        if(rangos>numfilas){
            if(ok=="1"){
                rangos="1";
                form.num_rangos.value="1";
            }
            for(var i=0;i<rangos-numfilas;i++){
                sumaRelacion();
            }

        }else{
            restarFilas(rangos);
        }
        bloqueaRangos();
    }
    -->
</script>
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
    var calendario1 = new calendar1(document.theForm.FechaCambio);
    var p24 = document.getElementById("p24");
  	if(p24.value == '1') {
    	var calendario2 = new calendar1(document.theForm.fechaSolUsuario);
 	}
</script>
</body>
</html>
