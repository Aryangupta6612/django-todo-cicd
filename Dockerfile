# Python 3.9 use karo (stable + distutils included)
FROM python:3.9

# System optimizations
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Working directory set karo
WORKDIR /app

# System dependencies install karo
RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Python dependencies install karo
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Project copy karo
COPY . .

# DB migrations run karo
RUN python manage.py migrate

# Port expose karo (8000)
EXPOSE 8000

# Django server start karo
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]