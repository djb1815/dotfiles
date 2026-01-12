#!/usr/bin/env zsh

# Script to manage compinit dump file
# - Automatically detects if a list of files has changed since last dump was generated
# - Expects $COMPINIT_WATCH to be an array of files/dirs, defaults to just .zshrc if not found

autoload -Uz compinit

function init_completions() {
  local zcompdump rebuild path_arg file default_zshrc
  local -a watch_list files_to_check

  zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  rebuild=false

  # Default zshrc location (respect ZDOTDIR)
  default_zshrc="${ZDOTDIR:-$HOME}/.zshrc"

  # Use external watch list if provided
  if (( ${+COMPINIT_WATCH} )); then
    watch_list=("${COMPINIT_WATCH[@]}")
  else
    watch_list=("$default_zshrc")
  fi

  # Expand files and directories
  for path_arg in "${watch_list[@]}"; do
    if [[ -d "$path_arg" ]]; then
      # All regular files under the directory
      files_to_check+=( "$path_arg"/**/*(.N) )
    elif [[ -f "$path_arg" ]]; then
      files_to_check+=( "$path_arg" )
    fi
  done

  # Decide whether to rebuild
  for file in "${files_to_check[@]}"; do
    if [[ ! -f "$zcompdump" || "$zcompdump" -ot "$file" ]]; then
      rebuild=true
      break
    fi
  done

  if $rebuild; then
    compinit -d "$zcompdump"
  else
    compinit -C -d "$zcompdump"
  fi
}

init_completions
