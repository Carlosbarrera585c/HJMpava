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
            url: 'ajax/marca_ajax.php',
            method: 'POST',
            data: data + "&opc=" + opcion,
            success: function (res) {
                console.log(res);
                listar();
            },
            error: function () {
                console.log("No se ha podido obtener la información");
            }
        });
    });

    $('#modal-marcas').on('show.bs.modal', function (event) {
        console.log("Abriendo Modal");
        if(editar){
            $("#titulo-modal").html('<h3>Editar Marca</h3>');
        }else{
            $("#titulo-modal").html('<h3>Agregar Marca</h3>');
        }
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var descripcion = button.data('descripcion');
        var modal = $(this);
        modal.find('#id').val(id);
        modal.find('#descripcion').val(descripcion);
        
    });
    $('#modal-marcas').on('hide.bs.modal', function (event) {
        editar=false;
    });
});



function listar() {
    $.ajax({
        url: 'ajax/marca_ajax.php',
        method: 'POST',
        data: {
            opc: 1
        },
        success: function (res) {
            console.log(res);
            if (res.ok) {
                $("#datos-marcas").html("");
                html = "";
                $.each(res.data, function (i, item) {
                    html += '<tr>';
                    html += '<td>' + item.id + '</td>';
                    html += '<td>' + item.desc_marca + '</td>';
                    html += '<td><button onclick="editar=true" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#modal-marcas"\n\
                    data-id="'+item.id+'" \n\
                    data-descripcion="' + item.descripcion + '">Editar</button> ';
                    html += '<button class="btn btn-sm btn-danger" onclick=eliminar('+item.id+') >Eliminar</button></td>';
                    html += '</tr>';
                });
                $("#datos-marcas").append(html);
            } else {
                alert();
            }
        },
        error: function () {
            console.log("No se ha podido obtener la información...");
        }
    });
}

function eliminar(id){
    if(confirm("¿Desea eliminar la marca??")){
            $.ajax({
            url: 'ajax/marca_ajax.php',
            method: 'POST',
            data: {id:id,opc:4},
            success: function (res) {
                console.log(res);
                listar();
            },
            error: function () {
                console.log("No se ha podido obtener la información");
            }
        });
    }
}