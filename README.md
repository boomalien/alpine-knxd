forked from Foxi352/docker-knxd

# knxd
[![Build status](https://ci.appveyor.com/api/projects/status/bhma7tmx0eje73ao/branch/master?svg=true)](https://ci.appveyor.com/project/boomalien/alpine-knxd/branch/master)
[![This image on DockerHub](https://img.shields.io/docker/pulls/boomalien/alpine-knxd.svg)](https://hub.docker.com/r/boomalien/alpine-knxd/)

For documentation and information on the KNXD project [check our their GitHub page](https://github.com/knxd/knxd).

-	**Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))  
	[`amd64`](https://hub.docker.com/r/amd64/alpine/), [`arm32v6`](https://hub.docker.com/r/arm32v6/alpine/), [`arm64v8`](https://hub.docker.com/r/arm64v8/alpine/)


## Exposed ports
***I still don't know why, but instead of binding ports use --net=host to get it working.***

* 3672/tcp (Server port)
* 6720/tcp (knx-ip)

## Exported volumes
* /etc/knxd (for knxd.ini file)

## Example container start command
As default the image starts `knxd` as an entrypoint and passes `/etc/knxd/knxd.ini` as command. If you want to run the image on it's own you have multiple choices to pass parameters to the knx daemon. Some are:

* Map `/etc/knxd` to a local volume of your host and put a `knxd.ini` inside
* Pass command line parameters to image as you would pass to the deamon directly. Example `docker run knxd --version`

Example to run the image standalone with a provided ini file in `./knxd/etc/knxd.ini`:

	docker run -d --net=host -v /smartHome/knxd:/etc/knxd boomalien/alpine-knxd
