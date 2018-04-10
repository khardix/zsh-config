#!/usr/bin/zsh
# Extra aliases for jstanek-t460p laptop

# Use vim with X support by default
alias vim='vimx'
alias view='vimx -R'

# Do not pass build flags to local RPM builds
alias rpmbuild='env --unset=CFLAGS --unset=CXXFLAGS -- rpmbuild'
