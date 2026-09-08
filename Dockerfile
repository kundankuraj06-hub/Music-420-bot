FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r Music420bot/requirements.txt

# पायथन को म्यूजिक बोट फोल्डर के अंदर और बाहर दोनों जगह फाइल्स ढूंढने के लिए मजबूर करें
ENV PYTHONPATH="/app:/app/Music420bot"

# बोट को उसी फोल्डर के अंदर जाकर रन करें ताकि config.py आराम से मिल जाए
CMD cd Music420bot && python __main__.py
