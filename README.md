# flexget-docker-rpi
FlexGet Docker container to run on your Raspberry Pi

## Build it
git clone https://github.com/autogun/flexget-docker-rpi.git
cd flexget-docker-rpi
docker build -t autogun/flexget .

## Run it
docker run -d \
	--name flexget \
	--net-alias=flexget \
	--network=interlink \
	--rm \
	--volume="/var/media/RPI/flexget-client/config/":/root/.flexget \
	--volume="/var/media/RPI/TV Shows/":/root/downloads/tv \
	--publish=5050:5050 \
	autogun/flexget
