FROM resin/rpi-raspbian:jessie

MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes \
    bluez \
    bluez-tools \
    darkice \
    icecast2 \
    mime-support \
    pulseaudio-module-bluetooth \
    rfkill \
    nano less

COPY app                    /app
COPY etc/darkice/*          /etc/darkice/
COPY etc/default/*          /etc/default/
COPY etc/icecast2/*         /etc/icecast2/
COPY etc/init.d/*           /etc/init.d/
COPY etc/pulse/*            /etc/pulse/
COPY etc/systemd/system/*   /etc/systemd/system/
COPY etc/udev/rules.d/*     /etc/udev/rules.d/

RUN adduser pulse bluetooth; \
    adduser root pulse-access; \
    systemctl enable darkice; \
    systemctl enable icecast2; \
    update-rc.d pulseaudio defaults; \
    update-rc.d bluetooth-config defaults;

EXPOSE 8000

CMD ["/sbin/init"]
