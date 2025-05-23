#!/bin/bash

new_chap_file() {
  local dir="./src/chaps/chap08"
  local template="./src/code.js"

  # Ensure the directory exists
  mkdir -p $dir

  # Ensure the template file exists
  if [ ! -f "$template" ]; then
    echo "Error: Template file '$template' does not exist."
    return 1
  fi

  # Count only .jsx files in the directory
  local count
  count=$(find "$dir" -maxdepth 1 -type f -name '*.jsx' | wc -l)

  # New index = existing files + 1
  local new_index=$((count + 1))

  # Format index with leading zeros (e.g., 001, 002)
  printf -v new_file "%03d.jsx" "$new_index"

  # Full path for the new file
  local new_path="$dir/$new_file"

  # Copy the content
  cp "$template" "$new_path"

  echo "Created: $new_path"
  return 0
}

# Only execute if script is run directly (not sourced)
mkdir -p ./out/chaps
new_chap_file
bash ./script.sh