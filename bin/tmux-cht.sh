#!/usr/bin/env bash

# source: https://www.youtube.com/watch?v=hJzqEAf2U4I

bin="$HOME/.bin/tmux"
selected=$(cat "$bin/cht-languages" "$bin/cht-command" | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

read -rp "Enter Query: " query

if grep -qs "$selected" "$bin/cht-languages"; then
  query=$( echo "$query" | tr ' ' '+' )
  tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
