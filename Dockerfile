FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन को समझाएं कि वो रूट और म्यूजिक बोट दोनों डायरेक्टरी को एक साथ रीड करे
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को पैकेज मॉड्यूल के रूप में सही तरीके से स्टार्ट करने का पक्का कमांड
CMD ["python", "-m", "Music420bot"]
