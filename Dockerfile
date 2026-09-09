FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# रिक्वायरमेंट्स बाहर ही हैं, इसलिए सीधे इंस्टॉल करें
RUN pip install --no-cache-dir -r requirements.txt

# सीधे बाहर ही क्लीन कॉन्फ़िगरेशन वेरिएबल्स सेट करना
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

# पायथन को समझाएं कि वो इसी मुख्य डायरेक्टरी में सब कुछ ढूंढे
ENV PYTHONPATH="/app"

# बोट की मुख्य फाइल सीधे बाहर ही है, उसे रन करें
CMD ["python", "__main__.py"]
