#!/bin/sh

get_device_list() {
	bluetoothctl devices | awk -F ' ' '{print $3 " " $2}'
}

device_list=$(get_device_list)
selected_device=$(echo "$device_list" | fuzzel -w 30% \
	-b 002b36cc -t 586e75ff -M cb4b16ff -m 657b83ff -S 93a1a1ff \
	-s 073642cc -B 2 -r 0 -C 073642ff --input-color cb4b16ff \
	--font monospace:size=12 -I -D no --cache=/dev/null --dmenu --lines 2 | awk '{print $1}')

[ -z "$selected_device" ] && notify-send "No device selected." && exit 1

MAC=$(echo "$device_list" | grep "$selected_device" | awk '{print $2}')
[ -z "$MAC" ] && notify-send "$selected_device..." "Failed to find MAC address." && exit 1

connect=$(bluetoothctl info "$MAC" | grep Connected: | awk '{print $2}')

if [ "$connect" = "no" ]; then
	action="connect"
elif [ "$connect" = "yes" ]; then
	action="disconnect"
else
	notify-send "$selected_device" "Unknown status"
	exit 1
fi

notify-send "$selected_device" "Attempting to $action..."
if bluetoothctl "$action" "$MAC"; then
	notify-send "$selected_device" "Successfully ${action}ed."
else
	notify-send "$selected_device" "Failed to $action."
fi
