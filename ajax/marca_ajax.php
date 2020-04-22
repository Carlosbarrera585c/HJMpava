<?php

include 'conexion.php';
header('Content-Type: application/json');

function listar() {
    $conexion = conectar();
    $sql = 'SELECT id,desc_marca FROM marcas';
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
    $id = $_POST['id'];
    $descripcion = $_POST['descripcion'];
    $sql = "INSERT INTO marcas (desc_marca) VALUES ('$descripcion')";
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Marca Registrada'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'No se pudo registrar la Marca'));
    }
}

function editar() {
    $conexion = conectar();
    $id = $_POST['id'];
    $descripcion = $_POST['descripcion'];
    $sql = "UPDATE marcas SET desc_marca = '$descripcion' WHERE id = '$id'";
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Marca Actualizada'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'La marca no se pudo actualizar'));
    }
}

function eliminar() {
    $conexion = conectar();
    $id = $_POST['id'];
    $sql = "DELETE FROM marcas WHERE id = '$id'";
    $result = mysqli_query($conexion, $sql);
    if ($result) {
        echo json_encode(array('ok' => true, 'mensaje' => 'Marca Eliminada'));
    } else {
        echo json_encode(array('ok' => false, 'mensaje' => 'No se Elimino la marca'));
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
