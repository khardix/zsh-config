#!/usr/bin/zsh

# Force MPV to use config file in XDG_CONFIG_DIR
export MPV_HOME="${XDG_CONFIG_DIR:-${HOME}/.config}/mpv"
