# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

#zstyle :compinstall filename '/home/giri/.zshrc'

autoload -Uz compinit
compinit

export LANG=en_IN.UTF-8

# Load ZSH helpers
for DOTFILE in `find ~/.local/zsh_helpers/`
do
  source "$DOTFILE"
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done

# Load generic shell helpers
for helper in `find ~/.local/maverick/shell_helpers`
do
  source "$helper"
done

