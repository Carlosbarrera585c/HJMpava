var editar = false;
$(document).ready(function () {
    console.log('Listo');
    listar();

    $("#form-datos").submit(function(event) {
        console.log("Enviando Formulario");
        event.preventDefault();
        const data = $(this).serialize();
        console.log(data);
        let opc;
        if (editar) {
            opcion = 3;
        } else {
            opcion = 2;
        }
        $.ajax({
            url: 'ajax/proveedor_ajax.php',
            method: 'POST',
            data: data + "&opc=" + opcion,
            success: function (res) {
                console.log(res);
                listar();
            },
            error: function () {
                console.log("No se ha podido obtener la informacion");
            }
        });
    });

    $('#modal-proveedor').on('show.bs.modal', function (event) {
        console.log("Abriendo Modal");
        if(editar){
            $("#titulo-modal").html('<h3>Editar proveedor</h3>');
        }else{
            $("#titulo-modal").html('<h3>Agregar proveedor</h3>');
        }
        var button = $(event.relatedTarget);
        var nit = button.data('nit');
        var nombre = button.data('nombre');
        var direccion = button.data('direccion');
        var telefono = button.data('telefono');
        var contacto = button.data('contacto');
        var barrio = button.data('barrio');
        var ciudad = button.data('ciudad');
        var modal = $(this);
        modal.find('#nit').val(nit);
        modal.find('#nombre').val(nombre);
        modal.find('#direccion').val(direccion);
        modal.find('#telefono').val(telefono);
        modal.find('#contacto').val(contacto);
        modal.find('#barrio').val(barrio);
        modal.find('#ciudad').val(ciudad);

    });
    $('#modal-proveedor').on('hide.bs.modal', function (event) {
        editar=false;
    });
});



function listar() {
    $.ajax({
        url: 'ajax/proveedor_ajax.php',
        method: 'POST',
        data: {
            opc: 1
        },
        success: function (res) {
            console.log(res);
            if (res.ok) {
                $("#datos").html("");
                html = "";
                $.each(res.data, function (i, item) {
                    html += '<tr>';
                    html += '<td>' + item.nit + '</td>';
                    html += '<td>' + item.nombre + '</td>';
                    html += '<td>' + item.direccion + '</td>';
                    html += '<td>' + item.telefono + '</td>';
                    html += '<td>' + item.contacto + '</td>';
                    html += '<td>' + item.barrio + '</td>';
                    html += '<td>' + item.ciudad + '</td>';
                    html += '<td><button onclick="editar=true" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#modal-proveedor"\n\
                    data-nit="'+item.nit+'" \n\
                    data-nombre="' + item.nombre + '" \n\
                    data-direccion="' + item.direccion + '" \n\
                    data-telefono="' + item.telefono + '" \n\
                    data-contacto="' + item.contacto + '" \n\
                    data-barrio="' + item.barrio + '" \n\
                    data-ciudad="' + item.ciudad + '" >Editar</button> ';
                    html += '<button class="btn btn-sm btn-danger" onclick=eliminar('+item.nit+') >Eliminar</button></td>';
                    html += '</tr>';
                });
                $("#datos").append(html);
            } else {
                alert();
            }
        },
        error: function () {
            console.log("No se ha podido obtener la informacion 2");
        }
    });
}

function eliminar(nit){
    if(confirm("¿Desea eliminar el proveedor?")){
            $.ajax({
            url: 'ajax/proveedor_ajax.php',
            method: 'POST',
            data: {nit:nit,opc:4},
            success: function (res) {
                console.log(res);
                listar();
            },
            error: function () {
                console.log("No se ha podido obtener la informacion");
            }
        });
    }
}