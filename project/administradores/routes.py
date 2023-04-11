from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from .mainUsuarios import modificarInsertarUsuario, consultarUsuarios, consultarUsuario, eliminarUsuario
from .mainProveedores import consultarProveedores, modificarInsertarProveedor
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required, current_user
from flask_security.decorators import roles_required
from flask import session

administradores = Blueprint('administradores_auth', __name__)

#Inicio usuarios
@administradores.route("/tlachicuates/usuarios")
@login_required
@roles_required('administrador')
def vistaUsuarios():
    resultset=consultarUsuarios()
    return render_template('/administradores/usuarios.html', usuarios=resultset, banderaLoading=True)

@administradores.route("/tlachicuates/usuarios", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaUsuarios():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
                modificarInsertarUsuario(idUsuario,request.form.get('txtCodigoU'),request.form.get('selectRol'),request.form.get('txtNombre'), request.form.get('txtApeMaterno'), request.form.get('txtApePaterno'),  request.form.get('txtemail'), request.form.get('txtContrasennia'), request.form.get('txtTelefono'))
        elif int(request.form.get('bandera1'))==2:
                eliminarUsuario(idUsuario,request.form.get('txtCodigoU'))
           
        return redirect(url_for('main.administradores_auth.vistaUsuarios')) 

@administradores.route("/tlachicuates/usuario", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaUsuario():
    resultset=consultarUsuarios()
    usuario=consultarUsuario(request.form.get('bandera'))
    return render_template('/administradores/usuarios.html', usuario=usuario, usuarios=resultset)

#Fin usuarios


#Inicio proveedores
@administradores.route("/tlachicuates/proveedores")
@login_required
@roles_required('administrador')
def vistaProveedores():
    resultset=consultarProveedores()
    return render_template('/administradores/proveedores.html', proveedores=resultset, banderaLoading=True)

@administradores.route("/tlachicuates/proveedores", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaProveedores():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
                modificarInsertarProveedor(idUsuario,request.form.get('txtCodigoU'),request.form.get('txtCodigoP'),request.form.get('txtproveedor'),request.form.get('txtNombre'), request.form.get('txtApeMaterno'), request.form.get('txtApePaterno'),  request.form.get('txtemail'), request.form.get('txtTelefono'))
        elif int(request.form.get('bandera1'))==2:
                eliminarUsuario(idUsuario,request.form.get('txtCodigoU'))
        return redirect(url_for('main.administradores_auth.vistaProveedores')) 
#Fin proveedoresproveedores