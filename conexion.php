<?php
function conectar(){
    $conexion = mysqli_connect('localhost','root','root','controlhv');
    if($conexion){
        return $conexion;
    }else{
        echo "no hay conexion a la base de datos";
    }
};

?>

