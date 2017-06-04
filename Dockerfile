FROM armhf/alpine
LABEL maintainer "autogun@gmail.com"

RUN apk update && \
	apk add py-pip py-setuptools ca-certificates
	
RUN pip install --upgrade pip && \
	pip install transmissionrpc flexget

RUN mkdir -p ~/.flexget \
	~/downloads/tv/ \
	~/torrents/tv/ \
	&& touch /root/.flexget/config.yml
	
VOLUME ["/root/.flexget"]

CMD ["flexget", "--loglevel", "info", "daemon", "start"]
