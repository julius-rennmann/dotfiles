# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.config/zsh
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

bindkey    "\e[7~"    beginning-of-line
bindkey    "\e[8~"    end-of-line
bindkey    "\e[3~"    delete-char
bindkey    "\e[1~"    beginning-of-line
bindkey    "\e[4~"    end-of-line
bindkey    "\e[7~"    beginning-of-line
bindkey    "\e[8~"    end-of-line
bindkey    "\eOH"     beginning-of-line
bindkey    "\eOF"     end-of-line
bindkey    "\e[H"     beginning-of-line
bindkey    "\e[F"     end-of-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

source $ZSH/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/.p10k.zsh
source $ZSH/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

autoload -Uz compinit
compinit

eval "$(~/.cargo/bin/rtx activate zsh)"

#Ctrl-W to new delimiters
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# aliases

alias ls=exa
alias la="ls -la"
alias ll="ls -l"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
