FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# अगर फाइल config.py या sample.config नाम से बाहर है, तो उसे अंदर कॉपी करें
RUN cp config.py Music420bot/ 2>/dev/null || true
RUN cp sample.config Music420bot/config.py 2>/dev/null || true
RUN cp sample.env Music420bot/config.py 2>/dev/null || true

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

ENV PYTHONPATH="/app:/app/Music420bot"

CMD ["python", "Music420bot/__main__.py"]
