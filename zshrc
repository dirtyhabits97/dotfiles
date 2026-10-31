# zmodload zsh/zprof

zmodload zsh/datetime
_zshrc_start=$EPOCHREALTIME

# PERF: - Keep PATH free of duplicates: tmux panes inherit the server's PATH,
# then path_helper (/etc/zprofile) and these files prepend onto it again.
# -U makes zsh drop repeated entries, keeping the first occurrence.
typeset -U path

source $HOME/.zsh/oh-my-zsh.zsh

# PERF: - Should be called as early as possible
# autoload -Uz compinit
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

source $HOME/.zsh/paths.zsh
source $HOME/.zsh/fzf.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/misc.zsh

# Re-dedupe: scalar `PATH=...` assignments (e.g. from sourced tool scripts)
# bypass -U; an array self-assignment re-applies it.
path=($path)

# TODO: The first shell after a different kind of shell takes ~1s. `brew
# shellenv` (bytedance.zsh) exports FPATH, so each nested zsh adds to its
# parent's fpath, and oh-my-zsh rebuilds the shared ~/.zcompdump-* whenever
# fpath changed. tmux keeps the exported copy and hands it to every pane, which
# is why main sees it too. Fix: `typeset +x FPATH` here, then once
# `tmux set-environment -gu FPATH`.

printf '⚡ %.0fms\n' $(( (EPOCHREALTIME - _zshrc_start) * 1000 ))
unset _zshrc_start

# zprof
# zmodload -u zsh/zprof
