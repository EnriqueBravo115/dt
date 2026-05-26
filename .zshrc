export ZSH="$HOME/.oh-my-zsh"
export MANPAGER="nvim +Man!"
export PATH=$PATH:/usr/local/go/go/bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

autoload -U colors && colors
ZSH_THEME=robbyrussell

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias c="clear"
alias lf="yazi"

bindkey -v
export KEYTIMEOUT=1

export ANDROID_SDK_ROOT=/home/nullboy/Android/Sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
