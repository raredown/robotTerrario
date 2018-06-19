<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
<script language="javascript" src='${jsURL}/menu.js'></script>

<table cellspacing='0' cellpadding='0' width="100%" >
   
    
    <br>
    <TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <bean:message key="menu.titulo.gestionProcesos" />
          </TD>
    </TR>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="MenuPrincipalJSP" onMouseOver="window.status='Inicio';return true" onMouseOut="window.status=' '" class="itemmenu">
            	<bean:message key="menu.inicio" />
   			</a>
          </TD>
    </TR>
    <TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <bean:message key="menu.titulo.consultas" />
          </TD>
    </TR>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="ConsultaAction.do?accion=view" onMouseOver="window.status='Consultas';return true" onMouseOut="window.status=' '" class="itemmenu">
              
              <bean:message key="menu.consultas" />
            </a>
          </TD>
    </TR>
     <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="ConsultaHistoricoAction.do?accion=consultaHistoricoView" onMouseOver="window.status='Consulta historico';return true" onMouseOut="window.status=' '" class="itemmenu">
              <bean:message key="menu.historico" />
            </a>
          </TD>
    </TR>   
    <TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <bean:message key="menu.titulo.gestionEstadisticas" />
          </TD>
    </TR>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="EstadisticasAction.do?accion=viewEstadistica" onMouseOver="window.status='Estadisticas';return true" onMouseOut="window.status=' '" class="itemmenu">
               <bean:message key="menu.estadisticas" />
            </a>
          </TD>
    </TR>
    <TR>
          <TD valign="top">&nbsp;</TD>
          <TD colSpan=3 valign="top" class="itemmenubold">
              <bean:message key="menu.titulo.mantenimiento" />
          </TD>
    </TR>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="MantenimientoConectoresAction.do?accion=viewMantenimiento" onMouseOver="window.status='Mantenimiento conectores';return true" onMouseOut="window.status=' '" class="itemmenu">
              
              <bean:message key="menu.mantenimientoconectores" />
            </a>
          </TD>
    </TR>
     <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="MantenimientoAlarmasAction.do?accion=viewMantenimientoAlarmas" onMouseOver="window.status='Mantenimiento Alarmas';return true" onMouseOut="window.status=' '" class="itemmenu">
              
              <bean:message key="menu.mantenimientoalarmas" />
            </a>
          </TD>
    </TR>
   <%-- <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="MantenimientoUsuariosAction.do?accion=viewMantenimiento" onMouseOver="window.status='Mantenimiento Usuarios';return true" onMouseOut="window.status=' '" class="itemmenu">
              <bean:message key="menu.mantenimientoPerfiles" />
            </a>
          </TD>
    </TR> --%>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
          <TD valign="top">&nbsp;</TD>
          <TD width=6 valign="top">&nbsp;</TD>
          <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
          <TD valign="top" class="itemmenubold">
          	<A href="MantenimientoUsuariosAction.do?accion=viewMantenimiento" onMouseOver="window.status='Mantenimiento Usuarios';return true" onMouseOut="window.status=' '" class="itemmenu">
              <bean:message key="menu.mantenimientoUsuarios" />
            </a>
          </TD>
    </TR>
    <TR>
       <TD valign="top">&nbsp;</TD>
       <TD colSpan=3 valign="top" class="itemmenubold"><br>&nbsp;</TD>
    </TR>
    <TR onMouseOver="this.className='Fondoverdeover'" onMouseOut="this.className='Fondoblanco'">
    	<TD valign="top">&nbsp;</TD>
    	<TD width=6 valign="top">&nbsp;</TD>
        <TD width=12 valign="top"><IMG height=9 src="${imagesURL}/cuadro.gif" width=9 alt="->"></TD>
        <TD valign="top" class="itemmenubold">
        	<A href="SalirAction.do" onMouseOver="window.status='Salir de la aplicaci&oacute;n';return true" onMouseOut="window.status=' '" class="itemmenu">
        	    <bean:message key="menu.salir" />
           </a>
        </TD>
</table>
