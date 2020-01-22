FROM alpine:3.9
RUN apk --update add gcc python3 python3-dev musl-dev libffi libffi-dev openssl-dev && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi
ADD requirements.txt /app/requirements.txt
RUN pip3 install --no-cache --upgrade pip
RUN pip3 install -r /app/requirements.txt
ENTRYPOINT ["yowsup-cli"]
