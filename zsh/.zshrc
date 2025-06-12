# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
export PATH=$PATH:~/.local/bin
unsetopt beep

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

#zstyle :compinstall filename '/home/giri/.zshrc'
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

autoload -Uz compinit
compinit

export LANG=en_IN.UTF-8

enabled_modules=(asdf fzf syntax_highlight zsh-autocompletion)

# Load ZSH helpers
for DOTFILE in `find ~/.local/zsh_helpers/`
do
  current_module="${DOTFILE##*/}"  
  if [[ ${enabled_modules[@]} =~ $current_module ]]
  then
    source "$DOTFILE"
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  fi
done

# Load generic shell helpers
for helper in `find ~/.local/maverick/shell_helpers`
do  
  source "$helper"
done

