

#!       █▀█ █▀█ █▀█ █▀▀ █▀▀ █▀ █▀█   █▀▀ ▀█▀ █░░
#!       █▀▀ █▀▄ █▄█ █▄▄ ██▄ ▄█ █▄█   ██▄ ░█░ █▄▄
#import pyodbc
# imports Conexion SQL Server
import pyodbc

import os
import pandas as pd
from numpy import nan
import subprocess

# Parámetros de conexión
server = 'KALI'
database = 'practica1ETL'
username = 'tu_usuario'
password = 'tu_contraseña'


#* Conexion SQL SERVER
try:
    #? Cadena de conexión
    connection_string = f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"

    connSQLS = pyodbc.connect(connection_string, autocommit=True)

except Exception as e:
    print("Error:", e)

# * Criterios para limpiar archivo
# * 1. EntregaID duplicados
# * 2. Celdas vacías en años
# * 3. Nombre Producto vacíos
# * 4. Estado Entrega vacíos
# * 5. Precio de Producto vacío

def menu():
    while True:
        opcion = input('Elija la operación que desea realizar: ')
        if opcion == '1':
            print("Borrado de Informacion")
            os.system("")
            print("\n Borrado \n")
        elif opcion == '2':
            print("Crear Base de Dato")
            os.system("")
            print("\n Creado \n")
        elif opcion == '3':
            print("Extraer Informacion")
            os.system("")
            print("\n La información fue extraída \n")
        elif opcion == '4':
            print("Cargar Informacion")
            os.system("")
            print("\n Información Cargada \n")
        elif opcion == '5':
            print("Consulta 1")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta1.txt')

            print("Consulta 2")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta2.txt')

            print("Consulta 4")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta4.txt')

            print("Consulta 5")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta5.txt')

            print("Consulta 6")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta6.txt')

            print("Consulta 7")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta7.txt')

            print("Consulta 8")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta8.txt')

            print("Consulta 9")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta9.txt')

            print("Consulta 10")
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta10.txt')

        else:
            logger.info('Fin de aplicación')
            exit()



if __name__ == "__main__":
    menu()
    logger.info('Aplicacion finalizada')