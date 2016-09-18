# Global named directories

## Utility functions

function current_semester_doc()
{
  setopt local_options null_glob
  local semesters=($(print -l ~/(#i)(documents)/uni/mgr/semestr-?))
  echo ${semesters[-1]}
}

function current_semester_proj()
{
  setopt local_options null_glob
  local semesters=($(print -l ~/(#i)(projects)/uni/mgr/semestr-?))
  echo ${semesters[-1]}
}

# Misc directories
hash -d pthemes=~zsh/oh-my-zsh/themes
hash -d config=~/system/dotfiles
hash -d vim=~config/vim
hash -d bin=~/.local/bin
hash -d dmnt=/run/media/$USER

# Current semester alias
hash -d uniproj="$(current_semester_proj)"
hash -d unidoc="$(current_semester_doc)"
