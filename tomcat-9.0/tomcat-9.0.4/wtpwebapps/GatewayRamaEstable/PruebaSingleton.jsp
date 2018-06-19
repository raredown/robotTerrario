<%@ page import="es.portanode.util.Singleton"%>
<%@ page import="java.util.ArrayList"%>
<%
    Singleton sing = Singleton.getInstance();
    ArrayList opCodigo = sing.getOpCodigo();
    ArrayList opDesc = sing.getOpDescripcion();
    ArrayList opLicencia = sing.getOpLicencia();
    ArrayList opComunidad = sing.getOpComunidad();
    ArrayList mopCodigo = sing.getMopCodigo();
    ArrayList mopDesc = sing.getMopDescripcion();
    ArrayList mopEstado = sing.getMopEstado();
    ArrayList provCodigo = sing.getProvCodigo();
    ArrayList provDesc = sing.getProvDescripcion();
    ArrayList provComunidad = sing.getProvComunidad();
%>
<html>
<head><title>JSP Page</title><script language="JavaScript" src="js/util.js"></script><link href="estilos/estilos.css" rel="stylesheet" type="text/css"> </head>
<body>

    <table align="center" border="0" cellspacing="1" cellpadding="1" bgcolor="black">
        <tr>
            <td bgcolor="white" colspan="4" align="center"><h2>OPERADORES</h2></td>
        </tr>
        <tr>
            <th bgcolor="white" align="center">CODIGO</th>
            <th bgcolor="white" align="center">DESCRIPCION</th>
            <th bgcolor="white" align="center">LICENCIA</th>
            <th bgcolor="white" align="center">COMUNIDAD</th>
        </tr>
    <%
        for (int op = 0; op < opCodigo.size(); op++){
    %>
        <tr>
            <td bgcolor="white" align="right"><%=opCodigo.get(op)%></td>
            <td bgcolor="white" align="left"><%=opDesc.get(op)%></td>
            <td bgcolor="white" align="left"><%=opLicencia.get(op)%></td>
            <td bgcolor="white" align="left"><%=opComunidad.get(op)%></td>
        </tr>
    <%
        }
    %>
    </table>
    <br/>
    <table align="center" border="0" cellspacing="1" cellpadding="1" bgcolor="black">
        <tr>
            <td bgcolor="white" colspan="3" align="center"><h2>MULTI OPERADORES</h2></td>
        </tr>
        <tr>
            <th bgcolor="white" align="center">CODIGO</th>
            <th bgcolor="white" align="center">DESCRIPCION</th>
            <th bgcolor="white" align="center">ESTADO</th>
        </tr>
    <%
        for (int mop = 0; mop < mopCodigo.size(); mop++){
    %>
        <tr>
            <td bgcolor="white" align="right"><%=mopCodigo.get(mop)%></td>
            <td bgcolor="white" align="left"><%=mopDesc.get(mop)%></td>
            <td bgcolor="white" align="left"><%=mopEstado.get(mop)%></td>
        </tr>
    <%
        }
    %>
    </table>
    <br/>
    <table align="center" border="0" cellspacing="1" cellpadding="1" bgcolor="black">
        <tr>
            <td bgcolor="white" colspan="3" align="center"><h2>PROVINCIAS</h2></td>
        </tr>
        <tr>
            <th bgcolor="white" align="center">CODIGO</th>
            <th bgcolor="white" align="center">DESCRIPCION</th>
            <th bgcolor="white" align="center">COMUNIDAD</th>
        </tr>
    <%
        for (int prov = 0; prov < provCodigo.size(); prov++){
    %>
        <tr>
            <td bgcolor="white" align="right"><%=provCodigo.get(prov)%></td>
            <td bgcolor="white" align="left"><%=provDesc.get(prov)%></td>
            <td bgcolor="white" align="left"><%=provComunidad.get(prov)%></td>
        </tr>
    <%
        }
    %>
    </table>
    <br/>
</body>
</html>
