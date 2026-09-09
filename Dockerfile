FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# सिंटैक्स एरर वाली फाइल को बायपास करने के लिए सीधे एक क्लीन पायथन config फाइल जनरेट करना
RUN echo "import os\nclass Config:\n    MONGO_DB_URI = os.getenv('MONGO_DB_URI')\n" > Music420bot/config.py

ENV PYTHONPATH="/app:/app/Music420bot"

CMD ["python", "Music420bot/__main__.py"]
