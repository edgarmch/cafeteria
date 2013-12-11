<?php

	class Tipoproducto extends AppModel{
	
	var $name = 'Tipoproducto';
	var $hasMany = array('Catalogo' -> 
	array( 'className' -> 'Catalogo'
	)
	)
}

?>