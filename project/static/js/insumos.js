function inicializarModuloInsumos() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaInsumos').removeClass("col-12");
        $('#divTablaInsumos').addClass("col-7");
        $('#divDetalleInsumo').show();
    } else {
        $('#divDetalleInsumo').hide();
        $('#divTablaInsumos').removeClass("col-7");
        $('#divTablaInsumos').addClass("col-12");
    }
}


function limpiarFormulario() {
    $('#txtCodigoI').val('');
    $('#txtNombre').val('');
    $('#txtPrecio').val('');
}

function mostrarDetalleInsumo(idInsumo) {
    $('#banderaOjo').val(idInsumo);
    setFormularioDetalleVisible(true);
}

function loadingInsumos(){
    if(
    $('#txtNombre').val().length == 0 ||
    $('#txtPrecio').val().length == 0 ||
    $('#txtPrecio').val() <= 0 ){
       
    }else{
        loading();
    }
    }