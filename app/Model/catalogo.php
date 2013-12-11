<?php

	class Catalogo extends AppModel {
	var $name = 'Catalogo';
	var $belongsTo = 
	array ('Tipo_producto' -> 
	array('className' -> 'Catalogo',
	'foreignKey' -> 'idtipo_producto',
	'conditions' -> '',
	'order' -> ''
	)
	)
}

?>