from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth
from random import randint

def consultarInventarios():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_Lotes()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar Lotes: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar Lotes', category='error')

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def modificarInsertarLote(idUsuario,idLote, var_noLote, var_costo, var_observaciones, arregloInsumos, bandera):
    try:
                if not idLote:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Lote(%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, -1, random_with_N_digits(5), var_costo, var_observaciones))
                        curso.execute('SELECT @salida')
                        resultado = curso.fetchone()
                        connection.commit()
                        for valor in arregloInsumos:
                                    x = valor.split("°")
                                    if int(bandera)==2:   
                                        curso.execute('CALL SP_insert_Lote_Insumos(%s,%s,%s,%s,@salida)',
                                                (idUsuario,resultado,x[0], x[1]))
                                        connection.commit()  
                                    elif int(bandera)==1:
                                           curso.execute('CALL SP_insert_lote_Productos(%s,%s,%s,%s,@salida)',
                                            (idUsuario,resultado,x[0], x[1]))
                                           connection.commit()
 
                    connection.close()
                    flash('Lote insertado', category='success')    
                else:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Lote(%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, idLote, var_noLote, var_costo, var_observaciones))
                        connection.commit()
                        if int(bandera)==2: 
                            curso.execute('CALL SP_eliminar_insumos_lote(%s,%s,@salida)',
                                        (idUsuario, idLote))
                            connection.commit()  
                        elif int(bandera)==1:
                            curso.execute('CALL SP_eliminar_productos_lote(%s,%s,@salida)',
                                        (idUsuario, idLote))
                            connection.commit()       
                        for valor in arregloInsumos:
                                    x = valor.split("°")
                                    if int(bandera)==2:   
                                        curso.execute('CALL SP_insert_Lote_Insumos(%s,%s,%s,%s,@salida)',
                                                (idUsuario,idLote,x[0], x[1]))
                                        connection.commit() 
                                    elif int(bandera)==1:
                                           curso.execute('CALL SP_insert_lote_Productos(%s,%s,%s,%s,@salida)',
                                            (idUsuario,idLote,x[0], x[1]))
                                           connection.commit()   
                    connection.close()
                    flash('Lote modificado', category='success')      
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar lote: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el lote', category='error')


def consultarInventario(idLote, bandera):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('CALL SP_mostrar_lote(%s)',(idLote,))
                resultset=curso.fetchone()
                if bandera=="Insumo":
                    curso.execute('CALL SP_mostrar_lote_insumos(%s)',(idLote,))
                elif bandera=="Producto":
                    curso.execute('CALL SP_mostrar_lote_productos(%s)',(idLote,))
                insumos=curso.fetchall()
            connection.close()
            return resultset, insumos
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar lote: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el lote', category='error')

def eliminarLote(idUsuario,idLote):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_Lote(%s,%s,@var_salida)',
                                    (idUsuario, idLote))
                    connection.commit()    
                    connection.close()
                    flash('Lote eliminado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar lote: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el lote', category='error')



def aprobarLoteInsumo(idUsuario,idLote, arregloInsumos, fechaCaducidad, bandera):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        if int(bandera)==2:  
                            for valor in arregloInsumos:
                                    x = valor.split("°")
                                    curso.execute('CALL SP_agregarInventario_Insumos(%s,%s,%s,%s,@var_salida)',
                                        (idUsuario, idLote,x[0],fechaCaducidad))
                                    connection.commit()
                        elif int(bandera)==1:
                          for valor in arregloInsumos:
                                    x = valor.split("°")
                                    curso.execute('CALL SP_mostrar_receta(%s)',(x[0],))
                                    insumos=curso.fetchall()
                                    for insumo in insumos:
                                        curso.execute('CALL SP_verificar_inventario_insumos(%s,%s,%s,@var_salida)',
                                            (x[0], insumo[0],x[1]))
                                        curso.execute('SELECT @var_salida')
                                        resultado = curso.fetchone()
                                        if resultado[0]!="SI":
                                               flash(resultado[0], category='error')
                                               return None
                          for valor in arregloInsumos:
                                 x = valor.split("°")
                                 curso.execute('CALL SP_agregarInventario_Productos(%s,%s,%s,%s,@var_salida)',
                                        (idUsuario, idLote,x[0],fechaCaducidad))
                                 connection.commit()
                                 curso.execute('CALL SP_mostrar_receta(%s)',(x[0],))
                                 insumos=curso.fetchall()
                                 for insumo in insumos:
                                        curso.execute('CALL SP_eliminarInventario_Insumos(%s,%s,%s,%s,@var_salida)',
                                            (idUsuario, insumo[0],x[0],idLote))
                                        connection.commit()
                    connection.close()
                    flash('Lote agregado al Almacen', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de agregar lote al almacen: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de agregar lote al almacen', category='error')

#Inventario Real
def comprobarInventario():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrarStockReal_Productos()')
            resultset=curso.fetchall()
            curso.execute('call SP_mostrarStockReal_Insumos()')
            resultset2=curso.fetchall()
        connection.close()
        return resultset, resultset2
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar Inventario: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar Inventario', category='error')
       
#Fin Inventario Real