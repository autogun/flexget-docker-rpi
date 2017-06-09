FROM armhf/alpine
LABEL maintainer "autogun@gmail.com"

RUN apk add --update py-pip py-setuptools ca-certificates \
	&& rm -rf /var/cache/apk/*
	
RUN pip install --upgrade pip \
	&& pip install transmissionrpc flexget

RUN mkdir -p ~/.flexget \
	~/downloads/tv/ \
	~/torrents/tv/ \
	&& touch /root/.flexget/config.yml
	
VOLUME ["/root/downloads/tv/"]
VOLUME ["/root/torrents/tv/"]

CMD ["flexget", "--loglevel", "info", "daemon", "start"]
