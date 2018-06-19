<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<!-- INICIO MENÚ DE LA IZQUIERDA -->
<SCRIPT>
	function entra(formName, accionName){
		f = document.forms[formName];
		f.accion.value = accionName;
		f.submit();
	}
</SCRIPT>
<FORM METHOD=POST ACTION="MenuPrincipal" name="Generico">
	<INPUT TYPE="hidden" name="OperadorConexion" value="2">
	<INPUT TYPE="hidden" name="OperadorConectado" value="2">
	<INPUT TYPE="hidden" NAME="Posicion" VALUE="1">
	<INPUT TYPE="hidden" NAME="Fecha" VALUE="2">
	<INPUT TYPE="hidden" NAME="enlace_user" VALUE="0" id="campooculto_user">
	<INPUT TYPE="hidden" NAME="enlace_perm" VALUE="0" id="campooculto_perm">
	<INPUT TYPE="hidden" NAME="idioma" id="idioma_web">
</form>
<FORM action="MantenimientoPerfilesAction.do" METHOD="POST" name="MantenimientoPerfiles">
	<input type="hidden" name="accion" value="opciones">
</FORM>

<table cellSpacing=0 cellPadding=0 border=0 width="100%">
	<tr>
		<td colspan="3">&nbsp; </td>
	</tr>

    <TR>
		<TD >
			&nbsp;
		</TD>
		<TD colSpan=3  class="itemmenubold">
			<fmt:message key="permisos.menu.perfiles" />
		</TD>
	</TR>

	<TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
		<TD valign="top">&nbsp;</TD>
		<TD width=6 valign="top">&nbsp;</TD>
		<TD width=12>
			<IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->">
		</TD>
		<TD width=160>
				<A href="#"
					onclick="javascript:entra('MantenimientoPerfiles','menu')"
					onMouseOver="window.status='Mantenimiento de Perfiles';return true"
					onMouseOut="window.status=' '" class="itemmenu">
				<fmt:message key="permisos.menu.mantenimiento" />
				</a>
		</TD>
	</TR>

	<tr>
		<TD colspan="3">&nbsp;</TD>
	</tr>
	
	<TR>
		<TD valign="top" valign="center">
			&nbsp;
		</TD>
		<TD colSpan=2 width=12 valign="center">
			<IMG height=9 src="images/cuadro.gif" alt="->">
		</TD>
		<form name="perfexit" action="MenuPrincipalJSP" method="post">
			<TD class="itemmenubold" width="90%" valign="center">
					<input type="hidden" name="accion" value="inicio" />		
					<a href="MenuPrincipalJSP" >
					<fmt:message key="permisos.menu.salir" />
					</a>
			</td>
		</form>
	</TR>
</table>
<!-- FIN MENÚ DE LA IZQUIERDA -->
