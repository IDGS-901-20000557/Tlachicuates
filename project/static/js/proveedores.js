function inicializarModuloProveedores() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaProveedores').removeClass("col-12");
        $('#divTablaProveedores').addClass("col-7");
        $('#divDetalleProveedor').show();
    } else {
        $('#divDetalleProveedor').hide();
        $('#divTablaProveedores').removeClass("col-7");
        $('#divTablaProveedores').addClass("col-12");
    }
}


function limpiarFormulario() {
    $('#txtCodigoP').val('');
    $('#txtNombre').val('');
    $('#txtApePaterno').val('');
    $('#txtApeMaterno').val('');
    $('#txtTelefono').val('');
    $('#txtproveedor').val('');
    $('#txtemail').val('');
    $('#txtCodigoU').val('');
}

function mostrarDetalleProveedor(idProveedor) {
    $('#banderaOjo').val(idProveedor);
    setFormularioDetalleVisible(true);
}

function loadingProveedores(){
    if(    $('#txtCodigoP').val('')||
    $('#txtNombre').val('') ||
    $('#txtApePaterno').val('') ||
    $('#txtApeMaterno').val('') ||
    $('#txtTelefono').val('') ||
    $('#txtproveedor').val('') ||
    $('#txtemail').val('') ||
    $('#txtCodigoU').val('')){
    
    }else{
        loading();
    }
    }