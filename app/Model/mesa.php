<?php

	class Mesa extends AppModel{
mesas empleados
	var $name = 'Mesa';
	var $belongsTo = 
	array('Empleado' ->
	array ( 'className' -> 'Mesa',
	'foreignKey' -> 'idempleados',
	'contraints' -> '',
	'order' -> ''
	)
	)
}

?>