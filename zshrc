# Add .local/bin/ to PATH
PATH=~/.local/bin:$PATH

# Add gcc coloring
[ -d /usr/lib/colorgcc/bin ] && PATH=/usr/lib/colorgcc/bin:$PATH

# Add RVM to PATH for scripting
[ -d $HOME/.rvm/bin ] && PATH=$PATH:$HOME/.rvm/bin
[ -r $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

#plugins=(sudo git vi-mode taskwarrior fedpkg)

#load zgen
export ZGEN_DIR=$HOME/system/dotfiles/zsh/plugins
source $HOME/system/dotfiles/zsh/zgen-plugin-manager/zgen.zsh

if ! zgen saved; then
  echo "Creating zgen init script, please be patient..." >&2

  zgen oh-my-zsh

  # oh-my-zsh plugins
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/vi-mode

  # extra completions
  zgen load khardix/fedpkg-zsh

  # save init script
  zgen save
fi

# Load custom theme (not managed by framework)
source $HOME/system/dotfiles/zsh/khardix.zsh-theme

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
unsetopt AUTO_PUSHD #do not push the old dir on directory stack
setopt CORRECT #try to correct typos

#aliases - process aliases directory
for als in ~zsh/aliases.d/*.zsh; do
  source "$als"
done

# custom shell variables and scripts fro specific applications
for cst in ~zsh/specific.d/*.zsh; do
  source "$cst"
done

#unset old/deprecated environment variables
unset -v GREP_OPTIONS

## Print fortune on launch
fortune -s
