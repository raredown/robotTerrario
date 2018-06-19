<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Modificación de Usuario</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

      <%@ page import="es.portanode.util.usuarios.UsuarioBean"%>
      <%@ page import="es.portanode.util.operadores.OperadorMultipleBean"%>
      <%@ page import="java.util.Vector"%>
      <!-- Insercion de Cabecera -->
      <%
    String subtitulo1 = new String("Mantenimiento de Usuarios");

     String usuario = (String)request.getAttribute("Usuario"); //Es el usuario conectado a la aplicacion
		 UsuarioBean user = (UsuarioBean)request.getAttribute("ObjUser");
     Vector vOperadores = (Vector)request.getAttribute("vectorOperadores");
		 int totalOperadores = vOperadores.size();
  %>

      <SCRIPT Language="javascript">
      <!--
        function CrearJS()
      {

              var f = document.cambioUsuario;
              if(f.Password.value != f.ConfPassword.value)
              {
                 alert("Introduzca y confirme de nuevo la Contraseña");
                 return;
              }
              var total = <%=totalOperadores%>;

              for (j=0; j < total; j++)
              {
                  if (dameCampo('chooseOpe',j).checked)
                  {
                          var aux = dameCampo('operador',j).value;

                          f.OpeElegidos.value += aux + "+";
                  }
              }

             f.submit();
      }
      -->
      </script>


 <%@include file="cabeceraLogo.jsp"%>
      <script language="JavaScript">
      var totalHeight=window.screen.availHeight - 211;
      var tabla="<table width='100%' height='" + totalHeight + "' border='0' cellpadding='0' cellspacing='0'>";
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Modificación usuarios</DIV>

                  <form action="CambioEnUsuario" method="POST" name="cambioUsuario">
                  <input type="hidden" name="OpeElegidos"  value="">
                  <input type="hidden" name="Operacion" value="2">
                    <table  border="0" width="90%" align="center">
                    <tr>
                      <td align="center" bgclass="texto2">
                      <BR>
                      <table border="0" cellspacing="4">
                      <tr>
                        <td><div align="right"><font class="texto2" size="3"><B>Usuario:</B></font></div></td>
                        <td><font class="texto" size="3"><%=user.getUsuario()%></font><input type="hidden" name="Usuario" value="<%=user.getUsuario()%>"></td>
                      </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><b>Contrase&ntilde;a:*&nbsp;</b></font></div></td>
                    <td><input type="password" size="15" maxlength="15" name="Password" value=""></td>
                </tr>
                 <tr>
                    <td width="10%"><div align="right"><font class="texto2" size="3"><b>Confirma Contrase&ntilde;a:</b></font></div></td>
                    <td><input type="password" size="15" maxlength="15" name="ConfPassword" value=""></td>
                 </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Nombre:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="30" maxlength="80" name="Nombre" value="<%=user.getNombre()%>"></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Apellidos:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Apellidos" value="<%=user.getApellidos()%>"></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Tel&eacute;fono</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Telefono" value="<%=user.getTelefono()%>"></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>Fax:</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="15" maxlength="15" name="Fax" value="<%=user.getFax()%>"></td>
                </tr>
                <tr>
                  <td width="10%"><div align="right"><font class="texto2" size="3"><B>E-mail</B></font></div></td>
                    <td><input type="text" class="inputText" class="inputText" size="40" maxlength="80" name="Mail" value="<%=user.getEmail()%>"></td>
                </tr>

                    <tr>
                      <td><div align="right"><font class="texto2" size="3"><B>Perfil:&nbsp;</B></font></div></td>
                      <td class="text"><select class="inputText"  name="Perfil">
                             <option value="01" <%if(user.getPerfil().equals("01")){out.print("selected");}%>>Rol de Administraci&oacute;n</option>
                             <option value="05" <%if(user.getPerfil().equals("05")){out.print("selected");}%>>Rol de Consulta</option>
							 <option value="03" <%if(user.getPerfil().equals("03")){out.print("selected");}%>>Rol de Tramitador Alta</option>
                             <option value="04" <%if(user.getPerfil().equals("04")){out.print("selected");}%>>Rol de Tramitador Baja</option>
							 <option value="02" <%if(user.getPerfil().equals("02")){out.print("selected");}%>>Rol de Soporte</option>
                      </select></td>
                    </tr>
                          <tr>
                            <td><div align="right"><font class="texto2" size="3"><B>Operadores:&nbsp;</B></font></div></td>
                            <td class="text"><table>
                        <%for (int j=0; j<totalOperadores;j++)
                              {
                                   OperadorMultipleBean operator = (OperadorMultipleBean)vOperadores.elementAt(j);
                                   String operador = operator.getCodigo();
                                   String descripcionOperador = operator.getNombre();
                                   String aux = "chooseOpe"+j;
                        %>

                                   <tr><td>
                                   <%if(user.isOperador(operador)) {
                                              out.print("<INPUT type='checkbox' name='" + aux + "' value='' checked='true'></td>");
                                         }else {
                                               out.print("<INPUT type='checkbox' name='"+aux+"' value=''  ></td>");
                                         }%>
                                       <td class="texto2">
                                          <INPUT TYPE="hidden" name="operador<%=j%>" value="<%=operador%>" ><%=operador%>&nbsp;</td>
                                       <td class="texto2"><%=descripcionOperador%></td>
                                   </tr>
                       <%}%>
                              </table>
                          </td>
                          </tr>
                  </table>
                <p align="center"><font class="textoRojo">*: <strong>Si No introduce ninguna contraseña, se conservar&aacute; la actual</strong></font></p>
                  <P>
                      <table border="0" width="80%">
                        <tr>
                          <td align="center"><a href="javascript:CrearJS()//'" onMouseOver="window.status='Modificar Usuario';return true" onMouseOut="window.status=' '"><img src="images/Aceptar.jpg" width="107" height="28" border="0"></a>&nbsp;&nbsp;<a href="MantenimientoUsuarios" onMouseOver="window.status='Ir a la Página anterior';return true" onMouseOut="window.status=' '"><img src="images/Back.jpg" width="107" height="28" border="0"></a></td>
                        </tr>
                      </table>
                  </td>
                 </tr>
                </table>
                </form>

                </center>
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