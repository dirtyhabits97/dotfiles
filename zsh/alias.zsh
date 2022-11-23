# MARK: - Alias

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

# MARK: - Functions

startup() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

replace() {
  rg -l "$1" | xargs -I {} sed -i '' -e "s/$1/$2/" "{}"
}

gitgo() {
  branches=$(git branch --all | grep -v HEAD)
  branch=$(echo "$branches" | fzf-tmux -d 40 +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
