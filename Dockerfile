# Dockerfile
FROM python:3.11-slim

# Directorio de trabajo
WORKDIR /app

# Copiar requirements y instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer el puerto de Flask
EXPOSE 5000


# Comando por defecto
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]