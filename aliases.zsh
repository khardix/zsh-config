#!/usr/bin/zsh
# Generic alias definitions

# ViM
alias view='vim -R'

# SystemD
alias ssc='sudo systemctl'
alias scu='systemctl --user'

# Media applications
[[ -n "${commands[zathura]}" ]] && alias zathura='zathura --fork'
