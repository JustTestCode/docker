FROM --platform=$TARGETPLATFORM python:3.11-alpine

RUN apk upgrade -U \
    && apk add ca-certificates ffmpeg \
    && rm -rf /var/cache/*
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

CMD ["python3"]