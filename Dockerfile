# Metemos arribo todo lo que sabemos que no puede dar problemas 
# lenguaje utilizado de la api 
FROM python:3.8-slim

# Puertos que usa la api rest
EXPOSE 5000/udp
EXPOSE 5000/tcp

# crea la carpeta app
WORKDIR /app
# A partir de aqui puede ocasionar problemas

# comando para actualizar el sistema apt :gestor de paquetes comprueba el paquete y si hay nuevas actualizciones
RUN apt update
# si hay modicficaciones o actualizaciones lo ejecuta y lo actualiza
RUN apt upgrade -y

#Copia app
COPY . /app

# inicializa el archivo requirements.txt que contiene todas las dependencias
RUN pip install -r requirements.txt

# inicializar la app,podemos ver el funcionamineto 
ENTRYPOINT flask run --host=0.0.0.0 --port=5000
