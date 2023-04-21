from flask import flash
from project.dbTlachicuates import get_connection
from datetime import datetime
from project.auth import auth
from project.models import User
from flask import redirect, url_for

# consultarReservaciones
def consultarReservaciones():
    try:
        connection = get_connection()
        with connection.cursor() as curso:
            curso.execute('call SP_mostrar_reservaciones();')
            resultset = curso.fetchall()
        connection.close()
        return resultset
    except Exception as ex:
        now = datetime.now()
        auth.logger.warning(
            'Excepción a la hora de consultar usuarios: ' + str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error a la hora de consultar usuarios', category='error')

# modificarInsertarReservacion
def modificarInsertarReservacion(id_reservacion, fecha, hora, cantidad_personas, id_usuario):
    try:
        connection = get_connection()
        with connection.cursor() as cursor:
            if id_reservacion:
                cursor.execute('call SP_Insert_Update_Reservacion(%s, %s, %s, %s, %s);', 
                               (id_reservacion, fecha, hora, cantidad_personas, id_usuario))
                message = 'Reservación modificada correctamente.'
            else:
                cursor.execute('call SP_Insert_Update_Reservacion(%s, %s, %s, %s, %s);', 
                               (fecha, hora, cantidad_personas, id_usuario))
                message = 'Reservación creada correctamente.'
            connection.commit()
        connection.close()
        flash(message, category='success')
    except Exception as ex:
        now = datetime.now()
        auth.logger.warning('Excepción al insertar o modificar reservación: ' + str(ex) + ' a la fecha: ' + str(now))
        flash('Hubo un error al crear o modificar la reservación.', category='error')
        return redirect(url_for('clientes_auth.vistaReservaciones'))

# eliminarReservacion
