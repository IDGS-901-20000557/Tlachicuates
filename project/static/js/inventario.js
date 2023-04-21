var cantidadInsumos = 1;
var cantidadProductos = 1;

function inicializarModuloInventarios() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaInventarios').removeClass("col-12");
        $('#divTablaInventarios').addClass("col-7");
        $('#divDetalleInventario').show();
    } else {
        $('#divDetalleInventario').hide();
        $('#divTablaInventarios').removeClass("col-7");
        $('#divTablaInventarios').addClass("col-12");
    }
}



function limpiarFormulario() {
    $('#txtCodigoI').val('');
    $('#txtNoLote').val('');
    $('#txtObservaciones').val('');
    $('#txtCosto').val('');
    $('#banderaInsumos').val('');
    $("input[name=tipoInventario2]").prop('disabled', false);
    $("#buttonEntregado").hide();
    $("#caducidadLoteDiv").hide();

    for (let i = 2; i <= cantidadInsumos; i++) {
        const element = document.getElementById('contenedorInsumo' + i);
        element.remove();
    }

    for (let i = 2; i <= cantidadProductos; i++) {
        const element = document.getElementById('contenedorProducto' + i);
        element.remove();
    }
    cantidadInsumos = 1;
    cantidadProductos = 1;
    $('#txtCantidad1').val('');
    $('#txtCantidadP1').val('');
}

function mostrarDetalleInventario(idInventario, banderaTipo) {
    $('#banderaOjo').val(idInventario);
    $('#banderaOjo2').val(banderaTipo);
    setFormularioDetalleVisible(true);
}

function loadingInventarios() {
    if (
        $('#txtCosto').val().length == 0 ||
        $('#txtObservaciones').val() <= 0) {
    } else {
        loading();
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


function crearElementosProductos() {
    /* let elements = document.getElementsByTagName(tagName); */
    cantidadProductos++;
    const contenedor = document.getElementById("contenedorProductos");
    const contenedorRow = document.createElement("div");
    contenedorRow.setAttribute('class', 'form-group row');
    contenedorRow.setAttribute('id', 'contenedorProducto' + cantidadProductos);
    contenedor.appendChild(contenedorRow);
    const contenedorSelect = document.createElement("div");
    contenedorSelect.setAttribute('class', 'col-4');
    contenedorRow.appendChild(contenedorSelect);
    const labelSelect = document.createElement("label");
    labelSelect.htmlFor = 'txtProducto' + cantidadProductos;
    labelSelect.setAttribute('class', 'labelForm');
    labelSelect.appendChild(document.createTextNode("Producto:"));
    contenedorSelect.appendChild(labelSelect);
    const contenedorboxSelect = document.createElement("div");
    contenedorboxSelect.setAttribute('class', 'box');
    contenedorboxSelect.style.cssText = 'width: 100%; cursor: pointer;';
    contenedorSelect.appendChild(contenedorboxSelect);
    const selectInsumo = document.createElement("select");
    selectInsumo.setAttribute('id', 'txtProducto' + cantidadProductos);
    selectInsumo.setAttribute('name', 'txtProducto' + cantidadProductos);
    selectInsumo.setAttribute("onchange", "setParametros('"
        + 'txtProducto' + cantidadProductos + "', '" + 'txtCostoP' + cantidadProductos + "', '"
        + 'txtUnidadP' + cantidadProductos + "')");
    contenedorboxSelect.appendChild(selectInsumo);
    $('#txtProducto' + cantidadProductos).html($('#txtProducto').html());
    const contenedorCosto = document.createElement("div");
    contenedorCosto.setAttribute('class', 'col-2');
    contenedorRow.appendChild(contenedorCosto);
    const labelCosto = document.createElement("label");
    labelCosto.htmlFor = 'txtCostoP' + cantidadProductos;
    labelCosto.setAttribute('class', 'labelForm');
    labelCosto.appendChild(document.createTextNode("Costo:"));
    contenedorCosto.appendChild(labelCosto);
    const inputCosto = document.createElement("input");
    inputCosto.setAttribute('id', 'txtCostoP' + cantidadProductos);
    inputCosto.setAttribute('name', 'txtCostoP' + cantidadProductos);
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
    labelUnidad.htmlFor = 'txtUnidadP' + cantidadProductos;
    labelUnidad.setAttribute('class', 'labelForm');
    labelUnidad.appendChild(document.createTextNode("Unidad:"));
    contenedorUnidad.appendChild(labelUnidad);
    const inputUnidad = document.createElement("input");
    inputUnidad.setAttribute('id', 'txtUnidadP' + cantidadProductos);
    inputUnidad.setAttribute('name', 'txtUnidadP' + cantidadProductos);
    inputUnidad.setAttribute('class', 'form-control rounded-left inputForm');
    inputUnidad.type = "text";
    inputUnidad.value= "lt";
    inputUnidad.setAttribute('placeholder', 'Unidad');
    inputUnidad.readOnly = true;
    inputUnidad.required = true;
    contenedorUnidad.appendChild(inputUnidad);

    const contenedorCantidad = document.createElement("div");
    contenedorCantidad.setAttribute('class', 'col-2');
    contenedorRow.appendChild(contenedorCantidad);
    const labelCantidad = document.createElement("label");
    labelCantidad.htmlFor = 'txtCantidadP' + cantidadProductos;
    labelCantidad.setAttribute('class', 'labelForm');
    labelCantidad.appendChild(document.createTextNode("Cantidad:"));
    contenedorCantidad.appendChild(labelCantidad);
    const inputCantidad = document.createElement("input");
    inputCantidad.setAttribute('id', 'txtCantidadP' + cantidadProductos);
    inputCantidad.setAttribute('name', 'txtCantidadP' + cantidadProductos);
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


function eliminarElementosProductos() {
    if (cantidadProductos > 1) {
        const element = document.getElementById('contenedorProducto' + cantidadProductos);
        element.remove();
        cantidadProductos--;
    } else {
        Swal.fire({
            position: 'center',
            icon: 'error',
            text: "Se necesita al menos un producto",
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

function agregarInputProductos() {
    let total = 0;
    let cadenaInsumos="";
    for (let i = 1; i <= cantidadProductos; i++) {
        let costoInsumo = $('#txtCantidadP'+i).val();
        let cantidadInsumo =$('#txtCostoP'+i).val();
        total= total+ (costoInsumo*cantidadInsumo);
        cadenaInsumos=cadenaInsumos+"¬"+$('#txtProducto'+i).val()+"°"+$('#txtCantidadP'+i).val();
    }
    $('#txtCosto').val(total);
    $('#banderaInsumos').val(cadenaInsumos);
    window.location.href = "#close5";
}


function cambiarLongitud(longitud){
    cantidadInsumos=longitud;
}

function cambiarLongitudProductos(longitud){
    cantidadProductos=longitud;
}

function optionProductoInsumo(){
    
    $('#banderaInventario').val($('input[name="tipoInventario2"]:checked').val());
    if(parseInt($('input[name="tipoInventario2"]:checked').val())===1){
        $("#buttonInsumo").hide();
        $("#buttonProducto").show();
        
    }else{
        $("#buttonProducto").hide();
        $("#buttonInsumo").show();
    }
    
}
