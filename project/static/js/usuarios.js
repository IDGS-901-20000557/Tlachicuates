function inicializarModuloUsuarios() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaUsuarios').removeClass("col-12");
        $('#divTablaUsuarios').addClass("col-7");
        $('#divDetalleUsuario').show();
    } else {
        $('#divDetalleUsuario').hide();
        $('#divTablaUsuarios').removeClass("col-7");
        $('#divTablaUsuarios').addClass("col-12");
    }
}


function limpiarFormulario() {
    $('#txtCodigoU').val('');
    $('#txtNombre').val('');
    $('#txtApePaterno').val('');
    $('#txtApeMaterno').val('');
    $('#txtTelefono').val('');
    $('#txtemail').val('');
    $('#txtContrasennia').val('');
}

function mostrarDetalleUsuario(idUsuario) {
    $('#banderaOjo').val(idUsuario);
    setFormularioDetalleVisible(true);
}

function loadingUsuarios(){
if($('#txtCodigoU').val('') ||
$('#txtNombre').val('') ||
$('#txtApePaterno').val('') ||
$('#txtApeMaterno').val('') ||
$('#txtTelefono').val('') ||
$('#txtemail').val('') ||
$('#txtContrasennia').val('')){

}else{
    loading();
}
}
