#Archivo de configuración que tiene la función de crear nuestra aplicación, iniciar la base de datos y registrará nuestros modelos.
#Importamos el módulo os
import os
#Importamos la clase Flask del módulo flask
from flask import Flask
#Importamos la clase Security y SQLAlchemySessionUserDatastore de flask-security
from flask_security import Security, SQLAlchemyUserDatastore
#Importamos la clase SQLAlchemy del módulo flask_sqlalchemy
from flask_sqlalchemy import SQLAlchemy

#Creamos una instancia de SQLAlchemy
db = SQLAlchemy()
#Importamos las clases de User y Role del modelo
from .models import User, Role
#Creamos un objeto de la clase SQLAlchemySessionUserDatastore
userDataStore = SQLAlchemyUserDatastore(db, User, Role)


#Método de inicio de la aplicación
def create_app():
    #Creamos una instancia de la clase Flask
    app = Flask(__name__)

    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['LOGIN_VIEW'] = '/loginTlachicuates'
    #Generamos la clave aleatoria de sesión Flask para crear una cookie con la inf. de la sesión
    app.config['SECRET_KEY'] = os.urandom(24)
    #Definimos la ruta a la BD: mysql://user:password@localhost/bd'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/bdtlachicuates'
    # We're using PBKDF2 with salt. PREGUNTA
    app.config['SECURITY_PASSWORD_HASH'] = 'pbkdf2_sha512'
    #Semilla para el método de encriptado que utiliza flask-security PREGUNTA
    app.config['SECURITY_PASSWORD_SALT'] = 'thisissecretsalt'

    #Inicializamos y creamos la BD
    db.init_app(app)
    @app.before_first_request
    def create_all():
        db.create_all()

    #Conectando los modelos a fask-security usando SQLAlchemyUserDatastore
    security = Security(app, userDataStore)

    #Registramos el blueprint para las rutas auth de la aplicación
    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    #Registramos el blueprint para las partes no auth de la aplicación
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app


