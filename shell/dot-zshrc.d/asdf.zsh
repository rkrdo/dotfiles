# asdf #
# https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
# from brew --prefix asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# asdf-java
[ -f $HOME/.asdf/plugins/java/set-java-home.zsh ] && . ~/.asdf/plugins/java/set-java-home.zsh

# asdf-direnv
[ -f $HOME/.config/asdf-direnv/zshrc ] && source ${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc
