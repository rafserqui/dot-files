#!/bin/bash
exec ghostty --title="wifi-menu" -e "$HOME/.cargo/bin/wlctl"
