# MARK: - Alias

alias ee="eza --icons"
alias fm="vifm"
alias ll="eza -l --no-user --icons"
alias lt="eza --tree -L 3 --icons"
alias nn="nvim"
# source: https://github.com/julienXX/terminal-notifier
alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $?"' -activate com.apple.Terminal
alias tree="eza --tree --icons"
alias :q="exit"
alias :Q="exit"

# Claude Code on the personal Max subscription: drop the work ANTHROPIC_* env
# overrides (proxy/base-url/model) so it uses subscription auth. ww adds worktree.
alias cc='env -u ANTHROPIC_AUTH_TOKEN -u ANTHROPIC_BASE_URL -u ANTHROPIC_CUSTOM_HEADERS -u ANTHROPIC_DEFAULT_HAIKU_MODEL -u ANTHROPIC_DEFAULT_SONNET_MODEL -u ANTHROPIC_DEFAULT_OPUS_MODEL -u ANTHROPIC_MODEL claude'
alias ww='cc --worktree'

# MARK: - Functions

startup() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

replace() {
  rg -l "$1" | xargs -I {} sed -i '' -e "s/$1/$2/" "{}"
}

delete_line() {
  rg -l "$1" | xargs -I {} sed -i '' -e "/$1/d" "{}"
}

gitgo() {
  branches=$(git branch --all | grep -v HEAD)
  branch=$(echo "$branches" | fzf-tmux -d 40 +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
