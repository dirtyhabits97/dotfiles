#!/usr/bin/env bash

# Claude Code Notification hook: macOS banner with project as title and
# branch + tmux session:window as subtitle (each shown when available).
# Wired in via settings.json:
#   "command": "~/.config/claude/bin/notify.sh"
# Stdin schema: https://docs.claude.com/en/docs/claude-code/hooks#notification

input=$(cat)
cwd=$(jq -r '.cwd     // ""'                          <<< "$input")
msg=$(jq -r '.message // "Claude needs your input"'   <<< "$input")

title="${cwd##*/}"
[ -z "$title" ] && title="Claude"

# Subtitle: tmux window index (e.g. "3") so you know which window to jump to.
sub=""
[ -n "$TMUX" ] && sub=$(tmux display-message -p '#I' 2>/dev/null)

jq -nr --arg m "$msg" --arg t "$title" --arg s "$sub" '
  "display notification " + ($m | tojson) +
  " with title "          + ($t | tojson) +
  (if $s == "" then "" else " subtitle " + ($s | tojson) end) +
  " sound name \"Glass\""
' | osascript -
