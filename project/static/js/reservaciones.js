function inicializarModuloReservaciones() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaReservaciones').removeClass("col-12");
        $('#divTablaReservaciones').addClass("col-7");
        $('#divDetalleReservaciones').show();
    } else {
        $('#divDetalleReservaciones').hide();
        $('#divTablaReservaciones').removeClass("col-7");
        $('#divTablaReservaciones').addClass("col-12");
    }
}


function limpiarFormulario() {
    $('#txtCodigoR').val('');
    $('#txtCliente').val('');
    $('#txtMesa').val('');
    $('#txtHora').val('');
}

function mostrarDetalleReservacion(idReservacion) {
    $('#banderaOjo').val(idReservacion);
    setFormularioDetalleVisible(true);
}

function loadingReservaciones() {
    if ($('#txtCodigoR').val('') ||
        $('#txtCliente').val('') ||
        $('#txtMesa').val('') ||
        $('#txtHora').val('')) {

    } else {
        loading();
    }
}