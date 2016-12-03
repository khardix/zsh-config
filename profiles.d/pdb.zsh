#!/usr/bin/zsh
# PDB Environment variables

pdb_path="$HOME/projects/uni/mgr/semestr-3/PDB"
zstyle ":chpwd:profiles:${pdb_path}(|/|/*)" profile pdb

function chpwd_profile_pdb {
    export OLD_JAVA_OPTIONS="${_JAVA_OPTIONS}"

    JAVA_OPTIONS=(${_JAVA_OPTIONS})
    JAVA_OPTIONS+='-Dawt.useSystemAAFontSettings=on'
    JAVA_OPTIONS+='-Dswing.aatext=true'
    JAVA_OPTIONS+='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

    export _JAVA_OPTIONS="${JAVA_OPTIONS}"
}

function chpwd_leave_profile_pdb {
    export _JAVA_OPTIONS="${OLD_JAVA_OPTIONS}"
    unset OLD_JAVA_OPTIONS
}
