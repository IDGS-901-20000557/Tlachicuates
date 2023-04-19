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
if($('#txtNombre').val().length == 0 ||
$('#txtApePaterno').val().length == 0 ||
$('#txtApeMaterno').val().length == 0 ||
$('#txtTelefono').val().length == 0 ||
$('#txtemail').val().length == 0 ||
$('#txtContrasennia').val().length == 0){
    
}else{
    loading();
}
}
