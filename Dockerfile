FROM resin/rpi-raspbian:wheezy-2015-01-15

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
  bluez \
  bluez-alsa \
  bluez-tools \
  pulseaudio-module-bluetooth \
  python-gobject \
  python-gobject-2 \
  qdbus

RUN sed -i '/\[General\]/c\\[General\]\nEnable=Source,Sink,Media,Socket' /etc/bluetooth/audio.conf
RUN sed -i '/; resample-method = speex-float-3/c\resample-method = trivial' /etc/pulse/daemon.conf

# Setup user
ENV SONOS_USER sonos
ENV GROUPS lp
RUN useradd --create-home --groups $GROUPS $SONOS_USER

# Setup bluetooth
ENV BLUETOOTH_NAME Sonos
ENV BLUETOOTH_CLASS 0x240414

# Run sonos-bluetooth
COPY lib /sonos-bluetooth
CMD ["sh", "/sonos-bluetooth/startup.sh"]
