<html>
<head><title>Rangos</title><script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
    <body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
        <%@ page import="java.util.*"%>
        <%@ page import="java.io.*"%>
<%
	String m_NRN = (String) request.getParameter("NRN");
	String m_NIR = (String) request.getParameter("NIR");
	String m_NFR = (String) request.getParameter("NFR");
        
        Vector v_NRN = new Vector();        
        
        if ((m_NRN!=null) && (m_NRN.length()>2))
            {
                StringTokenizer st_NRN = new StringTokenizer(m_NRN,",");
                while (st_NRN.hasMoreTokens()) {
                    v_NRN.add(st_NRN.nextToken());
                }
            }

        Vector v_NIR = new Vector();        
	StringTokenizer st_NIR = new StringTokenizer(m_NIR,",");
        while (st_NIR.hasMoreTokens()) {
            v_NIR.add(st_NIR.nextToken());
        }

        Vector v_NFR = new Vector();        
	StringTokenizer st_NFR = new StringTokenizer(m_NFR,",");
        while (st_NFR.hasMoreTokens()) {
            v_NFR.add(st_NFR.nextToken());
        }
        
        if (v_NRN.size()>0)
            {
%>
        <table  border="1" class="tablas" align="center">
            <tr>
                <td class="bgCabeceraFila" align="center"><font class="texto2"><small>NRN</small></font></td>
                <td class="bgCabeceraFila" align="center" NOWRAP><font class="texto2"><small>Inicio Rango</small></font></td>
                <td class="bgCabeceraFila" align="center" NOWRAP><font class="texto2"><small>Final Rango</small></font></td>
            </tr>
<%
        for (int i=0; i< v_NRN.size(); i++)
        {
            %>
            <tr>
                <td align="center" class="texto"><small><%=v_NRN.elementAt(i).toString()%></small></td>
                <td align="center" class="texto"><small><%=v_NIR.elementAt(i).toString()%></small></td>
                <td align="center" class="texto"><small><%=v_NFR.elementAt(i).toString()%></small></td>
            </tr>
            <%
        }
        }
        else
            {
%>
        <table  border="1" class="tablas" align="center" >
            <tr>
                <td  NOWRAP><font class="texto2"><small>Inicio Rango</small></font></td>
                <td  NOWRAP><font class="texto2"><small>Final Rango</small></font></td>
            </tr>
<%
        for (int i=0; i< v_NIR.size(); i++)
        {
            %>
            <tr>
                <td align="center" class="texto"><small><%=v_NIR.elementAt(i).toString()%></small></td>
                <td align="center" class="texto"><small><%=v_NFR.elementAt(i).toString()%></small></td>
            </tr>
            <%
        }
}
%>
        </table>     
    </body>
</html>
