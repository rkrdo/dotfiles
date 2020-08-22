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

use_minikube_docker() {
  eval $(minikube docker-env)
  export MINIKUBE_IP=$(minikube ip)
}

undo_use_minikube_docker() {
  eval $(minikube docker-env -u)
  unset MINIKUBE_IP
}
