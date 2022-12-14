FROM python:3.9.6-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY /src poetry.lock pyproject.toml /app/
WORKDIR /app
RUN chmod +x /app/entrypoint.py \
&& pip install poetry==1.1.7 --no-cache-dir --disable-pip-version-check \
&& poetry config virtualenvs.create false
RUN poetry install --no-dev --no-interaction --no-root

CMD [ "python3", "/app/entrypoint.py" ]