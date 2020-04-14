<?php

include 'conexion.php';
header('Content-Type: application/json');

function listar() {
    $conexion = conectar();
    $sql = 'SELECT nit,nombre,direccion,telefono,contacto,barrio,ciudad FROM proveedor';
    $result = mysqli_query($conexion, $sql);
    $data = [];
    if ($result) {
        while ($row = mysqli_fetch_array($result)) {
            $data[] = $row;
        }
        echo json_encode(array('ok' => true, 'data' => $data));
    } else {
        echo json_encode(array('ok' => false, 'error' => mysqli_error($conexion)));
    }
}

function registrar() {
    $conexion = conectar();
    $nit = $_POST['nit'];
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $contacto = $_POST['contacto'];
    $barrio = $_POST['barrio'];
    $ciudad = $_POST['ciudad'];
    $sql = "INSERT INTO proveedor (nit,nombre,direccion,telefono,contacto,barrio,ciudad) VALUES ('$nit','$nombre','$direccion','$telefono','$contacto','$barrio', '$ciudad')";
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Proveedor Registrado'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'No se registro el proveedor'));
    }
}

function editar() {
    $conexion = conectar();
    $nit = $_POST['nit'];
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $contacto = $_POST['contacto'];
    $barrio = $_POST['barrio'];
    $ciudad = $_POST['ciudad'];
    $sql = "UPDATE proveedor SET nit = '$nit', nombre = '$nombre', direccion = '$direccion', telefono = '$telefono', contacto = '$contacto', barrio = '$barrio', ciudad = '$ciudad' WHERE nit = '$nit'";
    print_r($sql);
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Proveedor Actualizado'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'No se registro el proveedor'));
    }
}

function eliminar() {
    $conexion = conectar();
    $nit = $_POST['nit'];
    $sql = "DELETE FROM proveedor WHERE nit = '$nit'";
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Proveedor Eliminado'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'No se registro el proveedor'));
    }
}

switch ($_POST['opc']) {
    case 1:
        listar();
        break;
    case 2:
        registrar();
        break;
    case 3:
        editar();
        break;
    case 4:
        eliminar();
        break;
    default :
        break;
}
?>
