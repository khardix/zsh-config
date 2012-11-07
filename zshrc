# Add .local/bin/ to PATH
PATH=$PATH:~/.local/bin

# Path to your oh-my-zsh configuration.
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
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode taskwarrior)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
autoload -U compinit #init completions
compinit
autoload -U colors #init colors
colors
autoload -U zsh-mime-setup #do file association
zsh-mime-setup

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

## Named directories
pthemes=~/system/dotfiles/zsh/oh-my-zsh/themes
dotfiles=~/system/dotfiles
bin=~/'.local/bin'
Films=~/Videos/Films
Series=~/Videos/Series
fit=~/Documents/FIT/semestr3
www=~/system/web_public
games=~/games

: ~bin ~dotfiles ~Films ~Series ~fit ~www ~pthemes ~games #force shell to recognize this dirs

#Power options
setopt NO_BEEP #no beeping, ever
setopt AUTO_CD #auto cd if forgot cd
setopt CORRECT #try to correct typos

#aliases - load from external file
if [[ -r ~dotfiles/zsh/aliasrc ]]; then
  . ~dotfiles/zsh/aliasrc
fi

## Print fortune on launch
fortune -s
