# NOTE: needed for M1 machines - tools installed via homebrew are unreachable without this.
M1_HOMEBREW_PATH=/opt/homebrew/bin
[ -d "$M1_HOMEBREW_PATH" ] && export PATH=$M1_HOMEBREW_PATH:$PATH

# Add homebrew's ruby to the PATH.
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"

# https://www.haskell.org/ghcup/
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" 

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
