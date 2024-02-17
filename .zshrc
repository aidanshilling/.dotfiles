# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aidan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export LC_ALL=C

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


# path
export PATH="/opt/homebrew/bin:$PATH"

# asdf config
. /opt/homebrew/opt/asdf/libexec/asdf.sh
