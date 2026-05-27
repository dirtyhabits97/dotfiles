#!/usr/bin/env bash

# Minimal Claude Code statusline.
#   Line 1: folder (bold cyan) + git branch/worktree + lines added/removed
#   Line 2: tokens used/total (% colored by threshold) | rate limits (when present)
#   Line 3: model + effort (dimmed, hidden when absent)
#
# Each segment hides independently when its data is absent. Example renders:
#
#   dotfiles  🌱 byted +146 -10
#   156k / 200k (78%)
#   Opus ⚡high
#
#   dotfiles  🌱 byted +146 -10
#   1M / 1M (95%) | 5h:24%  7d:85%
#   Opus ⚡max
#
#   dotfiles  🌱 byted +146 -10
#   80k / 200k (40%)
#   Sonnet
#
# Standard 8-color ANSI so the terminal theme (e.g. Alacritty) controls actual colors.
# See https://code.claude.com/docs/en/statusline for the input JSON schema.

# --- ANSI colors ---
C_RESET=$'\033[0m'
C_BOLD=$'\033[1m'
C_DIM=$'\033[2m'
C_RED=$'\033[31m'
C_GREEN=$'\033[32m'
C_YELLOW=$'\033[33m'
C_BLUE=$'\033[34m'
C_CYAN=$'\033[36m'

# --- Helpers ---

# 156234 -> 156k, 1200000 -> 1M, 850 -> 850.
fmt_tokens() {
  local n=$1
  if   [ "$n" -lt 1000 ];    then printf '%d'  "$n"
  elif [ "$n" -lt 1000000 ]; then printf '%dk' "$((n / 1000))"
  else                            printf '%dM' "$((n / 1000000))"
  fi
}

# Context %: green <70, yellow 70-89, red >=90.
pct_color() {
  local p=$1
  if   [ "$p" -ge 90 ]; then printf '%s' "$C_RED"
  elif [ "$p" -ge 70 ]; then printf '%s' "$C_YELLOW"
  else                       printf '%s' "$C_GREEN"
  fi
}

# Rate limit %: dim <60, yellow 60-79, red >=80.
rate_color() {
  local p=$1
  if   [ "$p" -ge 80 ]; then printf '%s' "$C_RED"
  elif [ "$p" -ge 60 ]; then printf '%s' "$C_YELLOW"
  else                       printf '%s' "$C_DIM"
  fi
}

# Concatenate non-empty arguments with a double-space.
join_segs() {
  local out=""
  for seg in "$@"; do
    [ -z "$seg" ] && continue
    if [ -z "$out" ]; then out="$seg"
    else                   out="${out}  ${seg}"
    fi
  done
  printf '%s' "$out"
}

# --- Read Claude Code session JSON from stdin into globals ---
input=$(cat)
mapfile -t F < <(
  echo "$input" | jq -r '
    .workspace.current_dir                    // "",
    .workspace.git_worktree                   // "",
    (.context_window.total_input_tokens      // 0),
    (.context_window.context_window_size     // 200000),
    (.context_window.used_percentage         // 0 | floor),
    (.rate_limits.five_hour.used_percentage  // -1),
    (.rate_limits.seven_day.used_percentage  // -1),
    .session_id                               // "nosession",
    .model.display_name                       // "",
    .effort.level                             // ""
  '
)
DIR="${F[0]}"; WORKTREE="${F[1]}"
TOKENS_USED="${F[2]}"; TOKENS_TOTAL="${F[3]}"; PCT="${F[4]}"
RATE_5H="${F[5]}"; RATE_7D="${F[6]}"; SESSION_ID="${F[7]}"
MODEL="${F[8]}"; EFFORT="${F[9]}"

# --- Git data, cached 5s per session_id (sets BRANCH, ADDED, REMOVED) ---
load_git_data() {
  local cache="/tmp/statusline-git-cache-$SESSION_ID"
  local mtime age
  mtime=$(stat -f %m "$cache" 2>/dev/null || stat -c %Y "$cache" 2>/dev/null || echo 0)
  age=$(( $(date +%s) - mtime ))
  if [ ! -f "$cache" ] || [ "$age" -gt 5 ]; then
    if (cd "$DIR" 2>/dev/null && git rev-parse --git-dir >/dev/null 2>&1); then
      local branch added removed
      branch=$(cd "$DIR" && git branch --show-current 2>/dev/null)
      # `git diff HEAD --numstat` = staged + unstaged vs HEAD. Binary files show "-"; skip them.
      read -r added removed < <(cd "$DIR" && git diff HEAD --numstat 2>/dev/null | \
        awk 'BEGIN{a=0;d=0} $1 ~ /^[0-9]+$/ {a+=$1} $2 ~ /^[0-9]+$/ {d+=$2} END {printf "%d %d\n", a, d}')
      printf '%s|%s|%s' "$branch" "${added:-0}" "${removed:-0}" > "$cache"
    else
      printf '||' > "$cache"
    fi
  fi
  IFS='|' read -r BRANCH ADDED REMOVED < "$cache"
}
load_git_data

# --- Per-segment renderers (each prints its segment or nothing) ---

render_dir() {
  printf '%b' "${C_BOLD}${C_CYAN}${DIR##*/}${C_RESET}"
}

render_git() {
  local out=""
  if   [ -n "$WORKTREE" ]; then out="${C_BLUE}🌲 ${WORKTREE}${C_RESET}"
  elif [ -n "$BRANCH"   ]; then out="${C_GREEN}🌱 ${BRANCH}${C_RESET}"
  else                          return
  fi
  [ "${ADDED:-0}"   -gt 0 ] && out="${out} ${C_GREEN}+${ADDED}${C_RESET}"
  [ "${REMOVED:-0}" -gt 0 ] && out="${out} ${C_RED}-${REMOVED}${C_RESET}"
  printf '%b' "$out"
}

# Single rate-limit pill (e.g. "5h:24%") with severity color, or nothing when absent.
render_rate() {
  local label=$1 raw=$2 rounded
  [ "$raw" = "-1" ] && return
  rounded=$(printf '%.0f' "$raw")
  printf '%b%s:%s%%%b' "$(rate_color "$rounded")" "$label" "$rounded" "$C_RESET"
}

render_usage() {
  local tokens limits
  tokens="$(fmt_tokens "$TOKENS_USED") / $(fmt_tokens "$TOKENS_TOTAL") ($(pct_color "$PCT")${PCT}%${C_RESET})"
  limits=$(join_segs "$(render_rate 5h "$RATE_5H")" "$(render_rate 7d "$RATE_7D")")
  if [ -n "$limits" ]; then
    printf '%b %b|%b %b' "$tokens" "$C_DIM" "$C_RESET" "$limits"
  else
    printf '%b' "$tokens"
  fi
}

render_model() {
  [ -z "$MODEL" ] && return
  if [ -n "$EFFORT" ]; then printf '%b%s ⚡%s%b' "$C_DIM" "$MODEL" "$EFFORT" "$C_RESET"
  else                      printf '%b%s%b'     "$C_DIM" "$MODEL"            "$C_RESET"
  fi
}

# --- Compose and print ---
LINE1=$(join_segs "$(render_dir)" "$(render_git)")
LINE2=$(render_usage)
LINE3=$(render_model)

printf '%b\n' "$LINE1"
printf '%b\n' "$LINE2"
if [ -n "$LINE3" ]; then
  printf '%b\n' "$LINE3"
fi
