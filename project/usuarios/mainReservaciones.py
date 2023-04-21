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

# eliminarReservacion
