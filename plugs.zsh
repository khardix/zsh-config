#!/usr/bin/zsh
# zplug configuration and setup

# ===== Auto-installation =====
# => Test if all commands are available
[ "${commands[curl]}" ] || return
# => Prepare the environment
[ -d $ZPLUG_HOME ] || mkdir -p $ZPLUG_HOME
# Install zplug
[ -r "$ZPLUG_HOME/init.zsh" ] || function {
    local -r url='https://raw.githubusercontent.com/zplug/installer/master/installer.zsh'
    eval "$(curl --silent --location --proto-redir -all,https "$url")"
}

# ===== Initialization and configuration =====
source "$ZPLUG_HOME/init.zsh"

# => Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# ===== Finalization =====
zplug load          # Source all installed plugins and add them to $path
