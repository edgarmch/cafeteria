<?php

	class Empleado extends AppModel {
	var $name = 'Empleado';
	var $hasMany = array ( 'Mesa' ->
	array( 'className' -> 'Mesa'
	)
	)
}

?>