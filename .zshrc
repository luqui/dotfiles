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

alias ack='ack-grep'
alias rvim='vim -R'

export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/devel/depot_tools:$PATH
export TOOLS=$HOME/devel/build/scripts/tools

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lukepalmer/devel/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lukepalmer/devel/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lukepalmer/devel/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lukepalmer/devel/google-cloud-sdk/completion.zsh.inc'; fi
