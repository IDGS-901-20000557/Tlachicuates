from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth

def consultarProductos():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_productos_compras()')
            resultset=curso.fetchall()
        connection.close()

        # Convertir la lista de tuplas a una lista de diccionarios
        productos = []
        for p in resultset:
            productos.append({
                'idProducto': p[0],
                'nombreProducto': p[1],
                'costoProduccion': p[2],
                'precioVenta': p[3],
                'foto': p[4]
            })

        return productos
    except Exception as ex:
        now = datetime.now()
        auth.logger.warning('Excepción a la hora de consultar productos: '+ str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error a la hora de consultar productos', category='error')


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

def delete_pedido(id_pedido):
    success = ''
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.execute('DELETE FROM pedidos_productos WHERE id_pedido=%s', (id_pedido,))
            cursor.execute('DELETE FROM pedidos WHERE id=%s', (id_pedido,))
            connection.commit()
        connection.close()
        print('Pedido eliminado con éxito')
        success = 'Pedido eliminado con éxito'
    except Exception as ex:
        print('Error al eliminar el pedido:', ex)
        success = 'Error al eliminar el pedido:', ex
    return success

def update_pedido(id_pedido, id_cliente, fecha_pedido, fecha_entrega, codigo, estatus):
    success = ''
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.execute("UPDATE pedidos SET id_cliente=%s, fecha_pedido=%s, fecha_entrega=%s, codigo=%s, estatus=%s WHERE id_pedido=%s", (id_cliente, fecha_pedido, fecha_entrega, codigo, estatus, id_pedido))
            connection.commit()
            success = 'Pedido actualizado correctamente'
        connection.close()
    except Exception as ex:
        print('Error actualizando el pedido:', ex)
        success = 'Error actualizando el pedido:', ex
    return success
