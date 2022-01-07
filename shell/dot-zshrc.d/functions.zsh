# create tmux session
function tmuxnew() {
  tmux -2 new-session -s $1
}

# attach to tmux session
function tmuxsession() {
  tmux -2 attach-session -t $1
}

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}