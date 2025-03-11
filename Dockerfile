# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Evitar preguntas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Python, pip y LibreOffice
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libreoffice \
    libreoffice-java-common \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar todos los archivos del proyecto
COPY . /app

# Instalar las dependencias de Python
RUN pip3 install --no-cache-dir -r requirements.txt

# Exponer el puerto 5000 (Render lo asignará dinámicamente, pero lo indicamos)
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python3", "app.py"]