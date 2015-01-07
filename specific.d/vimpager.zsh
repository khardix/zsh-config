#!/usr/bin/zsh

if [ -x /usr/bin/vimpager ]; then
  export PAGER=/usr/bin/vimpager
  alias less='vimpager'
fi
