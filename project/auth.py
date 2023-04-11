#Importamos los módulos a usar de flask
from flask import Blueprint, render_template, redirect, url_for, request, flash, session, jsonify
#Importamos los módulos de seguridad para las funciones hash
from werkzeug.security import generate_password_hash, check_password_hash

from .dbTlachicuates import get_connection
from logging import FileHandler, WARNING, getLogger
from datetime import datetime
#Importamos el método login_required de flask_security
from flask_security import login_required
#Importamos los métodos login_user, logout_user flask_security.utils
#########################################################################################
from flask_security.utils import login_user, logout_user, hash_password, encrypt_password
##########################################################################################
#Importamos el modelo del usuario
from . models import User
#Importamos el objeto de la BD y userDataStore desde __init__
from . import db, userDataStore

#Creamos el BluePrint y establecemos que todas estas rutas deben estar dentro de /security para sobre escribir las vistas por omisión de flask-security.
#Por lo que ahora las rutas deberán ser /security/login y security/register
auth = Blueprint('auth', __name__)

auth.logger = getLogger(__name__)
file_handler= FileHandler('log.log')
file_handler.setLevel(WARNING)
auth.logger.addHandler(file_handler)


@auth.route('/loginTlachicuates')
def login():
    return render_template('/security/login.html')

@auth.route('/loginTlachicuates', methods=['POST'])
def login_post():
    email = request.form.get('email')
    password = request.form.get('password')
    remember = True if request.form.get('remember') else False

    #Consultamos si existe un usuario ya registrado con el email.
    user = User.query.filter_by(email=email, active=1).first()
    
    #Verificamos si el usuario existe
    #Tomamos el password proporcionado por el usuario lo hasheamos, y lo comparamos con el password de la base de datos.
    if not user or not check_password_hash(user.password, password):
    #if not user or not user.password==encrypt_password(password):
        #Si el usuario no existe o no coinciden los passwords
        flash('El usuario y/o la contraseña son incorrectos', category='error')
        return redirect(url_for('auth.login_post', banderaLoading=True)) #Si el usuario no existe o el password es incorrecto regresamos a login
    
    #Si llegamos a este punto sabemos que el usuario tiene datos correctos.
    #Creamos una sessión y logueamos al usuario
    login_user(user, remember=remember)
    try:
        connection=get_connection()
        with connection.cursor() as curso:
            curso.execute('CALL SP_Inicio_Sesion(%s)',(email))
            resultset=curso.fetchall()
            for row in resultset:
                session["user"] = email
                session["idUsuario"] = row[0]
                session["rol"] = row[1]
                session["nombre"] = row[2]
        connection.commit()
        connection.close()
    except Exception as ex:
          flash('Hubo un error a la hora de iniciar sesión', category='error') 
          now = datetime.now()
          auth.logger.warning('Excepción a la hora de iniciar sesión: '+ str(ex) + ' a la fecha: ' + str(now)+ "email: "+str(email))
    return redirect(url_for('main.principal'))


@auth.route('/register', methods=['POST'])
def register_post():
    email = request.form.get('email')
    name = request.form.get('name')
    apellidoM = request.form.get('apellidoM')
    apellidoP = request.form.get('apellidoP')
    password = request.form.get('password')
    telefono = request.form.get('telefono')
    #Consultamos si existe un usuario ya registrado con el email.
    user = User.query.filter_by(email=email).first()

    if user: #Si se encontró un usuario, redireccionamos de regreso a la página de registro
        flash('El correo electrónico ya existe', category='error')
        return redirect(url_for('auth.login_post', banderaLoading=True))

    #Creamos un nuevo usuario con los datos del formulario.
    # Hacemos un hash a la contraseña para que no se guarde la versión de texto sin formato
    #new_user = User(email=email, name=name, password=generate_password_hash(password, method='sha256'))
    try:
                connection=get_connection()
                with connection.cursor() as curso:
                    curso.execute('CALL SP_Insert_Cliente(%s,%s,%s,%s,%s,%s,@salida)', (name, apellidoM, apellidoP, email, generate_password_hash(password, method='sha256'), telefono))
                connection.commit()    
                connection.close()     
               
    except Exception as ex:
                now = datetime.now()
                auth.logger.warning('Excepción a la hora de registrar cliente: '+ str(ex) + ' a la fecha: ' + str(now))
                flash('Hubo un error a la hora de registrar el usuario', category='error')

    """ userDataStore.create_user(
        name=name, email=email, password=generate_password_hash(password, method='sha256'),
        apellidoP=apellidoP, apellidoM=apellidoM, telefono=telefono
    ) """
    #Añadimos el nuevo usuario a la base de datos.
    #db.session.add(new_user)
    """ db.session.commit() """
    return redirect(url_for('auth.login_post', banderaLoading=True))


@auth.route('/logout')
@login_required
def logout():
    #Cerramos la sessión
    logout_user()
    return redirect(url_for('auth.login_post'))
