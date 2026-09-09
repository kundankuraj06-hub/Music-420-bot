FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# पहले पूरा प्रोजेक्ट कॉपी करें
COPY . .

# अब वर्किंग डायरेक्टरी को सीधे बोट फोल्डर के अंदर सेट करें
WORKDIR /app/Music420bot

# रिक्वायरमेंट्स इंस्टॉल करें
RUN pip install --no-cache-dir -r requirements.txt

# पायथन पाथ को पूरे प्रोजेक्ट पर सेट करें ताकि बाहर की config.py भी मिल सके
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को सीधे उसकी मुख्य स्क्रिप्ट से स्टार्ट करें
CMD ["python", "__main__.py"]
