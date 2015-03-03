#!/bin/sh

DIR=$( readlink -f "$( dirname "$0" )")
cd "$( cd -P $DIR && pwd )"

# Modprobe the internal sound card
#modprobe snd_bcm2835

# Start pulseaudio
su $SONOS_USER -c 'pulseaudio --start'

# Set up the bluetooth adapter to be as visible as possible.
service bluetooth restart

hciconfig hci0 name $SONOS_NAME
hciconfig hci0 class 0x200404

hciconfig -a dev

hciconfig hci0 up
hciconfig hci0 piscan

# Load a bluetooth agent to allow the pairing and connection, and to
# Set pulseaudio up against the bluetooth connection.
bluetooth-agent 1234 &

sh /sonos-bluetooth/connect.sh

while:
do
	sleep 1
done
