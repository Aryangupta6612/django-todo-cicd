# Use Python 3 base image
FROM python:3

# Set the working directory in the container
WORKDIR /data

# Update apt-get repositories and install required dependencies
RUN apt-get update && apt-get install -y \
    python3-distutils \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install specific version of Django and other dependencies
RUN pip install --upgrade pip && \
    pip install django==3.2

# Copy the current directory contents into the container at /data
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
