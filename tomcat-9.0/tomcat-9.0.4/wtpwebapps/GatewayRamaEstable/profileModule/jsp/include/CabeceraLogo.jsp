<!--
 * 
 * Esta clase es propiedad de IECISA
 *
 * @author Informatica El Corte Ingles
 * 
 -->
 <!-- 
 	
 	Modificación realizada para eliminar la sesion abierta al cerrar 
 	el navegador desde botón cerrar y pulsado ALT + F4
 	
 	04-09-2009
 
  -->
 <script type="text/javascript">
 	function salir(){
    	if (window.event.clientY < 0 && window.event.clientY < -80){
            formularioCerrar('SalirForm', 'salir');
    	}    	
    }

	function cerrarAltF4(evento){
		var tecla = evento.keyCode;
    	var alt = evento.altKey;

    	if (alt) {
    	      switch (tecla) {
    	            // Alt-F4
    	            case 115:  	            	
    	            	formularioCerrar('SalirForm', 'salir');
    					break;
    	      }
    	}
	}

	function formularioCerrar(formName, accionName){
		f = document.forms[formName];
		f.accion.value = accionName;
		f.submit();
	}
 </script>
<body onunload="javascript:salir()" onKeyDown="javascript:cerrarAltF4(event)">
<table width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
	<form method=post action="MenuSalir.do" name="SalirForm"> 
			<input type="hidden" name="accion" value="salir"> 
	</form>
	<tr>
		<td width="40%" class='celdalineaabajo'>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src='images/telefono.jpg' name='logotipo' width='90' height='41'>
		</td>
		<td width="20%" class='celdalineaabajo' colspan="2" align="CENTER">
			<table>
				<tr>
					<td align="center">
						 <img src='images/portanode.png' name='logotipo' ALT='Operador'>
						
						<!-- <img src='images/portanode.png' name='logotipo' ALT='Operador'> -->
					</td>
				</tr>
				<tr>
					<td align="center">

					</td>
				</tr>
			</table>
		</td>
		<td width="40%" align="right" class='celdalineaabajo' valign="middle">
			<table border="0">
				<tr>
				
				</tr>

			</table>
		</td>
	</tr>
</table>
</body>
