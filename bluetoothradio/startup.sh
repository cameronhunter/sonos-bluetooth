#!/bin/sh
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

user="pi"
#cd "$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$( readlink -f "$( dirname "$0" )")
cd "$( cd -P $DIR && pwd )"

# Modprobe the internal sound card
#modprobe snd_bcm2835

# Start pulseaudio
su $user -c 'pulseaudio --start'

# Set up the bluetooth adapter to be as visible as possible.
hciconfig hci0 piscan

# Load a bluetooth agent to allow the pairing and connection, and to
# Set pulseaudio up against the bluetooth connection.
(./agent.sh) &

./connect.sh

while:
do
	sleep 1
done
