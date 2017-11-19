#!/usr/bin/zsh
# Extra named directories

# XDG directory shortcuts
hash -d bin=~/.local/bin

# Udisks2 mount point
hash -d dmnt=/run/media/"$USER"

# University related projects and documents
hash -d uniproj="$(print ~/(#i)(projects)/uni/mgr/semestr-?(/On[1]N^M))"
hash -d unidoc="$(print ~/(#i)(documents)/uni/mgr/semestr-?(/On[1]N^M))"
