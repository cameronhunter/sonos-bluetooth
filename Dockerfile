FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    bluez-tools \
    pulseaudio-module-bluetooth \
    nano less

COPY app                  /app
COPY etc/init.d/*         /etc/init.d/
COPY etc/pulse/*          /etc/pulse/
COPY etc/udev/rules.d/*   /etc/udev/rules.d/

RUN adduser pulse bluetooth; \
    adduser root pulse-access; \
    update-rc.d 90-pulseaudio defaults; \
    update-rc.d 95-bluetooth-agent defaults; \
    update-rc.d 99-bluetooth-config defaults;

CMD ["/sbin/init"]
