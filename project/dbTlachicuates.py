from decouple import config
import pymysql

def get_connection():
    return pymysql.connect(
        host=config('MYSQL_HOST', default='127.0.0.1'),
        database=config('MYSQL_DB', default='bdtlachicuates'),
        user=config('MYSQL_USER', default='bassrobert'),
        password=config('MYSQL_PASSWORD', default='18002424!')
    )