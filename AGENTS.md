# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal macOS dotfiles, managed by [dotbot](https://github.com/anishathalye/dotbot) (vendored as a git submodule at `dotbot/`). Running `./install` invokes `dotbot/bin/dotbot -c install.conf.yaml`, which (re)creates the symlinks described in `install.conf.yaml`. There is no build, no test suite, no package — editing a tracked file and re-running `./install` is the full workflow.

Setup steps that dotbot does NOT do (Homebrew bundle, oh-my-zsh, vim-plug, tpm, lldb extensions) live in `README.md`.

## The symlink layout

`install.conf.yaml` is the source of truth for what gets linked where. The non-obvious shape:

- Top-level files (`gitconfig`, `zshrc`, `tmux.conf`, `lldbinit`, `aerospace.toml`, ...) link to `~/.<name>`.
- `bin/` links to `~/bin` (added to PATH by `zsh/paths.zsh`).
- Each subdirectory of `config/` links to `~/.config/<name>/` via a glob — so editing `config/nvim/init.lua` immediately affects `~/.config/nvim/init.lua`.
- `config/vifm/*` is linked file-by-file (not as a directory) so vifm's runtime `vifminfo.json` is excluded.
- `zsh/` links to `~/.zsh/`; `zshrc` sources `~/.zsh/{oh-my-zsh,paths,fzf,alias,misc}.zsh` in that order.

When adding a new tool config, decide: does it want `~/.toolrc` (place at repo root, add to the `link:` block) or `~/.config/tool/` (place a directory under `config/`, the glob picks it up)?

## Neovim — see its own AGENTS.md

`config/nvim/` has its own `AGENTS.md` with full conventions for that subtree (lazy.nvim plugin spec format, LSP server list, keybinds, Lua code style). Defer to it for any edits under `config/nvim/`.

## Per-directory git identity

`gitconfig` uses `includeIf` to switch identity by directory:

- `~/projects/**` → `.gitconfig-work.config` (work identity; that file is intentionally not tracked here)
- `~/dotfiles/**` and `~/other_projects/**` → `.gitconfig-dev.config` (personal)

If a commit ends up with the wrong author, check which directory the repo lives in.

## Conventions worth preserving

- Shell scripts use `#!/usr/bin/env bash` and start with a header comment block explaining purpose and (where relevant) the input schema or wiring example.
- Section markers in long config files use `# MARK: - Section` (zsh, tmux, lldb, brewfile) — keeps Xcode-style navigation working in editors that understand it.
- `zshrc` is deliberately tiny; new shell config goes into one of the `zsh/*.zsh` files based on topic.
