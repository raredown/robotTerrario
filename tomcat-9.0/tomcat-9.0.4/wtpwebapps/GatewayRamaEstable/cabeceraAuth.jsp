<%@ page import="es.portanode.util.Singleton"%><!-- Insercion de Cabecera -->
  <%
    String imagen = (String) request.getAttribute("OperadorConexion");
    if(imagen==null) imagen = (String) request.getAttribute("OperadorConectado");
    if(imagen==null)  imagen="";
    String logo = "";
    if (imagen.equals("")){
       logo = "<img src='images/telefono.jpg' name='logotipo' width='90' height='56'>";
    }
    else{
       logo = "<img src='images/"+imagen+".gif' name='logotipo' ALT='Operador' width='161' height='56'>";
    }
  %>
  <!-- Fin Insercion de Cabecera -->
<table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class='celdalineaabajo'><%=logo%></td>
    <td class='celdalineaabajo' colspan="2" align="center">
      <img src='images/portanode.png' name='logotipo' ALT='Operador'>
    </td>
    <td align="right" class='celdalineaabajo'>
      <font class="texto3"><%=subtitulo1%></font>&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
</table>