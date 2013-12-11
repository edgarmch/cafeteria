<?php

	class Orden extends AppModel {
	var $name = 'Ordenes';
	var $belongsTo = 
	array ('Clientes' -> 
	array('className' -> 'clientes',
	'foreignKey' -> 'idclientes',
	'conditions' -> '',
	'order' -> ''
	)
	)
}

?>