FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन को समझाएं कि मुख्य डायरेक्टरी 'Music420bot' के अंदर ही है
ENV PYTHONPATH="/app/Music420bot:/app"

# बोट को रन करने का सबसे सटीक और डायरेक्ट तरीका
CMD ["python", "Music420bot/__main__.py"]
