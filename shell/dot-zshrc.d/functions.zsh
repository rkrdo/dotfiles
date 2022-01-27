# create tmux session
function tmuxnew() {
  tmux -2 new-session -s $1
}

# attach to tmux session
function tmuxsession() {
  tmux -2 attach-session -t $1
}

brewdeps() {
  brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"
}
