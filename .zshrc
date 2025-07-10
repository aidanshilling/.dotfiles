# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Locale
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en" # Optional, for a list of preferred languages
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8" # This often overrides all others, but setting them individually can be good practice.

export FCEDIT="nvim"

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aidan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# plugins
source ~/.config/zsh-plugins/zsh-z/zsh-z.plugin.zsh

# version control
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr ' *'
zstyle ':vcs_info:git:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{blue}(%b%f%F{cyan}%u%c%f%F{blue})%f '
zstyle ':vcs_info:git:*' actionformats '%F{blue}(%b|%f%F{cyan}%u%c%f%F{blue})%f '


# prompt
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='%F{green}%*%f %2~ ${vcs_info_msg_0_}${NEWLINE}%F{white}%#%f '

# aliases
alias ll="ls -lh --color"
alias lla="ls -lah --color"
alias vim="nvim"
alias gvim="neovide"
alias tmux="tmux -u"
alias gh="cd ~"
alias bri="brightnessctl set"
alias reload-waybar="pkill waybar && hyprctl dispatch exec waybar"

# path
# export PATH="/opt/homebrew/bin:$PATH"

# asdf config
# . /opt/homebrew/opt/asdf/libexec/asdf.sh
