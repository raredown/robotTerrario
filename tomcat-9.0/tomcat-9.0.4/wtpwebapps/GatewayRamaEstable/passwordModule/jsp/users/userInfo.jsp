<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List, es.gateway.bean.MultiOperador, es.gateway.sesiones.obj.Grupo"%>
<c:url var="imagesURL" value="/images" />
<script language="JavaScript" src="profileModule/js/util.js"></script>
<script language="javaScript" src="passwordModule/jscripts/validateUser.js"></script>
<% 

Vector<Grupo> listaGrupos = (Vector<Grupo>)session.getAttribute("vectorAllGrupos");
Vector<Grupo> grupos = (Vector<Grupo>)request.getAttribute("gruposUsuario");
int totalGrupos = listaGrupos.size();
es.gateway.sesiones.users.vo.UserVo uvo =null;

     if(request.getAttribute("userdataattribute")!=null){
	       uvo = (es.gateway.sesiones.users.vo.UserVo)request.getAttribute("userdataattribute");
      }else if(session.getAttribute("userdataattribute")!=null){
	       uvo = (es.gateway.sesiones.users.vo.UserVo)session.getAttribute("userdataattribute");
      }
 
    if(session.getAttribute("templatedataintouser")!=null)
    {
    	es.gateway.sesiones.users.vo.TemplateVo tv = (es.gateway.sesiones.users.vo.TemplateVo)session.getAttribute("templatedataintouser");
	      uvo.setTtlpwd(tv.getTtlPassword());
	      uvo.setTimeadvice(tv.getTimeAdvice());
	      uvo.setLfbblockuser(tv.getLfbBlockUser());
	      uvo.setNorPasswrods(tv.getNorPasswrods());
	      uvo.setCasesensitive(tv.getCaseSensitive());
	      uvo.setUserType(tv.getUserType());
     }

	  session.setAttribute("userdataattribute",uvo);
%>

<%
	String path = java.io.File.separator; 
	//String propPath="com"+path+"usermodule"+path+"users"+path+"struts"+path+"resources"+path+"ApplicationResources";
	String propPath="es.gateway.sesiones"+path+"resources"+path+"ApplicationResources";
%>

<fmt:bundle basename="<%=propPath %>">

<%
	String csVal="N";
	String upVal="N";
%>
<script language="JavaScript" src="js/util.js"></script>
<script language="javaScript" src="passwordModule/jscripts/userInfo.js"></script>
<script language="javaScript">

function displayPasswordBox(){
		document.editUserDetailsForm.newPassword.disabled = !document.editUserDetailsForm.passReset.checked;
		document.editUserDetailsForm.confirmNewPassword.disabled = !document.editUserDetailsForm.passReset.checked;
	
	}
function call(){
	
	for(var i =0;i<document.editUserDetailsForm.userType.length;i++)
	 {	
	     
		if(document.editUserDetailsForm.userType[i].value==document.editUserDetailsForm.ut.value)
		 {
              
				document.editUserDetailsForm.userType.selectedIndex=i;
		 }
	 }
     //validation for casesensitive	 
      if(document.editUserDetailsForm.cs.value=="Y"){
     
          <%csVal="Y";%> 	    
		  document.editUserDetailsForm.casesensitive.value="Y";
		  document.editUserDetailsForm.casesensitive.checked=true;
   
        }
        else {
             document.editUserDetailsForm.casesensitive.value="N";
             document.editUserDetailsForm.casesensitive.checked=false;
	        <%csVal="N";%>
        }  
      //validation for updatepwdfirsttime
      if(document.editUserDetailsForm.up.value=="Y"){
          <%upVal="Y";%> 	    
		  document.editUserDetailsForm.updatepwdfirsttime.value="Y";
		  document.editUserDetailsForm.updatepwdfirsttime.checked=true;
   
       }
       else document.editUserDetailsForm.updatepwdfirsttime.value="N";
	        <%upVal="N";%> 

      if(document.getElementById("isblocked").value != 0)
      {

         document.getElementById("unblock").style.visibility="visible";
       }
      displayPasswordBox();
      
}	
</script>
<form name="editUserDetailsForm" id="editUserDetailsForm" action="validateUser.do" method="post">
<input type="hidden" name="operadores" value="">	
<input type="hidden" name="numTotalGr" value="<%=totalGrupos %>" />
<input type="hidden" name="grupos" value="">
<input type="hidden" name="userId" value="<%=uvo.getUserId() %>" />

<h3 align=center><bean:message bundle="usersmodule" key="users.ui.screen.listUsers.title" /> </h3>

<TABLE align=center>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.userid"/></TD>
	<TD class="texto"><b><%=uvo.getUserId() %></b></TD>
	
</TR>
<TR>
	
	<TD class="texto"><input type="hidden" name="password" value="<%=uvo.getPassword() %>" /></TD>
</TR>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.ttlPassword"/></TD>
	
	<TD class="texto"><input type="text" name="ttlpwd" maxlength="4" value="<%=uvo.getTtlpwd() %>" /></TD>
	
	
</TR>

 <input type="hidden" name="ut" value="<%=uvo.getUserType() %>"/> 
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.usertype"/></TD>
	<TD class="texto"><select    name="userType"  class="bgFila2">
	<%@ page import="es.gateway.sesiones.obj.Perfil,java.util.Vector" %>
	<% if (request.getAttribute("vectorPerfiles")!=null){ 
		
		List<Perfil> vPerfiles= (List<Perfil>) request.getAttribute("vectorPerfiles");
    	int totalPerfiles = vPerfiles.size();
	
		for (int k=0; k<totalPerfiles;k++){
           Perfil perfil = (Perfil)vPerfiles.get(k);
    %>
        <option value="<%=perfil.getIdProf()%>" <%=perfil.getIdProf()==uvo.getTemplateVo().getTemplateId()?"selected='selected'":""%>><%=perfil.getDescripcion() %></option>
    <% }
     }
     else{ 
		List<Perfil> vPerfiles= (List<Perfil>) session.getAttribute("vectorPerfiles");
    	int totalPerfiles = vPerfiles.size();
	
		for (int k=0; k<totalPerfiles;k++){
           Perfil perfil = (Perfil)vPerfiles.get(k);
    %>
        <option value="<%=perfil.getIdProf()%>"  <%=perfil.getIdProf()==uvo.getTemplateVo().getTemplateId()?"selected='selected'":""%>><%=perfil.getDescripcion() %></option>
    <%}
    	}%>
    
	</select></TD>
</TR>

<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.timeAdvice"/></TD>
	<TD class="texto"><input type="text" name="timeadvice" maxlength="4" value="<%=uvo.getTimeadvice() %>"/></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.norPasswrods"/></TD>
	<TD class="texto"><input type="text" name="norPasswrods" maxlength="2" value="<%=uvo.getNorPasswrods() %>" /></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.lfbBlockUser"/></TD>
	<TD class="texto"><input type="text" name="lfbblockuser" maxlength="2" value="<%=uvo.getLfbblockuser() %>"/></TD>
</TR>
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.caseSensitive"/></TD>
	<TD class="texto"><input type="checkbox" name="casesensitive" value="<%=csVal%>"/></TD>
	<input type="hidden" name="cs" value="<%=uvo.getCasesensitive() %>"/>
</TR>
<!--/*************************************-->
<TR>
	<TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.resetPassword"/></TD>
	<TD class="texto"><input type="checkbox" onclick="displayPasswordBox();" name="passReset" /></TD>
</TR>
	<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.newPassword" /></TD>
		<TD class="texto"><input type="password" name="newPassword"
			maxlength="10" id="newPassword"/></TD>
	</TR>
		<TR>
		<TD class="texto"><bean:message bundle="usersmodule"
			key="users.ui.screen.confirmNewPassword" /></TD>
		<TD class="texto"><input type="password" name="confirmNewPassword"
			maxlength="10" id="confirmNewPassword" /></TD>
</TR>
<!--/*************************************-->




				<tr>
					<td>
						<div align="right">
							<font class="texto2" size="3"><B> <bean:message bundle="usersmodule"
										key="users.ui.screen.ops" />:&nbsp;</B> </font>
						</div>
					</td>
					<td class="text">
					<table>

							<%
								List operadores = (List) request.getAttribute("listaOperadores");
								int j = 0;
								String operador = "";
								String checked = "";
								String descripcionOperador = "";
								List l=(List<MultiOperador>) request.getAttribute("vectorOperadores");
								request.setAttribute("vectorOperadores",l);
								
								for (MultiOperador operator: (List<MultiOperador>) request.getAttribute("vectorOperadores")) {
										operador = operator.getOperador().getOperadorCodigo();
										descripcionOperador = operator.getOperador().getOperadorDescripcion();
										
										if (operadores.contains(operator)){
											checked = "checked='checked'";
										}
										else{
											checked = "";
										}
							%>
							 <tr>
								<td>
									<INPUT type="checkbox" name="chooseOpe<%=j%>"
										id="chooseOpe<%=j%>" value="Si" disabled="true" checked="checked">
								</td>
								<td class="texto">
									<INPUT TYPE="hidden" name="operador<%=j%>" id="operador<%=j++%>"value="<%=operador%>"><%=operador%>&nbsp;
								</td>
								<td class="texto">-&nbsp;<%=descripcionOperador%></td>
							</tr> 
							<%
								}
	
								%>
								</table>
									<tr>
		<td>
		<div align="right"><font class="texto2" size="3"><B>
		<bean:message bundle="usersmodule" key="users.ui.screen.grs" />:&nbsp;</B>
		</font></div>
		</td>
		<td class="text">
								<table>

			<%
			
								Grupo grupo = null;
								Grupo aux = null;
								String idGrupo = "";
								String idGrupoAux = "";
								String nombreGrupo = "";
								String checkedGrupo = "";
								boolean isChecked = false;

								for (int i=0;i<listaGrupos.size();i++){
										grupo = (Grupo)listaGrupos.elementAt(i);
										idGrupo = grupo.getIdGrupo();
										nombreGrupo = grupo.getNombreGrupo();
										
										for(int k=0;k<grupos.size();k++){
											aux = (Grupo)grupos.elementAt(k);
												idGrupoAux = aux.getIdGrupo();
												if (idGrupoAux.equals(idGrupo)){
													isChecked = true;
											}
										}
										
										if(isChecked){
											checkedGrupo = "checked";
										}else{
											checkedGrupo = "";
										}
										
										isChecked = false;
										
								%>
			<tr>
				<td><input type="checkbox" name="chooseGrupo<%=i%>" id="chooseGrupo<%=i%>"
					value="Si" <%=checkedGrupo%> disabled="true"/></td>
				<td class="texto">
				<INPUT TYPE="hidden" name="grupo<%=i%>" id="grupo<%=i%>" value="<%=idGrupo%>"></td>
				<td class="texto">&nbsp;<%=nombreGrupo%></td>
			</tr>
			<%
								}%>


		</table>
		<input type="hidden" name="numTotalOp" value="<%=j%>" />
</td>
</tr>

<TR>
<TD class="texto"></TD>
	<TD class="texto"><input type="hidden" name="updatepwdfirsttime" value="<%=upVal%>"/></TD>
<input type="hidden" name="isblocked" id="isblocked" value="<%=uvo.getIsblocked() %>"/>
	<input type="hidden" name="up" value="<%=uvo.getUpdatepwdfirsttime() %>"/>
</TR>

<input type=hidden name=cancelvar value=<%="queryback.do"%> />
<TR align=right><input type="hidden" name="mode" value="">
<input type="hidden" name="editunblock" value="">
	<td align=center colspan=2>
	<table>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>	
	<tr >

	<TD class="texto">
		<A HREF="#" onClick="validations()"> <img src='images/Aceptar.jpg' name='aceptar' ALT='Aceptar' border="0"> </a>
	</TD>
    <TD class="texto">
    	<A HREF="#" onClick="cancelfunction()"> <img src='images/Back.jpg' name='cancelar' ALT='Cancelar' border="0"> </a>
    </TD>
	<TD class="texto">
		<A HREF="#" onClick="funcall()"> <img src='images/detalle.jpg' name='detalles' ALT='Detalles' border="0"> </a>
	</TD>
	<TD class="texto">
        <A HREF="#" onClick="loadfunction()"> <img src='images/cargar.gif' name='cargar' ALT='Cargar plantilla' border="0"> </a>
	</TD>
	<TD class="texto">
        <%if(1==uvo.getIsblocked()){%>
          <script type="text/javascript">pintaBoton ("<font class='texto2'>Desbloquear</font>","modefun()","${imagesURL}")</script>
        <%}%>
	</TD>
   </tr>
   </table>
   </td>
</TR>
</TABLE>


<script language="javaScript">call();
	</script>

</form>
<!-- </html>-->
