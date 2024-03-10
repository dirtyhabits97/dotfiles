#!/usr/bin/env bash
# source: https://github.com/keith/dotfiles/commit/bc6c0525e9e5ff497a900f4d8b3dc23928ded6ea

set -euo pipefail

readonly filename=$1
sips -s format jpeg "$filename" --out "${filename%.*}.jpg"
