FROM python:2.7-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk add 'exiftool=11.79-r0'

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

VOLUME ["/orig", "/dest"]

CMD    [ "/usr/local/bin/sortphotos" ]
