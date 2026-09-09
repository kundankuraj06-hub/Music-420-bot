FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# यह पायथन को बाहर (रूट) और अंदर (Music420bot) दोनों जगह कॉन्फ़िगरेशन खोजने की अनुमति देगा
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को रूट डायरेक्टरी से सीधे मॉड्यूल के रूप में रन करें
CMD ["python", "-m", "Music420bot"]
