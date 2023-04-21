from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from .mainUsuarios import modificarInsertarUsuario, consultarUsuarios, consultarUsuario, eliminarUsuario
from .mainProveedores import consultarProveedores, modificarInsertarProveedor, consultarProveedor, eliminarProveedor
from .mainInsumos import consultarInsumos, modificarInsertarInsumo, consultarInsumo, eliminarInsumo
from .mainProductos import consultarProductos, modificarInsertarProducto, consultarReceta, eliminarProducto
from .mainInventarios import consultarInventarios, modificarInsertarLote, consultarInventario, eliminarLote, aprobarLoteInsumo, comprobarInventario
from .mainVentas import InsertarVenta, consultarVentas,consultarVenta, eliminarVenta
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required, current_user
from flask_security.decorators import roles_required
from flask import session
from .mainFinanzas import *
import random
from flask import jsonify



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
    cadenaReceta=""
    for receta in recetas:
        cadenaReceta=cadenaReceta+"¬"+str(receta[0])+"°"+str(receta[3])
    return render_template('/administradores/recetas.html', productos=resultset, insumos=insumos, cadenaReceta=cadenaReceta,producto=producto, recetas=recetas,longitud=longitud)
#Fin recetas


#Inicio inventario
@administradores.route("/tlachicuates/inventarios")
@login_required
@roles_required('administrador')
def vistaInventarios():
    resultset=consultarInventarios()
    insumos=consultarInsumos()
    productos=consultarProductos()
    inventarioProductos, inventarioInsumos=comprobarInventario()
    return render_template('/administradores/inventario.html', Inventarios=resultset, inventarioInsumos=inventarioInsumos,inventarioProductos=inventarioProductos,productos=productos,insumos=insumos,banderaLoading=True)

@administradores.route("/tlachicuates/inventarios", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaInventarios():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
              x = request.form.get('banderaInsumos').split("¬");
              x.pop(0)
              modificarInsertarLote(idUsuario,request.form.get('txtCodigoI'),request.form.get('txtNoLote'), request.form.get('txtCosto'),request.form.get('txtObservaciones'), x, request.form.get('tipoInventario'))
        elif int(request.form.get('bandera1'))==2:
                eliminarLote(idUsuario,request.form.get('txtCodigoI'))
        elif int(request.form.get('bandera1'))==3:
              x = request.form.get('banderaInsumos').split("¬");
              x.pop(0)
              aprobarLoteInsumo(idUsuario,request.form.get('txtCodigoI'), x, request.form.get('txtCaducidad'), request.form.get('tipoInventario'))

        return redirect(url_for('main.administradores_auth.vistaInventarios')) 


@administradores.route("/tlachicuates/inventario", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaInventario():
    resultset=consultarInventarios()
    insumos=consultarInsumos()
    productos=consultarProductos()
    lote, insumos_lote=consultarInventario(request.form.get('bandera'),request.form.get('bandera2'))
    longitud = len(insumos_lote)
    cadenaInsumos=""
    for receta in insumos_lote:
        cadenaInsumos=cadenaInsumos+"¬"+str(receta[0])+"°"+str(receta[3])
    return render_template('/administradores/inventario.html', Inventarios=resultset, productos=productos, insumos=insumos, cadenaInsumos=cadenaInsumos,lote=lote, insumos_lote=insumos_lote,longitud=longitud)
#Fin inventario

#Inicio Ventas
@administradores.route("/tlachicuates/ventas")
@login_required
@roles_required('administrador')
def vistaVentas():
    resultset=consultarVentas()
    productos=consultarProductos()
    return render_template('/administradores/ventas.html', ventas=resultset, productos=productos,banderaLoading=True)

@administradores.route("/tlachicuates/ventas", methods=["POST"])
@login_required
@roles_required('administrador')
def CUDvistaVentas():
        idUsuario = session.get("idUsuario")
        if int(request.form.get('bandera1'))==1:
              x = request.form.get('banderaInsumos').split("¬");
              x.pop(0)
              InsertarVenta(idUsuario,x, request.form.get('txtTotal'))
        elif int(request.form.get('bandera1'))==2:
                eliminarVenta(idUsuario,request.form.get('txtCodigoV'))

        return redirect(url_for('main.administradores_auth.vistaVentas')) 


@administradores.route("/tlachicuates/venta", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaVenta():
    resultset=consultarVentas()
    productos=consultarProductos()
    venta, productos_venta=consultarVenta(request.form.get('bandera'))
    return render_template('/administradores/ventas.html', ventas=resultset,productos=productos,banderaLoading=True,venta=venta,productos_venta=productos_venta)
#Fin Ventas

#Inicio Finanzas
@administradores.route("/tlachicuates/finanzas", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaFinanzas():
    # Genera las gráficas y obtiene las imágenes en formato base64
    graficas_bytes = generar_graficas()

    # Codifica las imágenes en formato base64
    imagen1 = "data:image/png;base64," + graficas_bytes[0]
    imagen2 = "data:image/png;base64," + graficas_bytes[1]

    # Renderiza la plantilla HTML y pasa las imágenes como parámetros
    return render_template('/administradores/finanzas.html', imagen1=imagen1, imagen2=imagen2)


""" @administradores.route("/tlachicuates/finanzas", methods=["POST", "GET"])
@login_required
@roles_required('administrador')
def vistaFinanzas():
    # Genera la gráfica y obtiene la imagen en formato base64
    grafica_bytes = generar_grafica()

    # Codifica la imagen en formato base64
    imagen = "data:image/png;base64," + grafica_bytes

    # Renderiza la plantilla HTML y pasa la imagen como parámetro
    return render_template('/administradores/finanzas.html', imagen=imagen) """

#Fin Finanzas