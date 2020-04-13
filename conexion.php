<?php
function conectar(){
    $conexion = mysqli_connect('192.168.1.19','root','.Sc13-Mpp25*','controlhv');
    if($conexion){
        return $conexion;
    }else{
        echo "no hay conexion a la base de datos";
    }
};

?>

