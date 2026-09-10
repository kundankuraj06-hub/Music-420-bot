FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# असली फाइल को सही नाम 'config.py' देना
RUN cp app_config.py config.py

# पाइथन को यह समझाना कि प्रोजेक्ट का नाम ArtistMusic ही है
RUN ln -s Music420bot ArtistMusic

ENV PYTHONPATH="/app"

CMD ["python3", "-m", "ArtistMusic.Core"]
