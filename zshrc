#zmodload zsh/zprof

source $HOME/.zsh/oh-my-zsh.zsh

# =====================================
# MARK: - Source
# =====================================

M1_HOMEBREW_PATH=/opt/homebrew/bin
[ -d "$M1_HOMEBREW_PATH" ] && export PATH=$M1_HOMEBREW_PATH:$PATH

# https://www.haskell.org/ghcup/
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" 

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# =====================================
# MARK: - Alias
# =====================================


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

source $HOME/.zsh/fzf.zsh
source $HOME/.zsh/alias.zsh
#zprof
#zmodload -u zsh/zprof
