<html>
<head>
<title>Operador</title>
<META HTTP-EQUIV ="expires" CONTENT="1">
<script language="JavaScript" src="js/util.js"></script>
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
var check=999;
function asignar(num,operacion){
     f1 = document.theFormAlta;
     f2 = document.form1;
     f3= document.theFormModificacion;
     f4= document.theFormBaja;
   var mystr;
   var separator= "+";
     if (f2.seleccion.value == 1){
        if(num == 0){
        		// Vamos a ver si hay sólo un radio o es un array;
        		if (f2.radio.value!=null)
            	mystr = f2.radio.value;
            else
            	mystr = f2.radio[0].value;
        }else{
            mystr = f2.radio[num].value;
        }
     }
     else{
         mystr = f2.radio.value;
     }
     arrayStr = mystr.split(separator);

    if (operacion==1) {

    namehid =f1.elements[0].name;
    if (namehid.search("session") != -1){
	     for (i=0; i < arrayStr.length; i++)
	         f1.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < arrayStr.length; i++)
        	 f1.elements[i].value = arrayStr[i];
    }
    }else if (operacion==2) {
    namehid =f3.elements[0].name;
    if (namehid.search("session") != -1){
	     for (i=0; i < arrayStr.length; i++)
	         f3.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < arrayStr.length; i++)
        	 f3.elements[i].value = arrayStr[i];
    }
    }else if (operacion==3)  {

    namehid =f4.elements[0].name;
    if (namehid.search("session") != -1){
	     for (i=0; i < arrayStr.length; i++)
	         f4.elements[i+1].value = arrayStr[i];
    }
    else{
	     for (i=0; i < arrayStr.length; i++)
        	 f4.elements[i].value = arrayStr[i];
    }
   }
}

function Carga(num){
      f1 = document.theFormAlta;
      f2 = document.form1;
      f3= document.theFormModificacion;
      f4= document.theFormBaja;
      var formu=num;
      if (num == 1){
         f1.submit();
         return
      }
      if (check == "999"){
            alert("Ha de escoger una fila");
            return;
      }
      else{
         asignar(check,formu);
         if (num == 2){
            f3.submit();
         }
         if (num == 3){
            f4.submit();
         }
      }
}



function Navegar(nPagina){
       f = document.form1;
       f.Posicion.value = nPagina;
       f.action = "ConsultaOperadoresER.jsp";
       f.submit();
}



//-->
</SCRIPT>
<body leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%@ page import="java.util.Vector,
                 es.portanode.util.Padre"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
 <%
   String subtitulo1 = new String("Mantenimiento de operadores ER");


	String maxRows="100";
	//Varibles del navegador
	int Limite=10;
	int numprocesos=0;
	//String posurl = ((Integer)request.getAttribute("Posicion")).toString();
	String posurl = request.getParameter("Posicion");
	int posActual = (new Integer(posurl)).intValue();
 	int inici = (posActual-1)*Limite;
	//-----------------------------

	 String operador = (String) request.getParameter("OperadorConexion");
	

%>
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
             <DIV align=left class="Titulo">&nbsp;&nbsp;&nbsp;<img src="images/flecha.gif" border="0"/>Consulta operadores ER</DIV>

                <FORM METHOD=POST ACTION="PrevioMenuMantenimientoSistema" name="fback">
                <INPUT TYPE="hidden" name="OperadorConectado" value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="1">
                </FORM>

                <FORM action="AltaOperadorERJSP" method="POST" NAME="theFormAlta">
                <INPUT TYPE="hidden" name=codigo value="0">
                <INPUT TYPE="hidden" name=descripcion value="0">
                <INPUT TYPE="hidden" name=licencia value="0">
                <INPUT TYPE="hidden" name=comunidad value="0">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>" >
                <INPUT TYPE="hidden" name="Servlet">

                </FORM>
                <FORM action="ModificacionOperadorERJSP" method="POST" NAME="theFormModificacion">
                <INPUT TYPE="hidden" name=codigo value="0">
                <INPUT TYPE="hidden" name=descripcion value="0">
                <INPUT TYPE="hidden" name=licencia value="0">
                <INPUT TYPE="hidden" name=comunidad value="0">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=operador%>">
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>" >
                <INPUT TYPE="hidden" name="Servlet">

                </FORM>

                <FORM action="BajaOperadorERJSP" method="POST" NAME="theFormBaja">
                <INPUT TYPE="hidden" name=codigo value="0">
                <INPUT TYPE="hidden" name=descripcion value="0">
                <INPUT TYPE="hidden" name=licencia value="0">
                <INPUT TYPE="hidden" name=comunidad value="0">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>" >
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Servlet">

                </FORM>
                <table border="0" width="95%">
                <FORM method="POST" name="form1">
                <INPUT TYPE="hidden" name=OperadorConectado value="<%=operador%>">
                <INPUT TYPE="hidden" name="Posicion" value="<%=posurl%>" >
                <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
                <INPUT TYPE="hidden" name="Servlet">
                  <tr>
                    <td align="center">
                      <div align="center"><center>
                      <table  border="1" class="tablas" >
                        <tr>
                          <td class="bgCabeceraFila">&nbsp;</td>
                          <td width="20%" align="center" class="bgCabeceraFila">Código</td>
                          <td width="50%" align="center" class="bgCabeceraFila">Descripción</td>
                          <td width="15%" align="center" class="bgCabeceraFila">Licencia</td>
                          <td width="15%" align="center" class="bgCabeceraFila">&nbsp;Comunidad&nbsp;</td>
                        </tr>

                <%
                           String clase="";
                           int i=0;
                           String sql="";

                           Connection con=null;
                           Statement stm = null;
                           ResultSet rs=null;

                           try{

                             con = Padre.getConnection();
                             stm = con.createStatement();

                             sql="select count(*) from operador";

                             numprocesos =Padre.selectInt(con,sql);

                    if (numprocesos >= 1){
                       if (Limite > 1)
                       {
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="1">
                <%	   }else{
                %>
                        <INPUT TYPE="hidden" name="seleccion" value="0">
                <%	   }


                             int fin;
                             int fin2;
                             int fin1;

                             /*fin2=numprocesos - inici;
                             if (fin2 < Limite)
                                 fin1=0;
                                else
                             fin1=fin2-Limite;
                             */

                             fin1=inici;
                             if (fin1 + Limite >= numprocesos)
                                 fin2=numprocesos;
                                else
                             fin2=fin1 + Limite;

                             System.out.println("fin1 = " + fin1 + "    fin2 = " + fin2);


                             //sql="select * from (select codigo, descripcion, licencia, comunidad, ROWNUM AS R from operador order by codigo asc) where R >'" + fin1+ "' and R <= '" + fin2 + "'";
                
                			sql = "select * from (" + 
                						"select a.*, rownum as R from (" +
                							"select codigo, descripcion, licencia, comunidad " + 
                							"from operador order by codigo asc) a " + 
                						"where rownum <= '" + fin2 + "') " + 
                					"where R > '" + fin1+ "'";

                            System.out.println("La sentencia ejecutada es :" + sql);

                             String codigo="";
                             String descripcion="";
                             String licencia="";
                             String comunidad="";


                             rs=stm.executeQuery(sql);

                             int index = 999;

                         while(rs.next())
                         {



                        if (index==999)
                            index=0;

                        codigo=rs.getString("codigo");
                        descripcion= rs.getString("descripcion");
                        licencia=rs.getString("licencia");
                        comunidad=rs.getString("comunidad");
                         if((i%2)==0)
                            clase="";
                        else
                            clase="bgFila";

                %>

                      <tr>
                        <td align="center" class="<%=clase%>"><input type="radio" name="radio" value="<%=codigo%>+<%=descripcion%>+<%=licencia%>+<%=comunidad%>" onClick="javascript:check=<%=index%>"></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=codigo%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=descripcion%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=licencia%></font></td>
                        <td align="center" class="<%=clase%>"><font class="texto2"><%=comunidad%></font></td>
                      </tr>
                <%
                    index ++;
                    i++;
                    }
                    }
                %>
                <%
                   }catch(Exception e){
                        System.out.println("Error al obtener los datos: "+e);
                   }finally {
                        try {
                                if (rs != null){
                                        rs.close();
                                        rs=null;
                                    }


                                    if (stm != null){
                                            stm.close();
                                            stm=null;
                                        }

                                        if (con != null){
                                        if(!con.isClosed())
                                           con.close();
                                        con=null;
                                        }
                                } catch (Exception e) {
                                        System.err.println("Error al cerrar Conexion: "+e);
                                }
                   }


                %>
                </FORM>
                </table>
                <!--
                    Calling Navegador.jsp
                -->

                <jsp:include page="/NavegadorJSP" flush="true">
                    <jsp:param name="Limit" value="<%=Limite%>" />
                    <jsp:param name="Total" value="<%=numprocesos%>" />
                    <jsp:param name="ActualLink" value="<%=posActual%>" />
                    <jsp:param name="DirectURL" value="javascript:Navegar(" />
                </jsp:include>

                    </center></div></td>
                  </tr>
                </table>
                </center></div><div align="center"><center>
                <BR>
                <table border="0">
                  <tr>
                    <td><a href="javascript:Carga(1)//'" onMouseOver="window.status='Alta Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten1.jpg" border="0" WIDTH="107" HEIGHT="28"></a><td>

                <%
                    if (numprocesos==0){
                %>
                  <td><A HREF="javascript:/*'*/void(alert('No hay ningun operador a modificar'))"
                   onMouseOver="window.status='Modificar Operador';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten2.jpg" border="0" width="107" height="28"></A></td>
                   <td><A HREF="javascript:/*'*/void(alert('No hay ningun operador para dar de baja'))"
                   onMouseOver="window.status='Baja Operador';return true" onMouseOut="window.status=' '"><img
                   src="images/Manten3.jpg" border="0" width="107" height="28"></A></td>
                <%
                        }
                        else{
                %>
                <td><a href="javascript:Carga(2)//'" onMouseOver="window.status='Modificar Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten2.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                <td><a href="javascript:Carga(3)//'" onMouseOver="window.status='Baja Operador';return true;" onMouseOver="window.status=' '"><img src="images/Manten3.jpg" border="0" WIDTH="107" HEIGHT="28"></a></td>
                </tr>
                <%
                        }
                %>
                </table>
                <P>
                <table border=0>
                </tr>
                <td><A HREF="javascript:history.back()//'" onMouseOver="window.status='Página Anterior';return true;" onMouseOver="window.status=' '"><img src="images/Back.jpg" border="0" width="107" height="28"></A></td>
                  </tr>
                </table>
                </center></div>
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



