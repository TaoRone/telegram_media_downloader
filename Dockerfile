FROM python:3.11.2-alpine AS compile-image

WORKDIR /app

COPY requirements.txt /app/

RUN apk add --no-cache --virtual .build-deps gcc g++ cmake make musl-dev \
    openblas-dev tiff-dev jpeg-dev openjpeg-dev zlib-dev freetype-dev lcms2-dev \
    libwebp-dev tcl-dev tk-dev harfbuzz-dev fribidi-dev libimagequant-dev \
    libxcb-dev libpng-dev \
    && pip install --trusted-host pypi.python.org -r requirements.txt \
    && apk del .build-deps && rm -rf requirements.txt

RUN apk add --no-cache rclone

FROM python:3.11.2-alpine AS runtime-image

WORKDIR /app

COPY --from=tangyoha/telegram_media_downloader_compile /usr/bin/rclone /app/rclone/rclone

COPY site-packages /usr/local/lib/python3.11/site-packages


RUN apk add --no-cache openblas-dev  ffmpeg

COPY config.yaml data.yaml setup.py media_downloader.py /app/
COPY module /app/module
COPY utils /app/utils

CMD ["python", "media_downloader.py"]
