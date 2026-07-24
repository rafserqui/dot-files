#!/bin/bash

# If rofi is already open, close it
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

chosen=$(printf "󰌾  Lock\n  Shutdown\n  Restart\n󰍃  Log Out" | rofi \
    -dmenu \
    -p "" \
    -theme ~/.config/rofi/power-menu.rasi)

firefox_running() {
    pgrep -x firefox >/dev/null
}

wait_for_firefox_exit() {
    local seconds="$1"
    local i

    for ((i = 0; i < seconds; i++)); do
        if ! firefox_running; then
            return 0
        fi

        sleep 1
    done

    ! firefox_running
}

close_firefox_windows() {
    swaymsg -q '[app_id="firefox"] kill' >/dev/null 2>&1 || true
    swaymsg -q '[class="[Ff]irefox"] kill' >/dev/null 2>&1 || true
    swaymsg -q '[sandbox_app_id="firefox"] kill' >/dev/null 2>&1 || true
}

quit_firefox() {
    if ! firefox_running; then
        return 0
    fi

    close_firefox_windows
    wait_for_firefox_exit 10 && return 0

    pkill -TERM -x firefox >/dev/null 2>&1 || true
    wait_for_firefox_exit 5 && return 0

    pkill -KILL -x firefox >/dev/null 2>&1 || true
    wait_for_firefox_exit 2
}

case "$chosen" in
    "󰌾  Lock")
        ~/.local/bin/start-gtklock
        ;;
    "  Shutdown")
        quit_firefox
        systemctl poweroff
        ;;
    "  Restart")
        quit_firefox
        systemctl reboot
        ;;
    "󰍃  Log Out")
        quit_firefox
        swaymsg exit
        ;;
esac
