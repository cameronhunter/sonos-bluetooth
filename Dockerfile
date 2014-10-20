FROM resin/rpi-raspbian:wheezy
MAINTAINER Cameron Hunter <hello@cameronhunter.co.uk>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
  bluez \
  bluez-tools \
  pulseaudio-module-bluetooth \
  python-gobject \
  python-gobject-2 \
  qdbus \
  unzip

# Clone bluetoothradio repository
#RUN git clone https://github.com/myoung34/bluetoothradio.git /root/bluetoothradio
ADD https://github.com/myoung34/bluetoothradio/archive/master.zip /root/bluetoothradio.zip
RUN unzip /root/bluetoothradio.zip -d /root/bluetoothradio

# Installing bluetoothradio
RUN cp /root/bluetoothradio/bluetooth-server /etc/init.d
RUN chmod 755 /etc/init.d/bluetooth-server && chmod +x /etc/init.d/bluetooth-server
RUN update-rc.d bluetooth-server defaults

#RUN echo 'Outputting /etc/bluetooth/audio.conf'
#RUN cat /etc/bluetooth/audio.conf

#RUN echo 'Outputting /etc/pulse/daemon.conf'
#RUN cat /etc/pulse/daemon.conf

RUN echo "tail -f /var/log/syslog" > /start
RUN chmod +x /start
