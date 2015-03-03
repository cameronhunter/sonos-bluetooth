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
ENV PULSEAUDIO_GROUP lp
RUN useradd --create-home --groups $PULSEAUDIO_GROUP $SONOS_USER

# Setup bluetooth
ENV SONOS_NAME Sonos

# Run sonos-bluetooth
COPY lib /sonos-bluetooth
CMD ["sh", "/sonos-bluetooth/startup.sh"]
