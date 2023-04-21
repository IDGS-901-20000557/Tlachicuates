var cantidadProductos = 1;
var totalProductos = 0;


function inicializarModuloVentas() {

    setFormularioDetalleVisible(true);

}


function setFormularioDetalleVisible(valor) {
    if (valor) {
        $('#divTablaVentas').removeClass("col-12");
        $('#divTablaVentas').addClass("col-7");
        $('#divDetalleVentas').show();
    } else {
        $('#divDetalleVentas').hide();
        $('#divTablaVentas').removeClass("col-7");
        $('#divTablaVentas').addClass("col-12");
    }
}



function limpiarFormulario() {
    $('#txtCodigoV').val('');
    for (let i = 2; i <= cantidadProductos; i++) {
        const element = document.getElementById('contenedorProducto' + i);
        element.remove();
    }
    cantidadProductos = 1;
    $('#txtCostoP1').val('');
    $('#txtCantidadP1').val('');
    $('#txtTotal').val('');

}

function mostrarDetalleVenta(idInventario) {
    $('#banderaOjo').val(idInventario);
    setFormularioDetalleVisible(true);
}




function setParametros(IdSelect, idCosto) {
    var costo = $("#" + IdSelect).children(":selected").attr("name");;
    $("#" + idCosto).val(costo);
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
    contenedorSelect.setAttribute('class', 'col-3');
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
        + 'txtProducto' + cantidadProductos + "', '" + 'txtCostoP' + cantidadProductos + "')");
    contenedorboxSelect.appendChild(selectInsumo);
    $('#txtProducto' + cantidadProductos).html($('#txtProducto').html());
    const contenedorCosto = document.createElement("div");
    contenedorCosto.setAttribute('class', 'col-3');
    contenedorRow.appendChild(contenedorCosto);
    const labelCosto = document.createElement("label");
    labelCosto.htmlFor = 'txtCostoP' + cantidadProductos;
    labelCosto.setAttribute('class', 'labelForm');
    labelCosto.appendChild(document.createTextNode("Precio:"));
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
    contenedorUnidad.setAttribute('class', 'col-3');
    contenedorRow.appendChild(contenedorUnidad);
    const labelUnidad = document.createElement("label");
    labelUnidad.htmlFor = 'txtUnidadP' + cantidadProductos;
    labelUnidad.setAttribute('class', 'labelForm');
    labelUnidad.appendChild(document.createTextNode("Unidad:"));
    contenedorUnidad.appendChild(labelUnidad);

    const otroContenedor = document.createElement("div");
    otroContenedor.setAttribute('class', 'box');
    otroContenedor.style.cssText = 'width: 100%; cursor: pointer;';
    contenedorUnidad.appendChild(otroContenedor);
    const inputUnidad = document.createElement("select");
    inputUnidad.setAttribute('id', 'txtUnidadP' + cantidadProductos);
    inputUnidad.setAttribute('name', 'txtUnidadP' + cantidadProductos);
    otroContenedor.appendChild(inputUnidad);
    const optionUno = document.createElement("option");
    optionUno.value= "1";
    optionUno.innerHTML= "Un Litro";
    inputUnidad.appendChild(optionUno);
    const optionDos = document.createElement("option");
    optionDos.value= "0.5";
    optionDos.innerHTML= "Medio Litro";
    inputUnidad.appendChild(optionDos);
    const optionTres = document.createElement("option");
    optionTres.value= "0.25";
    optionTres.innerHTML= "250 Mililitros";
    inputUnidad.appendChild(optionTres);


    const contenedorCantidad = document.createElement("div");
    contenedorCantidad.setAttribute('class', 'col-3');
    contenedorRow.appendChild(contenedorCantidad);
    const labelCantidad = document.createElement("label");
    labelCantidad.htmlFor = 'txtCantidadP' + cantidadProductos;
    labelCantidad.setAttribute('class', 'labelForm');
    labelCantidad.appendChild(document.createTextNode("Cantidad:"));
    contenedorCantidad.appendChild(labelCantidad);
    const inputCantidad = document.createElement("input");
    inputCantidad.setAttribute('id', 'txtCantidadP' + cantidadProductos);
    inputCantidad.setAttribute('name', 'txtCantidadP' + cantidadProductos);
    inputCantidad.setAttribute('class', 'form-control rounded-left inputForm cantidad');
    inputCantidad.type = "number";
    inputCantidad.setAttribute('placeholder', 'Cantidad');
    inputCantidad.required = true;
    contenedorCantidad.appendChild(inputCantidad);
    calcularTotales();
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



function agregarInputProductos() {
    let total = 0;
    let cadenaInsumos="";
    loading();
    for (let i = 1; i <= cantidadProductos; i++) {
        let costoInsumo = $('#txtCantidadP'+i).val();
        let cantidadInsumo =$('#txtCostoP'+i).val();
        total= total+ (costoInsumo*cantidadInsumo);
        cadenaInsumos=cadenaInsumos+"¬"+$('#txtProducto'+i).val()+"°"+$('#txtCantidadP'+i).val()+"°"+$('#txtUnidadP'+i).val();
    }
    $('#banderaInsumos').val(cadenaInsumos);
}



function cambiarLongitudProductos(longitud){
    cantidadProductos=longitud;
}

function  calcularTotales() {
    $('.cantidad').change(function () {
    total=0;
    console.log("XXXXXXXXXXXXXXXXX");
    for (let i = 1; i <= cantidadProductos; i++) {
        console.log("sdsasads");
        total=total+(($('#txtCostoP'+ i).val()*$('#txtCantidadP'+ i).val())*$('#txtUnidadP'+ i).val());
        console.log($('#txtUnidadP'+ i).val());
    }
   
    $('#txtTotal').val(total);
});
}

