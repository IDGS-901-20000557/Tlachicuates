from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth
from project.models import User 
from flask import redirect, url_for

#consultarReservaciones
def consultarReservaciones(idReservacion):
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            cursor.execute('CALL SP_mostrar_reservacion(%s)', (idReservacion,))
            resultset = cursor.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
        now = datetime.now()
        auth.logger.warning('Excepción a la hora de consultar reservaciones: ' + str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error a la hora de consultar reservaciones', category='error')

#modificarInsertarReservacion
def modificarInsertarReservacion(idUsuario, idUsuarioNew, idReservacion, idCliente, idMesa, idHorario, fecha, personas):
    try:
        if idUsuarioNew:
            connection = get_connection()
            with connection.cursor() as curso:
                curso.execute('CALL SP_Insert_Update_Reservacion(%s, %s, %s, %s, %s, %s, %s, %s, @salida)',
                              (idUsuario, idUsuarioNew, idReservacion, idCliente, idMesa, idHorario, fecha, personas))
            connection.commit()
            connection.close()
        else:
            #Consultamos si existe un usuario ya registrado con el email.
            user = User.query.filter_by(email=email).first()
            if user: #Si se encontró un usuario, redireccionamos de regreso a la página de registro
                flash('El correo electrónico ya existe', category='error')
                return redirect(url_for('main.administradores_auth.vistaUsuarios', banderaLoading=True))
            connection = get_connection()
            with connection.cursor() as curso:
                curso.execute('CALL SP_Insert_Update_Reservacion(%s, -1, %s, %s, %s, %s, %s, %s, @salida)',
                              (idUsuario, idReservacion, idCliente, idMesa, idHorario, fecha, personas))
            connection.commit()
            connection.close()
    except Exception as ex:
        now = datetime.now()
        auth.logger.warning('Excepción a la hora de registrar reservación: ' + str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error a la hora de registrar la reservación', category='error')

#eliminarReservacion