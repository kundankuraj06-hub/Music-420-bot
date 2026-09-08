FROM python:3.10-slim-buster

# सिस्टम डिपेंडेंसी और FFmpeg इंस्टॉल करें
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# पूरे प्रोजेक्ट को पहले कॉपी करें ताकि फोल्डर एक्सेस हो सके
COPY . .

# Music420bot फोल्डर के अंदर से रिक्वायरमेंट्स इंस्टॉल करें
RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# बोट को रन करने का सही कमांड
CMD ["python", "-m", "Music420bot"]
