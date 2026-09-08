FROM python:3.10-slim

# सिस्टम पैकेजेस और FFmpeg इंस्टॉल करें
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# पूरे प्रोजेक्ट को कॉपी करें
COPY . .

# Music420bot फोल्डर के अंदर से रिक्वायरमेंट्स इंस्टॉल करें
RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन को समझाएं कि वो Music420bot फोल्डर के अंदर की फाइल्स भी रीड करे
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को सीधे रन करने का सटीक कमांड
CMD ["python", "Music420bot/__main__.py"]
Use code with caution.
