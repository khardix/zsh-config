# Add .local/bin/ to PATH
PATH=~/.local/bin:$PATH

# Add gcc coloring
[ -d /usr/lib/colorgcc/bin ] && PATH=/usr/lib/colorgcc/bin:$PATH

# Add RVM to PATH for scripting
[ -d $HOME/.rvm/bin ] && PATH=$PATH:$HOME/.rvm/bin
[ -r $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

# Path to oh-my-zsh
ZSH=$HOME/system/dotfiles/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="khardix"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(sudo git vi-mode taskwarrior fedpkg)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
autoload -U compinit #init completions
compinit -i
autoload -U colors #init colors
colors
autoload -U zsh-mime-setup #do file association
zsh-mime-setup

# zstyle
zstyle ':completion:*:descriptions' format "%{${fg[red]}= %d =$reset_color%}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#set local options and traps (in functions)
setopt LOCAL_OPTIONS LOCAL_TRAPS

#set error reporting of missing globs
setopt CSH_NULL_GLOB

#set extended globbing
setopt EXTENDED_GLOB

#set vim commands for command-line editing
bindkey -v

#and set vim as default editor
export EDITOR=vim
export GIT_EDITOR=$EDITOR

## History setting
HISTFILE=~/.zshhistory
HISTSIZE=1000
SAVEHIST=1000

#Verify edited command with bang-history
setopt HIST_VERIFY

#managing and sharing of the $HISTFILE
setopt INC_APPEND_HISTORY SHARE_HISTORY EXTENDED_HISTORY
#duplicated history
setopt HIST_IGNORE_DUPS HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS
setopt NO_HIST_BEEP
#UP and DOWN keys search in history
bindkey "OA" up-line-or-search
bindkey "[A" up-line-or-search
bindkey "OB" down-line-or-search
bindkey "[B" down-line-or-search

# zsh configuration path
hash -d zsh=$HOME/system/dotfiles/zsh

# Named directories
for names in ~zsh/dirs.d/*.zsh; do
  source "$names"
done

#Power options
setopt NO_BEEP #no beeping, ever
setopt AUTO_CD #auto cd if forgot cd
setopt CORRECT #try to correct typos

#aliases - process aliases directory
for als in ~zsh/aliases.d/*.zsh; do
  source "$als"
done

# custom shell variables and scripts fro specific applications
for cst in ~zsh/specific.d/*.zsh; do
  source "$cst"
done

## Print fortune on launch
fortune -s
