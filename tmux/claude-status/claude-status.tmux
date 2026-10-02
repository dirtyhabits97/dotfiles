#!/usr/bin/env bash

# Catppuccin status module that counts the Claude Code sessions open in the
# current tmux session, plus a red ✻ count of the ones waiting on you.
#
# Defines @catppuccin_status_claude. Needs catppuccin/tmux loaded first (it
# reuses its colors and utils/status_module.conf), and the @claude_wait pane
# flag that the hooks in claude/settings.json set.
#
# Wiring example (tmux.conf, after catppuccin's `run`):
#   run '~/.tmux/claude-status/claude-status.tmux'
#   set -ag status-right "#{E:@catppuccin_status_claude}"

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux source "${PLUGIN_DIR}/claude-status.conf"
