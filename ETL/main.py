

#!       █▀█ █▀█ █▀█ █▀▀ █▀▀ █▀ █▀█   █▀▀ ▀█▀ █░░
#!       █▀▀ █▀▄ █▄█ █▄▄ ██▄ ▄█ █▄█   ██▄ ░█░ █▄▄
#import pyodbc
# imports Conexion SQL Server
import pyodbc

import os
import pandas as pd
import subprocess
import logging

# Parámetros de conexión
server = 'KALI'
database = 'practica1ETL'
username = 'alvaro'
password = '24122001'

# Configura log
logger = logging.getLogger('PRACTICA 1 SEMINARIO DE SISTEMAS 2')
logger.setLevel(logging.DEBUG)
ch = logging.FileHandler('logs.log')
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)
# Fin Configura log

#* Conexion SQL SERVER
try:
    #? Cadena de conexión
    connection_string = f"DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"
    logger.info("Iniciando nuestra aplicacion")
    logger.info(" CONNECTION_STRING: ".center(80, "-"))
    logger.info("Iniciando la realizacion de la conexion")
    connSQLS = pyodbc.connect(connection_string, autocommit=True)
    logger.info("Conexion realizada exitosamente")

except Exception as e:
    print("Error:", e)

def clean():
    # * Criterios para limpiar archivo
    # * 1. EntregaID duplicados
    # * 2. Celdas vacías en años
    # * 3. Nombre Producto vacíos
    # * 4. Estado Entrega vacíos
    # * 5. Precio de Producto vacío

    file_csv = r"C:\Users\socop\Videos\REPOS TEMP\SS2-Practica1_202000194\ETL\EntregasUSAC-Delivery.csv"
    # Cargar el archivo CSV en un DataFrame
    df = pd.read_csv(file_csv, sep=';')

    # Eliminar filas con EntregaID duplicados
    df = df.drop_duplicates(["EntregaID"], keep="first")

    # Eliminar filas con celdas vacías
    df = df.dropna(subset=["Anio"])
    df["Anio"] = pd.to_numeric(df["Anio"], downcast="integer")
    df = df.dropna(subset=["NombreProducto"])
    df = df.dropna(subset=["EstadoEntrega"])
    df = df.dropna(subset=["PrecioProducto"])

    # Guardar el DataFrame limpio en un nuevo archivo CSV
    archivo_limpiado = r"C:\Users\socop\Videos\REPOS TEMP\SS2-Practica1_202000194\ETL\EntregasUSAC-Delivery-Limpiado.csv"
    df.to_csv(archivo_limpiado, index=False)

    print("Archivo limpiado guardado correctamente.")

def menu():

    print("╦ ╦╔═╗╔═╗╔═╗     ")
    print("║ ║╚═╗╠═╣║──  DELIVERY  ")
    print("╚═╝╚═╝╩ ╩╚═╝     ")
    while True:
        print("1)  Borrar modelo")
        print("2)  Crear modelo")
        print("3)  Extraer información")
        print("4)  Cargar información")
        print("5)  Realizar consultas")
        print("6)  Salir")
        opcion = input('Elija la operación que desea realizar: ')
        if opcion == '1':
        #* 1)  Borrar modelo: Se ejecutará un script y se borrará cualquier tabla que 
        #* utilice para el desarrollo de la práctica.
            print("Borrado de Informacion")
            pathr = "..\\ETLmenu\\Eliminacion.sql"
            os.system( f"sqlcmd -S KALI\\MSSQLSERVER01 -i {pathr}") 
            print("\n >>>>>> Borrado \n")
        elif opcion == '2':
        #* 2)  Crear modelo: Se ejecutará el script de creación de las tablas del modelo 
        #* que el estudiante haya desarrollado.

            print("Crear Base de Dato")
            os.system("")
            print("\n >>>>>> Creado \n")
        elif opcion == '3':
        #* 3)  Extraer información: Se solicitará la ruta de los archivos de carga, para
        #* proceder a extraer la información de estos.
            print("Extraer Informacion")
            os.system("")
            print("\n >>>>>> La información fue extraída \n")
        elif opcion == '4':
        #* 4)  Cargar información: Se ejecutará un script que transforme la información
        #* de los archivos de entrada y luego se cargue al modelo desarrollado.
            print("Cargar Informacion")
            os.system("")
            print("\n >>>>>> Información Cargada \n")
        elif opcion == '5':
        #* 5)  Realizar consultas: Ejecutará un script con las consultas solicitadas y
        #* guardará los resultados en un archivo de texto.
            print("Consulta 1")
            #! 1.  SELECT COUNT(*) de todas las tablas para ver que si realizo la carga en las tablas del modelo.
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta1.txt')

            print("Consulta 2")
            #! 2.  Top 5 Clientes con más entregas realizadas
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta2.txt')

            print("Consulta 3")
            #! 3.  Top 5 de productos con el costo de envío más alto.
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta3.txt')

            print("Consulta 4")
            #! 4.  Top 5 de ciudades con más entregas
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta4.txt')

            print("Consulta 5")
            #! 5.  Top 5 de envíos con estado Pendiente
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta5.txt')

            print("Consulta 6")
            #! 6.  Top 5 de envíos con estado Entregado
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta6.txt')

            print("Consulta 7")
            #! 7.  Total de entregas realizadas por ciudad.
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta7.txt')

            print("Consulta 8")
            #! 8.  Total de Entregas por días de la semana
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta8.txt')

            print("Consulta 9")
            #! 9.  Total de Entregas por mes
            
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta9.txt')

            print("Consulta 10")
            #! 10. Total de Entregas por año
            sqlcmd_command = ""
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta10.txt')

        else:
            exit()

def crearArchivo(texto, nombre_archivo):
    with open(nombre_archivo, "w") as archivo:
        archivo.write(texto)

if __name__ == "__main__":
    clean()
    menu()