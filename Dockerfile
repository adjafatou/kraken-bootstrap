FROM python:3.12-slim

WORKDIR /app

RUN useradd --create-home app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /app/output && chown app:app /app/output

COPY --chown=app:app . .

USER app

CMD ["python", "-m", "app.main"]
