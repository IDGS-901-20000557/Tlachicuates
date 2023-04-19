from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth

def consultarInsumos():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_insumos()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar insumos: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar insumos', category='error')


def modificarInsertarInsumo(idUsuario,idProveedor, idInsumo, nombreInsumo, unidad, precio):
    try:
                if idInsumo:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Insumo(%s,%s,%s,%s,%s,%s,@var_salida)',
                                    (idUsuario, idProveedor, idInsumo, nombreInsumo, unidad, precio))
                    connection.commit()    
                    connection.close()
                    flash('insumo modificado', category='success')    
                else:
                    print("*"*500)
                    print(idUsuario, idProveedor, -1, nombreInsumo, unidad, precio)
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Insumo(%s,%s,%s,%s,%s,%s,@var_salida)',
                                    (idUsuario, idProveedor, -1, nombreInsumo, unidad, precio))
                    connection.commit()    
                    connection.close()
                    flash('proveedor registrado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar insumo: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el insumo', category='error')



def consultarInsumo(idInsumo):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('call SP_mostrar_Insumo(%s)',(idInsumo,))
                resultset=curso.fetchone()
            connection.close()
            return resultset
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar insumo: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el insumo', category='error')


def eliminarInsumo(idUsuario,idInsumo):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_insumo(%s,%s,@var_salida)',
                                    (idUsuario, idInsumo))
                    connection.commit()    
                    connection.close()
                    flash('Insumo eliminado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar insumo: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el insumo', category='error')