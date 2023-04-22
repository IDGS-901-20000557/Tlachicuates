function agregarAlCarrito(idPedido){
    alert(idPedido)
    fetch('/cliente/tlachicuates/mispedidos', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            'idPedido': idPedido
        })
    })
    .then(response => response.json())
    .then(productos_obtenidos => {
      // aquí puedes procesar la respuesta de la función obtenerProductosPorPedido
      console.log(productos_obtenidos);
    });

   
    hacerVisibleCarrito();



}

function p(Nombre){
    alert(Nombre)
 
}

