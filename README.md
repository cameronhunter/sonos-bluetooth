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

## Notes
### Bluetooth
* I can't seem to configure `Bluez5` to use legacy pairing mode (i.e. pin code).
* `Bluez5` doesn't include the `bluetooth-agent` anymore.
* I can't get `Bluez4` to use `main.conf` for general configuration (`hcid.conf` is `Bluez3` only)
* List of available [bluetoothctl agent capabilities](http://comments.gmane.org/gmane.linux.bluez.kernel/34784)

### Sonos
* Can't play using the `http` url, using `x-rincon-mp3radio://192.168.1.102:8000/sonos-bluetooth.mp3` works just fine though.

## Links

### Similar projects
* [AirSonos Github](https://github.com/stephen/airsonos/)
* [Sonocast](https://github.com/gpothier/sonoscast)

### Useful
* [Sonos Supported Audio Formats](https://sonos.custhelp.com/app/answers/detail/a_id/80/~/supported-audio-formats)
* [Bluetooth Class of Device/Service (CoD) Generator](http://bluetooth-pentest.narod.ru/software/bluetooth_class_of_device-service_generator.html)

### Other Guides and Resources

#### Bluetooth
* [Raspberry Pi network audio player: pulseaudio, DLNA and bluetooth A2DP](http://rootprompt.apatsch.net/2013/02/20/raspberry-pi-network-audio-player-pulseaudio-dlna-and-bluetooth-a2dp-part-1-pulseaudio/)
* [A2DP Sink Pre-built RPI Image](http://www.raspberrypi.org/forums/viewtopic.php?t=33943&p=347843)
* [DAC Raspbian Pi2 and A2DP](https://www.hifiberry.com/forums/topic/dac-raspbian-pi2-and-a2dp/)
* [ragusa87/bluetooth-a2dp Gist](https://gist.github.com/ragusa87/6687903)
* [Debian BluetoothUser A2DP](https://wiki.debian.org/BluetoothUser/a2dp)
* [gpduck/bluetoothradio Github](https://github.com/gpduck/bluetoothradio)
* [Gentoo Bluetooth wiki](http://wiki.gentoo.org/wiki/Bluetooth)
* [RaspberryPi Forums - Bluetooth audio streaming](http://www.raspberrypi.org/forums/viewtopic.php?t=68779)
* [RaspberryPi Forums - Pulseaudio 5 and Bluez 5.23](http://www.raspberrypi.org/forums/viewtopic.php?f=29&t=87138&p=636181&hilit=a2dp#p636181)
* [Forum post on simple-agent](http://www.linuxquestions.org/questions/linux-wireless-networking-41/setting-up-bluez-with-a-passkey-pin-to-be-used-as-headset-for-iphone-816003/#post5149524)
* [Example agent (in python)](https://github.com/brainsqueezer/scripts/blob/master/agent.py)

#### Docker
* [Resin.io docker base images](https://registry.hub.docker.com/u/resin/rpi-raspbian/tags/manage/)

#### systemd and init.d
* [Helpful systemd forum post](https://wiki.archlinux.org/index.php/Systemd/User#D-Bus)
* [Helpful template for init.d scripts](https://github.com/fhd/init-script-template/blob/master/template)

#### darkice and icecast2
* [Live stream using darkice and icecast2](https://stmllr.net/blog/live-mp3-streaming-from-audio-in-with-darkice-and-icecast2-on-raspberry-pi/)
* [Ask Ubuntu Darkice/Icecast2 guide](http://askubuntu.com/questions/28496/how-do-i-setup-an-icecast-server-for-broadcasting-audio-in-my-network)
* [Stream audio from Ubuntu to DLNA](https://sandalov.org/blog/1441/)
* [DarkIce and IceCast2 on raspi](https://stmllr.net/blog/live-mp3-streaming-from-audio-in-with-darkice-and-icecast2-on-raspberry-pi/)
* [Raspi baby monitor using darkice and icecast2](http://mattkaar.com/blog/2013/05/26/web-streaming-with-the-raspberry-pi-baby-monitor/)
* [Automated scripts to setup icecast2](https://github.com/grailsasia/vps-setup-audio-streaming/blob/master/setup-icecast-server.sh)
* [How-to forge for Icecast](https://www.howtoforge.com/linux_webradio_with_icecast2_ices2)
