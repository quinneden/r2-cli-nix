#!/bin/sh
OS=`uname -s`
ARCH=`uname -m`

curl -fsSLo /tmp/r2-${OS}-${ARCH}.tar.gz \
	https://github.com/erdos-one/r2/releases/download/v0.1.0-alpha/r2-${OS}-${ARCH}.tar.gz

mkdir -p /tmp/r2-v0.1.0-alpha
tar -xzf /tmp/r2-${OS}-${ARCH}.tar.gz -C /tmp/r2-v0.1.0-alpha
chmod +x /tmp/r2-v0.1.0-alpha/r2

if [ "$EUID" -eq 0 ]; then
	mv /tmp/r2-v0.1.0-alpha/r2 /usr/local/bin/r2
	rm -r /tmp/r2-v0.1.0-alpha
else
	echo "Couldn't add r2 to /usr/local/bin because script is not running at admin"
	echo "Please run as root."
fi
