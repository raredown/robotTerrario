<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Alta de Usuario</title>
    <META HTTP-EQUIV="expires" CONTENT="1">
    <script language="JavaScript" src="js/util.js"></script>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

    <%
        String subtitulo1 = new String("Mantenimiento de Usuarios");
         String usuario = (String)request.getAttribute("Usuario");
         Vector vOperadores = (Vector)request.getAttribute("vectorOperadores");
             int totalOperadores = vOperadores.size();
 %>

<SCRIPT Language="javascript">
<!--
function CrearJS()
{
   	var f = document.cambioUsuario;
		if (f.Usuario.value == ""){
       alert("El campo Usuario ha de estar informado");
			 return;
		}
		
        if(f.Password.value != f.ConfPassword.value)
        {
           alert("Introduzca y confirme de nuevo la Contraseña");
		   return;
        }
		if(f.Nombre.value == "" || f.Apellidos.value == ""){
			alert("Introduzca Nombre y Apellidos del nuevo usuario a Crear");
			return;
		}

        var total = <%=totalOperadores%>;
        for (j=0; j < total; j++)
        {
            if (dameCampo('chooseOpe',j).checked)
            {
                    f.OpeElegidos.value+=dameCampo('operador',j).value+"+";
            }
        }
        if (f.OpeElegidos.value == "")
        {
          alert("Ha de escoger al menos un operador para el usuario");
          return;
        }

  	f.submit();
}
function Navegar(nPagina){
       f = document.cambioUsuario;
	     f.Pagina.value = nPagina;
       f.action="ConsultaMensajes";
       f.submit();
}
//-->
</SCRIPT>


<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
  <%@ page import="java.util.Vector,
                   es.portanode.util.operadores.OperadorMultipleBean"%>

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
              <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Datos usuario:</DIV>

                <form action="CambioEnUsuario" method="POST" name="cambioUsuario">
                <center>
                <input type="hidden" name="Operacion" value="1">
                <input type="hidden" name="OpeElegidos"  value="">
                <table  border="0" width="90%">
                <tr>
                <td align="center">
                <BR>
                <table border="0" cellpadding="0" cellspacing="4">
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Usuario:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="10" maxlength="10" name="Usuario" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><b>Contrase&ntilde;a:</b></font></div></td>
                    <td><input type="password" size="15" maxlength="15" name="Password" value=""></td>
                </tr>
                <tr>
                    <td width="10%"><div align="right"><font class="texto2" size="3"><b>Confirma Contrase&ntilde;a:</b></font></div></td>
                    <td><input type="password" size="15" maxlength="15" name="ConfPassword" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Nombre:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="20" maxlength="80" name="Nombre" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Apellidos:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Apellidos" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Tel&eacute;fono:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Telefono" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Fax:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Fax" value=""></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>E-mail:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Mail" value=""></td>
                </tr>

                <tr>
                    <td><div align="right"><font class="texto2" size="3"><B>Perfil:&nbsp;</B></font></div></td>
                    <td class="text"><select class="inputText"  name="Perfil">
                            <option value="01">Rol de Administraci&oacute;n</option>
                             <option value="05">Rol de Consulta</option>
							 <option value="03">Rol de Tramitador Alta</option>
                             <option value="04">Rol de Tramitador Baja</option>
							 <option value="02">Rol de Soporte</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><div align="right"><font class="texto2" size="3"><B>Operadores:&nbsp;</B></font></div></td>
                    <td class="text"><table>
                        <%for (int j=0; j<totalOperadores;j++)
                        {
                             OperadorMultipleBean operator = (OperadorMultipleBean)vOperadores.elementAt(j);
                             String operador = operator.getCodigo();
                             String descripcionOperador = operator.getNombre();%>
                             <tr><td><INPUT type="checkbox" name="chooseOpe<%=j%>" value="Si"></td>
                                 <td class="texto2">
                                    <INPUT TYPE="hidden" name="operador<%=j%>" value="<%=operador%>" ><%=operador%>&nbsp;</td>
                                 <td class="texto2"><%=descripcionOperador%></td>
                             </tr>
                       <%}%>
                        </table>
                    </td>
                </tr>

                </table>

                <P>
                <table border="0" width="80%">
                <tr align="center">
                <td><a href="javascript:CrearJS()//'" onMouseOver="window.status='Crear Usuario';return true" onMouseOut="window.status=' '"><img src="images/Manten1.jpg" width="107" height="28" border="0"></a>
                    &nbsp;&nbsp;<a href="MantenimientoUsuarios" onMouseOver="window.status='Ir a la Página anterior';return true" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" height="28" border="0"></a>
                </td>
                </tr></table>
                </td></tr>
                </table></center>

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
