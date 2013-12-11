<?php

	class TipoProducto extends AppModel{
	
	var $name = 'TipoProducto';
	var $hasMany = array('Catalogo' -> 
	array( 'className' -> 'Catalogo'
	)
	)
}

?>