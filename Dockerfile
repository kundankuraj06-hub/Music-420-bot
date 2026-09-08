FROM python:3.10-slim-buster

# सिस्टम डिपेंडेंसी और FFmpeg इंस्टॉल करें
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ffmpeg git & \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# रिक्वायरमेंट्स कॉपी और इंस्टॉल करें
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# बोट स्टार्ट करने का कमांड
CMD ["python", "-m", "Music420bot"]
