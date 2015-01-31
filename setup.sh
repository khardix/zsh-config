# if in empty dir, clone self
test -z "$(ls .)" && git clone --recursive git@github.com:khardix/zsh-config.git .

# link zshrc
test -f "$HOME/.zshrc" || ln -s "$PWD/zshrc" "$HOME/.zshrc"
