from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from .mainUsuarios import modificarInsertarUsuario, consultarUsuarios, consultarUsuario, eliminarUsuario
from .mainProveedores import consultarProveedores, modificarInsertarProveedor, consultarProveedor, eliminarProveedor
from .mainInsumos import consultarInsumos, modificarInsertarInsumo, consultarInsumo, eliminarInsumo
from .mainProductos import consultarProductos, modificarInsertarProducto, consultarReceta, eliminarProducto
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
                eliminarProveedor(idUsuario,request.form.get('txtCodigoP'))
        return redirect(url_for('main.administradores_auth.vistaProveedores')) 


@administradores.route("/tlachicuates/proveedor", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaProveedor():
    resultset=consultarProveedores()
    proveedor=consultarProveedor(request.form.get('bandera'))
    return render_template('/administradores/proveedores.html', proveedor=proveedor, proveedores=resultset)
#Fin proveedores


#Inicio insumos
@administradores.route("/tlachicuates/insumos")
@login_required
@roles_required('administrador')
def vistaInsumos():
    resultset=consultarInsumos()
    proveedores=consultarProveedores()
    return render_template('/administradores/insumos.html', insumos=resultset, proveedores=proveedores,banderaLoading=True)

@administradores.route("/tlachicuates/insumos", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaInsumos():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
                modificarInsertarInsumo(idUsuario,request.form.get('txtProveedor'),request.form.get('txtCodigoI'),request.form.get('txtNombre'),request.form.get('txtUnidad'), request.form.get('txtPrecio'))
        elif int(request.form.get('bandera1'))==2:
                eliminarInsumo(idUsuario,request.form.get('txtCodigoI'))
        return redirect(url_for('main.administradores_auth.vistaInsumos')) 

@administradores.route("/tlachicuates/insumo", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaInsumo():
    resultset=consultarInsumos()
    proveedores=consultarProveedores()
    insumo=consultarInsumo(request.form.get('bandera'))
    return render_template('/administradores/insumos.html',insumos=resultset, proveedores=proveedores, insumo=insumo)
#Fin insumos

#Inicio recetas
@administradores.route("/tlachicuates/recetas")
@login_required
@roles_required('administrador')
def vistaRecetas():
    resultset=consultarProductos()
    insumos=consultarInsumos()
    return render_template('/administradores/recetas.html', productos=resultset, insumos=insumos,banderaLoading=True)

@administradores.route("/tlachicuates/recetas", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaRecetas():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
              x = request.form.get('banderaInsumos').split("¬");
              x.pop(0)
              modificarInsertarProducto(idUsuario,request.form.get('txtCodigoP'),request.form.get('txtNombreP'), request.form.get('txtDescripcion'),request.form.get('portada'), request.form.get('txtCosto'), request.form.get('txtPrecio'),   request.form.get('txtObservaciones'), x)
        elif int(request.form.get('bandera1'))==2:
                eliminarProducto(idUsuario,request.form.get('txtCodigoP'))
           
        return redirect(url_for('main.administradores_auth.vistaRecetas')) 

@administradores.route("/tlachicuates/receta", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaReceta():
    resultset=consultarProductos()
    insumos=consultarInsumos()
    producto, recetas=consultarReceta(request.form.get('bandera'))
    longitud = len(recetas)
    return render_template('/administradores/recetas.html', productos=resultset, insumos=insumos, producto=producto, recetas=recetas,longitud=longitud)
#Fin recetas