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

#Inicio de contacto

@clientes.route("/tlachicuates/contacto")
@login_required
@roles_required('cliente')
def vistaContacto():
    return render_template('/generales/contacto.html', banderaLoading=True)

#Fin de Contacto

#Inicio Reservaciones

@clientes.route("/tlachicuates/reservaciones")
@login_required
@roles_required('cliente')
def vistaReservaciones():
    resultset=consultarReservaciones()
    return render_template('/clientes/reservaciones.html', banderaLoading=True)
#Fin Reservaciones