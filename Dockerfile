# JRE base
FROM openjdk:18-slim
WORKDIR /opt
# Environment variables
ENV MC_VERSION="latest" \
    PURPUR_BUILD="latest" \
    MC_RAM="" \
    JAVA_OPTS=""

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /purpurmc

# Start script
COPY purpurmc.sh .
CMD ["sh", "./purpurmc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /purpurmc
