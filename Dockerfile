FROM arm32v6/alpine:latest
LABEL maintainer "autogun@gmail.com"

VOLUME [ "/sys/fs/cgroup" ]
VOLUME ["/root/downloads/tv/"]
VOLUME ["/root/torrents/tv/"]

RUN apk add --update py-pip py-setuptools ca-certificates \
	&& rm -rf /var/cache/apk/*
	
RUN pip install --upgrade pip \
	&& pip install transmissionrpc flexget

RUN mkdir -p ~/.flexget \
	~/downloads/tv/ \
	~/torrents/tv/ \
	&& touch /root/.flexget/config.yml
	
CMD ["flexget", "--loglevel", "info", "daemon", "start"]
