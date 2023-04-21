from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth


def consultarVentas():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_ventas()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar ventas: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar ventas', category='error')




def InsertarVenta(idUsuario,arregloInsumos, total):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        for valor in arregloInsumos:
                                    x = valor.split("°")
                                    curso.execute('CALL SP_verificar_inventario_Productos(%s, %s,@var_salida)',(x[0],x[1]))
                                    curso.execute('SELECT @var_salida')
                                    res = curso.fetchone()
                                    if res[0]!="SI":
                                               flash(res[0], category='error')
                                               return None
                        print("*"*500)
                        curso.execute('CALL SP_insertar_orden_venta(%s,%s,@var_salida)',
                                    (idUsuario, total))
                        curso.execute('SELECT @var_salida')
                        resultado = curso.fetchone()
                        connection.commit()    
                        print("#"*500)
                        print(arregloInsumos)
                        for valor in arregloInsumos:
                                print(valor)
                                print(resultado)
                                x = valor.split("°")
                                curso.execute('CALL SP_insert_orden_venta_producto(%s,%s,%s,%s,%s,@salida)',
                                        (idUsuario,resultado,x[0], x[1],x[2]))
                                connection.commit()    
                    connection.close()
                    flash('venta realizada', category='success')        
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar la venta: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar la venta', category='error')



def consultarVenta(idVenta):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('CALL SP_mostrar_venta(%s)',(idVenta,))
                resultset=curso.fetchone()
                curso.execute('CALL SP_mostrar_orden_venta_productos(%s)',(idVenta,))
                insumos=curso.fetchall()
            connection.close()
            return resultset, insumos
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar venta: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el venta', category='error')


def eliminarVenta(idUsuario,idVenta):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_Venta(%s,%s,@var_salida)',
                                    (idUsuario, idVenta))
                    connection.commit()    
                    connection.close()
                    flash('Venta eliminada', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar venta: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el venta', category='error')
