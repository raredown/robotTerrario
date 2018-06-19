<html>

<head>
<title>Prueba Proceso7: Enviar SNP</title>
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>


	<%@ page import="java.util.Vector"%>

	<%	
		String tipoMensaje = "SNP";
		String idMensaje = (String)request.getAttribute("idMensaje"); if (idMensaje==null) idMensaje="";
		String observaciones = (String)request.getAttribute("observaciones"); if (observaciones==null) observaciones="";
		String idProceso = (String)request.getAttribute("idProceso"); if (idProceso==null) idProceso="";
		String Adquisicion = (String)request.getAttribute("Adquisicion"); if (Adquisicion==null) Adquisicion="";
		String Rango1 = (String)request.getAttribute("Rango1"); if (Rango1==null) Rango1="";
		String Rango2 = (String)request.getAttribute("Rango2"); if (Rango2==null) Rango2="";
		String SelAdq[]={"","",""};
		try {
			SelAdq[Integer.parseInt(Adquisicion)]="selected";
		} catch (Exception e) {}

	%>
	<%
		
		String Subtitulo1="Prueba proceso 7 (Adq.Info): Envio SNP";

	%>

<%@ include file="/CabeceraLogo.jsp"%>



<form action="TestProceso7" method="post" name="theForm">
  <div align="center"><center><table  border="1" class="tablas" width="100%">
    <tr>
      <th bgcolor="#FFFFFF"><nobr>Cabecera del mensaje</nobr></th>
    </tr>
    <tr>
      <td><table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100%"><table border="0" cellspacing="0" cellpadding="1">
            <tr>
              <td width="140">Identificador Mensaje:</td>
              <td align="left"><input type="hidden" name="tipoMensaje" value= "<%= tipoMensaje %>"></td>
              <td align="left"><input type="text" class="inputText" class="inputText" name="idMensaje" value= "<%= idMensaje %>" size="21" maxlength="20" onFocus="this.form.T1.select()"></td>
            </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td><table border="0" width="100%" cellspacing="0" cellpadding="1">
            <tr>
              <td class="texto2">Operador Destinatario:</td>
              <td class="texto"><select class="inputText"  size="1" name="Destinatario:">
                  <option value="00000">Entidad Referencia</option>
              </select></td>
            </tr>
          </table>
          </td>
        </tr>
        <tr>
          <td><table border="0" width="100%" cellspacing="0" cellpadding="1">
            <tr>
              <td class="texto2">Observaciones:</td>
              <td><input type="text" class="inputText" class="inputText" name="observaciones" value="<%= observaciones %>" size="60" maxlength="80" onFocus="this.form.T2.select()"></td>
            </tr>
          </table>
          </td>
        </tr>
      </table>
      </td>
    </tr>
        <tr>
      <th bgcolor="#FFFFFF">Datos solicitud</th>
    </tr>
    <tr>
      <td><table border="0" width="100%" cellspacing="0" cellpadding="1">
        <tr>
          <td width="300" class="texto2">Nº Ident.Proceso: <input type="text" class="inputText" class="inputText" size="20" name="idProceso" value="<%= idProceso %>" maxlength="20" onFocus="this.form.idProceso.select()"></td>
        </tr>
      </table>
      </td>
    </tr>
    <tr>
      <td><table border="0" width="100%" cellspacing="0" cellpadding="1">
        <tr>
          <td class="texto2">Tipo de adquisici&oacute;n: &nbsp;&nbsp;
            <select class="inputText" size="1" name="Adquisicion">
              <option value="*"></option>
              <option <%= SelAdq[0] %> value="0">Adquisici&oacute;n sin rango</option>
              <option <%= SelAdq[1] %> value="1">Adquisici&oacute;n por rango de fechas</option>
              <option <%= SelAdq[2] %> value="2">Adquisici&oacute;n por rango de n&uacute;meros de abonado</option>   
           </select></td>
        </tr>
        <tr>
           <td align="left" class="texto2">Rango de <input type="text" class="inputText" class="inputText" size="15" name="Rango1" value="<%= Rango1 %>" maxlength="15" onFocus="this.form.Rango1.select()"> a <input type="text" class="inputText" class="inputText" size="15" name="Rango2" value="<%= Rango2 %>" maxlength="15" onFocus="this.form.Rango2.select()"></td>
         </tr>
        </table>
      </td>
    </tr>  
 </table>
 </td>
 </tr>
</table>
</center></div><div align="center"><center><p><input type="submit" value="Enviar"> </p>
</center></div>
</form>
</nobr>
</body>
</html>
