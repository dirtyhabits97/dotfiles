#!/usr/bin/env bash

# Check if the input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
output_dir="tmp_theme_samples"
output_format="truecolor"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# base16 dark duotone light lsp vim
category="dark"

# Build the highlight command as an array
cmd=(highlight --list-scripts=themes)

# Append --list-cat only if category is non-empty
if [ -n "$category" ]; then
  cmd+=(--list-cat="$category")
fi

# Run the command and capture output
output="$("${cmd[@]}")"

# Process the output with awk only once
themes=$(echo "$output" | awk '
  /^Installed themes/ {flag=1; next}
  /^Found theme categories:/ {flag=0}
  /^Use name of the desired theme with --style/ {flag=0}
  flag && NF {
    # Extract substring before first colon
    split($0, parts, ":")
    theme_name = parts[1]
    # Trim trailing spaces (if any)
    sub(/[[:space:]]+$/, "", theme_name)
    print theme_name
  }
')

while IFS= read -r theme; do
  output_file="${output_dir}/${input_file}.${theme}.html"
  output_dir_path=$(dirname "$output_file")
  mkdir -p "$output_dir_path"
  highlight -s "$theme" -O "$output_format" -- "$input_file" > "$output_file"
done <<< "$themes"
