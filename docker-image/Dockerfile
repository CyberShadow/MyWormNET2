# This image has been built with `docker build -t worms-server:01 .`
# You can always explore this container with `docker run -it worms-server:01 /bin/bash`
# To run `docker run --name worms-server --rm -it -p 80:80 -p 6667:6667 worms-server:01`
FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Instructions: https://github.com/CyberShadow/MyWormNET2
RUN wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --allow-unauthenticated --reinstall \
        d-apt-keyring \
        dmd-compiler \
        dub \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN dub fetch mywormnet2 && dub build mywormnet2

WORKDIR /root/.dub/packages/mywormnet2-1.0.0/mywormnet2

COPY mywormnet2.ini mywormnet2.ini

EXPOSE 6667 80

CMD [ "dub", "run", "mywormnet2" ]
