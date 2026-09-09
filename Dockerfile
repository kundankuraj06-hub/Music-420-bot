FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# बोट के सारे वेरिएबल्स और check() फंक्शन के साथ नई config.py फाइल बनाना
RUN echo "import os\n\
class Config:\n\
    API_ID = int(os.getenv('API_ID', 0))\n\
    API_HASH = os.getenv('API_HASH')\n\
    BOT_TOKEN = os.getenv('BOT_TOKEN')\n\
    MONGO_DB_URI = os.getenv('MONGO_DB_URI')\n\
    STRING_SESSION = os.getenv('STRING_SESSION')\n\
    OWNER_ID = int(os.getenv('OWNER_ID', 0))\n\
    LOGGER_ID = int(os.getenv('LOGGER_ID', 0))\n\
    MUSIC420BOT_API_URL = os.getenv('MUSIC420BOT_API_URL')\n\
    MUSIC420BOT_KEY = os.getenv('MUSIC420BOT_KEY')\n\
    def check(self):\n\
        pass" > Music420bot/config.py

ENV PYTHONPATH="/app:/app/Music420bot"

CMD ["python", "Music420bot/__main__.py"]
