FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# सबसे ज़रूरी स्टेप: बाहर रखी config.py को उठाकर म्यूजिक बोट फोल्डर के अंदर कॉपी करना
RUN cp config.py Music420bot/ 2>/dev/null || true

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

ENV PYTHONPATH="/app:/app/Music420bot"

CMD ["python", "Music420bot/__main__.py"]
