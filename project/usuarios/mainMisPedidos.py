from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth


def consultarPedidos(idCliente):
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.execute('call SP_mostrar_pedidos(%s)', idCliente)
            resultset = cursor.fetchall()
        
        connection.close()

        # Convertir la lista de tuplas a una lista de diccionarios
        pedidos = []
        for p in resultset:
            pedidos.append({
                'idPedido': p[0],
                'fechaPedido': p[1],
                'estado': p[2],
                'idCliente': p[3]
            })

        return pedidos

    except Exception as ex:
        now = datetime.now()
        auth.logger.warning('Excepción a la hora de consultar pedidos: '+ str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error a la hora de consultar pedidos', category='error')

def insert_pedido(id_cliente, fecha_pedido, fecha_entrega, codigo, estatus):
    success = ''
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.callproc('SP_insert_pedido', args=(id_cliente, fecha_pedido, fecha_entrega, codigo, estatus))
            connection.commit()
            cursor.execute('SELECT LAST_INSERT_ID()')
            last_id = cursor.fetchone()[0]
        connection.close()
        print('Pedido added successfully')
        success = 'Pedido added successfully'
    except Exception as ex:
        print('Error adding pedido:', ex)
        success = 'Error adding pedido:', ex
    return last_id

def insert_pedido_producto(cantidad, unidad, id_producto, id_pedido):
    success = ''
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.callproc('SP_insert_pedido_producto', args=(cantidad, unidad, id_producto, id_pedido))
            connection.commit()
        connection.close()
        print(id_producto)
        print('Producto agregado al pedido con éxito')
        success = 'Producto agregado al pedido con éxito'
    except Exception as ex:
        print(id_producto)
        print('Error al agregar el producto al pedido:', ex)
        success = 'Error al agregar el producto al pedido:', ex
    return success


def obtenerProductosPorPedido(idPedido):
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            # Obtenemos los productos y cantidades del pedido
            cursor.execute('SELECT p.idproductos, p.nombreProducto, p.precioVenta, d.cantidad, d.unidad, pe.fechaPedido, pe.idPedidos \
                            FROM pedido_producto d \
                            INNER JOIN producto p ON d.idProducto = p.idproductos \
                            INNER JOIN pedido pe ON d.idPedidos = pe.idPedidos \
                            WHERE pe.idPedidos = %s', idPedido)

            resultset = cursor.fetchall()

        connection.close()

        # Convertir la lista de tuplas a una lista de diccionarios
        productos = []
        for p in resultset:
            productos.append({
                'idProducto': p[0],
                'nombreProducto': p[1],
                'precioProducto': p[2],
                'cantidad': p[3],
                'unidad': p[4],
                'fechaPedido': p[5],
                'idPedido': p[6]
            })

        return productos

    except Exception as ex:
       print('Error obteniendo productos del pedido:', ex)
       return None

