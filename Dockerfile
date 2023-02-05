FROM ubuntu:latest
EXPOSE 80
EXPOSE 443

WORKDIR /home/
COPY . .

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chmod +x call

RUN chmod +x call.sh
ENTRYPOINT [ "/home/call.sh" ]
