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
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar proveedor: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el proveedor', category='error')
