import os

from sqlalchemy import create_engine

import urllib
class Config(object):
    SECRET_KEY='MY_SECRET_KEY'
    SESSION_COOKIE_SECURE=False

class DevelopmentConfig(Config):
    DEBUG=True
    SQLALCHEMY_DATABASE_URI='mysql+pymysql://root:root@127.0.0.1/bdtlachicuates'
    SQLALCHEMY_TRACK_MODIFICATION=False