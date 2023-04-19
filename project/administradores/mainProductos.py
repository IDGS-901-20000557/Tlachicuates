from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth

def consultarProductos():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_productos()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar productos: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar productos', category='error')

def modificarInsertarProducto(idUsuario,idProducto, nombreProducto, descripcion, foto, costo ,precio, observaciones, arregloInsumos):
    try:
                if not idProducto:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Producto(%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, -1, nombreProducto, descripcion, foto, costo,precio,
                                        observaciones))
                        curso.execute('SELECT @salida')
                        resultado = curso.fetchone()
                        connection.commit()    
                        for valor in arregloInsumos:
                                x = valor.split("°")
                                curso.execute('CALL SP_Insert_Receta(%s,%s,%s,%s,@salida)',
                                        (idUsuario,resultado,x[0], x[1]))
                                connection.commit()    
                    connection.close()
                    flash('receta insertada', category='success')    
                else:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Producto(%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, idProducto, nombreProducto, descripcion, foto, costo,precio,
                                        observaciones))
                        connection.commit()
                        curso.execute('CALL SP_eliminar_receta(%s,%s,@salida)',
                                    (idUsuario, idProducto))
                        connection.commit()       
                        for valor in arregloInsumos:
                                x = valor.split("°")
                                curso.execute('CALL SP_Insert_Receta(%s,%s,%s,%s,@salida)',
                                        (idUsuario,idProducto,x[0], x[1]))
                                connection.commit()    
                    connection.close()
                    flash('receta modificada', category='success')      
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar receta: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el receta', category='error')


def consultarReceta(idProducto):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('CALL SP_mostrar_producto(%s)',(idProducto,))
                resultset=curso.fetchone()
                curso.execute('CALL SP_mostrar_receta(%s)',(idProducto,))
                insumos=curso.fetchall()
            connection.close()
            return resultset, insumos
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar receta: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el receta', category='error')


def eliminarProducto(idUsuario,idProducto):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_producto(%s,%s,@var_salida)',
                                    (idUsuario, idProducto))
                    connection.commit()    
                    connection.close()
                    flash('Producto eliminado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar producto: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el producto', category='error')