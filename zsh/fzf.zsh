[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% \
  --preview='bat --color=always --style=plain --theme=OneHalfDark {}' \
  --bind shift-up:preview-page-up,shift-down:preview-page-down"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
