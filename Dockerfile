ARG PYTHON_VERSION=3.13-slim

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

WORKDIR /code

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/
COPY . /code

# Створюємо папку для SQLite
RUN mkdir -p /data && chmod 777 /data

ENV SECRET_KEY "AR032vYdMNY6pkuLwpzZsvG7IPdUkQGIOYGY6TUYs3pF7kU4nU"
RUN python manage.py collectstatic --noinput

EXPOSE 8000

RUN chmod +x /code/entrypoint.sh
ENTRYPOINT ["/code/entrypoint.sh"]
