# NOTE: - Prepend with `path=(... $path)`, not `PATH=...:$PATH` — scalar
# assignments bypass the dedup from `typeset -U path` in zshrc.

# NOTE: needed for M1 machines - tools installed via homebrew are unreachable without this.
M1_HOMEBREW_PATH=/opt/homebrew/bin
[ -d "$M1_HOMEBREW_PATH" ] && path=($M1_HOMEBREW_PATH $path)

# Add homebrew's ruby to the PATH.
#export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"

# https://www.haskell.org/ghcup/
#[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

path=($HOME/bin $path)
#export PATH="/usr/local/opt/llvm/bin:$PATH"
