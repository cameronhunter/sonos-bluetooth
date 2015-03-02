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
* [Raspberry Pi network audio player: pulseaudio, DLNA and bluetooth A2DP](http://rootprompt.apatsch.net/2013/02/20/raspberry-pi-network-audio-player-pulseaudio-dlna-and-bluetooth-a2dp-part-1-pulseaudio/)
* [A2DP Sink Pre-built RPI Image](http://www.raspberrypi.org/forums/viewtopic.php?t=33943&p=347843)
