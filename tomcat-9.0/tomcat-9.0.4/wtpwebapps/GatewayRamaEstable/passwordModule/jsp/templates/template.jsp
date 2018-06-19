<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 * Alta
 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>

<%@page import="es.gateway.sesiones.perfiles.dao.PerfilesDAOImpl"%>
<%@page import="es.gateway.dao.DAOFactory"%>
<%@page import="es.gateway.sesiones.perfiles.dao.PerfilesDAO"%>
<%@page import="java.util.List"%>
<script language="javaScript" src="passwordModule/jscripts/template.js"></script>
<script type="text/javascript">
function solonumeros(evt){
	var nav4 = window.Event ? true : false;
	var key = nav4 ? evt.which : evt.keyCode;
	return (key <= 13 || (key >= 48 && key <= 57));
}
function solonumerosynegativo(evt, objeto){
	var pos = objeto.value.indexOf("-",-1);
	var nav4 = window.Event ? true : false;
	var key = nav4 ? evt.which : evt.keyCode;
	if (key == 45 && pos==-1 && objeto.value.length == 0)
		return true;
	else
		return (key <= 13 || (key >= 48 && key <= 57));
}
</script>

    <form name="templateForm" method="post" action="template.do" onSubmit="return templatefunction()">

        <div align=center><bean:message bundle="usersmodule" key="templates.ui.screen.template.title" /> </div>
        <br/><br/>
        <TABLE align=center>

            <TR>
                <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.templateName"/></TD>
                <TD class="texto"><input type="text" maxlength="40" name="templateName" value='<logic:notEmpty name="templateForm" property="templateName"><bean:write name="templateForm" property="templateName"/></logic:notEmpty>'/><logic:notEmpty name="templateForm" property="templateName"> El nombre '<bean:write name="templateForm" property="templateName"/>' ya existe.</logic:notEmpty></TD>
            </TR>

            <TR>
                <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.description"/></TD>
                <TD class="texto"><textarea maxlength="512" name="description" ><logic:notEmpty name="templateForm" property="description"><bean:write name="templateForm" property="description"/></logic:notEmpty></textarea></TD>
            </TR>
            <TR>
                <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.usertype"/></TD>
                <TD class="texto"><select    name="userType"  class="bgFila2"/>
				<%@ page import="es.gateway.sesiones.obj.Perfil,java.util.Vector" %>
<%
					List<Perfil> vPerfiles=(List<Perfil>) request.getAttribute("vectorPerfiles");
					int totalPerfiles = 0;	
					if (vPerfiles==null) {
						DAOFactory fac=DAOFactory.getDAOFactory(DAOFactory.TiposBD.SQL);;
						PerfilesDAO daoP = fac.getPerfilesDAO();
						vPerfiles = PerfilesDAOImpl.casteaAPerfil( new Vector(daoP.getPerfiles()) );
					}
					totalPerfiles = vPerfiles.size();
				
					for (int k=0; k<totalPerfiles;k++){
			           Perfil perfil = (Perfil)vPerfiles.get(k);
			    %>
			        <option value="<%=perfil.getIdProf()%>" <logic:notEmpty name="templateForm" property="userType"><logic:equal name="templateForm" property="userType" value='<%=String.valueOf(perfil.getIdProf())%>'> selected="selected" </logic:equal></logic:notEmpty>><%=perfil.getDescripcion() %></option>
			    <%}%>
			    
				</select></TD>
        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.ttlPassword" /></TD>
            <TD class="texto"><input type="text" maxlength="4" name="ttlPassword" value='<logic:notEmpty name="templateForm" property="ttlPassword"><logic:notEqual name="templateForm" property="ttlPassword" value="0"><bean:write name="templateForm" property="ttlPassword"/></logic:notEqual></logic:notEmpty>' onkeypress="return solonumerosynegativo(event, this)"></TD>
        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.timeAdvice"/></TD>
            <TD class="texto"><input type="text" maxlength="4" name="timeAdvice" value='<logic:notEmpty name="templateForm" property="timeAdvice"><logic:notEqual name="templateForm" property="timeAdvice" value="0"><bean:write name="templateForm" property="timeAdvice"/></logic:notEqual></logic:notEmpty>' onkeypress="return solonumeros(event)"></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.norPasswrods"/></TD>
            <TD class="texto"><input type="text"  maxlength="2" name="norPasswrods" value='<logic:notEmpty name="templateForm" property="norPasswrods"><logic:notEqual name="templateForm" property="norPasswrods" value="0"><bean:write name="templateForm" property="norPasswrods"/></logic:notEqual></logic:notEmpty>' onkeypress="return solonumeros(event)"></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.lfbBlockUser"/></TD>
            <TD class="texto"><input type="text"  maxlength="2" name="lfbBlockUser" value='<logic:notEmpty name="templateForm" property="lfbBlockUser"><logic:notEqual name="templateForm" property="lfbBlockUser" value="0"><bean:write name="templateForm" property="lfbBlockUser"/></logic:notEqual></logic:notEmpty>' onkeypress="return solonumeros(event)"></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="templates.ui.screen.caseSensitive"/></TD>
            <TD class="texto"><input type="checkbox" name="caseSensitive" <logic:notEmpty name="templateForm" property="caseSensitive"><logic:equal name="templateForm" property="caseSensitive" value="Y">checked='checked'</logic:equal></logic:notEmpty>/></TD>


        </TR>
        	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>	
        <TR align=right>
            <TD class="texto"></TD>
            <input type="hidden" name="mode" value="">
            <td align=center colspan=2>
                <table>
                    <tr >
                        <TD>
                        	<!-- <input type="submit" value="Crear" onClick="return validations() " class="boton2">-->
                        	<A HREF="#" onClick="enviar(0)">
              					<img src='images/Aceptar.jpg' name='aceptar' ALT='Crear' border="0">	
					        </a>
                        </TD>
                        <TD>
                        	<!-- <input type="reset" value="Borrar" class="boton2">-->
                        	<A HREF="#" onClick="limpiar()">
              					<img src='images/limpiar.gif' name='borra' ALT='Borrar' border="0">	
					        </a>
                        </TD>
                        <TD>
                        	<!-- <input type="submit"   value="Cargar" onClick="return setModeToLoad()" class="boton2">-->
                        	<A HREF="#" onClick="enviar(1)">
              					<img src='images/cargar.gif' name='carga' ALT='Cargar' border="0">	
					        </a>
                        </TD>
                    </tr>
                </table>
            </td>
        </TR>
    </TABLE>
    </form>
