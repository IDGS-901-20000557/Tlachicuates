from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from .mainUsuarios import modificarInsertarUsuario, consultarUsuarios, consultarUsuario, eliminarUsuario
from .mainReservaciones import consultarReservaciones, modificarInsertarReservacion, eliminarReservacion
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required, current_user
from flask_security.decorators import roles_required
from flask import session

clientes = Blueprint('clienteses_auth', __name__)

#Inicio usuarios
@clientes.route("/tlachicuates/reservaciones")
@login_required
@roles_required('cliente')
def vistaUsuarios():
    resultset=consultarUsuarios()
    return render_template('/clientes/reservaciones.html', reservacion=resultset, banderaLoading=True)

@clientes.route("/tlachicuates/reservaciones", methods=["POST"])
@login_required
@roles_required('cliente')
def CUDvistaReservaciones():
        idUsuario = session.get("idReservacion")
        if int(request.form.get('bandera1'))==1:
                modificarInsertarReservacion(idUsuario,request.form.get('txtCodigoU'),request.form.get('selectRol'),request.form.get('txtNombre'), request.form.get('txtApeMaterno'), request.form.get('txtApePaterno'),  request.form.get('txtemail'), request.form.get('txtContrasennia'), request.form.get('txtTelefono'))
        elif int(request.form.get('bandera1'))==2:
                eliminarReservacion(idUsuario,request.form.get('txtCodigoU'))
           
        return redirect(url_for('main.administradores_auth.vistaUsuarios')) 

@clientes.route("/tlachicuates/reservaciones", methods=["POST", "GET"])
@login_required
@roles_required('cliente')
def vistaReservaciones():
    resultset=consultarReservaciones()
    reservacion=consultarReservaciones(request.form.get('bandera'))
    return render_template('/clientes/reservaciones.html', reservacion=reservacion, reservacion=resultset)

#Fin usuarios