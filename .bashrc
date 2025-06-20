#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman="sudo pacman"
alias pacman-clean="pacman -Qdtq | sudo pacman -Rns -"
alias ls="eza"
alias code="codium"
alias py="python"
alias docker="sudo docker"
alias reboot="sudo reboot"
alias vim="nvim"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# PS1='\e[38;5;85m\u@\h:\033[00m\e[38;5;250m\w\033[00m \$ '
PS1='\[\e[38;5;85m\]\u@\h:\[\033[00m\]\[\e[38;5;250m\]\w\[\033[00m\] \$ '

export EDITOR=nvim
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# source /usr/share/nvm/init-nvm.sh
complete -cf sudo

# pnpm
export PNPM_HOME="/home/av32000/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:/home/av32000/.spicetify
export PATH=$PATH:/home/av32000/.cargo/bin

# Created by `pipx` on 2024-12-08 17:16:50
export PATH="$PATH:/home/av32000/.local/bin"
source ~/completion-for-pnpm.bash
