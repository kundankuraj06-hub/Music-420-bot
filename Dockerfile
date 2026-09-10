FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# बिना किसी '\n' की गलती के सीधे config.py फाइल बनाना
RUN cat <<EOF > config.py
import os
API_ID = int(os.getenv('API_ID', 0))
API_HASH = os.getenv('API_HASH')
BOT_TOKEN = os.getenv('BOT_TOKEN')
MONGO_DB_URI = os.getenv('MONGO_DB_URI')
STRING_SESSION = os.getenv('STRING_SESSION')
OWNER_ID = int(os.getenv('OWNER_ID', 0))
LOGGER_ID = int(os.getenv('LOGGER_ID', 0))
MUSIC420BOT_API_URL = os.getenv('MUSIC420BOT_API_URL')
MUSIC420BOT_KEY = os.getenv('MUSIC420BOT_KEY')
def check():
    pass
EOF

ENV PYTHONPATH="/app"

CMD ["python3", "-m", "Music420bot.Core"]
