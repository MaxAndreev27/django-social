# Deployment Guide

This guide provides instructions for deploying Django Social to production.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Heroku Deployment](#heroku-deployment)
- [Docker Deployment](#docker-deployment)
- [VPS/Server Deployment](#vpsserver-deployment)
- [Production Configuration](#production-configuration)
- [Database Setup](#database-setup)
- [Static Files](#static-files)
- [Media Files](#media-files)
- [SSL/HTTPS](#sslhttps)
- [Monitoring](#monitoring)
- [Troubleshooting](#troubleshooting)

## Prerequisites

- Python 3.9+
- pip and virtualenv
- Git
- PostgreSQL (recommended for production)
- Redis (optional, for caching)
- Gunicorn or uWSGI (production WSGI server)
- Nginx or Apache (reverse proxy)
- SSL certificate (Let's Encrypt recommended)

## Heroku Deployment

### 1. Prerequisites

- Heroku account
- Heroku CLI installed

### 2. Prepare Application

```bash
# Create Procfile
echo "web: gunicorn config.wsgi" > Procfile

# Create runtime.txt (optional)
echo "python-3.11.0" > runtime.txt

# Ensure requirements.txt is updated
pip freeze > requirements.txt
```

### 3. Deploy

```bash
# Login to Heroku
heroku login

# Create app
heroku create your-app-name

# Set environment variables
heroku config:set SECRET_KEY='your-secret-key'
heroku config:set DEBUG='False'
heroku config:set ALLOWED_HOSTS='your-app-name.herokuapp.com'

# Add PostgreSQL
heroku addons:create heroku-postgresql:hobby-dev

# Deploy
git push heroku main

# Run migrations
heroku run python manage.py migrate

# Create superuser
heroku run python manage.py createsuperuser
```

## Docker Deployment

### 1. Build Image

```bash
docker build -t django-social:latest .
```

### 2. Run Container

```bash
docker run -d \
  --name django-social \
  -p 8000:8000 \
  -e SECRET_KEY='your-secret-key' \
  -e DEBUG='False' \
  -v /path/to/media:/app/media \
  django-social:latest
```

### 3. Using Docker Compose

```yaml
version: "3.8"

services:
  web:
    build: .
    ports:
      - "8000:8000"
    environment:
      - SECRET_KEY=your-secret-key
      - DEBUG=False
      - DB_ENGINE=django.db.backends.postgresql
      - DB_NAME=django_social
      - DB_USER=postgres
      - DB_PASSWORD=password
      - DB_HOST=db
      - DB_PORT=5432
    depends_on:
      - db

  db:
    image: postgres:15
    environment:
      - POSTGRES_DB=django_social
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

Run with: `docker-compose up -d`

## VPS/Server Deployment

### 1. System Setup

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y python3 python3-pip python3-venv postgresql nginx git

# Create application user
sudo useradd -m -s /bin/bash django
sudo su - django
```

### 2. Application Setup

```bash
# Clone repository
git clone https://github.com/MaxAndreev27/django-social.git
cd django-social

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
pip install gunicorn

# Create .env file
cat > .env << EOF
SECRET_KEY='your-secret-key'
DEBUG=False
ALLOWED_HOSTS='yourdomain.com,www.yourdomain.com'
DB_ENGINE=django.db.backends.postgresql
DB_NAME=django_social
DB_USER=django_user
DB_PASSWORD=secure_password
DB_HOST=localhost
DB_PORT=5432
EOF
```

### 3. Database Setup

```bash
sudo -u postgres psql
CREATE DATABASE django_social;
CREATE USER django_user WITH PASSWORD 'secure_password';
ALTER ROLE django_user SET client_encoding TO 'utf8';
ALTER ROLE django_user SET default_transaction_isolation TO 'read committed';
ALTER ROLE django_user SET default_transaction_deferrable TO on;
ALTER ROLE django_user SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE django_social TO django_user;
\q
```

### 4. Run Migrations

```bash
python manage.py migrate
python manage.py collectstatic --noinput
python manage.py createsuperuser
```

### 5. Configure Gunicorn

```bash
# Create systemd service file
sudo tee /etc/systemd/system/django-social.service > /dev/null << EOF
[Unit]
Description=Django Social
After=network.target

[Service]
User=django
WorkingDirectory=/home/django/django-social
ExecStart=/home/django/django-social/venv/bin/gunicorn \
    --workers 4 \
    --bind 127.0.0.1:8000 \
    config.wsgi:application

[Install]
WantedBy=multi-user.target
EOF

# Start service
sudo systemctl start django-social
sudo systemctl enable django-social
```

### 6. Configure Nginx

```bash
sudo tee /etc/nginx/sites-available/django-social > /dev/null << EOF
upstream django {
    server 127.0.0.1:8000;
}

server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    client_max_body_size 50M;

    location /static/ {
        alias /home/django/django-social/static/;
    }

    location /media/ {
        alias /home/django/django-social/media/;
    }

    location / {
        proxy_pass http://django;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

# Enable site
sudo ln -s /etc/nginx/sites-available/django-social /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

## Production Configuration

### Environment Variables

Create a `.env` file with:

```env
# Django Settings
SECRET_KEY=your-very-secret-key-here
DEBUG=False
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com

# Database
DB_ENGINE=django.db.backends.postgresql
DB_NAME=django_social
DB_USER=django_user
DB_PASSWORD=secure_password
DB_HOST=localhost
DB_PORT=5432

# Email
EMAIL_BACKEND=django.core.mail.backends.smtp.EmailBackend
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password

# AWS S3 (Optional, for media storage)
USE_S3=True
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_STORAGE_BUCKET_NAME=your-bucket
AWS_S3_REGION_NAME=us-east-1

# Security
SECURE_SSL_REDIRECT=True
SESSION_COOKIE_SECURE=True
CSRF_COOKIE_SECURE=True
```

### settings.py Configuration

```python
# Load environment variables
from decouple import config

SECRET_KEY = config('SECRET_KEY')
DEBUG = config('DEBUG', default=False, cast=bool)
ALLOWED_HOSTS = config('ALLOWED_HOSTS', default='').split(',')

# Database
DATABASES = {
    'default': {
        'ENGINE': config('DB_ENGINE'),
        'NAME': config('DB_NAME'),
        'USER': config('DB_USER'),
        'PASSWORD': config('DB_PASSWORD'),
        'HOST': config('DB_HOST'),
        'PORT': config('DB_PORT'),
    }
}

# Security
SECURE_SSL_REDIRECT = config('SECURE_SSL_REDIRECT', default=True, cast=bool)
SESSION_COOKIE_SECURE = config('SESSION_COOKIE_SECURE', default=True, cast=bool)
CSRF_COOKIE_SECURE = config('CSRF_COOKIE_SECURE', default=True, cast=bool)
```

## Database Setup

### PostgreSQL

```bash
# Connect to PostgreSQL
sudo -u postgres psql

# Create database and user
CREATE DATABASE django_social;
CREATE USER django_user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE django_social TO django_user;
```

### Backup Database

```bash
# Manual backup
pg_dump -U django_user django_social > backup.sql

# Restore from backup
psql -U django_user django_social < backup.sql

# Automated daily backups
0 2 * * * pg_dump -U django_user django_social | gzip > ~/backups/django-social-$(date +\%Y\%m\%d).sql.gz
```

## Static Files

### Collect Static Files

```bash
python manage.py collectstatic --noinput
```

### Serve with WhiteNoise (Alternative to Nginx)

```bash
pip install whitenoise
```

## Media Files

### Local Storage

Ensure proper permissions:

```bash
chmod 755 media/
sudo chown -R django:www-data media/
```

### AWS S3

```bash
pip install django-storages boto3

# Configure in settings.py
if USE_S3:
    STORAGES = {
        'default': {
            'BACKEND': 'storages.backends.s3boto3.S3Boto3Storage',
        }
    }
```

## SSL/HTTPS

### Let's Encrypt with Certbot

```bash
# Install certbot
sudo apt install -y certbot python3-certbot-nginx

# Generate certificate
sudo certbot certonly --nginx -d yourdomain.com -d www.yourdomain.com

# Update Nginx configuration
sudo certbot --nginx
```

## Monitoring

### Application Monitoring

- Sentry for error tracking
- New Relic for performance monitoring
- DataDog for infrastructure monitoring

### Log Monitoring

```bash
# View application logs
sudo journalctl -u django-social -f

# View Nginx logs
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

## Troubleshooting

### Static Files Not Loading

```bash
python manage.py collectstatic --clear --noinput
sudo systemctl restart nginx
```

### Database Connection Error

```bash
# Test connection
python manage.py dbshell

# Check PostgreSQL service
sudo systemctl status postgresql
```

### Memory Issues

```bash
# Monitor memory usage
free -h

# Reduce Gunicorn workers
# Edit /etc/systemd/system/django-social.service
# Change --workers to a smaller number
sudo systemctl daemon-reload
sudo systemctl restart django-social
```

### Slow Application

```bash
# Enable Django Debug Toolbar
pip install django-debug-toolbar

# Check database queries
# Use Django ORM query optimization
# Consider adding caching with Redis
```

## Backup Strategy

### Regular Backups

- Database: Daily automated backups
- Media files: Daily to S3 or backup storage
- Configuration: Version control in Git

### Disaster Recovery Plan

1. Database restoration from backup
2. Static files regeneration
3. Media files restoration
4. Configuration recreation from Git

## Security Checklist

- [ ] SECRET_KEY is unique and secure
- [ ] DEBUG is False in production
- [ ] ALLOWED_HOSTS is configured
- [ ] SSL/HTTPS is enabled
- [ ] Database credentials are secure
- [ ] Firewall rules are configured
- [ ] Regular backups are in place
- [ ] Security updates are applied
- [ ] Monitoring is enabled
- [ ] Log aggregation is configured

---

For more information, see:

- [Django Deployment Checklist](https://docs.djangoproject.com/en/stable/howto/deployment/checklist/)
- [Gunicorn Documentation](https://gunicorn.org/)
- [Nginx Documentation](https://nginx.org/)

Last updated: 2026-08-29
