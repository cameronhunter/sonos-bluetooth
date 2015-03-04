# sonos-bluetooth

*This is a work-in-progress, and doesn't actually work yet*

Trying to make a Raspberry Pi Bluetooth A2DP to Sonos bridge. I want it to be completely reproducible so I'm using [Docker](https://www.docker.com/) and [Resin.io](https://resin.io/).

## Feature Aims
* RaspberryPi broadcasts as a bluetooth audio device
* Auto-pairing with bluetooth devices
* Auto-change Sonos source to RaspberryPi on bluetooth connect

## Development Aims
* A completely reproducible result &mdash; there are many how-to guides on how to achieve bluetooth audio with a RaspberryPi but they are not always reproducible.
* Easy installation onto a RaspberryPi device.

## Links

### Useful
* [Bluetooth Class of Device/Service (CoD) Generator](http://bluetooth-pentest.narod.ru/software/bluetooth_class_of_device-service_generator.html)

### Other Guides and Resources
* [Raspberry Pi network audio player: pulseaudio, DLNA and bluetooth A2DP](http://rootprompt.apatsch.net/2013/02/20/raspberry-pi-network-audio-player-pulseaudio-dlna-and-bluetooth-a2dp-part-1-pulseaudio/)
* [A2DP Sink Pre-built RPI Image](http://www.raspberrypi.org/forums/viewtopic.php?t=33943&p=347843)
* [DAC Raspbian Pi2 and A2DP](https://www.hifiberry.com/forums/topic/dac-raspbian-pi2-and-a2dp/)
* [ragusa87/bluetooth-a2dp Gist](https://gist.github.com/ragusa87/6687903)
* [Debian BluetoothUser A2DP](https://wiki.debian.org/BluetoothUser/a2dp)
* [gpduck/bluetoothradio Github](https://github.com/gpduck/bluetoothradio)
