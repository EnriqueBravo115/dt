export ZSH="$HOME/.oh-my-zsh"
export MANPAGER="nvim +Man!"
export PATH=$PATH:/usr/local/go/go/bin
export PATH="$HOME/.local/bin:$PATH"

autoload -U colors && colors
ZSH_THEME=robbyrussell

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias c="clear"
alias n="ncmpcpp"
alias g="lf /mnt/disk/"
alias lf="lfub"

export KEYTIMEOUT=1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
