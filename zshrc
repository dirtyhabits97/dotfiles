#zmodload zsh/zprof

# =====================================
# MARK: - oh-my-zsh
# =====================================

export ZSH="$HOME/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

# =====================================
# NOTE: - Slow paste fix
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
# MARK: - Source
# =====================================

M1_HOMEBREW_PATH=/opt/homebrew/bin
[ -d "$M1_HOMEBREW_PATH" ] && export PATH=$M1_HOMEBREW_PATH:$PATH

source $ZSH/oh-my-zsh.sh
# https://www.haskell.org/ghcup/
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" 

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# =====================================
# MARK: - Alias
# =====================================

alias ee="exa --icons"
alias fm="vifm"
alias ll="exa -l --no-user --icons"
alias lt="exa --tree -L 3 --icons"
alias nn="nvim"
# source: https://github.com/julienXX/terminal-notifier
alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?"' -activate com.apple.Terminal
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
# MARK: - Optimizations
# =====================================
# PERF: - If this is called later, it doesn't work
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# =====================================
# MARK: - Plugins
# =====================================

# zsh-autosuggestions
# source: https://github.com/zsh-users/zsh-autosuggestions#configuration 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370,bold,underline"
bindkey '^N' autosuggest-accept

# =====================================
# MARK: - Completions
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
# MARK: - Starship
# =====================================
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# pretty message
if [[ -z $TMUX ]]; then
  neofetch
fi

# =====================================
# MARK: - Homebrew
# =====================================
export HOMEBREW_BUNDLE_FILE=~/.config/brewfile/Brewfile

# =====================================
# MARK: - Gems
# =====================================
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

source ~/.zsh/fzf.zsh
#zprof
#zmodload -u zsh/zprof
