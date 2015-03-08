FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV SONOS_USER sonos

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bluez \
    bluez-utils \
    pulseaudio-module-bluetooth \
    nano

COPY app                  /app
COPY etc/init.d/*         /etc/init.d/
COPY etc/pulse/*          /etc/pulse/
COPY etc/udev/rules.d/*   /etc/udev/rules.d/

RUN addgroup --system pulse; \
    addgroup --system pulse-access; \
    adduser --system --ingroup pulse --home /var/run/pulse pulse; \
    adduser pulse audio; \
    adduser pulse lp; \
    adduser root pulse-access; \
    update-rc.d pulseaudio defaults; \
    update-rc.d bluetooth defaults;

CMD ["/sbin/init"]
