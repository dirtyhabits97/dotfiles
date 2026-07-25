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

printf '⚡ %.0fms\n' $(( (EPOCHREALTIME - _zshrc_start) * 1000 ))
unset _zshrc_start

# zprof
# zmodload -u zsh/zprof
