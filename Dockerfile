FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# वर्क डायरेक्टरी सेट की
WORKDIR /app

# पूरा प्रोजेक्ट पहले कॉपी कर लेते हैं ताकि फोल्डर स्ट्रक्चर मिल जाए
COPY . .

# रिक्वायरमेंट्स फाइल म्यूजिक बोट फोल्डर के अंदर है, इसलिए सही रास्ता दिया
RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# क्लीन कॉन्फ़िगरेशन वेरिएबल्स सेट करना
RUN echo "import os\n\
API_ID = int(os.getenv('API_ID', 0))\n\
API_HASH = os.getenv('API_HASH')\n\
BOT_TOKEN = os.getenv('BOT_TOKEN')\n\
MONGO_DB_URI = os.getenv('MONGO_DB_URI')\n\
STRING_SESSION = os.getenv('STRING_SESSION')\n\
OWNER_ID = int(os.getenv('OWNER_ID', 0))\n\
LOGGER_ID = int(os.getenv('LOGGER_ID', 0))\n\
MUSIC420BOT_API_URL = os.getenv('MUSIC420BOT_API_URL')\n\
MUSIC420BOT_KEY = os.getenv('MUSIC420BOT_KEY')\n\
def check():\n\
    pass" > config.py

# Python को सही रास्ता बताना ताकि वो सभी फोल्डर्स को पहचान सके
ENV PYTHONPATH="/app"

# बॉट को मॉड्यूल के रूप में चलाने की सही कमांड
CMD ["python3", "-m", "Music420bot"]
