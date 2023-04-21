from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
#from .mainUsuarios import modificarInsertarUsuario, consultarUsuarios, consultarUsuario, eliminarUsuario
from .mainReservaciones import consultarReservaciones, modificarInsertarReservacion, eliminarReservacion
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required, current_user
from flask_security.decorators import roles_required
from flask import session

clientes = Blueprint('clientes_auth', __name__)

#Inicio usuarios
@clientes.route("/tlachicuates/reservaciones")
@login_required
@roles_required('cliente')
def vistaReservaciones():
    resultset=consultarReservaciones()
    return render_template('/clientes/reservaciones.html', banderaLoading=True)





""" @clientes.route("/tlachicuates/reservaciones", methods=["POST"])
@login_required
@roles_required('cliente')
def CUDvistaReservaciones():
    idUsuario = session.get("idUsuario")
    if int(request.form.get('bandera1'))==1:
        modificarInsertarReservacion(
            int(request.form.get('txtIdReservacion')),
            idUsuario,
            int(request.form.get('selectMesa')),
            int(request.form.get('selectHorario')),
            )
    elif int(request.form.get('bandera1'))==2:
        eliminarReservacion(
            int(request.form.get('txtIdReservacion')),
            idUsuario,
            )
           
    return redirect(url_for('main.clientes_auth.vistaReservaciones'))  """

#Fin usuarios