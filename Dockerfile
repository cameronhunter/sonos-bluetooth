FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes \
    bluez \
    bluez-tools \
    darkice \
    icecast2 \
    pulseaudio-module-bluetooth \
    rfkill \
    nano less

COPY app                  /app
COPY etc/default/*        /etc/default/
COPY etc/icecast2/*       /etc/icecast2/
COPY etc/init.d/*         /etc/init.d/
COPY etc/pulse/*          /etc/pulse/
COPY etc/udev/rules.d/*   /etc/udev/rules.d/
COPY etc/darkice.cfg      /etc/darkice.cfg
COPY etc/mime.types       /etc/mime.types

RUN adduser pulse bluetooth; \
    adduser root pulse-access; \
    systemctl enable icecast2; \
    update-rc.d pulseaudio defaults; \
    update-rc.d bluetooth-config defaults 99;

EXPOSE 8000

CMD ["/sbin/init"]
