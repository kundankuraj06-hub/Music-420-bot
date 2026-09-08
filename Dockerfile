FROM python:3.10-slim

# सिस्टम पैकेजेस और FFmpeg इंस्टॉल करने का नया और सुरक्षित तरीका
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# पूरे प्रोजेक्ट को कॉपी करें
COPY . .

# Music420bot फोल्डर के अंदर से रिक्वायरमेंट्स इंस्टॉल करें
RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# बोट को रन करने का कमांड
CMD ["python", "-m", "Music420bot"]
