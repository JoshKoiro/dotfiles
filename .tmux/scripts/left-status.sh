#!/bin/bash

function uptime() {
	uptime | awk '{printf $2" "$3" " $4" "$5}' | sed 's/,/ | /g'
}

function ip_address() {

	# Loop through the interfaces and check for the interface that is up.
	for file in /sys/class/net/*; do

		iface=$(basename $file)

		read status <$file/operstate

		[ "$status" == "up" ] && ip addr show $iface | awk '/inet /{printf $2" "}'
	done

}

function main() {
	uptime
}

main
