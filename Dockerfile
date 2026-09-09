FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन को प्रोजेक्ट की हर डायरेक्टरी की लोकेशन समझाएं 
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को बिना किसी मॉड्यूल फ्लैग के, सीधे फाइल पाथ से चालू करने का अचूक कमांड
CMD ["python", "Music420bot/__main__.py"]
