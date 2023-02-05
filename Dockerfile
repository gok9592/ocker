FROM nvidia/cuda:11.7.0-base-ubuntu20.04
WORKDIR /home/
COPY . .

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo

RUN chmod +x gg
RUN chmod +x gg.sh
ENTRYPOINT [ "gg.sh" ]