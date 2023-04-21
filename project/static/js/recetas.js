var cantidadInsumos = 1;
function inicializarModuloProductos() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaProductos').removeClass("col-12");
        $('#divTablaProductos').addClass("col-7");
        $('#divDetalleProducto').show();
    } else {
        $('#divDetalleProducto').hide();
        $('#divTablaProductos').removeClass("col-7");
        $('#divTablaProductos').addClass("col-12");
    }
}


function limpiarFormulario() {
    $('#txtCodigoP').val('');
    $('#codigoImagen').val('');
    $('#txtNombreP').val('');
    $('#txtCosto').val('');
    $('#txtPrecio').val('');
    $('#txtDescripcion').val('');
    $('#txtObservaciones').val('');
    $('#fotoPortada').attr('src', "");

    for (let i = 2; i <= cantidadInsumos; i++) {
        const element = document.getElementById('contenedorInsumo' + i);
        element.remove();
    }
    cantidadInsumos = 1;
    $('#txtCantidad1').val('');
}

function mostrarDetalleProducto(idProducto) {
    $('#banderaOjo').val(idProducto);
    setFormularioDetalleVisible(true);
}

function loadingProductos() {
    if (
        $('#codigoImagen').val().length == 0 ||
        $('#txtNombreP').val().length == 0 ||
        $('#txtCosto').val() <= 0 ||
        $('#txtPrecio').val() <= 0 ||
        $('#txtDescripcion').val() <= 0 ||
        $('#txtObservaciones').val() <= 0) {

    } else {
        loading();
    }
}


function cargarFotografia() {

    //Recuperamos el input de tipo file donde se selecciona la foto:
    var inputFile = document.getElementById('inputFileFoto');

    //Revisamos que el usuario haya seleccionado un archivo:
    if (inputFile.files && inputFile.files[0]) {

        //Creamos el objeto que leerá la imagen
        var reader = new FileReader();

        //Agregamos un oyente al lector del archivo para que,
        //en cuanto el usuario cargue una imagen, esta se lea
        //y se convierta de forma automatica en una cadena de Base64:
        reader.onload = function (e) {

            var fotoB64 = e.target.result;
            $("#fotoPortada").attr("src", fotoB64);
            $("#codigoImagen").val(fotoB64);

        };

        //Leemos el archivo que selecciono el usuario y lo
        //convertimos en una cadena con la Base64

        reader.readAsDataURL(inputFile.files[0]);

    }


}


function setParametros(IdSelect, idCosto, idUnidad) {
    var unidad = $("#" + IdSelect).children(":selected").attr("id");
    var costo = $("#" + IdSelect).children(":selected").attr("name");
    $("#" + idUnidad).val(unidad);
    $("#" + idCosto).val(costo);
}

function crearElementos() {
    /* let elements = document.getElementsByTagName(tagName); */
    cantidadInsumos++;
    const contenedor = document.getElementById("contenedorInsumos");
    const contenedorRow = document.createElement("div");
    contenedorRow.setAttribute('class', 'form-group row');
    contenedorRow.setAttribute('id', 'contenedorInsumo' + cantidadInsumos);
    contenedor.appendChild(contenedorRow);
    const contenedorSelect = document.createElement("div");
    contenedorSelect.setAttribute('class', 'col-4');
    contenedorRow.appendChild(contenedorSelect);
    const labelSelect = document.createElement("label");
    labelSelect.htmlFor = 'txtInsumo' + cantidadInsumos;
    labelSelect.setAttribute('class', 'labelForm');
    labelSelect.appendChild(document.createTextNode("Insumo:"));
    contenedorSelect.appendChild(labelSelect);
    const contenedorboxSelect = document.createElement("div");
    contenedorboxSelect.setAttribute('class', 'box');
    contenedorboxSelect.style.cssText = 'width: 100%; cursor: pointer;';
    contenedorSelect.appendChild(contenedorboxSelect);
    const selectInsumo = document.createElement("select");
    selectInsumo.setAttribute('id', 'txtInsumo' + cantidadInsumos);
    selectInsumo.setAttribute('name', 'txtInsumo' + cantidadInsumos);
    selectInsumo.setAttribute("onchange", "setParametros('"
        + 'txtInsumo' + cantidadInsumos + "', '" + 'txtCosto' + cantidadInsumos + "', '"
        + 'txtUnidad' + cantidadInsumos + "')");
    contenedorboxSelect.appendChild(selectInsumo);
    $('#txtInsumo' + cantidadInsumos).html($('#txtInsumo').html());
    const contenedorCosto = document.createElement("div");
    contenedorCosto.setAttribute('class', 'col-2');
    contenedorRow.appendChild(contenedorCosto);
    const labelCosto = document.createElement("label");
    labelCosto.htmlFor = 'txtCosto' + cantidadInsumos;
    labelCosto.setAttribute('class', 'labelForm');
    labelCosto.appendChild(document.createTextNode("Costo:"));
    contenedorCosto.appendChild(labelCosto);
    const inputCosto = document.createElement("input");
    inputCosto.setAttribute('id', 'txtCosto' + cantidadInsumos);
    inputCosto.setAttribute('name', 'txtCosto' + cantidadInsumos);
    inputCosto.setAttribute('class', 'form-control rounded-left inputForm');
    inputCosto.type = "text";
    inputCosto.setAttribute('placeholder', 'Costo');
    inputCosto.readOnly = true;
    inputCosto.required = true;
    contenedorCosto.appendChild(inputCosto);


    const contenedorUnidad = document.createElement("div");
    contenedorUnidad.setAttribute('class', 'col-4');
    contenedorRow.appendChild(contenedorUnidad);
    const labelUnidad = document.createElement("label");
    labelUnidad.htmlFor = 'txtUnidad' + cantidadInsumos;
    labelUnidad.setAttribute('class', 'labelForm');
    labelUnidad.appendChild(document.createTextNode("Unidad:"));
    contenedorUnidad.appendChild(labelUnidad);
    const inputUnidad = document.createElement("input");
    inputUnidad.setAttribute('id', 'txtUnidad' + cantidadInsumos);
    inputUnidad.setAttribute('name', 'txtUnidad' + cantidadInsumos);
    inputUnidad.setAttribute('class', 'form-control rounded-left inputForm');
    inputUnidad.type = "text";
    inputUnidad.setAttribute('placeholder', 'Unidad');
    inputUnidad.readOnly = true;
    inputUnidad.required = true;
    contenedorUnidad.appendChild(inputUnidad);

    const contenedorCantidad = document.createElement("div");
    contenedorCantidad.setAttribute('class', 'col-2');
    contenedorRow.appendChild(contenedorCantidad);
    const labelCantidad = document.createElement("label");
    labelCantidad.htmlFor = 'txtCantidad' + cantidadInsumos;
    labelCantidad.setAttribute('class', 'labelForm');
    labelCantidad.appendChild(document.createTextNode("Cantidad:"));
    contenedorCantidad.appendChild(labelCantidad);
    const inputCantidad = document.createElement("input");
    inputCantidad.setAttribute('id', 'txtCantidad' + cantidadInsumos);
    inputCantidad.setAttribute('name', 'txtCantidad' + cantidadInsumos);
    inputCantidad.setAttribute('class', 'form-control rounded-left inputForm');
    inputCantidad.type = "number";
    inputCantidad.setAttribute('placeholder', 'Cantidad');
    inputCantidad.required = true;
    contenedorCantidad.appendChild(inputCantidad);
}

function eliminarElementos() {
    if (cantidadInsumos > 1) {
        const element = document.getElementById('contenedorInsumo' + cantidadInsumos);
        element.remove();
        cantidadInsumos--;
    } else {
        Swal.fire({
            position: 'center',
            icon: 'error',
            text: "Se necesita al menos un insumo",
            showConfirmButton: true,
            timer: 5000
        })
    }
}

function agregarInputInsumos() {
    let total = 0;
    let cadenaInsumos="";
    for (let i = 1; i <= cantidadInsumos; i++) {
        let costoInsumo = $('#txtCantidad'+i).val();
        let cantidadInsumo =$('#txtCosto'+i).val();
        total= total+ (costoInsumo*cantidadInsumo);
        cadenaInsumos=cadenaInsumos+"¬"+$('#txtInsumo'+i).val()+"°"+$('#txtCantidad'+i).val();
    }
    $('#txtCosto').val(total);
    $('#banderaInsumos').val(cadenaInsumos);
    window.location.href = "#close4";
}


function cambiarLongitud(longitud){
    cantidadInsumos=longitud;
}