from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth
from project.models import User 
from flask import redirect, url_for

def consultarProveedores():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_proveedores()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar proveedores: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar proveedores', category='error')


def modificarInsertarProveedor(idUsuario,idUsuarioNew, idProveedor, nombreEmpresa, nombre, apellidom,apellidop, email, telefono):
    try:
                if idUsuarioNew:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Proveedor(%s,%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, idUsuarioNew, idProveedor, nombreEmpresa, nombre, apellidom,apellidop,
                                        email, telefono))
                    connection.commit()    
                    connection.close()
                    flash('proveedor modificado', category='success')    
                else:
                    #Consultamos si existe un usuario ya registrado con el email.
                    user = User.query.filter_by(email=email).first()
                    if user: #Si se encontró un usuario, redireccionamos de regreso a la página de registro
                            flash('El correo electrónico ya existe', category='error')
                            return redirect(url_for('main.administradores_auth.vistaUsuarios', banderaLoading=True))
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_Insert_Update_Proveedor(%s,%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, -1, -1, nombreEmpresa, nombre, apellidom,apellidop,
                                        email, telefono))
                    connection.commit()    
                    connection.close()
                    flash('proveedor registrado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar proveedor: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el proveedor', category='error')



def consultarProveedor(idUsuario):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('call SP_mostrar_proveedor(%s)',(idUsuario,))
                resultset=curso.fetchone()
            connection.close()
            return resultset
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar proveedor: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el proveedor', category='error')


def eliminarProveedor(idUsuario,idProveedor):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_proveedor(%s,%s,@var_salida)',
                                    (idUsuario, idProveedor))
                    connection.commit()    
                    connection.close()
                    flash('Proveedor eliminado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar proveedor: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el proveedor', category='error')