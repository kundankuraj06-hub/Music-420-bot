FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# जो फाइल पहले से मौजूद है, उसे config.py के नाम से कॉपी करना
RUN cp app_config.py config.py

ENV PYTHONPATH="/app"

CMD ["python3", "-m", "Music420bot.Core"]
