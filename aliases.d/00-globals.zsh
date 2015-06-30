# Command aliases

alias lll='ls -l --color=always | less -R' # long colored dirs
alias vide='vim +NERDTree +TagbarOpen'
alias gide='gvim +NERDTree +TagbarOpen'
alias zathura='zathura --fork --debug=error'
alias mpv-us='mpv --video-unscaled'

# Systemd
alias ssc='sudo systemctl'
alias scu='systemctl --user'

function logout
{
  if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    qdbus org.kde.ksmserver /KSMServer logout 0 0 0
  else
    logout
  fi
}

function poweroff
{
  if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    qdbus org.kde.ksmserver /KSMServer logout 0 2 2
  else
    systemctl poweroff
  fi
}

function subconv
{
  iconv -f WINDOWS-1250 -t UTF-8 "$1"|dos2unix
}

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

# Suffix aliases
alias -s php='php -f'
alias -s pdf='zathura --fork'
