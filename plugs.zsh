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

# => Utilize zsh-users basics
zplug "zsh-users/zsh-completions"       # Omnibus completion definitions
zplug "zsh-users/zsh-syntax-highlighting", defer:2  # Color the typed command

# => Cherry-pick plugins from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh     # Aliases for git subcommands
zplug "plugins/pip", from:oh-my-zsh     # Cached package completion for pip
zplug "plugins/python", from:oh-my-zsh  # Completion and clean function for python
zplug "plugins/taskwarrior", from:oh-my-zsh  # Smart task and project completion

# => Additional standalone completions
zplug "Schnouki/git-annex-zsh-completion"

# => Manage my own plugins
zplug "khardix/fedpkg-zsh", if:"[[ -n ${commands[fedpkg]} || -n ${commands[rhpkg]} ]]"
zplug "~config/mail", from:local

# ===== Finalization =====
zplug load          # Source all installed plugins and add them to $path
