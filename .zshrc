# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=vim
setopt appendhistory extendedglob nomatch HIST_IGNORE_ALL_DUPS
unsetopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/luqui/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
PROMPT="%{%B%}[ %{$fg[red]%}%~%{$reset_color%B%} ]%% %{%b%}"

alias ls='ls --color=auto'
alias ack='ack-grep'
alias rvim='vim -R'

export PATH=$HOME/bin:$HOME/devel/depot_tools:$PATH

