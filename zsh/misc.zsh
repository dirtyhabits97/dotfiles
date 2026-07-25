# MARK: - Completions
# https://github.com/apple/swift-argument-parser/pull/123/files
# https://unix.stackexchange.com/a/240192
fpath=(~/.zsh/completion $fpath)
# https://github.com/keith/zsh-xcode-completions
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# MARK: - Plugins
# zsh-autosuggestions
# source: https://github.com/zsh-users/zsh-autosuggestions#configuration 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370,bold,underline"
bindkey '^N' autosuggest-accept

# MARK: - Starship

# PERF: - The output of `starship init` / `direnv hook` only changes when the
# binary updates, so source a cached copy instead of spawning them every shell
# (~35ms each). The cache regenerates whenever the binary is newer than it.
evalcache() {
  local cache=~/.cache/zsh/$1.zsh
  if [[ ! -r $cache || $commands[$1] -nt $cache ]]; then
    mkdir -p ~/.cache/zsh
    "$@" > $cache
  fi
  source $cache
}
evalcache starship init zsh
evalcache direnv hook zsh

# MARK: - Neofetch

if [[ -z $TMUX ]]; then
  fastfetch
fi

# MARK: - Homebrew

export HOMEBREW_BUNDLE_FILE=~/.config/brewfile/Brewfile

# MARK: - Gems

#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:$GEM_HOME/bin"

# =====================================
# Environments
# =====================================
# jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init --no-rehash -)"
#(jenv rehash &) 2> /dev/null
