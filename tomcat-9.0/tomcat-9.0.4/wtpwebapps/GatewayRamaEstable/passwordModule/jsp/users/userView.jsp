<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<%@ page import="java.util.List" %>
<%@ page import="es.portanode.util.Registro,es.gateway.bean.MultiOperador, java.util.List, es.gateway.sesiones.obj.Grupo" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
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
	
     }

	  session.setAttribute("userdataattribute",uvo);
%>

<% String csVal="N";
    String upVal="N";
    String usertypedescription = (String)request.getAttribute("usertypedescription");
    List listOperadores=(List)request.getAttribute("listaOperadores");
%>

<script language="javaScript" src="passwordModule/jscripts/userView.js"></script>
<script language="javaScript" src="profileModule/js/util.js"></script>
<form name="editUserDetailsForm" action="validateUser.do"  method="post">

    <div class="Titulo" align=center><bean:message bundle="usersmodule" key="users.ui.screen.listUsers.title" /> </div>
	<br/><br/>
    <TABLE align=center>

        <TR>

            <input type="hidden" name="userId" value="<%=uvo.getUserId() %>" />
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.userid"/></TD><TD class="texto">:</TD>

            <TD class="texto"><%=uvo.getUserId() %></TD>

        </TR>
        <TR>

            <TD class="texto"><input type="hidden" readOnly name="password" value="<%=uvo.getPassword() %>" /></TD>
        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.ttlPassword"/></TD><TD class="texto">:</TD>

            <TD class="texto"><%=uvo.getTtlpwd() %></TD>


        </TR>


        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.usertype"/></TD><TD class="texto">:</TD>
            <TD class="texto"><%=usertypedescription%></TD>
        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.timeAdvice"/></TD><TD class="texto">:</TD>
            <TD class="texto"><%=uvo.getTimeadvice() %></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.norPasswrods"/></TD><TD class="texto">:</TD>
            <TD class="texto"><%=uvo.getNorPasswrods() %></TD>
        </TR>
        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.lfbBlockUser"/></TD><TD class="texto">:</TD>
            <TD class="texto"><%=uvo.getLfbblockuser() %></TD>

        </TR>

        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.caseSensitive"/></TD><TD class="texto">:</TD>
            <TD class="texto"><span id="span1" ></span></TD>
            <input type="hidden" name="cs" value="<%=uvo.getCasesensitive() %>"/>
        </TR>


        <TR>
            <TD class="texto"><bean:message bundle="usersmodule" key="users.ui.screen.password_update_the_first_time"/></TD><TD class="texto">:</TD>
            <TD class="texto"><span id="span2" ></span></TD>

            <input type="hidden" name="up" value="<%=uvo.getUpdatepwdfirsttime() %>"/>
        </TR>
         <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="cabeceratabla"><bean:message bundle="usersmodule" key="users.list.Operadores"/></td>
        </tr>
        <%
            if(listOperadores!=null && listOperadores.size()>0){
                for(int i=0;i<listOperadores.size();i++){
                    MultiOperador registro =  (MultiOperador)listOperadores.get(i);
        %>
        <tr>
            <td colspan="2" class="texto"><%=(String)registro.getOperador().getOperadorDescripcion()%></td>
        </tr>
        <%
            }
        }else{%>
        <td colspan="2" class="texto"><bean:message bundle="usersmodule" key="users.list.NoOperadores"/></td>
        <%}%>
        <tr>
			<td colspan="3">
			&nbsp;
			</td>
		</tr>
		<tr>
            <td colspan="3" class="cabeceratabla"><bean:message bundle="usersmodule" key="users.list.Operadores"/></td>
        </tr>
        <%
        	List<Grupo> listGrupos = (List<Grupo>)request.getAttribute("gruposUsuario");
        	if (listGrupos!=null && listGrupos.size()>0){
        		for(int i=0;i<listGrupos.size();i++){
                    Grupo registro =  (Grupo)listGrupos.get(i);
        %>
        <tr>
            <td colspan="2" class="texto"><%=(String)registro.getNombreGrupo()%></td>
        </tr>
        <%
            }
        }else{%>
        <td colspan="2" class="texto"><bean:message bundle="usersmodule" key="users.list.NoGrupos"/></td>
        <%}%>
        <tr>
			<td colspan="3">
			&nbsp;
			</td>
		</tr>
        <TR>
            <input type="hidden" name="isblocked" id="isblocked" value="<%=uvo.getIsblocked() %>"/>
            <input type="hidden" name="mode" value="" />
            <TD class="texto" id="unblock" STYLE="visibility:hidden"><span id="span3" name="span3"></span>
                <script type="text/javascript">pintaBoton ("Desbloquear","return modefun()")</script>
                <!-- <input type="button" name="unblock" id="unblock" value="Unblock" STYLE="visibility:hidden" onClick="return modefun()" />-->
            </td>
            <TD class="texto">
                <!-- <input type="submit" value="Volver" onClick="return backfunction()" class="boton2"/>-->
                <A HREF="#" onClick="backfunction()">
                    <img src='images/Back.jpg' name='vuelve' ALT='Volver' border="0">
                </a>
            </td>
        </TR>

    </TABLE>


    <script language="javaScript">call();
    </script>

</form>

