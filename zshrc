#zmodload zsh/zprof

source $HOME/.zsh/oh-my-zsh.zsh

# PERF: - Should be called as early as possible
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

source $HOME/.zsh/paths.zsh
source $HOME/.zsh/fzf.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/misc.zsh

#zprof
#zmodload -u zsh/zprof
