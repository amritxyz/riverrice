#!/bin/sh

start_enable() {
    choice=$(printf "Yes\nNo\n" |
        fuzzel --dmenu --prompt="Start power-management-daemon? " \
        -w 50% -I -l 2 --no-mouse)

    case "$choice" in
        Yes)
            systemctl start power-profiles-daemon.service >/dev/null 2>&1 &
            systemctl enable power-profiles-daemon.service >/dev/null 2>&1 &
            notify-send -u low "Power Management" "Starting daemon..."
            sleep 2
            ;;
        *) exit 0 ;;
    esac

    if ! pgrep -x power-profiles >/dev/null; then
        notify-send -u critical "Power Management" "Failed to start daemon." || true
        exit 1
    fi
}

choose() {
    choice=$(printf '%s\n' \
        "Performance" \
        "Balanced" \
        "Power-saver" | \
        fuzzel --dmenu --prompt="Select power profile: " \
        -w 50% -I -l 3 --no-mouse)

    case "$choice" in
        Performance)         powerprofilesctl set performance ;;
        Balanced)   powerprofilesctl set balanced ;;
        Power-saver)  powerprofilesctl set power-saver ;;
        *) exit 0 ;;
    esac

    notify-send -u low "Power Management" "Switched to: $choice" || true
}

if ! pgrep -x power-profiles >/dev/null; then
    choose
else
    start_enable
fi
