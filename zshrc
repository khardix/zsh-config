#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit #init completions
compinit
autoload -U colors #init colors
colors
autoload -U promptinit #init prompt themes
promptinit
autoload -U zsh-mime-setup #do file association
zsh-mime-setup

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#set local options and traps (in functions)
setopt LOCAL_OPTIONS LOCAL_TRAPS

#set error reporting of missing globs
setopt CSH_NULL_GLOB

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

## Prompt settings
#main prompt
PS1="%{${fg_bold[green]}%}%n@%m \
%{${fg_no_bold[yellow]}%}[%55<...<%3~%<<]\
%(?.. %{${bg[red]}${fg_bold[white]}%}EC:%?)
%{${bg[default]}${fg_bold[red]}%}%B%#%b\
%{${bg[default]}${fg[default]}%} "
#prompt on the right side; automatically hidden
RPS1="%B%D{%a %d. %b %Y, %k:%M}%b"
#next-line prompt
#PS2=
#prompt before lines to be executed
#PS4=

## Named directories
dotfiles=~/system/dotfiles
bin=~/'.local/bin'
Films=~/Videos/Films
Series=~/Videos/Series
fit=~/Documents/FIT/semestr3
www=~/system/web_public

: ~bin ~dotfiles ~Films ~Series ~fit ~www #force shell to recognize this dirs

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
