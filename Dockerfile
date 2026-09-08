FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

ENV PYTHONPATH="/app:/app/Music420bot"

CMD ["python", "Music420bot/__main__.py
