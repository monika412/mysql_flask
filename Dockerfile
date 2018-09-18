FROM alpine:3.7

RUN mkdir /py_app

RUN apk update \
  && apk add --no-cache python3 \
  && apk add libc-dev \
  && apk --no-cache --update-cache add gcc gfortran build-base python3-dev wget freetype-dev libpng-dev openblas-dev \	
  && apk add --no-cache subversion \
  && apk add curl bash binutils tar git \
  && python3 -m ensurepip \
  && git clone https://github.com/monika412/mysql_flask.git /py_app \
  && pip3 install -r /py_app/requirements.txt 	

CMD cd /py_app && git pull && python3 /py_app/src/app/mysqlapp.py
