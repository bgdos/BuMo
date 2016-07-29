<?php
header('Content-type: text/html; charset=utf-8');
$server = 'localhost';
$database = 'bumo';
$user = 'root';
$password = '';

    /*$conexion = mysql_connect($server, $user, $password) or die ('Error de conexión: '.mysql_error());
    echo 'Conexión exitosa<br>';
    mysql_select_db($database);

    $consulta = 'SELECT reading_date, reading_temperature, reading_id_station FROM readings';
    $resultado = mysql_query($consulta) or die ('Error en consulta: '.mysql_error().'<br>');
    while($value = mysql_fetch_array($resultado, MYSQL_ASSOC))
        foreach ($value as $v)
            echo $v.'<br>';*/
        
    $conexion = new mysqli($server, $user, $password, $database);
    if ($conexion->connect_errno)
        echo 'Error de Conexion: ' . $conexion->connect_error;
    $consulta = 'SELECT reading_date, reading_temperature, reading_id_station FROM readings';
    if ($resultado = $conexion->query($consulta))
        while($value = $resultado->fetch_row())
        foreach ($value as $v)
            echo $v.'<br>';


      
?>