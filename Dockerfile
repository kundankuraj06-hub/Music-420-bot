FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन पाथ को सीधे रूट ऐप पर सेट करें ताकि 'config' आसानी से मिल सके
ENV PYTHONPATH="/app"

# बोट को मुख्य फ़ोल्डर से सीधे मॉड्यूल के रूप में रन करने का सही तरीका
CMD ["python", "-m", "Music420bot"]
