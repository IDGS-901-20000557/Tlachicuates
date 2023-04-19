from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required
from flask_security.decorators import roles_required
from flask import session

clientes = Blueprint('clientes_auth', __name__)

#Inicio contacto
@clientes.route("/tlachicuates/contacto")
@login_required
@roles_required('cliente')
def vistaContacto():
    return render_template('/generales/contacto.html', banderaLoading=True)
#fin contacto
