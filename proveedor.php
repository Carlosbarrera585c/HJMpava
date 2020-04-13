<!DOCTYPE html>
<html>
    <!-- HEAD -->
    <?php include 'shared/head.php'; ?>
    <!-- END HEAD -->
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <!-- HEADER -->
            <?php include 'shared/header.php'; ?>
            <!-- END HEADER -->

            <!-- sidebar -->
            <?php include_once 'shared/sidebar.php'; ?>
            <!-- End Sidebar -->

            <!--Contenido-->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <!-- Main content -->
                <section class="content">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Sistema de Hojas de Vida</h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!--Contenido-->
                                            <h3>Listado de Provedores <button class="btn btn-sm btn-primary btn pull-right" data-toggle="modal" data-target="#modal-proveedor">
                                                    Agregar</button></h3>
                                            <br/>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <th>NIT</th>
                                                    <th>Descripcion Proovedores</th>
                                                    <th>Direccion</th>
                                                    <th>Telefono</th>
                                                    <th>Contacto</th>
                                                    <th>Barrio</th>
						    <th>Ciudad</th>
                                                    </thead>
                                                    <tbody id="datos">
                                                    </tbody>
                                                </table>
                                            </div>
                                            <!--Fin Contenido-->
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.row -->
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!--Fin-Contenido-->
<!-- FOOTER -->
<!-- Ventana Modal Insertar Datos -->
<div class="modal fade" id="modal-proveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="titulo-modal">Nuevo proveedor</h3>
            </div>
            <div class="modal-body">
                <form id="form-datos">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">NIT</label>
                        <input type="text" class="form-control" id="nit" name="nit">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Direccion</label>
                        <input type="text" class="form-control" id="direccion" name="direccion">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Telefono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Contacto</label>
                        <input type="text" class="form-control" id="contacto" name="contacto">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Barrio</label>
                        <input type="text" class="form-control" id="barrio" name="barrio">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Ciudad</label>
                        <input type="text" class="form-control" id="ciudad" name="ciudad">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Fin Ventana Modal -->
<?php include_once 'shared/footer.php'; ?>
<script src="js/proveedor.js"></script>
<!-- END FOOTER -->
</body>
</html>
