<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bean" uri="/WEB-INF/tld/struts-bean.tld"%>
<%@ taglib prefix="logic" uri="/WEB-INF/tld/struts-logic.tld"%>

<%
	String fechaSistema = (String) request.getAttribute("FechaSistema");
 System.out.println(fechaSistema);
 
%>

<script language="JavaScript">
		//Función que permite abrir el fichero de ayuda correspondiente a la página

		function lanzaFormularioDe3(accionName, metodo, numForm){

			
			if(accionName=="MenuOpcionesUsuario"){
				f = document.MenuOpcionesUsuario;
				f.accion.value = metodo;
			}else if(accionName=="ConsultaExpirados"){
				f = document.Generico;
				f.Accion.value = metodo;
                f.action = accionName;
			}else{
				f = document.Generico;
				f.action = accionName;
			}
			f.submit();
			
		}

		function lanzaFormularioDe2(accionName){
			f = document.Generico;
			f.action = accionName;
			f.submit();
		}

		function lanzaSalir(formName, accionName){
			f = document.forms[formName];
			f.accion.value = accionName;
			f.submit();
		}

		function lanzaModuloUsuarios(accionName){
			f = document.MenuOpcionesUsuario;
			f.accion.value = accionName;
			f.submit();
		}
	</script>

<bean:define id="permisosLink" type="java.util.ArrayList" name="links" scope="session" />

<table cellSpacing=0 cellPadding=0 border=0 width="100%">
    <FORM METHOD=POST ACTION="MenuPrincipal" name="Generico">
       <INPUT TYPE="hidden" name="OperadorConexion" value="<%=imagen%>">
       <INPUT TYPE="hidden" name="OperadorConectado" value="<%=imagen%>">
       <INPUT TYPE="hidden" NAME="Posicion" VALUE="1">
       <INPUT TYPE="hidden" NAME="Fecha" VALUE="<%=fechaSistema%>">
       <INPUT TYPE="hidden" NAME="Accion" VALUE="">
    </form>
    <form method=post action="MenuOpcionesUsuario.do" name="MenuOpcionesUsuario"> 
    <input type="hidden" name="accion" value="">
    </form>

<logic:iterate id="link" name="permisosLink" type="es.gateway.sesiones.permisos.bean.LinkBean" indexId="ij">
	<logic:empty name="link" property="idPadre">
		<TR>
			<TD valign="top">
				&nbsp;
			</TD>
			<TD colSpan=3 valign="top" class="itemmenubold">
				<BR />
				<fmt:message>
					<bean:write property='descripcion' name='link' />
				</fmt:message>
			</TD>
		</TR>
	</logic:empty>
	<logic:notEmpty name="link" property="idPadre">
		<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">


				<input type="hidden" name="accion" value="">

				<TD valign="top">&nbsp;</TD>
				<TD width=6 valign="top">&nbsp;</TD>
				<TD width=172 colspan="2">
				<%for (int i=0;i<link.getNivel().intValue()-2;i++){ out.print("&nbsp");}%>
					<IMG height=9 src="images/cuadro.gif" width=9 alt="->"> 
					
					<a href="#" onclick="javascript:lanzaFormularioDe3('<bean:write property="accion" name="link" />', '<bean:write property="metodo" name="link" />', '${ij}')" 
						onMouseOver="window.status='<fmt:message><bean:write property='descripcion' name='link' /></fmt:message>';return true"
						onMouseOut="window.status=' '" class="itemmenu">
						<fmt:message><bean:write property='descripcion' name='link' /></fmt:message>
					</a>
				</TD>
		</TR>
	</logic:notEmpty>
</logic:iterate>

	<TR>
		<TD valign="top">&nbsp;</TD>
		<TD colSpan=3 valign="top" class="itemmenubold">
			<br>&nbsp;</BR>
		</TD>
	</TR>

    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		 <form method=post action="MenuSalir.do" name="MenuSalirForm"> 
			<input type="hidden" name="accion" value="salir"> 
			<TD valign="top">&nbsp;</TD>
			<TD width=6 valign="top">&nbsp;</TD>
			<TD width=12>
				<IMG height=9 src="images/cuadro.gif" width=9 alt="->">
			</TD>
	        <TD width=160>
				<A href="#" onclick="javascript:lanzaSalir('MenuSalirForm', 'salir')"
					onMouseOver="window.status='<fmt:message key="javascript.menu.salir_app"/>';return true"
					onMouseOut="window.status=' '" class="itemmenu">
					<fmt:message key="texto.menu.salir" />
				</a>
			</TD>
		 </FORM> 
	</TR>

</table>