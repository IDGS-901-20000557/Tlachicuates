from flask import make_response, after_this_request
from threading import Thread
import random
import base64
from io import BytesIO
import matplotlib.pyplot as plt
from flask import current_app

def generar_graficas():
    # Generar datos aleatorios para la primera gráfica
    ingresos = [random.randint(1000, 5000) for _ in range(6)]
    egresos = [random.randint(500, 2000) for _ in range(6)]
    meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"]

    # Crear la primera gráfica
    plt.plot(meses, ingresos, label="Ingresos")
    plt.plot(meses, egresos, label="Egresos")
    plt.legend()
    buf = BytesIO()
    plt.savefig(buf, format="png")
    grafica1_bytes = base64.b64encode(buf.getvalue()).decode("utf-8")
    buf.close()

    # Generar datos aleatorios para la segunda gráfica
    datos = [random.randint(1, 100) for _ in range(5)]
    etiquetas = ["Frutos Rojos", "Mazapan", "Mango", "Mojito", "Fresa"]

    # Crear la segunda gráfica
    plt.clf()
    plt.bar(etiquetas, datos)
    buf = BytesIO()
    plt.savefig(buf, format="png")
    grafica2_bytes = base64.b64encode(buf.getvalue()).decode("utf-8")
    buf.close()

    # Limpiar los recursos de Matplotlib
    plt.close('all')

    return [grafica1_bytes, grafica2_bytes]

def generar_graficas_async():
    with current_app.app_context():
        graficas_bytes = generar_graficas()
        return graficas_bytes

def generar_graficas_thread():
    graficas_bytes = None
    try:
        graficas_bytes = generar_graficas_async()
    except Exception as e:
        current_app.logger.error(f"Error al generar gráficas: {str(e)}")
    finally:
        return graficas_bytes

def generar_graficas_threaded():
    thread = Thread(target=generar_graficas_thread)
    thread.start()
    thread.join()
    return thread._result
