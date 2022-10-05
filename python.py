------modificacion1------
import cx_Oracle
from sqlalchemy.engine import create_engine
import pandas as pd 

DIALECT = 'oracle'
SQL_DRIVER = 'cx_oracle'
USERNAME = 'parram' 
PASSWORD = 'Ippb202209'
HOST = 'DESKTOP-D9FCLPV' 
PORT = 1521 
SERVICE = 'BISSAS' 
ENGINE_PATH_WIN_AUTH = DIALECT + '+' + SQL_DRIVER + '://' + USERNAME + ':' + PASSWORD +'@' + HOST + ':' + str(PORT) + '/?service_name=' + SERVICE
# cx_Oracle.init_oracle_client(lib_dir=r"C:\python\pruebas\oracle\instantclient_19_11")
engine = create_engine(ENGINE_PATH_W
===============================
