<?php
class Clientes extends AppModel
{
    var $name = "Cilentes";
    var $hasMany = array("Ordenes" ->
                   array('className' -> 'Ordenes')
}
                         