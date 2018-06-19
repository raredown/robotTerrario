<HTML>
<HEAD>
<TITLE>Test conexiones</TITLE>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@ page import="java.util.Vector"%>
<%	
	String salida = (String) request.getAttribute("Resultado");
	String nFirewall = (String) request.getAttribute("NEjbs");
    String nEjbs = (String) request.getAttribute("NFirewall");
%><font class="texto3"> TEST CONEXIONES ABIERTAS </font>
<P>
<TABLE BORDER="0" WIDTH="50%">
<FORM METHOD=GET NAME="NumConexion" ACTION="TestConexiones">
<INPUT TYPE="hidden" name="TipoConexion">
<TR>
<TD class="texto2">Nº Conexiones Locales (firewall): </TD>
<TD><input type="text" class="inputText" class="inputText" NAME="conFirewall" size="4" maxlength="4" value="<%=nFirewall%>"></TD>
<TD><INPUT TYPE="button" NAME="fire" VALUE="GO!" onClick="this.form.TipoConnexion.value='1'"></TD>
</TR>
<TR>
<TD class="texto2">Nº Conexiones Globales (Ejb´s): </TD>
<TD><input type="text" class="inputText" class="inputText" NAME="conEjb" size="4" maxlength="4" value="<%=nEjbs%>"></TD>
<TD><INPUT TYPE="button" NAME="global" VALUE="GO!" onClick="this.form.TipoConnexion.value='2'"></TD>
</TR>
<tr>
<td></td>
</tr>
<tr>
<td><I>Aqui </I><%=salida%></td>
</tr>
</FORM>
</TABLE>
</BODY>
