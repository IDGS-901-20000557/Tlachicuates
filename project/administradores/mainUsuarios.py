from flask import flash
from project.dbTlachicuates import get_connection
from logging import FileHandler, WARNING, getLogger
from project.models import User
from datetime import datetime
from werkzeug.security import generate_password_hash
from project.auth import auth 
from flask import redirect, url_for

def modificarInsertarUsuario(idUsuario,idUsuarioNew, idRol, nombre, apellidom,apellidop, email, contrasennia, telefono):
    try:
                if idUsuarioNew:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_insert_update_Cliente(%s,%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, idUsuarioNew, idRol, nombre, apellidom,apellidop,
                                        email,generate_password_hash(contrasennia, method='sha256'), telefono))
                    connection.commit()    
                    connection.close() 
                    flash('Usuario modificado', category='success')   
                else:
                    #Consultamos si existe un usuario ya registrado con el email.
                    user = User.query.filter_by(email=email).first()
                    if user: #Si se encontró un usuario, redireccionamos de regreso a la página de registro
                            flash('El correo electrónico ya existe', category='error')
                            return redirect(url_for('main.administradores_auth.vistaUsuarios', banderaLoading=True))
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_insert_update_Cliente(%s,%s,%s,%s,%s,%s,%s,%s,%s,@salida)',
                                    (idUsuario, -1, idRol, nombre, apellidom,apellidop,
                                        email,generate_password_hash(contrasennia, method='sha256'), telefono))
                    connection.commit()    
                    connection.close()
                    flash('Usuario registrado', category='success')  
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el usuario', category='error')

def consultarUsuarios():
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_usuarios()')
            resultset=curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de consultar usuarios: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de consultar usuarios', category='error')



def consultarUsuario(idUsuario):
    try:
            connection=get_connection()
            with connection.cursor() as curso:
                curso.execute('call SP_mostrar_usuario(%s)',(idUsuario,))
                resultset=curso.fetchone()
            connection.close()
            return resultset
    except Exception as ex:
             now = datetime.now()
             auth.logger.warning('Excepción a la hora de consultar usuario: '+ str(ex) + ' a la fecha: ' + str(now))
             flash('Hubo un error a la hora de consultar el usuario', category='error')


def eliminarUsuario(idUsuario,idUsuarioNew):
    try:
                    connection=get_connection()
                    with connection.cursor() as curso:
                        curso.execute('CALL SP_eliminar_usuario(%s,%s,@var_salida)',
                                    (idUsuario, idUsuarioNew))
                    connection.commit()    
                    connection.close()
                    flash('Usuario eliminado', category='success')    
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de eliminar usuario: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de eliminar el usuario', category='error')