export EDITOR=nvim
export NNN_USE_EDITOR=1
# use ripgrep with fzf
# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --no-ignore-vcs'
# https://github.com/junegunn/fzf#respecting-gitignore
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p"