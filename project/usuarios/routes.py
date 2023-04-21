from flask import Blueprint, redirect, render_template, request, url_for
from flask_security.decorators import login_required, roles_required
from flask import session

from .mainReservaciones import consultarReservaciones


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
    return render_template('/usuarios/reservaciones.html', banderaLoading=True)

#Fin Reservaciones