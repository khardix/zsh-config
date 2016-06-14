# Command aliases

alias lll='ls -l --color=always | less -R' # long colored dirs
alias vide='vim +NERDTree +TagbarOpen'
alias gide='gvim +NERDTree +TagbarOpen'
alias zathura='zathura --fork --debug=error'
alias mpv-us='mpv --video-unscaled'
alias alot="LC_ALL=en_US.utf8 alot -p $MAILDIR"
alias view="vim -R"

# Systemd
alias ssc='sudo systemctl'
alias scu='systemctl --user'

function ggr # goto git root
{
  local topdir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [ "$topdir" ]; then
    cd "$topdir"
  else
    echo "Not a git repo" >&2
  fi
}

function update-configs
{
  local cnf_root=$HOME/system/dotfiles
  local submodules='on-demand'

  while getopts 'f' opt; do
    case opt in
      f) submodules='yes' ;;
    esac
  done

  echo "Entering config directory..." && pushd "$cnf_root" &>/dev/null
  git pull --recurse-submodules="$submodules" && git submodule foreach git merge
  bash setup.sh # run dotbot
  echo "Leaving config directory..." && popd &>/dev/null
}

# Colored man pages
function man
{
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  man "$@"
}

# Suffix aliases
alias -s php='php -f'
alias -s pdf='zathura --fork'
