<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<script type="text/javascript" src="js/ventana-modal-1.3.js"></script>
<script type="text/javascript" src="js/abrir-ventana-alertas.js"></script>
<link href="estilos/ventana-modal.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
  //Función que permite abrir el fichero de ayuda correspondiente a la página.
    function ayuda()
    {
        window.open('ayuda/' + p + '.htm', 'AYUDA','toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,scrollbars=yes,width=750');
    }
    function CambioOper()
    {
        f = document.formularioCabecera;
       	f.action = "CambioOperadorSesion";
        f.submit();
    }

</script>
  <!-- Fin Insercion de Cabecera -->

<table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="40%" align="left" class='celdalineaabajo' valign="center">
        <table border="0">
          <tr>
             <td align="right">
               <font class="texto3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message bundle="usersmodule" key="titulo.menu"/></font>&nbsp;&nbsp;&nbsp;
             </td>
         </tr>
         <tr>
            <%-- <td align="right">
               <a  href="javascript:ayuda()"><img src="${imagesURL}/help.gif" alt="Manual de usuario" border="0"></a>
             </td> --%>
         </tr>
      </table>
    </td>
    <td width="20%" class='celdalineaabajo' colspan="2" align="CENTER">
        <table>
            <tr><td align="center" ><img  src='images/portanode.png'  name='logotipo' ></td></tr>
            <tr><td align="center">
                  
            </td></tr>
        </table>
    </td>
    <td width="20%" align="right" class='celdalineaabajo' valign="center">
		</td>
  </tr>
  <tr height="20"></tr>
</table>
