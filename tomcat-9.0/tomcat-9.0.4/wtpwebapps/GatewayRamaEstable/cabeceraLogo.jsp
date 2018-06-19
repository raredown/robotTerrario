<%@ page import="java.util.Vector,
                 java.util.Enumeration,
                 es.gateway.sesiones.obj.Grupo,
                 es.portanode.util.Singleton,
                 es.portanode.util.operadores.OperadorMultipleBeanCollection,
                 es.portanode.util.operadores.OperadorMultipleBean,
                 es.portanode.util.html.SesionConectada"%><!-- Insercion de Cabecera -->
<jsp:include page="/ComprobarSesion"/>
  <%

      SesionConectada cs2 = new SesionConectada(request);
      String operadorSesion = cs2.GetOperador();
      System.out.println("cabeceraLogo: oper sera "+cs2.GetOperador());

      String imagen = operadorSesion;
      if(imagen==null)
      {
        imagen = (String) request.getAttribute("OperadorConexion");
      }
      if(imagen==null)
      {
         imagen = (String) request.getAttribute("OperadorConectado");
      }
      if(imagen==null)
      {
          imagen="";
      }

      /*
        String imagen = (String) request.getAttribute("OperadorConexion");
        if(imagen==null) imagen = (String) request.getAttribute("OperadorConectado");
        if(imagen==null)  imagen="";
        */
    String logo = "";
    if ((imagen==null)||(imagen.equals(""))){
       logo = "<img src='images/telefono.jpg' name='logotipo' width='90' height='56'>";
    }
    else{
       logo = "<img src='images/"+imagen+".gif' name='logotipo' ALT='Operador' height='56'>";
    }
    boolean isAdmin = false;
    String esAdmin=(String)request.getAttribute("isAdmin");
    if ("true".equals(esAdmin)){
      isAdmin = true;
    }
    String nombreServlet = getServletConfig().getServletName();


      String usuarioCabecera = cs2.GetSuserId();
      System.out.println(usuarioCabecera);
      OperadorMultipleBeanCollection mOperadoresCabecera = new OperadorMultipleBeanCollection (null,usuarioCabecera );
      Vector vOperadoresCabecera = mOperadoresCabecera.getMultiOperador ( );
      int totalOperadoresCabecera = vOperadoresCabecera.size();

      Vector vGrupos = (Vector)session.getAttribute("grupos");
      String grupoActivo = (String)session.getAttribute("grupoActivo");      

  %>
<script type="text/javascript" src="js/ventana-modal-1.3.js"></script>
<script type="text/javascript" src="js/abrir-ventana-alertas.js"></script>
<link href="estilos/ventana-modal.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
    //Función que permite abrir el fichero de ayuda correspondiente a la página.
    function ayuda()
    {
        var p = '<%=nombreServlet%>';
        window.open('ayuda/' + p + '.htm', 'AYUDA', 'toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=yes,width=750');
    }
    function CambioOper()
    {
        f = document.formularioCabecera;
        f.action = "CambioOperadorSesion";
        f.submit();
    }
    
    function CambioGrupo(){
        f = document.formularioCabecera;
        f.action = "CambioGrupoSesion";
        f.submit();
    }

</script>
<!-- Fin Insercion de Cabecera -->

<table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="40%" class='celdalineaabajo'><%=logo%></td>
    <td width="20%" class='celdalineaabajo' colspan="2" align="center">
        <table>
            <tr><td align="center"><img src='images/portanode.png' name='logotipo' ALT='Operador'></td></tr>
           	<tr><td>&nbsp;</td></tr>
        </table>
    </td>
    <td width="40%" align="right" class='celdalineaabajo' valign="center">
      <table border="0">
       <tr>
         <td align="right">
<%--            <font class="texto3"><%=subtitulo1%></font>&nbsp;&nbsp;&nbsp; --%>
			<font class="texto3">subtitulo1</font>&nbsp;&nbsp;&nbsp;
         </td>
       </tr>
       <tr>
         <td align="right">
           <a  href="javascript:ayuda()"><img src="images/help.gif" alt="Manual de usuario" border="0"></a>
         </td>
       </tr>
      </table>
    </td>
  </tr>
</table>