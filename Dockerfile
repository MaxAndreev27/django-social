ARG PYTHON_VERSION=3.12-slim

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

WORKDIR /code

COPY --from=ghcr.io/astral-sh/uv:0.13 /uv /uvx /bin/

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never \
    PATH="/code/.venv/bin:$PATH"

COPY pyproject.toml uv.lock /code/
RUN uv sync --locked --no-dev --no-install-project

COPY . /code

# Створюємо папку для SQLite
RUN mkdir -p /data && chmod 777 /data

ENV SECRET_KEY "AR032vYdMNY6pkuLwpzZsvG7IPdUkQGIOYGY6TUYs3pF7kU4nU"
RUN python manage.py collectstatic --noinput

EXPOSE 8000

RUN chmod +x /code/entrypoint.sh
ENTRYPOINT ["/code/entrypoint.sh"]
