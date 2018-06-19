<html>

<head>
<title>TEST: Simulación envío de mensajes desde la ER</title>
<script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>

<body>


	<%@ page import="java.util.Vector"%>

	<%	
		Vector NombresCampos = (Vector)request.getAttribute("NombresCampos");
		String TipoMensaje = (String) request.getAttribute("TipoMensaje");
		Vector TiposMensajes = (Vector)request.getAttribute("TiposMensajes");
		String Resultado = (String) request.getAttribute("Resultado");
		String churro = (String) request.getAttribute("Churro");
		if (NombresCampos==null) NombresCampos= new Vector();
		if (TipoMensaje==null) TipoMensaje="";
		if (TiposMensajes==null) TiposMensajes= new Vector();
		if (Resultado==null) Resultado="";
		if (churro==null) churro="";
	%>
	<%
		
		String titulo="Simulación envío mensajes desde ER";

	%>

<small><small>
<pre>
<%=Resultado%>
</pre>
</small></small>
<form action="TestEnviar" method="post" name="theForm">
  <div align="center"><center><table  border="1" class="tablas" width="100%">
</table>
</center></div>
<div align="center"><center>
<p>
<small><small>Churro del último mensaje:&nbsp;<input type="text" class="inputText" class="inputText" name="Churro" size="80" value="<%=churro%>">
</small></small>
</p>
<p>
Operador que ha de tratar el mensaje:&nbsp;<input type="text" class="inputText" class="inputText" name="OperadorTratante" size="21">
</p>
<p>IdInterno (para tratar mensaje de BD):&nbsp;<input type="text" class="inputText" class="inputText" name="IdInterno" size="21">
&nbsp;&nbsp;&nbsp;
</p>
<small><small>
<%
		for (int j=0; j<NombresCampos.size(); j++) {
			String nombreCampo=(String)NombresCampos.elementAt(j);
%>
		<%=nombreCampo%>:&nbsp;<input type="text" class="inputText" class="inputText" name="<%=nombreCampo%>" size="21">
<%
		}
%>

</small></small><p>Siguiente mensaje: <select class="inputText" NAME="TipoMensaje">
<%	
	if (TiposMensajes.size()==0) {
%>
		<option value="NADA">Pulsa el botón para empezar</option>
<%
	} else {
		for (int i=0; i<TiposMensajes.size(); i++) {
			String tipo=(String)TiposMensajes.elementAt(i);
			if (tipo.equals(TipoMensaje)) {
%>
		<option selected value="<%=tipo%>"><%=tipo%></option>

<%			} else {
%>
		<option value="<%=tipo%>"><%=tipo%></option>

<%			}
		}
	}
%>
</select></p>
<p><input type="submit" value="Enviar"></p>
</center></div>
</form>
</nobr>
</body>
</html>
