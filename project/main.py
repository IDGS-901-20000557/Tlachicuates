#Importamos la clase Blueprint del módulo flask
from flask import Blueprint, render_template, Flask, redirect, url_for
#Importamos login_required, current_user de flask_security
from flask_security import login_required, current_user, Security, roles_accepted
#Importamos el decorador login_required de flask_security
from flask_security.decorators import roles_required
#Importamos el objeto de la BD desde __init__.py
from flask_sqlalchemy import SQLAlchemy
#Creamos una instancia de SQLAlchemy
db = SQLAlchemy()

app=Flask(__name__)
from project.administradores.routes import administradores
""" 



from project.usuarios.routes import usuarios """

main = Blueprint('main',__name__)
main.register_blueprint(administradores, url_prefix='/administrador')
""" 
main.register_blueprint(usuarios, url_prefix='/usuario')
 """
@main.route('/')
def inicio():
    return render_template('/inicio/index.html')

@main.route('/nosotros')
def nosotros():
    return render_template('/inicio/nosotros.html')

@main.route('/productos')
def productos():
    return render_template('/inicio/productos.html')

@main.route('/contacto')
def contactoPrincipal():
    return render_template('/inicio/contacto.html')


#Definimos la ruta a la página de perfil
@main.route('/tlachicuates/inicio')
#si no tienen ese rol, no los va a dejar entrar
@roles_accepted('administrador', 'empleado', 'cliente')
def principal():
        if not current_user.is_authenticated:
            return redirect(url_for('/loginTlachicuates', banderaLoading=True))
        else:
            return render_template('/layout/main.html')
                 


@main.route('/tlahicuates/contacto')
@login_required
#si no tienen ese rol, no los va a dejar entrar
#@roles_accepted('admin', 'user')
def contacto():
    return render_template('/generales/contacto.html')


if __name__== '__main__':
    
    db.init_app(app)
    with app.app_context():
        db.create_all()
    app.run(port=3000)


