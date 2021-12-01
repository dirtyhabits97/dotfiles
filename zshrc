#zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# =====================================
# Slow paste fix
# =====================================
# sources:
# * https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-303402980
# * https://gist.github.com/magicdude4eva/2d4748f8ef3e6bf7b1591964c201c1ab
# Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# =====================================
# Source
# =====================================

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://www.haskell.org/ghcup/
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
# https://homebrew-file.readthedocs.io/en/latest/installation.html
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# =====================================
# Alias
# =====================================

alias ee="exa --icons"
alias fm="vifm"
alias ll="exa -l --no-user --icons"
alias lt="exa --tree -L 3 --icons"
alias nn="nvim"
# source: https://github.com/julienXX/terminal-notifier
alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?"' -activate com.apple.Terminal
alias stocks="ticker --config=/Users/$(whoami)/.config/ticker.yaml"
alias tree="exa --tree --icons"
alias :q="exit"
alias :Q="exit"

startup() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

replace() {
  rg -l "$1" | xargs sed -i '' -e "s/$1/$2/"
}

# =====================================
# Optimizations
# =====================================
# If this is called later, it doesn't work
autoload -Uz compinit
# TODO: find a better way to handle this on Linux.
if [[ "$(uname)" == "Linux" ]]; then
  compinit
else
  if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
    compinit
  else
    compinit -C
  fi
fi

# =====================================
# Plugins
# =====================================

# zsh-autosuggestions
# source: https://github.com/zsh-users/zsh-autosuggestions#configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370,bold,underline"
# This only applies to WSL which already maps ctrl + space to something else
# https://github.com/zsh-users/zsh-autosuggestions/issues/132#issuecomment-588621352
if [[ "$(uname)" == "Linux" ]]; then
  bindkey '^n' autosuggest-accept
else
  bindkey '^ ' autosuggest-accept
fi

# fzf
# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# =====================================
# Completions
# =====================================
# https://github.com/apple/swift-argument-parser/pull/123/files
# https://unix.stackexchange.com/a/240192
fpath=(~/.zsh/completion $fpath)

# =====================================
# Environments
# =====================================
# jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init --no-rehash -)"
#(jenv rehash &) 2> /dev/null

# =====================================
# Starship
# =====================================
eval "$(starship init zsh)"

# pretty message
if [[ -z $TMUX ]]; then
  neofetch
fi

# =====================================
# Linux
# =====================================
if [[ "$(uname)" == "Linux" ]]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

#zprof
#zmodload -u zsh/zprof
