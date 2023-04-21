from flask import redirect, render_template, Blueprint
from flask import request
from flask import url_for
from flask import Blueprint, render_template
from flask_security.decorators import login_required
from flask_security import login_required
from flask_security.decorators import roles_required
from flask import session
from .mainCompras import *
from .mainMisPedidos import *
from .mainReservaciones import *
from flask_login import current_user
from datetime import datetime
import random

clientes = Blueprint('clientes_auth', __name__)

#Inicio contacto
@clientes.route("/tlachicuates/contacto")
@login_required
@roles_required('cliente')
def vistaContacto():
    return render_template('/generales/contacto.html', banderaLoading=True)
#fin contacto


#Inicio contacto
@clientes.route("/tlachicuates/mispedidos")
@login_required
@roles_required('cliente')
def vistaMisPedidos():
    idcliente = current_user.id
    pedidos = consultarPedidos(idcliente)
    return render_template('/usuarios/mispedidos.html', banderaLoading=True, pedidos=pedidos)
#fin contacto


#Inicio compras

@clientes.route("/tlachicuates/compras", methods=['GET', 'POST'])
@login_required
@roles_required('cliente')
def vistaCompras():
    productos = consultarProductos()
    idcliente = current_user.id
    if request.method == 'POST':
        idcliente = current_user.id
        fecha_pedido = datetime.now()
        fecha_entrega = None # puedes cambiar esto si lo necesitas
        codigo = random.randint(100, 999)
        estatus = 1
        last_id_pedido = insert_pedido(idcliente,fecha_pedido,fecha_entrega,codigo,estatus)
        items = request.get_json() # obtener los datos del carrito enviados desde el formulario
        print(items) 
        print(last_id_pedido)
        
        for item in items['items']:
            cantidad = item['cantidad']
            unidad = item['tamano']
            id_producto = item['id']
            insert_pedido_producto(cantidad, unidad, id_producto, last_id_pedido)
        
    return render_template('/usuarios/compras.html', banderaLoading=True, productos=productos)

#fin compras

#Inicio Reservaciones

@clientes.route("/tlachicuates/reservaciones")
@login_required
@roles_required('cliente')
def vistaReservaciones():
    resultset=consultarReservaciones()
    return render_template('/usuarios/reservaciones.html', banderaLoading=True)



#Fin Reservaciones

