# Global named directories

## Utility functions

function current_semester()
{
  setopt local_options null_glob
  local semesters=($(print -l ~/(#i)(documents)/uni/mgr/sem-?))
  echo ${semesters[-1]}
}

# Misc directories
hash -d pthemes=~zsh/oh-my-zsh/themes
hash -d config=~/system/dotfiles
hash -d vim=~config/vim
hash -d bin=~/.local/bin

# Current semester alias
hash -d uni="$(current_semester)"
