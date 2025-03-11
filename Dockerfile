FROM python:3.12-slim

WORKDIR /app

COPY . /app

# Instalar dependencias del sistema necesarias para lxml y python-docx
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Actualizar pip y instalar dependencias de Python
RUN python3 -m pip install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python3", "app.py"]
